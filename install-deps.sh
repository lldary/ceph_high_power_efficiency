#!/usr/bin/env bash
# -*- mode:sh; tab-width:8; indent-tabs-mode:t -*-
#
# Ceph distributed storage system
#
# Copyright (C) 2014, 2015 Red Hat <contact@redhat.com>
#
# Author: Loic Dachary <loic@dachary.org>
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#
set -e
DIR=/tmp/install-deps.$$
trap "rm -fr $DIR" EXIT
mkdir -p $DIR
if test $(id -u) != 0 ; then
    SUDO=sudo
fi
export LC_ALL=C # the following is vulnerable to i18n

ARCH=$(uname -m)

function munge_ceph_spec_in {
    local with_seastar=$1
    shift
    local with_zbd=$1
    shift
    local for_make_check=$1
    shift
    local with_jaeger=$1
    shift
    local OUTFILE=$1
    sed -e 's/@//g' < ceph.spec.in > $OUTFILE
    # http://rpm.org/user_doc/conditional_builds.html
    if $with_seastar; then
        sed -i -e 's/%bcond_with seastar/%bcond_without seastar/g' $OUTFILE
    fi
    if $with_jaeger; then
        sed -i -e 's/%bcond_with jaeger/%bcond_without jaeger/g' $OUTFILE
    fi
    if $with_zbd; then
        sed -i -e 's/%bcond_with zbd/%bcond_without zbd/g' $OUTFILE
    fi
    if $for_make_check; then
        sed -i -e 's/%bcond_with make_check/%bcond_without make_check/g' $OUTFILE
    fi
}

function munge_debian_control {
    local version=$1
    shift
    local control=$1
    case "$version" in
        *squeeze*|*wheezy*)
	    control="/tmp/control.$$"
	    grep -v babeltrace debian/control > $control
	    ;;
    esac
    if $with_jaeger; then
	sed -i -e 's/^# Jaeger[[:space:]]//g' $control
	sed -i -e 's/^# Crimson      libyaml-cpp-dev,/d' $control
    fi
    echo $control
}

function ensure_decent_gcc_on_ubuntu {
    # point gcc to the one offered by g++-7 if the used one is not
    # new enough
    local old=$(gcc -dumpfullversion -dumpversion)
    local new=$1
    local codename=$2
    if dpkg --compare-versions $old ge ${new}.0; then
	return
    fi

    if [ ! -f /usr/bin/g++-${new} ]; then
	$SUDO tee /etc/apt/sources.list.d/ubuntu-toolchain-r.list <<EOF
deb [lang=none] http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu $codename main
deb [arch=amd64 lang=none] http://mirror.nullivex.com/ppa/ubuntu-toolchain-r-test $codename main
EOF
	# import PPA's signing key into APT's keyring
	cat << ENDOFKEY | $SUDO apt-key add -
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: SKS 1.1.6
Comment: Hostname: keyserver.ubuntu.com

mI0ESuBvRwEEAMi4cDba7xlKaaoXjO1n1HX8RKrkW+HEIl79nSOSJyvzysajs7zUow/OzCQp
9NswqrDmNuH1+lPTTRNAGtK8r2ouq2rnXT1mTl23dpgHZ9spseR73s4ZBGw/ag4bpU5dNUSt
vfmHhIjVCuiSpNn7cyy1JSSvSs3N2mxteKjXLBf7ABEBAAG0GkxhdW5jaHBhZCBUb29sY2hh
aW4gYnVpbGRziLYEEwECACAFAkrgb0cCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRAe
k3eiup7yfzGKA/4xzUqNACSlB+k+DxFFHqkwKa/ziFiAlkLQyyhm+iqz80htRZr7Ls/ZRYZl
0aSU56/hLe0V+TviJ1s8qdN2lamkKdXIAFfavA04nOnTzyIBJ82EAUT3Nh45skMxo4z4iZMN
msyaQpNl/m/lNtOLhR64v5ZybofB2EWkMxUzX8D/FQ==
=LcUQ
-----END PGP PUBLIC KEY BLOCK-----
ENDOFKEY
	$SUDO env DEBIAN_FRONTEND=noninteractive apt-get update -y || true
	$SUDO env DEBIAN_FRONTEND=noninteractive apt-get install -y g++-${new}
    fi

    case "$codename" in
        trusty)
            old=4.8;;
        xenial)
            old=5;;
        bionic)
            old=7;;
    esac
    $SUDO update-alternatives --remove-all gcc || true
    $SUDO update-alternatives \
	 --install /usr/bin/gcc gcc /usr/bin/gcc-${new} 20 \
	 --slave   /usr/bin/g++ g++ /usr/bin/g++-${new}

    if [ -f /usr/bin/g++-${old} ]; then
      $SUDO update-alternatives \
  	 --install /usr/bin/gcc gcc /usr/bin/gcc-${old} 10 \
  	 --slave   /usr/bin/g++ g++ /usr/bin/g++-${old}
    fi

    $SUDO update-alternatives --auto gcc

    # cmake uses the latter by default
    $SUDO ln -nsf /usr/bin/gcc /usr/bin/${ARCH}-linux-gnu-gcc
    $SUDO ln -nsf /usr/bin/g++ /usr/bin/${ARCH}-linux-gnu-g++
}

function ensure_python3_sphinx_on_ubuntu {
    local sphinx_command=/usr/bin/sphinx-build
    # python-sphinx points $sphinx_command to
    # ../share/sphinx/scripts/python2/sphinx-build when it's installed
    # let's "correct" this
    if test -e $sphinx_command  && head -n1 $sphinx_command | grep -q python$; then
        $SUDO env DEBIAN_FRONTEND=noninteractive apt-get -y remove python-sphinx
    fi
}

function install_pkg_on_ubuntu {
    local project=$1
    shift
    local sha1=$1
    shift
    local codename=$1
    shift
    local force=$1
    shift
    local pkgs=$@
    local missing_pkgs
    if [ $force = "force" ]; then
	missing_pkgs="$@"
    else
	for pkg in $pkgs; do
	    if ! apt -qq list $pkg 2>/dev/null | grep -q installed; then
		missing_pkgs+=" $pkg"
	    fi
	done
    fi
    if test -n "$missing_pkgs"; then
	local shaman_url="https://shaman.ceph.com/api/repos/${project}/master/${sha1}/ubuntu/${codename}/repo"
	$SUDO curl --silent --location $shaman_url --output /etc/apt/sources.list.d/$project.list
	$SUDO env DEBIAN_FRONTEND=noninteractive apt-get update -y -o Acquire::Languages=none -o Acquire::Translation=none || true
	$SUDO env DEBIAN_FRONTEND=noninteractive apt-get install --allow-unauthenticated -y $missing_pkgs
    fi
}

boost_ver=1.75

function clean_boost_on_ubuntu {
    # Find currently installed version. If there are multiple
    # versions, they end up newline separated
    local installed_ver=$(apt -qq list --installed ceph-libboost*-dev 2>/dev/null |
                              cut -d' ' -f2 |
                              cut -d'.' -f1,2 |
			      sort -u)
    # If installed_ver contains whitespace, we can't really count on it,
    # but otherwise, bail out if the version installed is the version
    # we want.
    if test -n "$installed_ver" &&
	    echo -n "$installed_ver" | tr '[:space:]' ' ' | grep -v -q ' '; then
	if echo "$installed_ver" | grep -q "^$boost_ver"; then
	    return
        fi
    fi

    # Historical packages
    $SUDO rm -f /etc/apt/sources.list.d/ceph-libboost*.list
    # Currently used
    $SUDO rm -f /etc/apt/sources.list.d/libboost.list
    # Refresh package list so things aren't in the available list.
    $SUDO env DEBIAN_FRONTEND=noninteractive apt-get update -y || true
    # Remove all ceph-libboost packages. We have an early return if
    # the desired version is already (and the only) version installed,
    # so no need to spare it.
    if test -n "$installed_ver"; then
	$SUDO env DEBIAN_FRONTEND=noninteractive apt-get -y --fix-missing remove "ceph-libboost*"
    fi
}

function install_boost_on_ubuntu {
    # Once we get to this point, clean_boost_on_ubuntu() should ensure
    # that there is no more than one installed version.
    local installed_ver=$(apt -qq list --installed ceph-libboost*-dev 2>/dev/null |
                              grep -e 'libboost[0-9].[0-9]\+-dev' |
                              cut -d' ' -f2 |
                              cut -d'.' -f1,2)
    if test -n "$installed_ver"; then
        if echo "$installed_ver" | grep -q "^$boost_ver"; then
            return
        fi
    fi
    local codename=$1
    local project=libboost
    local sha1=7aba8a1882670522ee1d1ee1bba0ea170b292dec
    install_pkg_on_ubuntu \
        $project \
        $sha1 \
        $codename \
        check \
        ceph-libboost-atomic${boost_ver}-dev \
        ceph-libboost-chrono${boost_ver}-dev \
        ceph-libboost-container${boost_ver}-dev \
        ceph-libboost-context${boost_ver}-dev \
        ceph-libboost-coroutine${boost_ver}-dev \
        ceph-libboost-date-time${boost_ver}-dev \
        ceph-libboost-filesystem${boost_ver}-dev \
        ceph-libboost-iostreams${boost_ver}-dev \
        ceph-libboost-program-options${boost_ver}-dev \
        ceph-libboost-python${boost_ver}-dev \
        ceph-libboost-random${boost_ver}-dev \
        ceph-libboost-regex${boost_ver}-dev \
        ceph-libboost-system${boost_ver}-dev \
        ceph-libboost-test${boost_ver}-dev \
        ceph-libboost-thread${boost_ver}-dev \
        ceph-libboost-timer${boost_ver}-dev \
        meson # dpdk编译支持

    $sudo ./src/spdk/scripts/pkgdep.sh # spdk编译支持
}

function install_libzbd_on_ubuntu {
    local codename=$1
    local project=libzbd
    local sha1=1fadde94b08fab574b17637c2bebd2b1e7f9127b
    install_pkg_on_ubuntu \
        $project \
        $sha1 \
        $codename \
        check \
        libzbd-dev
}

function version_lt {
    test $1 != $(echo -e "$1\n$2" | sort -rV | head -n 1)
}

for_make_check=false
if tty -s; then
    # interactive
    for_make_check=true
elif [ $FOR_MAKE_CHECK ]; then
    for_make_check=true
else
    for_make_check=false
fi

if [ x$(uname)x = xFreeBSDx ]; then
    $SUDO pkg install -yq \
        devel/babeltrace \
        devel/binutils \
        devel/git \
        devel/gperf \
        devel/gmake \
        devel/cmake \
        devel/nasm \
        devel/boost-all \
        devel/boost-python-libs \
        devel/valgrind \
        devel/pkgconf \
        devel/libedit \
        devel/libtool \
        devel/google-perftools \
        lang/cython \
        databases/leveldb \
        net/openldap24-client \
        archivers/snappy \
        archivers/liblz4 \
        ftp/curl \
        misc/e2fsprogs-libuuid \
        misc/getopt \
        net/socat \
        textproc/expat2 \
        textproc/gsed \
        lang/gawk \
        textproc/libxml2 \
        textproc/xmlstarlet \
        textproc/jq \
        textproc/py-sphinx \
        emulators/fuse \
        java/junit \
        lang/python36 \
        devel/py-pip \
        devel/py-flake8 \
        devel/py-tox \
        devel/py-argparse \
        devel/py-nose \
        devel/py-prettytable \
        devel/py-yaml \
        www/py-routes \
        www/py-flask \
        www/node \
        www/npm \
        www/fcgi \
        security/nss \
        security/krb5 \
        security/oath-toolkit \
        sysutils/flock \
        sysutils/fusefs-libs \

	# Now use pip to install some extra python modules
	pip install pecan

    exit
else
    [ $WITH_SEASTAR ] && with_seastar=true || with_seastar=false
    [ $WITH_JAEGER ] && with_jaeger=true || with_jaeger=false
    [ $WITH_ZBD ] && with_zbd=true || with_zbd=false
    source /etc/os-release
    case "$ID" in
    debian|ubuntu|devuan|elementary|softiron)
        echo "Using apt-get to install dependencies"
	# Put this before any other invocation of apt so it can clean
	# up in a broken case.
        clean_boost_on_ubuntu
        $SUDO apt-get install -y devscripts equivs
        $SUDO apt-get install -y dpkg-dev
        ensure_python3_sphinx_on_ubuntu
        case "$VERSION" in
            *Bionic*)
                ensure_decent_gcc_on_ubuntu 9 bionic
                [ ! $NO_BOOST_PKGS ] && install_boost_on_ubuntu bionic
                $with_zbd && install_libzbd_on_ubuntu bionic
                ;;
            *Focal*)
                [ ! $NO_BOOST_PKGS ] && install_boost_on_ubuntu focal
                $with_zbd && install_libzbd_on_ubuntu focal
                ;;
            *Jammy*)
                [ ! $NO_BOOST_PKGS ] && \
		    $SUDO env DEBIAN_FRONTEND=noninteractive apt-get install -y \
			  libboost-atomic-dev \
			  libboost-chrono-dev \
			  libboost-container-dev \
			  libboost-context-dev \
			  libboost-coroutine-dev \
			  libboost-date-time-dev \
			  libboost-filesystem-dev \
			  libboost-iostreams-dev \
			  libboost-program-options-dev \
			  libboost-python-dev \
			  libboost-random-dev \
			  libboost-regex-dev \
			  libboost-system-dev \
			  libboost-test-dev \
			  libboost-thread-dev \
			  libboost-timer-dev \
			  gcc
                ;;
            *)
                $SUDO apt-get install -y gcc
                ;;
        esac
        if ! test -r debian/control ; then
            echo debian/control is not a readable file
            exit 1
        fi
        touch $DIR/status

	backports=""
	control=$(munge_debian_control "$VERSION" "debian/control")
        case "$VERSION" in
            *squeeze*|*wheezy*)
                backports="-t $codename-backports"
                ;;
        esac

	# make a metapackage that expresses the build dependencies,
	# install it, rm the .deb; then uninstall the package as its
	# work is done
	build_profiles=""
	if $for_make_check; then
	    build_profiles+=",pkg.ceph.check"
	fi
	if $with_seastar; then
	    build_profiles+=",pkg.ceph.crimson"
	fi
	if $with_jaeger; then
	    build_profiles+=",pkg.ceph.jaeger"
	fi

	$SUDO env DEBIAN_FRONTEND=noninteractive mk-build-deps \
	      --build-profiles "${build_profiles#,}" \
	      --install --remove \
	      --tool="apt-get -y --no-install-recommends $backports" $control || exit 1
	$SUDO env DEBIAN_FRONTEND=noninteractive apt-get -y remove ceph-build-deps
	if [ "$control" != "debian/control" ] ; then rm $control; fi
        ;;
    almalinux|rocky|centos|fedora|rhel|ol|virtuozzo)
        builddepcmd="dnf -y builddep --allowerasing"
        echo "Using dnf to install dependencies"
        case "$ID" in
            fedora)
                $SUDO dnf install -y dnf-utils
                ;;
            almalinux|rocky|centos|rhel|ol|virtuozzo)
                MAJOR_VERSION="$(echo $VERSION_ID | cut -d. -f1)"
                $SUDO dnf install -y dnf-utils selinux-policy-targeted
                rpm --quiet --query epel-release || \
		    $SUDO dnf -y install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$MAJOR_VERSION.noarch.rpm
                $SUDO rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$MAJOR_VERSION
                $SUDO rm -f /etc/yum.repos.d/dl.fedoraproject.org*
		if test $ID = centos -a $MAJOR_VERSION = 8 ; then
                    # Enable 'powertools' or 'PowerTools' repo
                    $SUDO dnf config-manager --set-enabled $(dnf repolist --all 2>/dev/null|gawk 'tolower($0) ~ /^powertools\s/{print $1}')
		    # before EPEL8 and PowerTools provide all dependencies, we use sepia for the dependencies
                    $SUDO dnf config-manager --add-repo http://apt-mirror.front.sepia.ceph.com/lab-extras/8/
                    $SUDO dnf config-manager --setopt=apt-mirror.front.sepia.ceph.com_lab-extras_8_.gpgcheck=0 --save
                elif test $ID = rhel -a $MAJOR_VERSION = 8 ; then
                    $SUDO dnf config-manager --set-enabled "codeready-builder-for-rhel-8-${ARCH}-rpms"
		    $SUDO dnf config-manager --add-repo http://apt-mirror.front.sepia.ceph.com/lab-extras/8/
		    $SUDO dnf config-manager --setopt=apt-mirror.front.sepia.ceph.com_lab-extras_8_.gpgcheck=0 --save
                fi
                ;;
        esac
        munge_ceph_spec_in $with_seastar $with_zbd $for_make_check $with_jaeger $DIR/ceph.spec
        # for python3_pkgversion macro defined by python-srpm-macros, which is required by python3-devel
        $SUDO dnf install -y python3-devel
        $SUDO $builddepcmd $DIR/ceph.spec 2>&1 | tee $DIR/yum-builddep.out
        [ ${PIPESTATUS[0]} -ne 0 ] && exit 1
        IGNORE_YUM_BUILDEP_ERRORS="ValueError: SELinux policy is not managed or store cannot be accessed."
        sed "/$IGNORE_YUM_BUILDEP_ERRORS/d" $DIR/yum-builddep.out | grep -i "error:" && exit 1
        ;;
    opensuse*|suse|sles)
        echo "Using zypper to install dependencies"
        zypp_install="zypper --gpg-auto-import-keys --non-interactive install --no-recommends"
        $SUDO $zypp_install systemd-rpm-macros rpm-build || exit 1
        munge_ceph_spec_in $with_seastar false $for_make_check $with_jaeger $DIR/ceph.spec
        $SUDO $zypp_install $(rpmspec -q --buildrequires $DIR/ceph.spec) || exit 1
        ;;
    *)
        echo "$ID is unknown, dependencies will have to be installed manually."
	exit 1
        ;;
    esac
fi

function populate_wheelhouse() {
    local install=$1
    shift

    # although pip comes with virtualenv, having a recent version
    # of pip matters when it comes to using wheel packages
    PIP_OPTS="--timeout 300 --exists-action i"
    pip $PIP_OPTS $install \
      'setuptools >= 0.8' 'pip >= 21.0' 'wheel >= 0.24' 'tox >= 2.9.1' || return 1
    if test $# != 0 ; then
        pip $PIP_OPTS $install $@ || return 1
    fi
}

function activate_virtualenv() {
    local top_srcdir=$1
    local env_dir=$top_srcdir/install-deps-python3

    if ! test -d $env_dir ; then
        python3 -m venv ${env_dir}
        . $env_dir/bin/activate
        if ! populate_wheelhouse install ; then
            rm -rf $env_dir
            return 1
        fi
    fi
    . $env_dir/bin/activate
}

function preload_wheels_for_tox() {
    local ini=$1
    shift
    pushd . > /dev/null
    cd $(dirname $ini)
    local require_files=$(ls *requirements*.txt 2>/dev/null) || true
    local constraint_files=$(ls *constraints*.txt 2>/dev/null) || true
    local require=$(echo -n "$require_files" | sed -e 's/^/-r /')
    local constraint=$(echo -n "$constraint_files" | sed -e 's/^/-c /')
    local md5=wheelhouse/md5
    if test "$require"; then
        if ! test -f $md5 || ! md5sum -c $md5 > /dev/null; then
            rm -rf wheelhouse
        fi
    fi
    if test "$require" && ! test -d wheelhouse ; then
        type python3 > /dev/null 2>&1 || continue
        activate_virtualenv $top_srcdir || exit 1
        populate_wheelhouse "wheel -w $wip_wheelhouse" $require $constraint || exit 1
        mv $wip_wheelhouse wheelhouse
        md5sum $require_files $constraint_files > $md5
    fi
    popd > /dev/null
}

# use pip cache if possible but do not store it outside of the source
# tree
# see https://pip.pypa.io/en/stable/reference/pip_install.html#caching
if $for_make_check; then
    mkdir -p install-deps-cache
    top_srcdir=$(pwd)
    if [ -n "$XDG_CACHE_HOME" ]; then
        ORIGINAL_XDG_CACHE_HOME=$XDG_CACHE_HOME
    fi
    export XDG_CACHE_HOME=$top_srcdir/install-deps-cache
    wip_wheelhouse=wheelhouse-wip
    #
    # preload python modules so that tox can run without network access
    #
    find . -name tox.ini | while read ini ; do
        preload_wheels_for_tox $ini
    done
    rm -rf $top_srcdir/install-deps-python3
    rm -rf $XDG_CACHE_HOME
    if [ -n "$ORIGINAL_XDG_CACHE_HOME" ]; then
        XDG_CACHE_HOME=$ORIGINAL_XDG_CACHE_HOME
    else
        unset XDG_CACHE_HOME
    fi
    type git > /dev/null || (echo "Dashboard uses git to pull dependencies." ; false)
fi

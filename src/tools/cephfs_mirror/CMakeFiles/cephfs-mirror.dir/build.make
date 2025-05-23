# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/led/workspace/ceph_high_power_efficiency

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/led/workspace/ceph_high_power_efficiency

# Include any dependencies generated for this target.
include src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/compiler_depend.make

# Include the progress variables for this target.
include src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/progress.make

# Include the compile flags for this target's objects.
include src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/flags.make

src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/main.cc.o: src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/flags.make
src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/main.cc.o: src/tools/cephfs_mirror/main.cc
src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/main.cc.o: src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/main.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/main.cc.o -MF CMakeFiles/cephfs-mirror.dir/main.cc.o.d -o CMakeFiles/cephfs-mirror.dir/main.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror/main.cc

src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cephfs-mirror.dir/main.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror/main.cc > CMakeFiles/cephfs-mirror.dir/main.cc.i

src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cephfs-mirror.dir/main.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror/main.cc -o CMakeFiles/cephfs-mirror.dir/main.cc.s

# Object files for target cephfs-mirror
cephfs__mirror_OBJECTS = \
"CMakeFiles/cephfs-mirror.dir/main.cc.o"

# External object files for target cephfs-mirror
cephfs__mirror_EXTERNAL_OBJECTS =

bin/cephfs-mirror: src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/main.cc.o
bin/cephfs-mirror: src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/build.make
bin/cephfs-mirror: lib/libcephfs_mirror_internal.a
bin/cephfs-mirror: lib/libglobal.a
bin/cephfs-mirror: lib/libcls_cephfs_client.a
bin/cephfs-mirror: lib/librados.so.2.0.0
bin/cephfs-mirror: lib/libmds.a
bin/cephfs-mirror: lib/libcephfs.so.2.0.0
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libtcmalloc.so
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/librt.a
bin/cephfs-mirror: lib/libheap_profiler.a
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libtcmalloc.so
bin/cephfs-mirror: lib/libcpu_profiler.a
bin/cephfs-mirror: lib/libosdc.a
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/liblua5.3.so
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libm.so
bin/cephfs-mirror: lib/libceph-common.so.2
bin/cephfs-mirror: lib/libjson_spirit.a
bin/cephfs-mirror: lib/libcommon_utf8.a
bin/cephfs-mirror: lib/liberasure_code.a
bin/cephfs-mirror: lib/libcrc32.a
bin/cephfs-mirror: lib/libarch.a
bin/cephfs-mirror: boost/lib/libboost_thread.a
bin/cephfs-mirror: boost/lib/libboost_chrono.a
bin/cephfs-mirror: boost/lib/libboost_atomic.a
bin/cephfs-mirror: boost/lib/libboost_system.a
bin/cephfs-mirror: boost/lib/libboost_random.a
bin/cephfs-mirror: boost/lib/libboost_program_options.a
bin/cephfs-mirror: boost/lib/libboost_date_time.a
bin/cephfs-mirror: boost/lib/libboost_iostreams.a
bin/cephfs-mirror: boost/lib/libboost_regex.a
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libfmt.so
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libudev.so
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libibverbs.so
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/librdmacm.so
bin/cephfs-mirror: /usr/lib/x86_64-linux-gnu/libz.so
bin/cephfs-mirror: src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/cephfs-mirror"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cephfs-mirror.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/build: bin/cephfs-mirror
.PHONY : src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/build

src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror && $(CMAKE_COMMAND) -P CMakeFiles/cephfs-mirror.dir/cmake_clean.cmake
.PHONY : src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/clean

src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror /home/led/workspace/ceph_high_power_efficiency/src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tools/cephfs_mirror/CMakeFiles/cephfs-mirror.dir/depend


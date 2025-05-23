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
include src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/compiler_depend.make

# Include the progress variables for this target.
include src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/progress.make

# Include the compile flags for this target's objects.
include src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/flags.make

src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o: src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/flags.make
src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o: src/rgw/store/dbstore/dbstore_main.cc
src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o: src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o -MF CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o.d -o CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore/dbstore_main.cc

src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/dbstore_main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dbstore-bin.dir/dbstore_main.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore/dbstore_main.cc > CMakeFiles/dbstore-bin.dir/dbstore_main.cc.i

src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/dbstore_main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dbstore-bin.dir/dbstore_main.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore/dbstore_main.cc -o CMakeFiles/dbstore-bin.dir/dbstore_main.cc.s

# Object files for target dbstore-bin
dbstore__bin_OBJECTS = \
"CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o"

# External object files for target dbstore-bin
dbstore__bin_EXTERNAL_OBJECTS =

bin/dbstore-bin: src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/dbstore_main.cc.o
bin/dbstore-bin: src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/build.make
bin/dbstore-bin: lib/libdbstore_lib.a
bin/dbstore-bin: lib/librgw_common.a
bin/dbstore-bin: lib/libsqlite_db.a
bin/dbstore-bin: lib/libdbstore.a
bin/dbstore-bin: lib/libdbstore_lib.a
bin/dbstore-bin: lib/librgw_common.a
bin/dbstore-bin: lib/libsqlite_db.a
bin/dbstore-bin: lib/libdbstore.a
bin/dbstore-bin: boost/lib/libboost_context.a
bin/dbstore-bin: lib/libcls_2pc_queue_client.a
bin/dbstore-bin: lib/libcls_cmpomap_client.a
bin/dbstore-bin: lib/libcls_lock_client.a
bin/dbstore-bin: lib/libcls_log_client.a
bin/dbstore-bin: lib/libcls_otp_client.a
bin/dbstore-bin: lib/libcls_refcount_client.a
bin/dbstore-bin: lib/libcls_rgw_client.a
bin/dbstore-bin: lib/libcls_rgw_gc_client.a
bin/dbstore-bin: lib/libcls_timeindex_client.a
bin/dbstore-bin: lib/libcls_user_client.a
bin/dbstore-bin: lib/libcls_version_client.a
bin/dbstore-bin: lib/librados.so.2.0.0
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libicuuc.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/liboath.so
bin/dbstore-bin: lib/libdmclock.a
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libcurl.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libexpat.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/liblua5.3.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libm.so
bin/dbstore-bin: src/arrow/lib/libparquet.a
bin/dbstore-bin: src/arrow/lib/libarrow.a
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/liblz4.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libsnappy.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libz.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/librdkafka.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/librabbitmq.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libssl.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libldap.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/liblber.so
bin/dbstore-bin: boost/lib/libboost_filesystem.a
bin/dbstore-bin: lib/libglobal.a
bin/dbstore-bin: lib/libceph-common.so.2
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libfmt.so
bin/dbstore-bin: lib/libjson_spirit.a
bin/dbstore-bin: lib/libcommon_utf8.a
bin/dbstore-bin: lib/liberasure_code.a
bin/dbstore-bin: lib/libcrc32.a
bin/dbstore-bin: lib/libarch.a
bin/dbstore-bin: boost/lib/libboost_thread.a
bin/dbstore-bin: boost/lib/libboost_system.a
bin/dbstore-bin: boost/lib/libboost_chrono.a
bin/dbstore-bin: boost/lib/libboost_atomic.a
bin/dbstore-bin: boost/lib/libboost_random.a
bin/dbstore-bin: boost/lib/libboost_program_options.a
bin/dbstore-bin: boost/lib/libboost_date_time.a
bin/dbstore-bin: boost/lib/libboost_iostreams.a
bin/dbstore-bin: boost/lib/libboost_regex.a
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libudev.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libibverbs.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/librdmacm.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/libz.so
bin/dbstore-bin: /usr/lib/x86_64-linux-gnu/librt.a
bin/dbstore-bin: src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../../bin/dbstore-bin"
	cd /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dbstore-bin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/build: bin/dbstore-bin
.PHONY : src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/build

src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore && $(CMAKE_COMMAND) -P CMakeFiles/dbstore-bin.dir/cmake_clean.cmake
.PHONY : src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/clean

src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore /home/led/workspace/ceph_high_power_efficiency/src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/rgw/store/dbstore/CMakeFiles/dbstore-bin.dir/depend


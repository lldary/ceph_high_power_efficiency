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
include src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/compiler_depend.make

# Include the progress variables for this target.
include src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/flags.make

src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o: src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/flags.make
src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o: src/test/rgw/test_rgw_obj.cc
src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o: src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o -MF CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o.d -o CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/rgw/test_rgw_obj.cc

src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/rgw/test_rgw_obj.cc > CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.i

src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/rgw/test_rgw_obj.cc -o CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.s

# Object files for target ceph_test_rgw_obj
ceph_test_rgw_obj_OBJECTS = \
"CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o"

# External object files for target ceph_test_rgw_obj
ceph_test_rgw_obj_EXTERNAL_OBJECTS =

bin/ceph_test_rgw_obj: src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/test_rgw_obj.cc.o
bin/ceph_test_rgw_obj: src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/build.make
bin/ceph_test_rgw_obj: lib/libtest_rgw_a.a
bin/ceph_test_rgw_obj: lib/libcls_rgw_client.a
bin/ceph_test_rgw_obj: lib/libcls_lock_client.a
bin/ceph_test_rgw_obj: lib/libcls_refcount_client.a
bin/ceph_test_rgw_obj: lib/libcls_log_client.a
bin/ceph_test_rgw_obj: lib/libcls_version_client.a
bin/ceph_test_rgw_obj: lib/libcls_user_client.a
bin/ceph_test_rgw_obj: lib/libglobal.a
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libcurl.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libexpat.so
bin/ceph_test_rgw_obj: lib/libgmock_maind.a
bin/ceph_test_rgw_obj: lib/libgmockd.a
bin/ceph_test_rgw_obj: lib/libgtestd.a
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/ceph_test_rgw_obj: lib/librgw_a.a
bin/ceph_test_rgw_obj: lib/librgw_common.a
bin/ceph_test_rgw_obj: lib/libdbstore.a
bin/ceph_test_rgw_obj: lib/libdbstore_lib.a
bin/ceph_test_rgw_obj: lib/libsqlite_db.a
bin/ceph_test_rgw_obj: lib/librgw_common.a
bin/ceph_test_rgw_obj: lib/libdbstore.a
bin/ceph_test_rgw_obj: lib/libdbstore_lib.a
bin/ceph_test_rgw_obj: lib/libsqlite_db.a
bin/ceph_test_rgw_obj: lib/libcls_rgw_client.a
bin/ceph_test_rgw_obj: lib/libcls_lock_client.a
bin/ceph_test_rgw_obj: lib/libcls_refcount_client.a
bin/ceph_test_rgw_obj: lib/libcls_log_client.a
bin/ceph_test_rgw_obj: lib/libcls_version_client.a
bin/ceph_test_rgw_obj: lib/libcls_user_client.a
bin/ceph_test_rgw_obj: lib/librados.so.2.0.0
bin/ceph_test_rgw_obj: lib/libglobal.a
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/librt.a
bin/ceph_test_rgw_obj: lib/libceph-common.so.2
bin/ceph_test_rgw_obj: lib/libjson_spirit.a
bin/ceph_test_rgw_obj: lib/libcommon_utf8.a
bin/ceph_test_rgw_obj: lib/liberasure_code.a
bin/ceph_test_rgw_obj: lib/libcrc32.a
bin/ceph_test_rgw_obj: lib/libarch.a
bin/ceph_test_rgw_obj: boost/lib/libboost_random.a
bin/ceph_test_rgw_obj: boost/lib/libboost_program_options.a
bin/ceph_test_rgw_obj: boost/lib/libboost_iostreams.a
bin/ceph_test_rgw_obj: boost/lib/libboost_regex.a
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libudev.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libibverbs.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/librdmacm.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libz.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libfmt.so
bin/ceph_test_rgw_obj: src/arrow/lib/libparquet.a
bin/ceph_test_rgw_obj: src/arrow/lib/libarrow.a
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/liblz4.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libsnappy.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libz.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/liboath.so
bin/ceph_test_rgw_obj: lib/libcls_2pc_queue_client.a
bin/ceph_test_rgw_obj: lib/libcls_cmpomap_client.a
bin/ceph_test_rgw_obj: lib/libcls_otp_client.a
bin/ceph_test_rgw_obj: lib/libcls_rgw_gc_client.a
bin/ceph_test_rgw_obj: lib/libcls_timeindex_client.a
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libcurl.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libexpat.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/liblua5.3.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libm.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libicuuc.so
bin/ceph_test_rgw_obj: lib/libdmclock.a
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/librdkafka.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/librabbitmq.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libssl.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/libldap.so
bin/ceph_test_rgw_obj: /usr/lib/x86_64-linux-gnu/liblber.so
bin/ceph_test_rgw_obj: boost/lib/libboost_context.a
bin/ceph_test_rgw_obj: boost/lib/libboost_thread.a
bin/ceph_test_rgw_obj: boost/lib/libboost_atomic.a
bin/ceph_test_rgw_obj: boost/lib/libboost_date_time.a
bin/ceph_test_rgw_obj: boost/lib/libboost_chrono.a
bin/ceph_test_rgw_obj: lib/libamqp_mock.a
bin/ceph_test_rgw_obj: lib/libkafka_stub.a
bin/ceph_test_rgw_obj: boost/lib/libboost_filesystem.a
bin/ceph_test_rgw_obj: boost/lib/libboost_system.a
bin/ceph_test_rgw_obj: src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/ceph_test_rgw_obj"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_test_rgw_obj.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/build: bin/ceph_test_rgw_obj
.PHONY : src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/build

src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && $(CMAKE_COMMAND) -P CMakeFiles/ceph_test_rgw_obj.dir/cmake_clean.cmake
.PHONY : src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/clean

src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/rgw /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/rgw /home/led/workspace/ceph_high_power_efficiency/src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/rgw/CMakeFiles/ceph_test_rgw_obj.dir/depend


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
include src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/compiler_depend.make

# Include the progress variables for this target.
include src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/flags.make

src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o: src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/flags.make
src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o: src/test/rgw/test_rgw_compression.cc
src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o: src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o -MF CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o.d -o CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/rgw/test_rgw_compression.cc

src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/rgw/test_rgw_compression.cc > CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.i

src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/rgw/test_rgw_compression.cc -o CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.s

# Object files for target unittest_rgw_compression
unittest_rgw_compression_OBJECTS = \
"CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o"

# External object files for target unittest_rgw_compression
unittest_rgw_compression_EXTERNAL_OBJECTS = \
"/home/led/workspace/ceph_high_power_efficiency/src/test/CMakeFiles/unit-main.dir/unit.cc.o"

bin/unittest_rgw_compression: src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/test_rgw_compression.cc.o
bin/unittest_rgw_compression: src/test/CMakeFiles/unit-main.dir/unit.cc.o
bin/unittest_rgw_compression: src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/build.make
bin/unittest_rgw_compression: lib/libgmock_maind.a
bin/unittest_rgw_compression: lib/libgmockd.a
bin/unittest_rgw_compression: lib/libgtestd.a
bin/unittest_rgw_compression: lib/librgw_a.a
bin/unittest_rgw_compression: lib/libamqp_mock.a
bin/unittest_rgw_compression: lib/libkafka_stub.a
bin/unittest_rgw_compression: boost/lib/libboost_filesystem.a
bin/unittest_rgw_compression: lib/librgw_common.a
bin/unittest_rgw_compression: lib/libdbstore.a
bin/unittest_rgw_compression: lib/libdbstore_lib.a
bin/unittest_rgw_compression: lib/libsqlite_db.a
bin/unittest_rgw_compression: lib/librgw_common.a
bin/unittest_rgw_compression: lib/libdbstore.a
bin/unittest_rgw_compression: lib/libdbstore_lib.a
bin/unittest_rgw_compression: lib/libsqlite_db.a
bin/unittest_rgw_compression: boost/lib/libboost_filesystem.a
bin/unittest_rgw_compression: lib/libglobal.a
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/librt.a
bin/unittest_rgw_compression: src/arrow/lib/libparquet.a
bin/unittest_rgw_compression: src/arrow/lib/libarrow.a
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/liblz4.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libsnappy.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libz.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/liboath.so
bin/unittest_rgw_compression: lib/libcls_2pc_queue_client.a
bin/unittest_rgw_compression: lib/libcls_cmpomap_client.a
bin/unittest_rgw_compression: lib/libcls_lock_client.a
bin/unittest_rgw_compression: lib/libcls_log_client.a
bin/unittest_rgw_compression: lib/libcls_otp_client.a
bin/unittest_rgw_compression: lib/libcls_refcount_client.a
bin/unittest_rgw_compression: lib/libcls_rgw_client.a
bin/unittest_rgw_compression: lib/libcls_rgw_gc_client.a
bin/unittest_rgw_compression: lib/libcls_timeindex_client.a
bin/unittest_rgw_compression: lib/libcls_user_client.a
bin/unittest_rgw_compression: lib/libcls_version_client.a
bin/unittest_rgw_compression: lib/librados.so.2.0.0
bin/unittest_rgw_compression: lib/libceph-common.so.2
bin/unittest_rgw_compression: lib/libjson_spirit.a
bin/unittest_rgw_compression: lib/libcommon_utf8.a
bin/unittest_rgw_compression: lib/liberasure_code.a
bin/unittest_rgw_compression: lib/libcrc32.a
bin/unittest_rgw_compression: lib/libarch.a
bin/unittest_rgw_compression: boost/lib/libboost_random.a
bin/unittest_rgw_compression: boost/lib/libboost_program_options.a
bin/unittest_rgw_compression: boost/lib/libboost_iostreams.a
bin/unittest_rgw_compression: boost/lib/libboost_regex.a
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libudev.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libibverbs.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/librdmacm.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libz.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libfmt.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libicuuc.so
bin/unittest_rgw_compression: lib/libdmclock.a
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libcurl.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libexpat.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/liblua5.3.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libm.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/librdkafka.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/librabbitmq.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libssl.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/libldap.so
bin/unittest_rgw_compression: /usr/lib/x86_64-linux-gnu/liblber.so
bin/unittest_rgw_compression: boost/lib/libboost_context.a
bin/unittest_rgw_compression: boost/lib/libboost_thread.a
bin/unittest_rgw_compression: boost/lib/libboost_system.a
bin/unittest_rgw_compression: boost/lib/libboost_atomic.a
bin/unittest_rgw_compression: boost/lib/libboost_date_time.a
bin/unittest_rgw_compression: boost/lib/libboost_chrono.a
bin/unittest_rgw_compression: src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/unittest_rgw_compression"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unittest_rgw_compression.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/build: bin/unittest_rgw_compression
.PHONY : src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/build

src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/rgw && $(CMAKE_COMMAND) -P CMakeFiles/unittest_rgw_compression.dir/cmake_clean.cmake
.PHONY : src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/clean

src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/rgw /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/rgw /home/led/workspace/ceph_high_power_efficiency/src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/rgw/CMakeFiles/unittest_rgw_compression.dir/depend


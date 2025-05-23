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
include src/test/osd/CMakeFiles/unittest_ecbackend.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/test/osd/CMakeFiles/unittest_ecbackend.dir/compiler_depend.make

# Include the progress variables for this target.
include src/test/osd/CMakeFiles/unittest_ecbackend.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/osd/CMakeFiles/unittest_ecbackend.dir/flags.make

src/test/osd/CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o: src/test/osd/CMakeFiles/unittest_ecbackend.dir/flags.make
src/test/osd/CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o: src/test/osd/TestECBackend.cc
src/test/osd/CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o: src/test/osd/CMakeFiles/unittest_ecbackend.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/osd/CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/osd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/osd/CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o -MF CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o.d -o CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/osd/TestECBackend.cc

src/test/osd/CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/osd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/osd/TestECBackend.cc > CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.i

src/test/osd/CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/osd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/osd/TestECBackend.cc -o CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.s

# Object files for target unittest_ecbackend
unittest_ecbackend_OBJECTS = \
"CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o"

# External object files for target unittest_ecbackend
unittest_ecbackend_EXTERNAL_OBJECTS =

bin/unittest_ecbackend: src/test/osd/CMakeFiles/unittest_ecbackend.dir/TestECBackend.cc.o
bin/unittest_ecbackend: src/test/osd/CMakeFiles/unittest_ecbackend.dir/build.make
bin/unittest_ecbackend: lib/libgmock_maind.a
bin/unittest_ecbackend: lib/libgmockd.a
bin/unittest_ecbackend: lib/libgtestd.a
bin/unittest_ecbackend: lib/libosd.a
bin/unittest_ecbackend: lib/libglobal.a
bin/unittest_ecbackend: lib/libdmclock.a
bin/unittest_ecbackend: lib/libos.a
bin/unittest_ecbackend: lib/libblk.a
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libaio.so
bin/unittest_ecbackend: lib/libkv.a
bin/unittest_ecbackend: src/rocksdb/librocksdb.a
bin/unittest_ecbackend: src/liburing/src/liburing.a
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libsnappy.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/liblz4.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libz.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libfuse3.so
bin/unittest_ecbackend: lib/libheap_profiler.a
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libtcmalloc.so
bin/unittest_ecbackend: lib/libcpu_profiler.a
bin/unittest_ecbackend: lib/libceph-common.so.2
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libfmt.so
bin/unittest_ecbackend: lib/libjson_spirit.a
bin/unittest_ecbackend: lib/libcommon_utf8.a
bin/unittest_ecbackend: lib/liberasure_code.a
bin/unittest_ecbackend: lib/libcrc32.a
bin/unittest_ecbackend: lib/libarch.a
bin/unittest_ecbackend: boost/lib/libboost_thread.a
bin/unittest_ecbackend: boost/lib/libboost_chrono.a
bin/unittest_ecbackend: boost/lib/libboost_atomic.a
bin/unittest_ecbackend: boost/lib/libboost_system.a
bin/unittest_ecbackend: boost/lib/libboost_random.a
bin/unittest_ecbackend: boost/lib/libboost_program_options.a
bin/unittest_ecbackend: boost/lib/libboost_date_time.a
bin/unittest_ecbackend: boost/lib/libboost_iostreams.a
bin/unittest_ecbackend: boost/lib/libboost_regex.a
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libudev.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libibverbs.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/librdmacm.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/libz.so
bin/unittest_ecbackend: /usr/lib/x86_64-linux-gnu/librt.a
bin/unittest_ecbackend: src/test/osd/CMakeFiles/unittest_ecbackend.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/unittest_ecbackend"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/osd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unittest_ecbackend.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/osd/CMakeFiles/unittest_ecbackend.dir/build: bin/unittest_ecbackend
.PHONY : src/test/osd/CMakeFiles/unittest_ecbackend.dir/build

src/test/osd/CMakeFiles/unittest_ecbackend.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/osd && $(CMAKE_COMMAND) -P CMakeFiles/unittest_ecbackend.dir/cmake_clean.cmake
.PHONY : src/test/osd/CMakeFiles/unittest_ecbackend.dir/clean

src/test/osd/CMakeFiles/unittest_ecbackend.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/osd /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/osd /home/led/workspace/ceph_high_power_efficiency/src/test/osd/CMakeFiles/unittest_ecbackend.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/osd/CMakeFiles/unittest_ecbackend.dir/depend


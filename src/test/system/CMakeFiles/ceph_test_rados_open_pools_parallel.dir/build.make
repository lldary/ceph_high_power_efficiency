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
include src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/compiler_depend.make

# Include the progress variables for this target.
include src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/flags.make

src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o: src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/flags.make
src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o: src/test/system/rados_open_pools_parallel.cc
src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o: src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/system && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o -MF CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o.d -o CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/system/rados_open_pools_parallel.cc

src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/system && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/system/rados_open_pools_parallel.cc > CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.i

src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/system && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/system/rados_open_pools_parallel.cc -o CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.s

# Object files for target ceph_test_rados_open_pools_parallel
ceph_test_rados_open_pools_parallel_OBJECTS = \
"CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o"

# External object files for target ceph_test_rados_open_pools_parallel
ceph_test_rados_open_pools_parallel_EXTERNAL_OBJECTS =

bin/ceph_test_rados_open_pools_parallel: src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/rados_open_pools_parallel.cc.o
bin/ceph_test_rados_open_pools_parallel: src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/build.make
bin/ceph_test_rados_open_pools_parallel: lib/librados.so.2.0.0
bin/ceph_test_rados_open_pools_parallel: lib/libsystest.a
bin/ceph_test_rados_open_pools_parallel: lib/libglobal.a
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/ceph_test_rados_open_pools_parallel: lib/libceph-common.so.2
bin/ceph_test_rados_open_pools_parallel: lib/libjson_spirit.a
bin/ceph_test_rados_open_pools_parallel: lib/libcommon_utf8.a
bin/ceph_test_rados_open_pools_parallel: lib/liberasure_code.a
bin/ceph_test_rados_open_pools_parallel: lib/libcrc32.a
bin/ceph_test_rados_open_pools_parallel: lib/libarch.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_thread.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_chrono.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_atomic.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_system.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_random.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_program_options.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_date_time.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_iostreams.a
bin/ceph_test_rados_open_pools_parallel: boost/lib/libboost_regex.a
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/libfmt.so
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/libudev.so
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/libibverbs.so
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/librdmacm.so
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/libz.so
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/librt.a
bin/ceph_test_rados_open_pools_parallel: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/ceph_test_rados_open_pools_parallel: src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/ceph_test_rados_open_pools_parallel"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/system && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph_test_rados_open_pools_parallel.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/build: bin/ceph_test_rados_open_pools_parallel
.PHONY : src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/build

src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/system && $(CMAKE_COMMAND) -P CMakeFiles/ceph_test_rados_open_pools_parallel.dir/cmake_clean.cmake
.PHONY : src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/clean

src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/system /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/system /home/led/workspace/ceph_high_power_efficiency/src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/system/CMakeFiles/ceph_test_rados_open_pools_parallel.dir/depend


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
include src/test/CMakeFiles/unittest_auth.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/test/CMakeFiles/unittest_auth.dir/compiler_depend.make

# Include the progress variables for this target.
include src/test/CMakeFiles/unittest_auth.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/CMakeFiles/unittest_auth.dir/flags.make

src/test/CMakeFiles/unittest_auth.dir/test_auth.cc.o: src/test/CMakeFiles/unittest_auth.dir/flags.make
src/test/CMakeFiles/unittest_auth.dir/test_auth.cc.o: src/test/test_auth.cc
src/test/CMakeFiles/unittest_auth.dir/test_auth.cc.o: src/test/CMakeFiles/unittest_auth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/CMakeFiles/unittest_auth.dir/test_auth.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/CMakeFiles/unittest_auth.dir/test_auth.cc.o -MF CMakeFiles/unittest_auth.dir/test_auth.cc.o.d -o CMakeFiles/unittest_auth.dir/test_auth.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/test_auth.cc

src/test/CMakeFiles/unittest_auth.dir/test_auth.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/unittest_auth.dir/test_auth.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/test_auth.cc > CMakeFiles/unittest_auth.dir/test_auth.cc.i

src/test/CMakeFiles/unittest_auth.dir/test_auth.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/unittest_auth.dir/test_auth.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/test_auth.cc -o CMakeFiles/unittest_auth.dir/test_auth.cc.s

# Object files for target unittest_auth
unittest_auth_OBJECTS = \
"CMakeFiles/unittest_auth.dir/test_auth.cc.o"

# External object files for target unittest_auth
unittest_auth_EXTERNAL_OBJECTS = \
"/home/led/workspace/ceph_high_power_efficiency/src/test/CMakeFiles/unit-main.dir/unit.cc.o"

bin/unittest_auth: src/test/CMakeFiles/unittest_auth.dir/test_auth.cc.o
bin/unittest_auth: src/test/CMakeFiles/unit-main.dir/unit.cc.o
bin/unittest_auth: src/test/CMakeFiles/unittest_auth.dir/build.make
bin/unittest_auth: lib/libgmock_maind.a
bin/unittest_auth: lib/libgmockd.a
bin/unittest_auth: lib/libgtestd.a
bin/unittest_auth: lib/libglobal.a
bin/unittest_auth: lib/libceph-common.so.2
bin/unittest_auth: lib/libjson_spirit.a
bin/unittest_auth: lib/libcommon_utf8.a
bin/unittest_auth: lib/liberasure_code.a
bin/unittest_auth: lib/libcrc32.a
bin/unittest_auth: lib/libarch.a
bin/unittest_auth: boost/lib/libboost_thread.a
bin/unittest_auth: boost/lib/libboost_chrono.a
bin/unittest_auth: boost/lib/libboost_atomic.a
bin/unittest_auth: boost/lib/libboost_system.a
bin/unittest_auth: boost/lib/libboost_random.a
bin/unittest_auth: boost/lib/libboost_program_options.a
bin/unittest_auth: boost/lib/libboost_date_time.a
bin/unittest_auth: boost/lib/libboost_iostreams.a
bin/unittest_auth: boost/lib/libboost_regex.a
bin/unittest_auth: /usr/lib/x86_64-linux-gnu/libfmt.so
bin/unittest_auth: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/unittest_auth: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/unittest_auth: /usr/lib/x86_64-linux-gnu/libudev.so
bin/unittest_auth: /usr/lib/x86_64-linux-gnu/libibverbs.so
bin/unittest_auth: /usr/lib/x86_64-linux-gnu/librdmacm.so
bin/unittest_auth: /usr/lib/x86_64-linux-gnu/libz.so
bin/unittest_auth: /usr/lib/x86_64-linux-gnu/librt.a
bin/unittest_auth: src/test/CMakeFiles/unittest_auth.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/unittest_auth"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unittest_auth.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/CMakeFiles/unittest_auth.dir/build: bin/unittest_auth
.PHONY : src/test/CMakeFiles/unittest_auth.dir/build

src/test/CMakeFiles/unittest_auth.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/test && $(CMAKE_COMMAND) -P CMakeFiles/unittest_auth.dir/cmake_clean.cmake
.PHONY : src/test/CMakeFiles/unittest_auth.dir/clean

src/test/CMakeFiles/unittest_auth.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test /home/led/workspace/ceph_high_power_efficiency/src/test/CMakeFiles/unittest_auth.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/CMakeFiles/unittest_auth.dir/depend


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
include src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/compiler_depend.make

# Include the progress variables for this target.
include src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/progress.make

# Include the compile flags for this target's objects.
include src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/flags.make

src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/server.cc.o: src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/flags.make
src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/server.cc.o: src/cls/cmpomap/server.cc
src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/server.cc.o: src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/server.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/server.cc.o -MF CMakeFiles/cls_cmpomap.dir/server.cc.o.d -o CMakeFiles/cls_cmpomap.dir/server.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap/server.cc

src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/server.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cls_cmpomap.dir/server.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap/server.cc > CMakeFiles/cls_cmpomap.dir/server.cc.i

src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/server.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cls_cmpomap.dir/server.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap/server.cc -o CMakeFiles/cls_cmpomap.dir/server.cc.s

# Object files for target cls_cmpomap
cls_cmpomap_OBJECTS = \
"CMakeFiles/cls_cmpomap.dir/server.cc.o"

# External object files for target cls_cmpomap
cls_cmpomap_EXTERNAL_OBJECTS =

lib/libcls_cmpomap.so.1.0.0: src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/server.cc.o
lib/libcls_cmpomap.so.1.0.0: src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/build.make
lib/libcls_cmpomap.so.1.0.0: src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../../../lib/libcls_cmpomap.so"
	cd /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cls_cmpomap.dir/link.txt --verbose=$(VERBOSE)
	cd /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap && $(CMAKE_COMMAND) -E cmake_symlink_library ../../../lib/libcls_cmpomap.so.1.0.0 ../../../lib/libcls_cmpomap.so.1 ../../../lib/libcls_cmpomap.so

lib/libcls_cmpomap.so.1: lib/libcls_cmpomap.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libcls_cmpomap.so.1

lib/libcls_cmpomap.so: lib/libcls_cmpomap.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libcls_cmpomap.so

# Rule to build all files generated by this target.
src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/build: lib/libcls_cmpomap.so
.PHONY : src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/build

src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap && $(CMAKE_COMMAND) -P CMakeFiles/cls_cmpomap.dir/cmake_clean.cmake
.PHONY : src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/clean

src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap /home/led/workspace/ceph_high_power_efficiency/src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/cls/cmpomap/CMakeFiles/cls_cmpomap.dir/depend


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

# Utility rule file for bluestore-tp.

# Include any custom commands dependencies for this target.
include src/tracing/CMakeFiles/bluestore-tp.dir/compiler_depend.make

# Include the progress variables for this target.
include src/tracing/CMakeFiles/bluestore-tp.dir/progress.make

src/tracing/CMakeFiles/bluestore-tp: include/tracing/bluestore.h

include/tracing/bluestore.h: src/tracing/bluestore.tp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "generating /home/led/workspace/ceph_high_power_efficiency/include/tracing/bluestore.h"
	cd /home/led/workspace/ceph_high_power_efficiency/include && /usr/bin/lttng-gen-tp /home/led/workspace/ceph_high_power_efficiency/src/tracing/bluestore.tp -o tracing/bluestore.h

bluestore-tp: include/tracing/bluestore.h
bluestore-tp: src/tracing/CMakeFiles/bluestore-tp
bluestore-tp: src/tracing/CMakeFiles/bluestore-tp.dir/build.make
.PHONY : bluestore-tp

# Rule to build all files generated by this target.
src/tracing/CMakeFiles/bluestore-tp.dir/build: bluestore-tp
.PHONY : src/tracing/CMakeFiles/bluestore-tp.dir/build

src/tracing/CMakeFiles/bluestore-tp.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && $(CMAKE_COMMAND) -P CMakeFiles/bluestore-tp.dir/cmake_clean.cmake
.PHONY : src/tracing/CMakeFiles/bluestore-tp.dir/clean

src/tracing/CMakeFiles/bluestore-tp.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/tracing /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/tracing /home/led/workspace/ceph_high_power_efficiency/src/tracing/CMakeFiles/bluestore-tp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tracing/CMakeFiles/bluestore-tp.dir/depend


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
include src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/compiler_depend.make

# Include the progress variables for this target.
include src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/progress.make

# Include the compile flags for this target's objects.
include src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/flags.make

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/flags.make
src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o: src/tools/rbd_mirror/image_map/Types.cc
src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o -MF CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o.d -o CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/image_map/Types.cc

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/image_map/Types.cc > CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.i

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/image_map/Types.cc -o CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.s

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/flags.make
src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o: src/tools/rbd_mirror/instance_watcher/Types.cc
src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o -MF CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o.d -o CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/instance_watcher/Types.cc

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/instance_watcher/Types.cc > CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.i

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/instance_watcher/Types.cc -o CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.s

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/flags.make
src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o: src/tools/rbd_mirror/leader_watcher/Types.cc
src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o -MF CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o.d -o CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/leader_watcher/Types.cc

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/leader_watcher/Types.cc > CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.i

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/leader_watcher/Types.cc -o CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.s

# Object files for target rbd_mirror_types
rbd_mirror_types_OBJECTS = \
"CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o" \
"CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o" \
"CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o"

# External object files for target rbd_mirror_types
rbd_mirror_types_EXTERNAL_OBJECTS =

lib/librbd_mirror_types.a: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/image_map/Types.cc.o
lib/librbd_mirror_types.a: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/instance_watcher/Types.cc.o
lib/librbd_mirror_types.a: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/leader_watcher/Types.cc.o
lib/librbd_mirror_types.a: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/build.make
lib/librbd_mirror_types.a: src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library ../../../lib/librbd_mirror_types.a"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && $(CMAKE_COMMAND) -P CMakeFiles/rbd_mirror_types.dir/cmake_clean_target.cmake
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rbd_mirror_types.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/build: lib/librbd_mirror_types.a
.PHONY : src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/build

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror && $(CMAKE_COMMAND) -P CMakeFiles/rbd_mirror_types.dir/cmake_clean.cmake
.PHONY : src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/clean

src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror /home/led/workspace/ceph_high_power_efficiency/src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tools/rbd_mirror/CMakeFiles/rbd_mirror_types.dir/depend


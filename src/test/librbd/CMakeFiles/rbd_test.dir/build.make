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
include src/test/librbd/CMakeFiles/rbd_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.make

# Include the progress variables for this target.
include src/test/librbd/CMakeFiles/rbd_test.dir/progress.make

# Include the compile flags for this target's objects.
include src/test/librbd/CMakeFiles/rbd_test.dir/flags.make

src/test/librbd/CMakeFiles/rbd_test.dir/test_fixture.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_fixture.cc.o: src/test/librbd/test_fixture.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_fixture.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_fixture.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_fixture.cc.o -MF CMakeFiles/rbd_test.dir/test_fixture.cc.o.d -o CMakeFiles/rbd_test.dir/test_fixture.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_fixture.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_fixture.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_fixture.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_fixture.cc > CMakeFiles/rbd_test.dir/test_fixture.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_fixture.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_fixture.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_fixture.cc -o CMakeFiles/rbd_test.dir/test_fixture.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_librbd.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_librbd.cc.o: src/test/librbd/test_librbd.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_librbd.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_librbd.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_librbd.cc.o -MF CMakeFiles/rbd_test.dir/test_librbd.cc.o.d -o CMakeFiles/rbd_test.dir/test_librbd.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_librbd.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_librbd.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_librbd.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_librbd.cc > CMakeFiles/rbd_test.dir/test_librbd.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_librbd.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_librbd.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_librbd.cc -o CMakeFiles/rbd_test.dir/test_librbd.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o: src/test/librbd/test_ImageWatcher.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o -MF CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o.d -o CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_ImageWatcher.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_ImageWatcher.cc > CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_ImageWatcher.cc -o CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_internal.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_internal.cc.o: src/test/librbd/test_internal.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_internal.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_internal.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_internal.cc.o -MF CMakeFiles/rbd_test.dir/test_internal.cc.o.d -o CMakeFiles/rbd_test.dir/test_internal.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_internal.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_internal.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_internal.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_internal.cc > CMakeFiles/rbd_test.dir/test_internal.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_internal.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_internal.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_internal.cc -o CMakeFiles/rbd_test.dir/test_internal.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_mirroring.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_mirroring.cc.o: src/test/librbd/test_mirroring.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_mirroring.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_mirroring.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_mirroring.cc.o -MF CMakeFiles/rbd_test.dir/test_mirroring.cc.o.d -o CMakeFiles/rbd_test.dir/test_mirroring.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_mirroring.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_mirroring.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_mirroring.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_mirroring.cc > CMakeFiles/rbd_test.dir/test_mirroring.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_mirroring.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_mirroring.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_mirroring.cc -o CMakeFiles/rbd_test.dir/test_mirroring.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o: src/test/librbd/test_DeepCopy.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o -MF CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o.d -o CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_DeepCopy.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_DeepCopy.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_DeepCopy.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_DeepCopy.cc > CMakeFiles/rbd_test.dir/test_DeepCopy.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_DeepCopy.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_DeepCopy.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_DeepCopy.cc -o CMakeFiles/rbd_test.dir/test_DeepCopy.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_Groups.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_Groups.cc.o: src/test/librbd/test_Groups.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_Groups.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_Groups.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_Groups.cc.o -MF CMakeFiles/rbd_test.dir/test_Groups.cc.o.d -o CMakeFiles/rbd_test.dir/test_Groups.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Groups.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_Groups.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_Groups.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Groups.cc > CMakeFiles/rbd_test.dir/test_Groups.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_Groups.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_Groups.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Groups.cc -o CMakeFiles/rbd_test.dir/test_Groups.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_Migration.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_Migration.cc.o: src/test/librbd/test_Migration.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_Migration.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_Migration.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_Migration.cc.o -MF CMakeFiles/rbd_test.dir/test_Migration.cc.o.d -o CMakeFiles/rbd_test.dir/test_Migration.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Migration.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_Migration.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_Migration.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Migration.cc > CMakeFiles/rbd_test.dir/test_Migration.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_Migration.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_Migration.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Migration.cc -o CMakeFiles/rbd_test.dir/test_Migration.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o: src/test/librbd/test_MirroringWatcher.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o -MF CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o.d -o CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_MirroringWatcher.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_MirroringWatcher.cc > CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_MirroringWatcher.cc -o CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o: src/test/librbd/test_ObjectMap.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o -MF CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o.d -o CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_ObjectMap.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_ObjectMap.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_ObjectMap.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_ObjectMap.cc > CMakeFiles/rbd_test.dir/test_ObjectMap.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_ObjectMap.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_ObjectMap.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_ObjectMap.cc -o CMakeFiles/rbd_test.dir/test_ObjectMap.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_Operations.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_Operations.cc.o: src/test/librbd/test_Operations.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_Operations.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_Operations.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_Operations.cc.o -MF CMakeFiles/rbd_test.dir/test_Operations.cc.o.d -o CMakeFiles/rbd_test.dir/test_Operations.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Operations.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_Operations.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_Operations.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Operations.cc > CMakeFiles/rbd_test.dir/test_Operations.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_Operations.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_Operations.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Operations.cc -o CMakeFiles/rbd_test.dir/test_Operations.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/test_Trash.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/test_Trash.cc.o: src/test/librbd/test_Trash.cc
src/test/librbd/CMakeFiles/rbd_test.dir/test_Trash.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/test_Trash.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/test_Trash.cc.o -MF CMakeFiles/rbd_test.dir/test_Trash.cc.o.d -o CMakeFiles/rbd_test.dir/test_Trash.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Trash.cc

src/test/librbd/CMakeFiles/rbd_test.dir/test_Trash.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/test_Trash.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Trash.cc > CMakeFiles/rbd_test.dir/test_Trash.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/test_Trash.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/test_Trash.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/test_Trash.cc -o CMakeFiles/rbd_test.dir/test_Trash.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o: src/test/librbd/journal/test_Entries.cc
src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o -MF CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o.d -o CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Entries.cc

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Entries.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/journal/test_Entries.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Entries.cc > CMakeFiles/rbd_test.dir/journal/test_Entries.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Entries.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/journal/test_Entries.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Entries.cc -o CMakeFiles/rbd_test.dir/journal/test_Entries.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o: src/test/librbd/journal/test_Replay.cc
src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o -MF CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o.d -o CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Replay.cc

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Replay.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/journal/test_Replay.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Replay.cc > CMakeFiles/rbd_test.dir/journal/test_Replay.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Replay.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/journal/test_Replay.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Replay.cc -o CMakeFiles/rbd_test.dir/journal/test_Replay.cc.s

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/flags.make
src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o: src/test/librbd/journal/test_Stress.cc
src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o: src/test/librbd/CMakeFiles/rbd_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o -MF CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o.d -o CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Stress.cc

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Stress.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rbd_test.dir/journal/test_Stress.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Stress.cc > CMakeFiles/rbd_test.dir/journal/test_Stress.cc.i

src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Stress.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rbd_test.dir/journal/test_Stress.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/journal/test_Stress.cc -o CMakeFiles/rbd_test.dir/journal/test_Stress.cc.s

# Object files for target rbd_test
rbd_test_OBJECTS = \
"CMakeFiles/rbd_test.dir/test_fixture.cc.o" \
"CMakeFiles/rbd_test.dir/test_librbd.cc.o" \
"CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o" \
"CMakeFiles/rbd_test.dir/test_internal.cc.o" \
"CMakeFiles/rbd_test.dir/test_mirroring.cc.o" \
"CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o" \
"CMakeFiles/rbd_test.dir/test_Groups.cc.o" \
"CMakeFiles/rbd_test.dir/test_Migration.cc.o" \
"CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o" \
"CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o" \
"CMakeFiles/rbd_test.dir/test_Operations.cc.o" \
"CMakeFiles/rbd_test.dir/test_Trash.cc.o" \
"CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o" \
"CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o" \
"CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o"

# External object files for target rbd_test
rbd_test_EXTERNAL_OBJECTS =

lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_fixture.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_librbd.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_ImageWatcher.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_internal.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_mirroring.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_DeepCopy.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_Groups.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_Migration.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_MirroringWatcher.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_ObjectMap.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_Operations.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/test_Trash.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Entries.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Replay.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/journal/test_Stress.cc.o
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/build.make
lib/librbd_test.a: src/test/librbd/CMakeFiles/rbd_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking CXX static library ../../../lib/librbd_test.a"
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && $(CMAKE_COMMAND) -P CMakeFiles/rbd_test.dir/cmake_clean_target.cmake
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rbd_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/test/librbd/CMakeFiles/rbd_test.dir/build: lib/librbd_test.a
.PHONY : src/test/librbd/CMakeFiles/rbd_test.dir/build

src/test/librbd/CMakeFiles/rbd_test.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd && $(CMAKE_COMMAND) -P CMakeFiles/rbd_test.dir/cmake_clean.cmake
.PHONY : src/test/librbd/CMakeFiles/rbd_test.dir/clean

src/test/librbd/CMakeFiles/rbd_test.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/librbd /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/test/librbd /home/led/workspace/ceph_high_power_efficiency/src/test/librbd/CMakeFiles/rbd_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/test/librbd/CMakeFiles/rbd_test.dir/depend


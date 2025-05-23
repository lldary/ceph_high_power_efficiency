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
include src/blk/CMakeFiles/blk.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/blk/CMakeFiles/blk.dir/compiler_depend.make

# Include the progress variables for this target.
include src/blk/CMakeFiles/blk.dir/progress.make

# Include the compile flags for this target's objects.
include src/blk/CMakeFiles/blk.dir/flags.make

src/blk/CMakeFiles/blk.dir/BlockDevice.cc.o: src/blk/CMakeFiles/blk.dir/flags.make
src/blk/CMakeFiles/blk.dir/BlockDevice.cc.o: src/blk/BlockDevice.cc
src/blk/CMakeFiles/blk.dir/BlockDevice.cc.o: src/blk/CMakeFiles/blk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/blk/CMakeFiles/blk.dir/BlockDevice.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/blk/CMakeFiles/blk.dir/BlockDevice.cc.o -MF CMakeFiles/blk.dir/BlockDevice.cc.o.d -o CMakeFiles/blk.dir/BlockDevice.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/blk/BlockDevice.cc

src/blk/CMakeFiles/blk.dir/BlockDevice.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blk.dir/BlockDevice.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/blk/BlockDevice.cc > CMakeFiles/blk.dir/BlockDevice.cc.i

src/blk/CMakeFiles/blk.dir/BlockDevice.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blk.dir/BlockDevice.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/blk/BlockDevice.cc -o CMakeFiles/blk.dir/BlockDevice.cc.s

src/blk/CMakeFiles/blk.dir/kernel/KernelDevice.cc.o: src/blk/CMakeFiles/blk.dir/flags.make
src/blk/CMakeFiles/blk.dir/kernel/KernelDevice.cc.o: src/blk/kernel/KernelDevice.cc
src/blk/CMakeFiles/blk.dir/kernel/KernelDevice.cc.o: src/blk/CMakeFiles/blk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/blk/CMakeFiles/blk.dir/kernel/KernelDevice.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/blk/CMakeFiles/blk.dir/kernel/KernelDevice.cc.o -MF CMakeFiles/blk.dir/kernel/KernelDevice.cc.o.d -o CMakeFiles/blk.dir/kernel/KernelDevice.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/blk/kernel/KernelDevice.cc

src/blk/CMakeFiles/blk.dir/kernel/KernelDevice.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blk.dir/kernel/KernelDevice.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/blk/kernel/KernelDevice.cc > CMakeFiles/blk.dir/kernel/KernelDevice.cc.i

src/blk/CMakeFiles/blk.dir/kernel/KernelDevice.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blk.dir/kernel/KernelDevice.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/blk/kernel/KernelDevice.cc -o CMakeFiles/blk.dir/kernel/KernelDevice.cc.s

src/blk/CMakeFiles/blk.dir/kernel/io_uring.cc.o: src/blk/CMakeFiles/blk.dir/flags.make
src/blk/CMakeFiles/blk.dir/kernel/io_uring.cc.o: src/blk/kernel/io_uring.cc
src/blk/CMakeFiles/blk.dir/kernel/io_uring.cc.o: src/blk/CMakeFiles/blk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/blk/CMakeFiles/blk.dir/kernel/io_uring.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/blk/CMakeFiles/blk.dir/kernel/io_uring.cc.o -MF CMakeFiles/blk.dir/kernel/io_uring.cc.o.d -o CMakeFiles/blk.dir/kernel/io_uring.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/blk/kernel/io_uring.cc

src/blk/CMakeFiles/blk.dir/kernel/io_uring.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blk.dir/kernel/io_uring.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/blk/kernel/io_uring.cc > CMakeFiles/blk.dir/kernel/io_uring.cc.i

src/blk/CMakeFiles/blk.dir/kernel/io_uring.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blk.dir/kernel/io_uring.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/blk/kernel/io_uring.cc -o CMakeFiles/blk.dir/kernel/io_uring.cc.s

src/blk/CMakeFiles/blk.dir/aio/aio.cc.o: src/blk/CMakeFiles/blk.dir/flags.make
src/blk/CMakeFiles/blk.dir/aio/aio.cc.o: src/blk/aio/aio.cc
src/blk/CMakeFiles/blk.dir/aio/aio.cc.o: src/blk/CMakeFiles/blk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/blk/CMakeFiles/blk.dir/aio/aio.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/blk/CMakeFiles/blk.dir/aio/aio.cc.o -MF CMakeFiles/blk.dir/aio/aio.cc.o.d -o CMakeFiles/blk.dir/aio/aio.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/blk/aio/aio.cc

src/blk/CMakeFiles/blk.dir/aio/aio.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/blk.dir/aio/aio.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/blk/aio/aio.cc > CMakeFiles/blk.dir/aio/aio.cc.i

src/blk/CMakeFiles/blk.dir/aio/aio.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/blk.dir/aio/aio.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/blk/aio/aio.cc -o CMakeFiles/blk.dir/aio/aio.cc.s

# Object files for target blk
blk_OBJECTS = \
"CMakeFiles/blk.dir/BlockDevice.cc.o" \
"CMakeFiles/blk.dir/kernel/KernelDevice.cc.o" \
"CMakeFiles/blk.dir/kernel/io_uring.cc.o" \
"CMakeFiles/blk.dir/aio/aio.cc.o"

# External object files for target blk
blk_EXTERNAL_OBJECTS =

lib/libblk.a: src/blk/CMakeFiles/blk.dir/BlockDevice.cc.o
lib/libblk.a: src/blk/CMakeFiles/blk.dir/kernel/KernelDevice.cc.o
lib/libblk.a: src/blk/CMakeFiles/blk.dir/kernel/io_uring.cc.o
lib/libblk.a: src/blk/CMakeFiles/blk.dir/aio/aio.cc.o
lib/libblk.a: src/blk/CMakeFiles/blk.dir/build.make
lib/libblk.a: src/blk/CMakeFiles/blk.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library ../../lib/libblk.a"
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && $(CMAKE_COMMAND) -P CMakeFiles/blk.dir/cmake_clean_target.cmake
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/blk.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/blk/CMakeFiles/blk.dir/build: lib/libblk.a
.PHONY : src/blk/CMakeFiles/blk.dir/build

src/blk/CMakeFiles/blk.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/blk && $(CMAKE_COMMAND) -P CMakeFiles/blk.dir/cmake_clean.cmake
.PHONY : src/blk/CMakeFiles/blk.dir/clean

src/blk/CMakeFiles/blk.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/blk /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/blk /home/led/workspace/ceph_high_power_efficiency/src/blk/CMakeFiles/blk.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/blk/CMakeFiles/blk.dir/depend


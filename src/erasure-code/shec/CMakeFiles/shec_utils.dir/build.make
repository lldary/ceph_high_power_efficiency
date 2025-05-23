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
include src/erasure-code/shec/CMakeFiles/shec_utils.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/erasure-code/shec/CMakeFiles/shec_utils.dir/compiler_depend.make

# Include the progress variables for this target.
include src/erasure-code/shec/CMakeFiles/shec_utils.dir/progress.make

# Include the compile flags for this target's objects.
include src/erasure-code/shec/CMakeFiles/shec_utils.dir/flags.make

src/erasure-code/shec/CMakeFiles/shec_utils.dir/__/ErasureCode.cc.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/flags.make
src/erasure-code/shec/CMakeFiles/shec_utils.dir/__/ErasureCode.cc.o: src/erasure-code/ErasureCode.cc
src/erasure-code/shec/CMakeFiles/shec_utils.dir/__/ErasureCode.cc.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/erasure-code/shec/CMakeFiles/shec_utils.dir/__/ErasureCode.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/erasure-code/shec/CMakeFiles/shec_utils.dir/__/ErasureCode.cc.o -MF CMakeFiles/shec_utils.dir/__/ErasureCode.cc.o.d -o CMakeFiles/shec_utils.dir/__/ErasureCode.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/ErasureCode.cc

src/erasure-code/shec/CMakeFiles/shec_utils.dir/__/ErasureCode.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/shec_utils.dir/__/ErasureCode.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/ErasureCode.cc > CMakeFiles/shec_utils.dir/__/ErasureCode.cc.i

src/erasure-code/shec/CMakeFiles/shec_utils.dir/__/ErasureCode.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/shec_utils.dir/__/ErasureCode.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/ErasureCode.cc -o CMakeFiles/shec_utils.dir/__/ErasureCode.cc.s

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/flags.make
src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.o: src/erasure-code/shec/ErasureCodePluginShec.cc
src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.o -MF CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.o.d -o CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodePluginShec.cc

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodePluginShec.cc > CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.i

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodePluginShec.cc -o CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.s

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/flags.make
src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.o: src/erasure-code/shec/ErasureCodeShec.cc
src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.o -MF CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.o.d -o CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodeShec.cc

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodeShec.cc > CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.i

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodeShec.cc -o CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.s

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/flags.make
src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.o: src/erasure-code/shec/ErasureCodeShecTableCache.cc
src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.o -MF CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.o.d -o CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodeShecTableCache.cc

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodeShecTableCache.cc > CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.i

src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/ErasureCodeShecTableCache.cc -o CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.s

src/erasure-code/shec/CMakeFiles/shec_utils.dir/determinant.c.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/flags.make
src/erasure-code/shec/CMakeFiles/shec_utils.dir/determinant.c.o: src/erasure-code/shec/determinant.c
src/erasure-code/shec/CMakeFiles/shec_utils.dir/determinant.c.o: src/erasure-code/shec/CMakeFiles/shec_utils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/erasure-code/shec/CMakeFiles/shec_utils.dir/determinant.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/erasure-code/shec/CMakeFiles/shec_utils.dir/determinant.c.o -MF CMakeFiles/shec_utils.dir/determinant.c.o.d -o CMakeFiles/shec_utils.dir/determinant.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/determinant.c

src/erasure-code/shec/CMakeFiles/shec_utils.dir/determinant.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/shec_utils.dir/determinant.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/determinant.c > CMakeFiles/shec_utils.dir/determinant.c.i

src/erasure-code/shec/CMakeFiles/shec_utils.dir/determinant.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/shec_utils.dir/determinant.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/determinant.c -o CMakeFiles/shec_utils.dir/determinant.c.s

shec_utils: src/erasure-code/shec/CMakeFiles/shec_utils.dir/__/ErasureCode.cc.o
shec_utils: src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodePluginShec.cc.o
shec_utils: src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShec.cc.o
shec_utils: src/erasure-code/shec/CMakeFiles/shec_utils.dir/ErasureCodeShecTableCache.cc.o
shec_utils: src/erasure-code/shec/CMakeFiles/shec_utils.dir/determinant.c.o
shec_utils: src/erasure-code/shec/CMakeFiles/shec_utils.dir/build.make
.PHONY : shec_utils

# Rule to build all files generated by this target.
src/erasure-code/shec/CMakeFiles/shec_utils.dir/build: shec_utils
.PHONY : src/erasure-code/shec/CMakeFiles/shec_utils.dir/build

src/erasure-code/shec/CMakeFiles/shec_utils.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec && $(CMAKE_COMMAND) -P CMakeFiles/shec_utils.dir/cmake_clean.cmake
.PHONY : src/erasure-code/shec/CMakeFiles/shec_utils.dir/clean

src/erasure-code/shec/CMakeFiles/shec_utils.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/shec/CMakeFiles/shec_utils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/erasure-code/shec/CMakeFiles/shec_utils.dir/depend


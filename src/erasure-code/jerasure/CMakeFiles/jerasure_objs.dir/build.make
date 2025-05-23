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
include src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/compiler_depend.make

# Include the progress variables for this target.
include src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/progress.make

# Include the compile flags for this target's objects.
include src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/flags.make

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/flags.make
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.o: src/erasure-code/jerasure/jerasure/src/cauchy.c
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.o -MF CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.o.d -o CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/cauchy.c

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/cauchy.c > CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.i

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/cauchy.c -o CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.s

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/flags.make
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.o: src/erasure-code/jerasure/jerasure/src/galois.c
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.o -MF CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.o.d -o CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/galois.c

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/galois.c > CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.i

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/galois.c -o CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.s

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/flags.make
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.o: src/erasure-code/jerasure/jerasure/src/jerasure.c
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.o -MF CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.o.d -o CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/jerasure.c

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/jerasure.c > CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.i

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/jerasure.c -o CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.s

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/flags.make
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.o: src/erasure-code/jerasure/jerasure/src/liberation.c
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.o -MF CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.o.d -o CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/liberation.c

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/liberation.c > CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.i

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/liberation.c -o CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.s

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/flags.make
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.o: src/erasure-code/jerasure/jerasure/src/reed_sol.c
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.o -MF CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.o.d -o CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/reed_sol.c

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/reed_sol.c > CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.i

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure/src/reed_sol.c -o CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.s

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure_init.cc.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/flags.make
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure_init.cc.o: src/erasure-code/jerasure/jerasure_init.cc
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure_init.cc.o: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure_init.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure_init.cc.o -MF CMakeFiles/jerasure_objs.dir/jerasure_init.cc.o.d -o CMakeFiles/jerasure_objs.dir/jerasure_init.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure_init.cc

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure_init.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jerasure_objs.dir/jerasure_init.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure_init.cc > CMakeFiles/jerasure_objs.dir/jerasure_init.cc.i

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure_init.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jerasure_objs.dir/jerasure_init.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/jerasure_init.cc -o CMakeFiles/jerasure_objs.dir/jerasure_init.cc.s

jerasure_objs: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/cauchy.c.o
jerasure_objs: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/galois.c.o
jerasure_objs: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/jerasure.c.o
jerasure_objs: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/liberation.c.o
jerasure_objs: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure/src/reed_sol.c.o
jerasure_objs: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/jerasure_init.cc.o
jerasure_objs: src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/build.make
.PHONY : jerasure_objs

# Rule to build all files generated by this target.
src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/build: jerasure_objs
.PHONY : src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/build

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure && $(CMAKE_COMMAND) -P CMakeFiles/jerasure_objs.dir/cmake_clean.cmake
.PHONY : src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/clean

src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure /home/led/workspace/ceph_high_power_efficiency/src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/erasure-code/jerasure/CMakeFiles/jerasure_objs.dir/depend


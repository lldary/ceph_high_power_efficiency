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
include src/tracing/CMakeFiles/osd_tp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/tracing/CMakeFiles/osd_tp.dir/compiler_depend.make

# Include the progress variables for this target.
include src/tracing/CMakeFiles/osd_tp.dir/progress.make

# Include the compile flags for this target's objects.
include src/tracing/CMakeFiles/osd_tp.dir/flags.make

include/tracing/oprequest.h: src/tracing/oprequest.tp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "generating /home/led/workspace/ceph_high_power_efficiency/include/tracing/oprequest.h"
	cd /home/led/workspace/ceph_high_power_efficiency/include && /usr/bin/lttng-gen-tp /home/led/workspace/ceph_high_power_efficiency/src/tracing/oprequest.tp -o tracing/oprequest.h

include/tracing/osd.h: src/tracing/osd.tp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "generating /home/led/workspace/ceph_high_power_efficiency/include/tracing/osd.h"
	cd /home/led/workspace/ceph_high_power_efficiency/include && /usr/bin/lttng-gen-tp /home/led/workspace/ceph_high_power_efficiency/src/tracing/osd.tp -o tracing/osd.h

include/tracing/pg.h: src/tracing/pg.tp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "generating /home/led/workspace/ceph_high_power_efficiency/include/tracing/pg.h"
	cd /home/led/workspace/ceph_high_power_efficiency/include && /usr/bin/lttng-gen-tp /home/led/workspace/ceph_high_power_efficiency/src/tracing/pg.tp -o tracing/pg.h

src/tracing/CMakeFiles/osd_tp.dir/oprequest.c.o: src/tracing/CMakeFiles/osd_tp.dir/flags.make
src/tracing/CMakeFiles/osd_tp.dir/oprequest.c.o: src/tracing/oprequest.c
src/tracing/CMakeFiles/osd_tp.dir/oprequest.c.o: src/tracing/CMakeFiles/osd_tp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/tracing/CMakeFiles/osd_tp.dir/oprequest.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/tracing/CMakeFiles/osd_tp.dir/oprequest.c.o -MF CMakeFiles/osd_tp.dir/oprequest.c.o.d -o CMakeFiles/osd_tp.dir/oprequest.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/tracing/oprequest.c

src/tracing/CMakeFiles/osd_tp.dir/oprequest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/osd_tp.dir/oprequest.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/tracing/oprequest.c > CMakeFiles/osd_tp.dir/oprequest.c.i

src/tracing/CMakeFiles/osd_tp.dir/oprequest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/osd_tp.dir/oprequest.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/tracing/oprequest.c -o CMakeFiles/osd_tp.dir/oprequest.c.s

src/tracing/CMakeFiles/osd_tp.dir/osd.c.o: src/tracing/CMakeFiles/osd_tp.dir/flags.make
src/tracing/CMakeFiles/osd_tp.dir/osd.c.o: src/tracing/osd.c
src/tracing/CMakeFiles/osd_tp.dir/osd.c.o: src/tracing/CMakeFiles/osd_tp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object src/tracing/CMakeFiles/osd_tp.dir/osd.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/tracing/CMakeFiles/osd_tp.dir/osd.c.o -MF CMakeFiles/osd_tp.dir/osd.c.o.d -o CMakeFiles/osd_tp.dir/osd.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/tracing/osd.c

src/tracing/CMakeFiles/osd_tp.dir/osd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/osd_tp.dir/osd.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/tracing/osd.c > CMakeFiles/osd_tp.dir/osd.c.i

src/tracing/CMakeFiles/osd_tp.dir/osd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/osd_tp.dir/osd.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/tracing/osd.c -o CMakeFiles/osd_tp.dir/osd.c.s

src/tracing/CMakeFiles/osd_tp.dir/pg.c.o: src/tracing/CMakeFiles/osd_tp.dir/flags.make
src/tracing/CMakeFiles/osd_tp.dir/pg.c.o: src/tracing/pg.c
src/tracing/CMakeFiles/osd_tp.dir/pg.c.o: src/tracing/CMakeFiles/osd_tp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object src/tracing/CMakeFiles/osd_tp.dir/pg.c.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/tracing/CMakeFiles/osd_tp.dir/pg.c.o -MF CMakeFiles/osd_tp.dir/pg.c.o.d -o CMakeFiles/osd_tp.dir/pg.c.o -c /home/led/workspace/ceph_high_power_efficiency/src/tracing/pg.c

src/tracing/CMakeFiles/osd_tp.dir/pg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/osd_tp.dir/pg.c.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/tracing/pg.c > CMakeFiles/osd_tp.dir/pg.c.i

src/tracing/CMakeFiles/osd_tp.dir/pg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/osd_tp.dir/pg.c.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/tracing/pg.c -o CMakeFiles/osd_tp.dir/pg.c.s

# Object files for target osd_tp
osd_tp_OBJECTS = \
"CMakeFiles/osd_tp.dir/oprequest.c.o" \
"CMakeFiles/osd_tp.dir/osd.c.o" \
"CMakeFiles/osd_tp.dir/pg.c.o"

# External object files for target osd_tp
osd_tp_EXTERNAL_OBJECTS =

lib/libosd_tp.so.1.0.0: src/tracing/CMakeFiles/osd_tp.dir/oprequest.c.o
lib/libosd_tp.so.1.0.0: src/tracing/CMakeFiles/osd_tp.dir/osd.c.o
lib/libosd_tp.so.1.0.0: src/tracing/CMakeFiles/osd_tp.dir/pg.c.o
lib/libosd_tp.so.1.0.0: src/tracing/CMakeFiles/osd_tp.dir/build.make
lib/libosd_tp.so.1.0.0: /usr/lib/x86_64-linux-gnu/liblttng-ust.so
lib/libosd_tp.so.1.0.0: src/tracing/CMakeFiles/osd_tp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C shared library ../../lib/libosd_tp.so"
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/osd_tp.dir/link.txt --verbose=$(VERBOSE)
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libosd_tp.so.1.0.0 ../../lib/libosd_tp.so.1 ../../lib/libosd_tp.so

lib/libosd_tp.so.1: lib/libosd_tp.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libosd_tp.so.1

lib/libosd_tp.so: lib/libosd_tp.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libosd_tp.so

# Rule to build all files generated by this target.
src/tracing/CMakeFiles/osd_tp.dir/build: lib/libosd_tp.so
.PHONY : src/tracing/CMakeFiles/osd_tp.dir/build

src/tracing/CMakeFiles/osd_tp.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/tracing && $(CMAKE_COMMAND) -P CMakeFiles/osd_tp.dir/cmake_clean.cmake
.PHONY : src/tracing/CMakeFiles/osd_tp.dir/clean

src/tracing/CMakeFiles/osd_tp.dir/depend: include/tracing/oprequest.h
src/tracing/CMakeFiles/osd_tp.dir/depend: include/tracing/osd.h
src/tracing/CMakeFiles/osd_tp.dir/depend: include/tracing/pg.h
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/tracing /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/tracing /home/led/workspace/ceph_high_power_efficiency/src/tracing/CMakeFiles/osd_tp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tracing/CMakeFiles/osd_tp.dir/depend


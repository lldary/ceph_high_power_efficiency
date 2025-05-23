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
include src/librados/CMakeFiles/librados_impl.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/librados/CMakeFiles/librados_impl.dir/compiler_depend.make

# Include the progress variables for this target.
include src/librados/CMakeFiles/librados_impl.dir/progress.make

# Include the compile flags for this target's objects.
include src/librados/CMakeFiles/librados_impl.dir/flags.make

src/librados/CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o: src/librados/CMakeFiles/librados_impl.dir/flags.make
src/librados/CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o: src/librados/IoCtxImpl.cc
src/librados/CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o: src/librados/CMakeFiles/librados_impl.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/librados/CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/librados/CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o -MF CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o.d -o CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/librados/IoCtxImpl.cc

src/librados/CMakeFiles/librados_impl.dir/IoCtxImpl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/librados_impl.dir/IoCtxImpl.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/librados/IoCtxImpl.cc > CMakeFiles/librados_impl.dir/IoCtxImpl.cc.i

src/librados/CMakeFiles/librados_impl.dir/IoCtxImpl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/librados_impl.dir/IoCtxImpl.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/librados/IoCtxImpl.cc -o CMakeFiles/librados_impl.dir/IoCtxImpl.cc.s

src/librados/CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o: src/librados/CMakeFiles/librados_impl.dir/flags.make
src/librados/CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o: src/librados/RadosXattrIter.cc
src/librados/CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o: src/librados/CMakeFiles/librados_impl.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/librados/CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/librados/CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o -MF CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o.d -o CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/librados/RadosXattrIter.cc

src/librados/CMakeFiles/librados_impl.dir/RadosXattrIter.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/librados_impl.dir/RadosXattrIter.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/librados/RadosXattrIter.cc > CMakeFiles/librados_impl.dir/RadosXattrIter.cc.i

src/librados/CMakeFiles/librados_impl.dir/RadosXattrIter.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/librados_impl.dir/RadosXattrIter.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/librados/RadosXattrIter.cc -o CMakeFiles/librados_impl.dir/RadosXattrIter.cc.s

src/librados/CMakeFiles/librados_impl.dir/RadosClient.cc.o: src/librados/CMakeFiles/librados_impl.dir/flags.make
src/librados/CMakeFiles/librados_impl.dir/RadosClient.cc.o: src/librados/RadosClient.cc
src/librados/CMakeFiles/librados_impl.dir/RadosClient.cc.o: src/librados/CMakeFiles/librados_impl.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/librados/CMakeFiles/librados_impl.dir/RadosClient.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/librados/CMakeFiles/librados_impl.dir/RadosClient.cc.o -MF CMakeFiles/librados_impl.dir/RadosClient.cc.o.d -o CMakeFiles/librados_impl.dir/RadosClient.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/librados/RadosClient.cc

src/librados/CMakeFiles/librados_impl.dir/RadosClient.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/librados_impl.dir/RadosClient.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/librados/RadosClient.cc > CMakeFiles/librados_impl.dir/RadosClient.cc.i

src/librados/CMakeFiles/librados_impl.dir/RadosClient.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/librados_impl.dir/RadosClient.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/librados/RadosClient.cc -o CMakeFiles/librados_impl.dir/RadosClient.cc.s

src/librados/CMakeFiles/librados_impl.dir/librados_util.cc.o: src/librados/CMakeFiles/librados_impl.dir/flags.make
src/librados/CMakeFiles/librados_impl.dir/librados_util.cc.o: src/librados/librados_util.cc
src/librados/CMakeFiles/librados_impl.dir/librados_util.cc.o: src/librados/CMakeFiles/librados_impl.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/librados/CMakeFiles/librados_impl.dir/librados_util.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/librados/CMakeFiles/librados_impl.dir/librados_util.cc.o -MF CMakeFiles/librados_impl.dir/librados_util.cc.o.d -o CMakeFiles/librados_impl.dir/librados_util.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/librados/librados_util.cc

src/librados/CMakeFiles/librados_impl.dir/librados_util.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/librados_impl.dir/librados_util.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/librados/librados_util.cc > CMakeFiles/librados_impl.dir/librados_util.cc.i

src/librados/CMakeFiles/librados_impl.dir/librados_util.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/librados_impl.dir/librados_util.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/librados/librados_util.cc -o CMakeFiles/librados_impl.dir/librados_util.cc.s

src/librados/CMakeFiles/librados_impl.dir/librados_tp.cc.o: src/librados/CMakeFiles/librados_impl.dir/flags.make
src/librados/CMakeFiles/librados_impl.dir/librados_tp.cc.o: src/librados/librados_tp.cc
src/librados/CMakeFiles/librados_impl.dir/librados_tp.cc.o: src/librados/CMakeFiles/librados_impl.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/librados/CMakeFiles/librados_impl.dir/librados_tp.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/librados/CMakeFiles/librados_impl.dir/librados_tp.cc.o -MF CMakeFiles/librados_impl.dir/librados_tp.cc.o.d -o CMakeFiles/librados_impl.dir/librados_tp.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/librados/librados_tp.cc

src/librados/CMakeFiles/librados_impl.dir/librados_tp.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/librados_impl.dir/librados_tp.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/librados/librados_tp.cc > CMakeFiles/librados_impl.dir/librados_tp.cc.i

src/librados/CMakeFiles/librados_impl.dir/librados_tp.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/librados_impl.dir/librados_tp.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/librados/librados_tp.cc -o CMakeFiles/librados_impl.dir/librados_tp.cc.s

# Object files for target librados_impl
librados_impl_OBJECTS = \
"CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o" \
"CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o" \
"CMakeFiles/librados_impl.dir/RadosClient.cc.o" \
"CMakeFiles/librados_impl.dir/librados_util.cc.o" \
"CMakeFiles/librados_impl.dir/librados_tp.cc.o"

# External object files for target librados_impl
librados_impl_EXTERNAL_OBJECTS =

lib/liblibrados_impl.a: src/librados/CMakeFiles/librados_impl.dir/IoCtxImpl.cc.o
lib/liblibrados_impl.a: src/librados/CMakeFiles/librados_impl.dir/RadosXattrIter.cc.o
lib/liblibrados_impl.a: src/librados/CMakeFiles/librados_impl.dir/RadosClient.cc.o
lib/liblibrados_impl.a: src/librados/CMakeFiles/librados_impl.dir/librados_util.cc.o
lib/liblibrados_impl.a: src/librados/CMakeFiles/librados_impl.dir/librados_tp.cc.o
lib/liblibrados_impl.a: src/librados/CMakeFiles/librados_impl.dir/build.make
lib/liblibrados_impl.a: src/librados/CMakeFiles/librados_impl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library ../../lib/liblibrados_impl.a"
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && $(CMAKE_COMMAND) -P CMakeFiles/librados_impl.dir/cmake_clean_target.cmake
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/librados_impl.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/librados/CMakeFiles/librados_impl.dir/build: lib/liblibrados_impl.a
.PHONY : src/librados/CMakeFiles/librados_impl.dir/build

src/librados/CMakeFiles/librados_impl.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/librados && $(CMAKE_COMMAND) -P CMakeFiles/librados_impl.dir/cmake_clean.cmake
.PHONY : src/librados/CMakeFiles/librados_impl.dir/clean

src/librados/CMakeFiles/librados_impl.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/librados /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/librados /home/led/workspace/ceph_high_power_efficiency/src/librados/CMakeFiles/librados_impl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/librados/CMakeFiles/librados_impl.dir/depend


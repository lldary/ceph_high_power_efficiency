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
include src/CMakeFiles/ceph-syn.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/ceph-syn.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/ceph-syn.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/ceph-syn.dir/flags.make

src/CMakeFiles/ceph-syn.dir/ceph_syn.cc.o: src/CMakeFiles/ceph-syn.dir/flags.make
src/CMakeFiles/ceph-syn.dir/ceph_syn.cc.o: src/ceph_syn.cc
src/CMakeFiles/ceph-syn.dir/ceph_syn.cc.o: src/CMakeFiles/ceph-syn.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/ceph-syn.dir/ceph_syn.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/ceph-syn.dir/ceph_syn.cc.o -MF CMakeFiles/ceph-syn.dir/ceph_syn.cc.o.d -o CMakeFiles/ceph-syn.dir/ceph_syn.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/ceph_syn.cc

src/CMakeFiles/ceph-syn.dir/ceph_syn.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph-syn.dir/ceph_syn.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/ceph_syn.cc > CMakeFiles/ceph-syn.dir/ceph_syn.cc.i

src/CMakeFiles/ceph-syn.dir/ceph_syn.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph-syn.dir/ceph_syn.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/ceph_syn.cc -o CMakeFiles/ceph-syn.dir/ceph_syn.cc.s

src/CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o: src/CMakeFiles/ceph-syn.dir/flags.make
src/CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o: src/client/SyntheticClient.cc
src/CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o: src/CMakeFiles/ceph-syn.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o"
	cd /home/led/workspace/ceph_high_power_efficiency/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o -MF CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o.d -o CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o -c /home/led/workspace/ceph_high_power_efficiency/src/client/SyntheticClient.cc

src/CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.i"
	cd /home/led/workspace/ceph_high_power_efficiency/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/led/workspace/ceph_high_power_efficiency/src/client/SyntheticClient.cc > CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.i

src/CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.s"
	cd /home/led/workspace/ceph_high_power_efficiency/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/led/workspace/ceph_high_power_efficiency/src/client/SyntheticClient.cc -o CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.s

# Object files for target ceph-syn
ceph__syn_OBJECTS = \
"CMakeFiles/ceph-syn.dir/ceph_syn.cc.o" \
"CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o"

# External object files for target ceph-syn
ceph__syn_EXTERNAL_OBJECTS =

bin/ceph-syn: src/CMakeFiles/ceph-syn.dir/ceph_syn.cc.o
bin/ceph-syn: src/CMakeFiles/ceph-syn.dir/client/SyntheticClient.cc.o
bin/ceph-syn: src/CMakeFiles/ceph-syn.dir/build.make
bin/ceph-syn: lib/libclient.a
bin/ceph-syn: lib/libglobal-static.a
bin/ceph-syn: lib/libosdc.a
bin/ceph-syn: lib/libceph-common.so.2
bin/ceph-syn: lib/libcommon.a
bin/ceph-syn: lib/libjson_spirit.a
bin/ceph-syn: lib/libcommon_utf8.a
bin/ceph-syn: lib/liberasure_code.a
bin/ceph-syn: lib/libcrc32.a
bin/ceph-syn: lib/libarch.a
bin/ceph-syn: boost/lib/libboost_thread.a
bin/ceph-syn: boost/lib/libboost_chrono.a
bin/ceph-syn: boost/lib/libboost_atomic.a
bin/ceph-syn: boost/lib/libboost_system.a
bin/ceph-syn: boost/lib/libboost_random.a
bin/ceph-syn: boost/lib/libboost_program_options.a
bin/ceph-syn: boost/lib/libboost_date_time.a
bin/ceph-syn: boost/lib/libboost_iostreams.a
bin/ceph-syn: boost/lib/libboost_regex.a
bin/ceph-syn: /usr/lib/x86_64-linux-gnu/libfmt.so
bin/ceph-syn: /usr/lib/x86_64-linux-gnu/libblkid.so
bin/ceph-syn: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/ceph-syn: /usr/lib/x86_64-linux-gnu/libudev.so
bin/ceph-syn: /usr/lib/x86_64-linux-gnu/libibverbs.so
bin/ceph-syn: /usr/lib/x86_64-linux-gnu/librdmacm.so
bin/ceph-syn: /usr/lib/x86_64-linux-gnu/libz.so
bin/ceph-syn: src/CMakeFiles/ceph-syn.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../bin/ceph-syn"
	cd /home/led/workspace/ceph_high_power_efficiency/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ceph-syn.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/ceph-syn.dir/build: bin/ceph-syn
.PHONY : src/CMakeFiles/ceph-syn.dir/build

src/CMakeFiles/ceph-syn.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src && $(CMAKE_COMMAND) -P CMakeFiles/ceph-syn.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/ceph-syn.dir/clean

src/CMakeFiles/ceph-syn.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src /home/led/workspace/ceph_high_power_efficiency/src/CMakeFiles/ceph-syn.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/ceph-syn.dir/depend


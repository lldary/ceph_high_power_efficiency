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

# Utility rule file for ceph-clone.

# Include any custom commands dependencies for this target.
include src/python-common/CMakeFiles/ceph-clone.dir/compiler_depend.make

# Include the progress variables for this target.
include src/python-common/CMakeFiles/ceph-clone.dir/progress.make

src/python-common/CMakeFiles/ceph-clone: src/python-common/setup.py
src/python-common/CMakeFiles/ceph-clone: src/python-common/README.rst
src/python-common/CMakeFiles/ceph-clone: src/python-common/requirements.txt
src/python-common/CMakeFiles/ceph-clone: src/python-common/ceph

src/python-common/README.rst: src/python-common/README.rst
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating README.rst"
	cd /home/led/workspace/ceph_high_power_efficiency/src/python-common && /usr/bin/cmake -E create_symlink /home/led/workspace/ceph_high_power_efficiency/src/python-common/README.rst README.rst

src/python-common/ceph: src/python-common/ceph
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating ceph"
	cd /home/led/workspace/ceph_high_power_efficiency/src/python-common && /usr/bin/cmake -E create_symlink /home/led/workspace/ceph_high_power_efficiency/src/python-common/ceph ceph

src/python-common/requirements.txt: src/python-common/requirements.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating requirements.txt"
	cd /home/led/workspace/ceph_high_power_efficiency/src/python-common && /usr/bin/cmake -E create_symlink /home/led/workspace/ceph_high_power_efficiency/src/python-common/requirements.txt requirements.txt

src/python-common/setup.py: src/python-common/setup.py
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating setup.py"
	cd /home/led/workspace/ceph_high_power_efficiency/src/python-common && /usr/bin/cmake -E create_symlink /home/led/workspace/ceph_high_power_efficiency/src/python-common/setup.py setup.py

ceph-clone: src/python-common/CMakeFiles/ceph-clone
ceph-clone: src/python-common/README.rst
ceph-clone: src/python-common/ceph
ceph-clone: src/python-common/requirements.txt
ceph-clone: src/python-common/setup.py
ceph-clone: src/python-common/CMakeFiles/ceph-clone.dir/build.make
.PHONY : ceph-clone

# Rule to build all files generated by this target.
src/python-common/CMakeFiles/ceph-clone.dir/build: ceph-clone
.PHONY : src/python-common/CMakeFiles/ceph-clone.dir/build

src/python-common/CMakeFiles/ceph-clone.dir/clean:
	cd /home/led/workspace/ceph_high_power_efficiency/src/python-common && $(CMAKE_COMMAND) -P CMakeFiles/ceph-clone.dir/cmake_clean.cmake
.PHONY : src/python-common/CMakeFiles/ceph-clone.dir/clean

src/python-common/CMakeFiles/ceph-clone.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/python-common /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/src/python-common /home/led/workspace/ceph_high_power_efficiency/src/python-common/CMakeFiles/ceph-clone.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/python-common/CMakeFiles/ceph-clone.dir/depend


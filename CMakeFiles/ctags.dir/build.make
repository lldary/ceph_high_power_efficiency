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

# Utility rule file for ctags.

# Include any custom commands dependencies for this target.
include CMakeFiles/ctags.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ctags.dir/progress.make

CMakeFiles/ctags:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/led/workspace/ceph_high_power_efficiency/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ctags file tags"
	cd /home/led/workspace/ceph_high_power_efficiency/src && CTAGS_EXECUTABLE-NOTFOUND -R --python-kinds=-i --c++-kinds=+p --fields=+iaS --extra=+q "--exclude=*.js" "--exclude=*.css" --exclude=.tox --exclude=python-common/build --exclude=erasure-code/jerasure/jerasure --exclude=erasure-code/jerasure/gf-complete --exclude=rocksdb --exclude=googletest --exclude=xxHash --exclude=isa-l --exclude=zstd --exclude=crypto/isa-l/isa-l_crypto --exclude=blkin --exclude=rapidjson --exclude=dmclock --exclude=seastar --exclude=fmt --exclude=c-ares --exclude=spawn --exclude=pybind/mgr/rook/rook-client-python --exclude=s3select --exclude=libkmip --exclude=arrow --exclude=utf8proc --exclude=spdk

ctags: CMakeFiles/ctags
ctags: CMakeFiles/ctags.dir/build.make
.PHONY : ctags

# Rule to build all files generated by this target.
CMakeFiles/ctags.dir/build: ctags
.PHONY : CMakeFiles/ctags.dir/build

CMakeFiles/ctags.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ctags.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ctags.dir/clean

CMakeFiles/ctags.dir/depend:
	cd /home/led/workspace/ceph_high_power_efficiency && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency /home/led/workspace/ceph_high_power_efficiency/CMakeFiles/ctags.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ctags.dir/depend


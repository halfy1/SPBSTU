# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 4.0

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\halfy\projects\SPBSTU\Algorithms\LabH

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build

# Include any dependencies generated for this target.
include test/CMakeFiles/TreeTests.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/TreeTests.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/TreeTests.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/TreeTests.dir/flags.make

test/CMakeFiles/TreeTests.dir/codegen:
.PHONY : test/CMakeFiles/TreeTests.dir/codegen

test/CMakeFiles/TreeTests.dir/TreeTests.cpp.obj: test/CMakeFiles/TreeTests.dir/flags.make
test/CMakeFiles/TreeTests.dir/TreeTests.cpp.obj: test/CMakeFiles/TreeTests.dir/includes_CXX.rsp
test/CMakeFiles/TreeTests.dir/TreeTests.cpp.obj: C:/Users/halfy/projects/SPBSTU/Algorithms/LabH/test/TreeTests.cpp
test/CMakeFiles/TreeTests.dir/TreeTests.cpp.obj: test/CMakeFiles/TreeTests.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/TreeTests.dir/TreeTests.cpp.obj"
	cd /d C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\test && C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/TreeTests.dir/TreeTests.cpp.obj -MF CMakeFiles\TreeTests.dir\TreeTests.cpp.obj.d -o CMakeFiles\TreeTests.dir\TreeTests.cpp.obj -c C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\test\TreeTests.cpp

test/CMakeFiles/TreeTests.dir/TreeTests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/TreeTests.dir/TreeTests.cpp.i"
	cd /d C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\test && C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\test\TreeTests.cpp > CMakeFiles\TreeTests.dir\TreeTests.cpp.i

test/CMakeFiles/TreeTests.dir/TreeTests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/TreeTests.dir/TreeTests.cpp.s"
	cd /d C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\test && C:\msys64\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\test\TreeTests.cpp -o CMakeFiles\TreeTests.dir\TreeTests.cpp.s

# Object files for target TreeTests
TreeTests_OBJECTS = \
"CMakeFiles/TreeTests.dir/TreeTests.cpp.obj"

# External object files for target TreeTests
TreeTests_EXTERNAL_OBJECTS =

test/TreeTests.exe: test/CMakeFiles/TreeTests.dir/TreeTests.cpp.obj
test/TreeTests.exe: test/CMakeFiles/TreeTests.dir/build.make
test/TreeTests.exe: libTreeLib.a
test/TreeTests.exe: lib/libgtest.a
test/TreeTests.exe: lib/libgmock.a
test/TreeTests.exe: lib/libgtest.a
test/TreeTests.exe: test/CMakeFiles/TreeTests.dir/linkLibs.rsp
test/TreeTests.exe: test/CMakeFiles/TreeTests.dir/objects1.rsp
test/TreeTests.exe: test/CMakeFiles/TreeTests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TreeTests.exe"
	cd /d C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\TreeTests.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/TreeTests.dir/build: test/TreeTests.exe
.PHONY : test/CMakeFiles/TreeTests.dir/build

test/CMakeFiles/TreeTests.dir/clean:
	cd /d C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\test && $(CMAKE_COMMAND) -P CMakeFiles\TreeTests.dir\cmake_clean.cmake
.PHONY : test/CMakeFiles/TreeTests.dir/clean

test/CMakeFiles/TreeTests.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\halfy\projects\SPBSTU\Algorithms\LabH C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\test C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\test C:\Users\halfy\projects\SPBSTU\Algorithms\LabH\build\test\CMakeFiles\TreeTests.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : test/CMakeFiles/TreeTests.dir/depend


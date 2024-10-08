# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/striving/mqtt_protocol

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/striving/mqtt_protocol/build

# Include any dependencies generated for this target.
include mqtt/CMakeFiles/mqtt.dir/depend.make

# Include the progress variables for this target.
include mqtt/CMakeFiles/mqtt.dir/progress.make

# Include the compile flags for this target's objects.
include mqtt/CMakeFiles/mqtt.dir/flags.make

mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o: mqtt/CMakeFiles/mqtt.dir/flags.make
mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o: ../mqtt/mqtt.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/striving/mqtt_protocol/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o"
	cd /home/striving/mqtt_protocol/build/mqtt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mqtt.dir/mqtt.cpp.o -c /home/striving/mqtt_protocol/mqtt/mqtt.cpp

mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mqtt.dir/mqtt.cpp.i"
	cd /home/striving/mqtt_protocol/build/mqtt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/striving/mqtt_protocol/mqtt/mqtt.cpp > CMakeFiles/mqtt.dir/mqtt.cpp.i

mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mqtt.dir/mqtt.cpp.s"
	cd /home/striving/mqtt_protocol/build/mqtt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/striving/mqtt_protocol/mqtt/mqtt.cpp -o CMakeFiles/mqtt.dir/mqtt.cpp.s

mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o.requires:

.PHONY : mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o.requires

mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o.provides: mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o.requires
	$(MAKE) -f mqtt/CMakeFiles/mqtt.dir/build.make mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o.provides.build
.PHONY : mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o.provides

mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o.provides.build: mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o


mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o: mqtt/CMakeFiles/mqtt.dir/flags.make
mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o: ../mqtt/mqtt_client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/striving/mqtt_protocol/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o"
	cd /home/striving/mqtt_protocol/build/mqtt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mqtt.dir/mqtt_client.cpp.o -c /home/striving/mqtt_protocol/mqtt/mqtt_client.cpp

mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mqtt.dir/mqtt_client.cpp.i"
	cd /home/striving/mqtt_protocol/build/mqtt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/striving/mqtt_protocol/mqtt/mqtt_client.cpp > CMakeFiles/mqtt.dir/mqtt_client.cpp.i

mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mqtt.dir/mqtt_client.cpp.s"
	cd /home/striving/mqtt_protocol/build/mqtt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/striving/mqtt_protocol/mqtt/mqtt_client.cpp -o CMakeFiles/mqtt.dir/mqtt_client.cpp.s

mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o.requires:

.PHONY : mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o.requires

mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o.provides: mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o.requires
	$(MAKE) -f mqtt/CMakeFiles/mqtt.dir/build.make mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o.provides.build
.PHONY : mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o.provides

mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o.provides.build: mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o


# Object files for target mqtt
mqtt_OBJECTS = \
"CMakeFiles/mqtt.dir/mqtt.cpp.o" \
"CMakeFiles/mqtt.dir/mqtt_client.cpp.o"

# External object files for target mqtt
mqtt_EXTERNAL_OBJECTS =

mqtt/libmqtt.a: mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o
mqtt/libmqtt.a: mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o
mqtt/libmqtt.a: mqtt/CMakeFiles/mqtt.dir/build.make
mqtt/libmqtt.a: mqtt/CMakeFiles/mqtt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/striving/mqtt_protocol/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libmqtt.a"
	cd /home/striving/mqtt_protocol/build/mqtt && $(CMAKE_COMMAND) -P CMakeFiles/mqtt.dir/cmake_clean_target.cmake
	cd /home/striving/mqtt_protocol/build/mqtt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mqtt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
mqtt/CMakeFiles/mqtt.dir/build: mqtt/libmqtt.a

.PHONY : mqtt/CMakeFiles/mqtt.dir/build

mqtt/CMakeFiles/mqtt.dir/requires: mqtt/CMakeFiles/mqtt.dir/mqtt.cpp.o.requires
mqtt/CMakeFiles/mqtt.dir/requires: mqtt/CMakeFiles/mqtt.dir/mqtt_client.cpp.o.requires

.PHONY : mqtt/CMakeFiles/mqtt.dir/requires

mqtt/CMakeFiles/mqtt.dir/clean:
	cd /home/striving/mqtt_protocol/build/mqtt && $(CMAKE_COMMAND) -P CMakeFiles/mqtt.dir/cmake_clean.cmake
.PHONY : mqtt/CMakeFiles/mqtt.dir/clean

mqtt/CMakeFiles/mqtt.dir/depend:
	cd /home/striving/mqtt_protocol/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/striving/mqtt_protocol /home/striving/mqtt_protocol/mqtt /home/striving/mqtt_protocol/build /home/striving/mqtt_protocol/build/mqtt /home/striving/mqtt_protocol/build/mqtt/CMakeFiles/mqtt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mqtt/CMakeFiles/mqtt.dir/depend


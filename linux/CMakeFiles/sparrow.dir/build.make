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
CMAKE_SOURCE_DIR = /home/user/Desktop/sparrow_pc/linux

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/user/Desktop/sparrow_pc/linux

# Include any dependencies generated for this target.
include CMakeFiles/bitcoin_wallet.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/bitcoin_wallet.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/bitcoin_wallet.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bitcoin_wallet.dir/flags.make

CMakeFiles/bitcoin_wallet.dir/main.cc.o: CMakeFiles/bitcoin_wallet.dir/flags.make
CMakeFiles/bitcoin_wallet.dir/main.cc.o: main.cc
CMakeFiles/bitcoin_wallet.dir/main.cc.o: CMakeFiles/bitcoin_wallet.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/Desktop/sparrow_pc/linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bitcoin_wallet.dir/main.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/bitcoin_wallet.dir/main.cc.o -MF CMakeFiles/bitcoin_wallet.dir/main.cc.o.d -o CMakeFiles/bitcoin_wallet.dir/main.cc.o -c /home/user/Desktop/sparrow_pc/linux/main.cc

CMakeFiles/bitcoin_wallet.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bitcoin_wallet.dir/main.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/Desktop/sparrow_pc/linux/main.cc > CMakeFiles/bitcoin_wallet.dir/main.cc.i

CMakeFiles/bitcoin_wallet.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bitcoin_wallet.dir/main.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/Desktop/sparrow_pc/linux/main.cc -o CMakeFiles/bitcoin_wallet.dir/main.cc.s

CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o: CMakeFiles/bitcoin_wallet.dir/flags.make
CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o: bitcoin_wallet.cc
CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o: CMakeFiles/bitcoin_wallet.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/Desktop/sparrow_pc/linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o -MF CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o.d -o CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o -c /home/user/Desktop/sparrow_pc/linux/bitcoin_wallet.cc

CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/Desktop/sparrow_pc/linux/bitcoin_wallet.cc > CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.i

CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/Desktop/sparrow_pc/linux/bitcoin_wallet.cc -o CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.s

CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o: CMakeFiles/bitcoin_wallet.dir/flags.make
CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o: flutter/generated_plugin_registrant.cc
CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o: CMakeFiles/bitcoin_wallet.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/Desktop/sparrow_pc/linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o -MF CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o.d -o CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o -c /home/user/Desktop/sparrow_pc/linux/flutter/generated_plugin_registrant.cc

CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/Desktop/sparrow_pc/linux/flutter/generated_plugin_registrant.cc > CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.i

CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/Desktop/sparrow_pc/linux/flutter/generated_plugin_registrant.cc -o CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.s

# Object files for target bitcoin_wallet
sparrow_OBJECTS = \
"CMakeFiles/bitcoin_wallet.dir/main.cc.o" \
"CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o" \
"CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o"

# External object files for target bitcoin_wallet
sparrow_EXTERNAL_OBJECTS =

intermediates_do_not_run/bitcoin_wallet: CMakeFiles/bitcoin_wallet.dir/main.cc.o
intermediates_do_not_run/bitcoin_wallet: CMakeFiles/bitcoin_wallet.dir/bitcoin_wallet.cc.o
intermediates_do_not_run/bitcoin_wallet: CMakeFiles/bitcoin_wallet.dir/flutter/generated_plugin_registrant.cc.o
intermediates_do_not_run/bitcoin_wallet: CMakeFiles/bitcoin_wallet.dir/build.make
intermediates_do_not_run/bitcoin_wallet: plugins/url_launcher_linux/liburl_launcher_linux_plugin.so
intermediates_do_not_run/bitcoin_wallet: plugins/window_size/libwindow_size_plugin.so
intermediates_do_not_run/bitcoin_wallet: flutter/ephemeral/libflutter_linux_gtk.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libgtk-3.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libgdk-3.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libpangocairo-1.0.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libpango-1.0.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libharfbuzz.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libatk-1.0.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libcairo-gobject.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libcairo.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libgio-2.0.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libgobject-2.0.so
intermediates_do_not_run/bitcoin_wallet: /usr/lib/x86_64-linux-gnu/libglib-2.0.so
intermediates_do_not_run/bitcoin_wallet: CMakeFiles/bitcoin_wallet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/Desktop/sparrow_pc/linux/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable intermediates_do_not_run/bitcoin_wallet"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bitcoin_wallet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bitcoin_wallet.dir/build: intermediates_do_not_run/bitcoin_wallet
.PHONY : CMakeFiles/bitcoin_wallet.dir/build

CMakeFiles/bitcoin_wallet.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bitcoin_wallet.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bitcoin_wallet.dir/clean

CMakeFiles/bitcoin_wallet.dir/depend:
	cd /home/user/Desktop/sparrow_pc/linux && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/Desktop/sparrow_pc/linux /home/user/Desktop/sparrow_pc/linux /home/user/Desktop/sparrow_pc/linux /home/user/Desktop/sparrow_pc/linux /home/user/Desktop/sparrow_pc/linux/CMakeFiles/bitcoin_wallet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bitcoin_wallet.dir/depend


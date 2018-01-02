@echo off
test&cls
gcc --version
::::::::::::::::::::::::::::::::::::::::::::::::::::
echo. 
echo [ === CLEAN LIB === ] 
echo. 

del /s /q /f *.o
del /s /q /f *.a
del /s /q /f *.dll
del /s /q /f *.exe

echo clean all [*.o; *.a, *.dll] complete ...
::::::::::::::::::::::::::::::::::::::::::::::::::::
echo. 
echo [ === BUILD ... === ] 

::--------------------------------------------------
::[CASE 001]:
::g++ -o run.exe hello.cpp

::--------------------------------------------------
::[CASE 002]:
g++ -Wall -g -o run.exe Hello.cpp
    ::// -o: specifies the output executable filename.
    ::// -Wall: prints "all" warning messages.
    ::// -g: generates additional symbolic debuggging information for use with gdb debugger.

::--------------------------------------------------
::[CASE 003]: Compile and Link Separately
    ::// The above command compile the source file into object file 
    ::// and link with other object files (system library) into executable in one step. 
    ::// You may separate compile and link in two steps as follows:

    ::// Compile-only with -c option
g++ -c -Wall -g Hello.cpp
    ::// Link object file(s) into an executable
g++ -g -o Hello.exe Hello.o

    ::// The options are:
    ::// -c: compile into object file "Hello.o". By default, the object file has the same name as 
    ::// the source file with extension of ".o" (there is no need to specify -o option). 
    ::// No linking with other object file or library.
    ::// Linking is performed when the input file are object files ".o" 
    ::// (instead of source file ".cpp" or ".c"). 
    ::// GCC uses a separate linker program (called ld.exe) to perform the linking.

::--------------------------------------------------
::[CASE 004]: Compile and Link Multiple Source Files
    ::// Suppose that your program has two source files: file1.cpp, file2.cpp. 
    ::// You could compile all of them in a single command:

::g++ -o myprog.exe file1.cpp file2.cpp 
    ::// However, we usually compile each of the source files separately into object file, 
    ::// and link them together in the later stage. 
    ::// In this case, changes in one file does not require re-compilation of the other files.

::g++ -c file1.cpp
::g++ -c file2.cpp
::g++ -o myprog.exe file1.o file2.o

::::::::::::::::::::::::::::::::::::::::::::::::::::
echo. 
echo [ === RUNNING ... === ] 
echo. 

call run.exe
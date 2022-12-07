cmake_minimum_required(VERSION 3.14)
project(googletest-examples LANGUAGES Fortran CXX)

# The version number.
set(VERSION_MAJOR 1)
set(VERSION_MINOR 0)

set(CMAKE_CXX_STANDARD 11) # GoogleTest requires at least C++11
set(CMAKE_Fortran_Compiler gfortran)

SET(CMAKE_CXX_FLAGS="-g -O0 -Wall -W -Wshadow -Wunused-variable -Wunused-parameter -Wunused-function -Wunused -Wno-system-headers -Wno-deprecated -Woverloaded-virtual -Wwrite-strings -fprofile-arcs -ftest-coverage")
SET(CMAKE_C_FLAGS="-g -O0 -Wall -W -fprofile-arcs -ftest-coverage")
SET(CMAKE_SHARED_LINKER_FLAGS="-fprofile-arcs -ftest-coverage")
SET(CMAKE_EXE_LINKER_FLAGS="-fprofile-arcs -ftest-coverage")

#build the test runner
include_directories(external/googletest/googletest/include)
add_subdirectory(external/googletest)
link_directories(external/googletest/build/lib)

# build a shared library
include_directories(fizz-buzz-library)
FILE(GLOB fblSources fizz-buzz-library/*.cpp)
add_library(fizz-buzz-library SHARED ${fblSources})
link_directories(${CMAKE_CURRENT_BINARY_DIR})

# build a test
add_executable(testfizzbuzzer fizzbuzz_kata/TestFizzBuzz.cpp fizzbuzz_kata/hello_test.cpp)
target_link_libraries(testfizzbuzzer gtest gtest_main fizz-buzz-library)

# build a fortran library
add_library(mylib SHARED fortranlibrary/mylib.f90)
set_target_properties(mylib PROPERTIES LINKER_LANGUAGE Fortran)
link_directories(${CMAKE_CURRENT_BINARY_DIR})

# build a test of a fortran library
add_executable(testfortranlibray test_fortran_library/TestFortranLibrary.cpp)
target_link_libraries(testfortranlibray mylib)
target_link_libraries(testfortranlibray lapack)
target_link_libraries(testfortranlibray gtest gtest_main)

# Specify CMake root location
#include(${CMAKE_ROOT}/Modules/CMakeDetermineCompiler.cmake)
#include(${CMAKE_ROOT}/Modules/ExternalProject.cmake)

# Set CMake stadard to be 11
#set(CMAKE_CXX_STANDARD 11)
#set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_CXX_FLAGS  -std=c++11)

# Setup file extension preferences
# set(FORT_EXT .F90)

# Define directories for source etc.
#set(FORT_SOURCE_DIR ${CMAKE_SOURCE_DIR}/src/fortran)
#set(CPP_SOURCE_DIR ${CMAKE_SOURCE_DIR}/src/cpp)
#set(GTEST_DIR ${CMAKE_SOURCE_DIR}/src/cpp)
#set(BLD_DIR ${CMAKE_BINARY_DIR})
#set(CMAKE_INSTALL_RPATH ${CMAKE_BINARY_DIR})
#set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

# Setup C and C++ compilers
#find_program(CMAKE_C_COMPILER NAMES $ENV{CC} gcc PATHS ENV PATH NO_DEFAULT_PATH)
#find_program(CMAKE_CXX_COMPILER NAMES $ENV{CXX} g++ PATHS ENV PATH NO_DEFAULT_PATH)

# Set CMake compiler flags
#SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-rpath -Wl,/usr/local/lib64")

# Set default fortran compiler flags
# set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -cpp -g -fcheck=bounds  -fbacktrace")

# Set the output folder where your program will be created
#set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
#set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})

# Set library path
#set(CMAKE_LIBRARY_PATH /usr/lib)

# Set output path
#set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})

# The following folders will be included
# file(GLOB all_sources ${FORT_SOURCE_DIR}/*.f90 ${FORT_SOURCE_DIR}/*.f)

# Create dynamic library/shared object

# Setup for Google test software (CPP executable)
# add_executable(GTest.exe ${GTEST_DIR}/main.cpp)
# target_link_libraries(GTest.exe fortran-googletest)
# target_link_libraries(GTest.exe lapack)
# target_link_libraries(GTest.exe gtest gtest_main pthread)

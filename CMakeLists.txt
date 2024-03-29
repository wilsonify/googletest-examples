cmake_minimum_required(VERSION 3.14)
project(googletest-examples LANGUAGES Fortran CXX)

# The version number.
set(VERSION_MAJOR 1)
set(VERSION_MINOR 0)
set(CMAKE_CXX_STANDARD 14) # GoogleTest requires at least C++11
set(CMAKE_CXX_FLAGS="-g -O0 -Wall -W -Wshadow -Wunused-variable -Wunused-parameter -Wunused-function -Wunused -Wno-system-headers -Wno-deprecated -Woverloaded-virtual -Wwrite-strings -fprofile-arcs -ftest-coverage")
set(CMAKE_C_FLAGS="-g -O0 -Wall -W -fprofile-arcs -ftest-coverage")
set(CMAKE_SHARED_LINKER_FLAGS="-fprofile-arcs -ftest-coverage")
set(CMAKE_EXE_LINKER_FLAGS="-fprofile-arcs -ftest-coverage")

# Fortran specific setup
ENABLE_LANGUAGE(Fortran)
set(CMAKE_Fortran_Compiler gfortran)
set(FORT_EXT .f90)
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -cpp -g -fcheck=bounds  -fbacktrace")

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
FILE(GLOB testfizzbuzzerSources fizz-buzz-kata/*.cpp)
add_executable(testfizzbuzzer ${testfizzbuzzerSources} )
target_link_libraries(testfizzbuzzer gtest gtest_main fizz-buzz-library)

# build a fortran library
include_directories(fortran-library)
FILE(GLOB fortranlibrarySources fortran-library/*.f90)
add_library(fortranlibrary SHARED ${fortranlibrarySources})
set_target_properties(fortranlibrary PROPERTIES LINKER_LANGUAGE Fortran)
link_directories(${CMAKE_CURRENT_BINARY_DIR})

#build a test of a fortran library
FILE(GLOB testfortranlibraySources fortran-library-kata/*.cpp)
add_executable(testfortranlibray ${testfortranlibraySources})
target_link_libraries(testfortranlibray gtest gtest_main fortranlibrary)

# build a shared library
include_directories(checkout-library)
FILE(GLOB checkoutSources checkout-library/*.cpp)
add_library(checkout-library SHARED ${checkoutSources})
link_directories(${CMAKE_CURRENT_BINARY_DIR})

# build a test
FILE(GLOB testcheckoutSources checkout-kata/*.cpp)
add_executable(testcheckout ${testcheckoutSources})
target_link_libraries(testcheckout gtest gtest_main checkout-library)


# Tests
enable_testing ()
add_test(run-testfizzbuzzer testfizzbuzzer)
add_test(run-testfortranlibray testfortranlibray)
add_test(run-testcheckout testcheckout)

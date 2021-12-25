cmake_minimum_required(VERSION 3.14)
project(fizzbuzz_kata)
set(CMAKE_CXX_STANDARD 11) # GoogleTest requires at least C++11


include_directories(external/googletest/googletest/include)
link_directories(external/googletest/build/lib)

add_executable(fizzbuzz_kata TestFizzBuzz.cpp)
target_link_libraries(fizzbuzz_kata gtest gtest_main)

cmake_minimum_required(VERSION 3.14)
project(fizzbuzz_kata)
set(CMAKE_CXX_STANDARD 11) # GoogleTest requires at least C++11


include_directories(fizzbuzz_kata/external/googletest/googletest/include)
link_directories(fizzbuzz_kata/external/googletest/build/lib)

add_executable(fizzbuzzer fizzbuzz_kata/TestFizzBuzz.cpp)
target_link_libraries(fizzbuzzer gtest gtest_main)

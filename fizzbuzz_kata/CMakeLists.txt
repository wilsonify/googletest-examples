cmake_minimum_required(VERSION 3.14)
project(fizzbuzz_kata)

# GoogleTest requires at least C++11
set(CMAKE_CXX_STANDARD 11)

include(external/googletest/googletest/include)
include(external/googletest/googlemock/include)

enable_testing()

add_executable(
  hello_test
  hello_test.cc
)
target_link_libraries(
  hello_test
  gtest_main
)

include(GoogleTest)
gtest_discover_tests(hello_test)

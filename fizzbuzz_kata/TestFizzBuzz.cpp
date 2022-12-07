//============================================================================
// Name        : FizzBuzz.cpp
//
// FizzBuzz Code Kata:
// Write a function that receives and prints a passed in number.
// But for multiples of three print "Fizz"
// instead of the number and for the multiples of five print "Buzz".
// For numbers which are multiples of
// both three and five print "FizzBuzz".
//============================================================================

#include <gtest/gtest.h>
#include "check-fizz-buzz.hpp"

TEST(FizzBuzzTests, returns1With1PassedIn)
{
	checkFizzBuzz(1, "1");
}

TEST(FizzBuzzTests, returns2With2PassedIn)
{
	checkFizzBuzz(2, "2");
}

TEST(FizzBuzzTests, returnsFizzWith3PassedIn)
{
	checkFizzBuzz(3, "Fizz");
}

TEST(FizzBuzzTests, returnsBuzzWith5PassedIn)
{
	checkFizzBuzz(5, "Buzz");
}

TEST(FizzBuzzTests, returnsFizzWith6PassedIn)
{
	checkFizzBuzz(6, "Fizz");
}

TEST(FizzBuzzTests, returnsBuzzWith10PassedIn)
{
	checkFizzBuzz(10, "Buzz");
}

TEST(FizzBuzzTests, returnsFizzBuzzWith15PassedIn)
{
	checkFizzBuzz(15, "FizzBuzz");
}

#include <gtest/gtest.h>

void checkFizzBuzz(int value, std::string expectedResult)
{
	std::string result = fizzBuzz(value);
	ASSERT_STREQ(expectedResult.c_str(), result.c_str());
}

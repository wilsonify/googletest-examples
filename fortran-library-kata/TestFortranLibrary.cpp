#include <gtest/gtest.h>

extern "C"
{
   double binomial(int *, int *);
   void echo(int *, int *);
}

// Tests for myLib

TEST(myLib, echo_test_1)
{
   int a = 1;
   int b = 3;
   echo(&a, &b);
   EXPECT_EQ(b, 3);
}

TEST(myLib, binomial_1)
{
   int n = 1;
   int k = 1;
   double c;
   c = binomial(&n, &k);
   EXPECT_EQ(1, c);
}
#include <gtest/gtest.h>

// 
//  Place subroutines and functions for testing here
//  Use the name given in the bind(C, name="") in the Fortran source
//
extern "C"
{
   void myLib_mySub(int *, int *);
   double myLib_binomial(int *, int *);
}


//  Tests for myLib

TEST(myLib, mySub_test_1) { 
   int a = 1;
   int b;
   
   myLib_mySub(&a, &b);
   EXPECT_EQ(b, 15);
}

TEST(myLib, mySub_test_2) { 
   int a = 1;
   extern int shared_value;
   shared_value = 20;
   int b;

   myLib_mySub(&a, &b);
   EXPECT_EQ(b, 20);
}

TEST(myLib, binomial_1) { 
   int n = 1;
   int k = 1;
   double c;
   c = myLib_binomial(&n, &k);
   EXPECT_EQ(1.0, c);
}
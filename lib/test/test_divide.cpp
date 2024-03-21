#include <gtest/gtest.h>

extern "C" int divide(int, int);

struct TestDivideValue
{
    int a;
    int b;
    int expected;

    TestDivideValue(int _a, int _b, int _expected): a(_a), b(_b), expected(_expected) { };
};

class DivideTestFixture :public ::testing::TestWithParam<TestDivideValue> { };

TEST_P(DivideTestFixture, Example) {
    TestDivideValue testDivideValue = GetParam();

    EXPECT_EQ(divide(testDivideValue.a, testDivideValue.b), testDivideValue.expected);
};

INSTANTIATE_TEST_CASE_P(
    DivideTests,
    DivideTestFixture,
    ::testing::Values(
        TestDivideValue( 15, 5, 3 ),
        TestDivideValue( 17, 5, 3 )
    )
);
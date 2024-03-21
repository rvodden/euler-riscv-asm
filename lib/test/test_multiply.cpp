#include <gtest/gtest.h>

extern "C" int multiply(int, int);

struct TestMultiplyValue
{
    int a;
    int b;
    int expected;

    TestMultiplyValue(int _a, int _b, int _expected): a(_a), b(_b), expected(_expected) { };
};

class MultiplyTestFixture :public ::testing::TestWithParam<TestMultiplyValue> { };

TEST_P(MultiplyTestFixture, Example) {
    TestMultiplyValue testMultiplyValue = GetParam();

    EXPECT_EQ(multiply(testMultiplyValue.a, testMultiplyValue.b), testMultiplyValue.expected);
};

INSTANTIATE_TEST_CASE_P(
    MultiplyTests,
    MultiplyTestFixture,
    ::testing::Values(
        TestMultiplyValue( 5, 3, 15 ),
        TestMultiplyValue( 7, 3, 21 )
    )
);
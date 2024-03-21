add_library(lib divide.s gcd.s multiply.s)

add_executable(test_lib test/test_divide.cpp test/test_multiply.cpp)
target_link_libraries(test_lib PUBLIC lib)
target_link_libraries(test_lib PUBLIC gtest)
target_link_libraries(test_lib PUBLIC gmock)
target_link_libraries(test_lib PUBLIC gtest_main)

gtest_add_tests(TARGET test_lib)
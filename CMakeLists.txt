cmake_policy(SET CMP0048 NEW)

set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/cmake/riscv.cmake")
project(euler VERSION 0.0.1 LANGUAGES ASM CXX)

cmake_minimum_required(VERSION 3.22)

set(CMAKE_EXE_LINKER_FLAGS "-lc ${CMAKE_EXE_LINKER_FLAGS}")

##### Testing

include(FetchContent)

FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.13.0.zip
)

FetchContent_MakeAvailable(googletest)
include(GoogleTest)
enable_testing()

add_subdirectory(lib)

add_executable(problem_001 problem_001.s)
target_link_libraries(problem_001 lib)
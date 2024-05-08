cmake_minimum_required(VERSION 3.2)

project(some_name)

file(GLOB_RECURSE sources      src/main/*.cpp src/main/*.hpp)
file(GLOB_RECURSE sources_test src/test/*.cpp)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(${PROJECT_NAME} ${sources})

set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY
                                                 "${CMAKE_BINARY_DIR}/bin")

target_compile_options(${PROJECT_NAME} PUBLIC -std=c++20 -O3 -Wall -Wpedantic -Werror)
target_include_directories(${PROJECT_NAME} PUBLIC src/main)

cmake_minimum_required(VERSION 3.26)
project(framework_consumer)

set(CMAKE_CXX_STANDARD 23)

add_executable(framework_consumer main.cpp)

find_package(tfc CONFIG REQUIRED)

target_link_libraries(framework_consumer
  PUBLIC
    tfc::base
    tfc::ipc
    tfc::confman
    tfc::logger
)

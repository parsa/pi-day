cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
project(pi_day_celebration CXX)

add_executable(pi_day pi.cpp)
set_property(TARGET pi_day PROPERTY CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
TARGET_LINK_LIBRARIES(pi_day mpfr)

cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
project(pi_day_celebration CXX)

set(PI_DIGITS 100 CACHE STRING "Numer of Pi digits")
message("Number of digits is set to ${PI_DIGITS}")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

find_package(MPFR REQUIRED)
find_package(Boost REQUIRED)

add_executable(pi_day pi.cpp)

set_target_properties(pi_day PROPERTIES
    CXX_STANDARD 14
    CXX_STANDARD_REQUIRED ON
    CXX_EXTENSIONS OFF
)

target_compile_definitions(pi_day PRIVATE PRECISION_DIGITS=${PI_DIGITS})

target_link_libraries(pi_day PRIVATE Boost::boost mpfr::mpfr)

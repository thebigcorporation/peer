cmake_minimum_required(VERSION 3.5)
project(alglib)

FILE(GLOB ALGLIB_SRC_LIB "*.cpp")

add_library(alglib STATIC ${ALGLIB_SRC_LIB})

cmake_minimum_required(VERSION 3.5)


set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/modules/")

SET(CMAKE_CXX_STANDARD 11)

option(BUILD_EXAMPLE "Build example" ON)

add_subdirectory(src)

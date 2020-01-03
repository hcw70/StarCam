cmake_minimum_required(VERSION 3.1)

set(PROJECT_NAME qdeclarativecamera)
project(${PROJECT_NAME} LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Quick Multimedia REQUIRED)

file(GLOB SRC *.cpp)
file(GLOB HEADER *.h)


add_library(${PROJECT_NAME} ${SRC} ${HEADER})
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick Qt5::Multimedia)

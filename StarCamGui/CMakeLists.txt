cmake_minimum_required(VERSION 3.1)

project(StarCamGui LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Quick Multimedia REQUIRED)

include(ExternalProject)

###################
## QuickFlux
ExternalProject_Add(QuickFlux
    PREFIX "${PROJECT_BINARY_DIR}/QuickFlux-build"
    GIT_REPOSITORY "https://github.com/benlau/quickflux.git"
    GIT_TAG "c4a1a477b"
    CMAKE_ARGS "-DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}"
                    "-DCMAKE_INSTALL_PREFIX=${PROJECT_BINARY_DIR}/QuickFlux"
                    "-DCMAKE_INSTALL_LIBDIR=${PROJECT_BINARY_DIR}/QuickFlux/lib"
                    "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}"
)

link_directories("${PROJECT_BINARY_DIR}/QuickFlux/lib")
include_directories("${PROJECT_BINARY_DIR}/QuickFlux/include/quickflux")

## QuickFlux
###################

list(APPEND QML_DIRS ${PROJECT_BINARY_DIR}/QuickFlux/)
list(APPEND QML_DIRS "${CMAKE_CURRENT_BINARY_DIR}/QuickFlux-build/src/QuickFlux-build")
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qdeclarativecamera")

set(QML_IMPORT_PATH "${QML_DIRS}" CACHE STRING "Qt Creator 4.1 extra qml import paths" FORCE)


add_subdirectory(qdeclarativecamera)

add_executable(${PROJECT_NAME} "main.cpp" "qml.qrc")
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick Qt5::Multimedia quickfluxd qdeclarativecamera)
add_dependencies(${PROJECT_NAME} QuickFlux)

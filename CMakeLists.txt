cmake_minimum_required (VERSION 2.8)
project (DEFINED) 

option(STATIC "STATIC" OFF)
set(CMAKE_VERBOSE_MAKEFILE on)

if(STATIC)
set(CMAKE_EXE_LINKER_FLAGS -static)
set(CMAKE_FIND_LIBRARY_SUFFIXES .a)
set(CMAKE_EXE_LINK_DYNAMIC_C_FLAGS)
set(CMAKE_EXE_LINK_DYNAMIC_CXX_FLAGS)
set(CMAKE_SHARED_LIBRARY_C_FLAGS)
set(CMAKE_SHARED_LIBRARY_CXX_FLAGS)
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS)
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS)
set(BUILD_SHARED_LIBS OFF)
endif(STATIC)

set(CMAKE_CXX_FLAGS "-std=c++11 -O3 -Wall -Wextra -Wshadow -g -Wfatal-errors -Wno-sign-compare -Wno-literal-suffix")

SET(CMAKE_C_FLAGS "-std=c99 -Wall -msse4.1 -mpclmul")

add_subdirectory(minisat)

include_directories(minisat)

SET(SOURCES 
	src/Parser.cpp
)

add_executable (defined src/Main.cpp ${SOURCES})
if(STATIC)
SET_TARGET_PROPERTIES (defined PROPERTIES LINK_SEARCH_START_STATIC 1)
target_link_libraries(defined minisat-lib-static)
else(STATIC)
target_link_libraries(defined minisat-lib-shared)
endif(STATIC)


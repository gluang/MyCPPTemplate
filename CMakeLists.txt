cmake_minimum_required (VERSION 2.6)
project (main)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Wextra -O2")

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin)

add_test(test ${CMAKE_CURRENT_SOURCE_DIR}/bin/${PROJECT_NAME})
enable_testing()

include_directories(include)

file(GLOB SRC "src/*.cpp")
add_executable (main main.cpp ${SRC})


# find_library(OTHERLIB libother.a)
# target_link_libraries(${PROJECT_NAME} ${OTHERLIB} ${HELLOLIB})

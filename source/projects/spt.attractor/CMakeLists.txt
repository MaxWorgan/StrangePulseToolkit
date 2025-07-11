cmake_minimum_required(VERSION 3.5)
project(spt.attractor)

# Min API pretarget
set(C74_MIN_API_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../min-api")
include(${C74_MIN_API_DIR}/script/min-pretarget.cmake)

# includes
include_directories(
  ${C74_INCLUDES}
  "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

# IDE folders & grouping
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
file(GLOB_RECURSE MXWN_MY_FILES
  RELATIVE "${CMAKE_SOURCE_DIR}"
  "include/*.h"
  "*.cpp"
)
source_group(
  TREE   "${CMAKE_SOURCE_DIR}"
  PREFIX "${PROJECT_NAME}"
  FILES  ${MXWN_MY_FILES}
)

# auto-add each attractor subdir
file(GLOB CHILD_DIRS RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/*")
foreach(dir ${CHILD_DIRS})
  if ( IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${dir}"
       AND EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${dir}/CMakeLists.txt"
       AND NOT dir MATCHES "^(min-api|include)$")
    add_subdirectory("${dir}")
  endif()
endforeach()

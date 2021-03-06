set (PROJECT_VER_MAJOR  0)
set (PROJECT_VER_MINOR  1)
set (PROJECT_VER_PATCH  0)
set (PROJECT_VER        0.1.0)

if (NOT CMAKE_BUILD_TYPE)
  set (CMAKE_BUILD_TYPE Debug CACHE STRING "")
endif (NOT CMAKE_BUILD_TYPE)

set (_host "${CMAKE_HOST_SYSTEM_NAME}/${CMAKE_HOST_SYSTEM_PROCESSOR}")
message ("-- Host:    ${_host}")

set (_target "${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_PROCESSOR}")
message ("-- Target:  ${_target}")

if (NOT DEFINED MACHINE)
  set (MACHINE "Generic")
endif (NOT DEFINED MACHINE)
message ("-- Machine: ${MACHINE}")

string (TOLOWER ${CMAKE_SYSTEM_NAME}      PROJECT_SYSTEM)
string (TOUPPER ${CMAKE_SYSTEM_NAME}      PROJECT_SYSTEM_UPPER)
string (TOLOWER ${CMAKE_SYSTEM_PROCESSOR} PROJECT_PROCESSOR)
string (TOUPPER ${CMAKE_SYSTEM_PROCESSOR} PROJECT_PROCESSOR_UPPER)
string (TOLOWER ${MACHINE}                PROJECT_MACHINE)
string (TOUPPER ${MACHINE}                PROJECT_MACHINE_UPPER)

option (WITH_STATIC_LIB "Build with a static library" ON)

if ("${PROJECT_SYSTEM}" STREQUAL "linux")
  option (WITH_SHARED_LIB "Build with a shared library" ON)
  option (WITH_TESTS      "Install test applications" ON)
endif ("${PROJECT_SYSTEM}" STREQUAL "linux")

if (WITH_TESTS AND (${_host} STREQUAL ${_target}))
  option (WITH_TESTS_EXEC "Run test applications during build" ON)
endif (WITH_TESTS AND (${_host} STREQUAL ${_target}))

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Werror -Wextra" CACHE STRING "")

# vim: expandtab:ts=2:sw=2:smartindent

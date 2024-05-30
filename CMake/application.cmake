include_directories(${CMAKE_SOURCE_DIR}/Application)
include_directories(${CMAKE_SOURCE_DIR}/Application/Runtime)

list(APPEND PROJECT_APPLICATION_SOURCES   
    ${CMAKE_SOURCE_DIR}/Application/syscalls.c 
    ${CMAKE_SOURCE_DIR}/Application/sysmem.c
    ${CMAKE_SOURCE_DIR}/Application/Runtime/os_task1.cpp
    ${CMAKE_SOURCE_DIR}/Application/Runtime/os_task2.cpp
    ${CMAKE_SOURCE_DIR}/Application/Runtime/os_task3.cpp
    ${CMAKE_SOURCE_DIR}/Application/Runtime/os_task4.cpp
)

set_source_files_properties(PROJECT_APPLICATION_SOURCES LANGUAGE CXX)
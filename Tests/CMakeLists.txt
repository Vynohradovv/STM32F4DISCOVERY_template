if(DEFINED ENV{CPPUTEST_HOME})
    message(STATUS "Using CppUTest home: $ENV{CPPUTEST_HOME}")
    set(CPPUTEST_INCLUDE_DIRS $ENV{CPPUTEST_HOME}/include)
    set(CPPUTEST_LIBRARIES $ENV{CPPUTEST_HOME}/lib)
    set(CPPUTEST_LDFLAGS CppUTest CppUTestExt)
else()
    find_package(PkgConfig REQUIRED)
    pkg_search_module(CPPUTEST REQUIRED cpputest>=3.8)
    message(STATUS "Found CppUTest version ${CPPUTEST_VERSION}")
    
endif()

set(TEST_APP_NAME ${PROJECT_NAME}_tests)

set(TEST_SOURCES 
    t_first.cpp     
    t_main.cpp
    )

# include_directories(${CPPUTEST_INCLUDE_DIRS} 
#     ../App/
#     ../CubeMX/
    # )
    
link_directories(${CPPUTEST_LIBRARIES})

add_executable(${TEST_APP_NAME} ${TEST_SOURCES})
target_link_libraries(${TEST_APP_NAME} ${CPPUTEST_LIBRARIES} ${CPPUTEST_LDFLAGS})
add_custom_target(CPPUTEST ALL COMMAND $<TARGET_FILE:${TEST_APP_NAME}>)
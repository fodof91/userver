project(userver-rabbitmq CXX)

file(GLOB_RECURSE SOURCES
  ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/*.hpp)

file(GLOB_RECURSE RABBITMQ_TEST_SOURCES
  ${CMAKE_CURRENT_SOURCE_DIR}/*_rmqtest.cpp)

list(REMOVE_ITEM SOURCES ${RABBITMQ_TEST_SOURCES})

include(SetupAmqpCPP)

add_library(${PROJECT_NAME} STATIC ${SOURCES})
target_link_libraries(${PROJECT_NAME}
  PUBLIC
    userver-core
  PRIVATE
    amqp-cpp
)
target_include_directories(
  ${PROJECT_NAME}
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src
)

if (USERVER_IS_THE_ROOT_PROJECT)
  add_executable(${PROJECT_NAME}_rmqtest ${RABBITMQ_TEST_SOURCES})
  target_include_directories (${PROJECT_NAME}_rmqtest PRIVATE
    $<TARGET_PROPERTY:${PROJECT_NAME},INCLUDE_DIRECTORIES>
  )
  target_link_libraries(${PROJECT_NAME}_rmqtest userver-utest ${PROJECT_NAME})
  add_test(${PROJECT_NAME}_rmqtest
    env
    ${CMAKE_BINARY_DIR}/testsuite/env
    --databases=rabbitmq
    run --
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}_rmqtest
    --gtest_output=xml:${CMAKE_BINARY_DIR}/test-results/${PROJECT_NAME}_rmqtest.xml
  )
endif()

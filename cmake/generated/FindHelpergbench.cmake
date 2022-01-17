# AUTOGENERATED, DON'T CHANGE THIS FILE!

include(ExternalProject)

 
if(NOT TARGET gbench_external_project)
  if (CMAKE_BUILD_TYPE MATCHES "Test")
    set(CURRENT_CMAKE_BUILD_TYPE "Debug")
  else ()
    set(CURRENT_CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE})
  endif ()

  ExternalProject_Add(
    gbench_external_project
    SOURCE_DIR ${USERVER_ROOT_DIR}/submodules/google-benchmark
      PREFIX ${CMAKE_CURRENT_BINARY_DIR}
    CMAKE_ARGS
      -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}
      -DCMAKE_C_COMPILER_LAUNCHER=${CMAKE_C_COMPILER_LAUNCHER}
      -DCMAKE_CXX_COMPILER_LAUNCHER=${CMAKE_CXX_COMPILER_LAUNCHER}
      -DCMAKE_BUILD_TYPE=${CURRENT_CMAKE_BUILD_TYPE}
      -DBENCHMARK_ENABLE_GTEST_TESTS=OFF
      -DBENCHMARK_ENABLE_TESTING=OFF
       PATCH_COMMAND ""
    DOWNLOAD_COMMAND ""
    INSTALL_COMMAND ""
        UPDATE_COMMAND ""
    LOG_DOWNLOAD True
    LOG_CONFIGURE True
    LOG_BUILD True
  )

ExternalProject_Get_Property(gbench_external_project source_dir binary_dir)

set(gbench_INCLUDE_DIRS ${source_dir}/include)
 
file(MAKE_DIRECTORY ${gbench_INCLUDE_DIRS})

add_library(libbenchmark INTERFACE IMPORTED GLOBAL)
add_dependencies(libbenchmark
  gbench_external_project
 )
 
target_link_libraries(
  libbenchmark
    INTERFACE
      "${binary_dir}/src/libbenchmark.a"
 )
 
target_include_directories(
  libbenchmark
    INTERFACE
      ${gbench_INCLUDE_DIRS}
)

add_library(libbenchmark_main INTERFACE IMPORTED GLOBAL)
add_dependencies(libbenchmark_main
  gbench_external_project
  libbenchmark
 )
 
target_link_libraries(
  libbenchmark_main
    INTERFACE
      "${binary_dir}/src/libbenchmark_main.a"
 )
 
target_include_directories(
  libbenchmark_main
    INTERFACE
      ${gbench_INCLUDE_DIRS}
)

  
endif(NOT TARGET gbench_external_project)

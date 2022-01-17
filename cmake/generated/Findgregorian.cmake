# AUTOGENERATED, DON'T CHANGE THIS FILE!

 
              
 
 

include(FindPackageHandleStandardArgs)

find_library(gregorian_LIBRARIES_boost_date_time NAMES
  boost_date_time
  )
list(APPEND gregorian_LIBRARIES
  ${gregorian_LIBRARIES_boost_date_time}
)
  
find_path(gregorian_INCLUDE_DIRS_boost_date_time_gregorian_gregorian_hpp NAMES
  boost/date_time/gregorian/gregorian.hpp
  )
list(APPEND gregorian_INCLUDE_DIRS
  ${gregorian_INCLUDE_DIRS_boost_date_time_gregorian_gregorian_hpp}
)
  
 

 
 
find_package_handle_standard_args(
  gregorian
    REQUIRED_VARS
      gregorian_LIBRARIES
      gregorian_INCLUDE_DIRS
      
    FAIL_MESSAGE
      "Could not find `gregorian` package. Debian: sudo apt update && sudo apt install libboost-date-time-dev MacOS: brew install boost"
)
mark_as_advanced(
  gregorian_LIBRARIES
  gregorian_INCLUDE_DIRS
  
)
 
if(NOT Boost_FOUND)
  message(FATAL_ERROR "Could not find `gregorian` package. Debian: sudo apt update && sudo apt install libboost-date-time-dev MacOS: brew install boost")
elseif(gregorian_version_result)
  if(gregorian_version_result EQUAL 0)
    if(gregorian_VERSION VERSION_LESS None)
      message(FATAL_ERROR "Found but version is gregorian_VERSION. Could not find `gregorian` package. Debian: sudo apt update && sudo apt install libboost-date-time-dev MacOS: brew install boost")
    endif()
  else()
    message(WARNING "Can not determine version. ${gregorian_version_error}")
  endif()
endif()

 
if (NOT TARGET gregorian)
  add_library(gregorian INTERFACE IMPORTED GLOBAL)
  if (TARGET Boost::gregorian)
    target_link_libraries(gregorian INTERFACE Boost::gregorian)
  endif(TARGET Boost::gregorian)
   target_include_directories(gregorian INTERFACE ${gregorian_INCLUDE_DIRS})
   target_link_libraries(gregorian INTERFACE ${gregorian_LIBRARIES})
  endif(NOT TARGET gregorian)

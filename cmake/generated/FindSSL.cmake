# AUTOGENERATED, DON'T CHANGE THIS FILE!

 
              
 
 

include(FindPackageHandleStandardArgs)

 
 
 

 
find_package(OpenSSL 
    COMPONENTS SSL
 )
 
 
if(NOT OpenSSL_FOUND)
  message(FATAL_ERROR "Could not find `SSL` package. Debian: sudo apt update && sudo apt install libssl-dev MacOS: brew install openssl")
elseif(OpenSSL_version_result)
  if(OpenSSL_version_result EQUAL 0)
    if(OpenSSL_VERSION VERSION_LESS None)
      message(FATAL_ERROR "Found but version is OpenSSL_VERSION. Could not find `SSL` package. Debian: sudo apt update && sudo apt install libssl-dev MacOS: brew install openssl")
    endif()
  else()
    message(WARNING "Can not determine version. ${OpenSSL_version_error}")
  endif()
endif()

 
if (NOT TARGET SSL)
  add_library(SSL INTERFACE IMPORTED GLOBAL)
  if (TARGET OpenSSL::SSL)
    target_link_libraries(SSL INTERFACE OpenSSL::SSL)
  endif(TARGET OpenSSL::SSL)
    endif(NOT TARGET SSL)

# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(string_service_sort_library VERSION 0.0.1 LANGUAGES C)

add_library(string_service_sort SHARED
  "string_service_sort.c"
)

set_target_properties(string_service_sort PROPERTIES
  PUBLIC_HEADER string_service_sort.h
  OUTPUT_NAME "string_service_sort"
)

target_compile_definitions(string_service_sort PUBLIC DART_SHARED_LIB)

if (ANDROID)
  # Support Android 15 16k page size
  target_link_options(string_service_sort PRIVATE "-Wl,-z,max-page-size=16384")
endif()

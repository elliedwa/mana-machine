cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    mana-machine
    VERSION 0.1.0
    DESCRIPTION "A command-line Magic: the Gathering implementation."
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    mana-machine_lib OBJECT
    src/lib.cc
)

target_include_directories(
    mana-machine_lib ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>"
)

target_compile_features(mana-machine_lib PUBLIC cxx_std_17)

# ---- Declare executable ----

add_executable(mana-machine_exe src/main.cc)
add_executable(mana-machine::exe ALIAS mana-machine_exe)

set_property(TARGET mana-machine_exe PROPERTY OUTPUT_NAME mana-machine)

target_compile_features(mana-machine_exe PRIVATE cxx_std_17)

target_link_libraries(mana-machine_exe PRIVATE mana-machine_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT mana-machine_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of mana-machine"
  )
endif()

include(cmake/dev-mode.cmake)

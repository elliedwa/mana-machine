install(
    TARGETS mana-machine_exe
    RUNTIME COMPONENT mana-machine_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()

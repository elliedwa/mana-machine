# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(mana-machineTests LANGUAGES CXX)

# ---- Tests ----

add_executable(mana-machine_test src/mana-machine_test.cc)
target_link_libraries(mana-machine_test PRIVATE mana-machine_lib)
target_compile_features(mana-machine_test PRIVATE cxx_std_17)

add_test(NAME mana-machine_test COMMAND mana-machine_test)

# ---- End-of-file commands ----

add_folders(Test)

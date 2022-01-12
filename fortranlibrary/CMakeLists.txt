add_library(mylib SHARED mylib.f90)
set_target_properties(mylib PROPERTIES LINKER_LANGUAGE Fortran)


add_library(ddfun90 STATIC
    ddfun90.f90
    ddmod90.f90
    x86.c
)

add_executable(testquad tquadtsdd.f90)
target_link_libraries(testquad PRIVATE ddfun90 rmn)

install(TARGETS ddfun90 DESTINATION lib)

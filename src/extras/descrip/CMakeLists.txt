add_library(descrip vgrid.c vgrid_descriptors.F90 vgrid_utils.F90)
target_link_libraries(descrip PRIVATE ddfun90 rmn)
install(TARGETS descrip DESTINATION lib)


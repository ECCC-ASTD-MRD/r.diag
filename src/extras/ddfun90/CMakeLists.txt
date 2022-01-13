
# F_SRC = ddfun90.f90  ddmod90.f90
# 
# C_SRC = x86.c
# 
# $(LIBDIR)/$(LIB):
# 	mkdir -p $(INCDIR) $(LIBDIR)
# 	rm -f *.o *.mod --------> No .mod files
# 	s.f90 -c -O $(F_SRC) >
# 	s.cc -c $(C_SRC)     > Add_library
# 	ar rcv $@ *.o        >
# 	rm -f *.o
# 	mv *.mod $(INCDIR) ------> no .mod files

add_library(ddfun90 STATIC
    ddfun90.f90
    ddmod90.f90
    # test16.f90
    # tquadtsdd.f90
    x86.c
)

add_executable(testquad tquadtsdd.f90)
target_link_libraries(testquad PRIVATE ddfun90 RMN::RMN)

install(TARGETS ddfun90 DESTINATION lib)

# TODO That's a lot of modules resulting from compiling two Fortran files
# TODO Where are they supposed to be installed and are they suppoesed to be
#      installed?
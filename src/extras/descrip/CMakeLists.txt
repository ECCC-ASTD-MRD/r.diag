add_library(descrip vgrid.c vgrid_descriptors.F90 vgrid_utils.F90)
target_link_libraries(descrip PRIVATE ddfun90 rmn)
install(TARGETS descrip DESTINATION lib)

# TODO How to install the *.mod files?  I think they are supposed to go in lib.
# and I can't use a glob because the .mod files don't exist at CMake configure
# time.  Also I can't transforme the list of .F90 files to .mod files because
# not all .F90 will generate a .mod file when compiled.


# NOTES: The following is the output of 'make'.  We see the compilation of three
# files to make a library.  We also note
#
# - We have some moves with the makefile
#      mv ... vgrid_descriptors.mod $EC_ARCH
#      mv ... vgrid_utils.mod $EC_ARCH
#   With CMake, the .mod files are with the library in
#      ${CMAKE_BINARY_DIR}/src/extras/descrip
#        ├── libdescrip.a
#        ├── vgrid_descriptors.mod
#        └── vgrid_utils.mod
# - Compilation is done with -O0
# - Compilation is done with -openmp in the makefile however when compiling with intel
#   I got this error message:
#      [ 25%] Building Fortran object src/extras/descrip/CMakeFiles/descrip.dir/vgrid_utils.F90.o
#      cd /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/build/src/extras/descrip && /fs/ssm/main/opt/intelcomp/intelpsxe-cluster-19.0.3.199/intelpsxe-cluster_19.0.3.199_multi/compilers_and_libraries_2019.3.199/linux/bin/intel64/ifort  -I/fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/build  -O3   -openmp -c /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/descrip/vgrid_utils.F90 -o CMakeFiles/descrip.dir/vgrid_utils.F90.o
#      ifort: command line error: option '-openmp' is not supported. Please use the replacement option '-qopenmp'
# - The include is from `-I$(EC_ARCH)` which is irrelevant because with CMake we
#   are not putting things in $(EC_ARCH).


#           Output of make command
#################################################################################
#  0 phc001@eccc2-ppp4:r.diag/src/extras/descrip/ (cmake_dev 4m) $ make
#################################################################################
# Makefile:55: dependencies.mk: No such file or directory
# ls *.hc *.c *.F90 | ./s.dependencies.pl > dependencies.mk 
# Includes missing from the current tree: stdlib.h stdio.h string.h math.h rpnmacros.h msg.h stdint.h 
# Modules missing from the current tree: iso_c_binding (vgrid_descriptors.F90) 
# mkdir -p Linux_x86-64/intel-19.0.3.199
# mkdir -p /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/descrip/../../../lib/Linux_x86-64/intel-19.0.3.199 
# mkdir -p /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/descrip/../../../include/Linux_x86-64/intel-19.0.3.199
# echo "character(len=128) :: vgrid_descriptors_version = \"VGRID 6.6.0 intel-19.0.3.199 ubuntu-18.04-amd64-64 Thu Jan 13 16:01:11 EST 2022\"" > vgrid_version.hf
# echo                "char vgrid_descriptors_version[] = \"VGRID 6.6.0 intel-19.0.3.199 ubuntu-18.04-amd64-64 Thu Jan 13 16:01:11 EST 2022\";" > vgrid_version.hc
#################################################################################
# s.cc -c -openmp -ILinux_x86-64/intel-19.0.3.199 -O0 -g    vgrid.c
#################################################################################
# USING: /fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/code-tools_3.2.2_all/include/Linux_x86-64/intel-19.0.3.199/Compiler_rules
# Compiler rules applied for Intel 19.0.3.199 20190206
# /bin/mv vgrid.o Linux_x86-64/intel-19.0.3.199
#################################################################################
# s.f90 -c -openmp -ILinux_x86-64/intel-19.0.3.199 -O0 -g    vgrid_utils.F90
#################################################################################
# USING: /fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/code-tools_3.2.2_all/include/Linux_x86-64/intel-19.0.3.199/Compiler_rules
# Compiler rules applied for Intel 19.0.3.199 20190206
# /bin/mv vgrid_utils.o vgrid_utils.mod Linux_x86-64/intel-19.0.3.199
#################################################################################
# s.f90 -c -openmp -ILinux_x86-64/intel-19.0.3.199 -O0 -g    vgrid_descriptors.F90
#################################################################################
# USING: /fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/code-tools_3.2.2_all/include/Linux_x86-64/intel-19.0.3.199/Compiler_rules
# Compiler rules applied for Intel 19.0.3.199 20190206
# /bin/mv vgrid_descriptors.o vgrid_descriptors.mod Linux_x86-64/intel-19.0.3.199
# cd Linux_x86-64/intel-19.0.3.199 ; s.ar rvU libdescrip.a vgrid.o  vgrid_descriptors.o  vgrid_utils.o  
# USING: /fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/code-tools_3.2.2_all/include/Linux_x86-64/intel-19.0.3.199/Compiler_rules
# Compiler rules applied for Intel 19.0.3.199 20190206
#################################################################################
# + ar rvU libdescrip.a vgrid.o vgrid_descriptors.o vgrid_utils.o
#################################################################################
# ar: creating libdescrip.a
# a - vgrid.o
# a - vgrid_descriptors.o
# a - vgrid_utils.o
# rsync -a Linux_x86-64/intel-19.0.3.199/libdescrip.a /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/descrip/../../../lib/Linux_x86-64/intel-19.0.3.199
# rsync -a vgrid_version.h* Linux_x86-64/intel-19.0.3.199/*.mod /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/descrip/../../../include/Linux_x86-64/intel-19.0.3.199
# make    clean_all
# make[1]: Entering directory '/fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/descrip'
# ls *.hc *.c *.F90 | ./s.dependencies.pl > dependencies.mk 
# Includes missing from the current tree: stdlib.h stdio.h string.h math.h rpnmacros.h msg.h stdint.h 
# Modules missing from the current tree: iso_c_binding (vgrid_descriptors.F90) 
# rm -f vgrid.o  vgrid_descriptors.o  vgrid_utils.o   Linux_x86-64/intel-19.0.3.199/vgrid_utils.mod Linux_x86-64/intel-19.0.3.199/vgrid_descriptors.mod
# rm -rf Linux_x86-64/intel-19.0.3.199 ; rm -f vgrid_version.hc vgrid_version.hf dependencies.mk
# rm -f *~
# make[1]: Leaving directory '/fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/descrip'

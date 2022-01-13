################# Make  $PWD/lib/${EC_ARCH} and $PWD/include/${EC_ARCH|
# mkdir -p /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/udunits-f-2.0/../../../lib/Linux_x86-64/intel-19.0.3.199
# mkdir -p /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/udunits-f-2.0/../../../include/Linux_x86-64/intel-19.0.3.199
################# s.f90 -c -O f_udunits_2.f90
# USING: /fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/code-tools_3.2.2_all/include/Linux_x86-64/intel-19.0.3.199/Compiler_rules
# Compiler rules applied for Intel 19.0.3.199 20190206
################# archiving f_udunits_2.o into ${...}/libudunits2f_s.a
################# s.ar rvU /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/udunits-f-2.0/../../../lib/Linux_x86-64/intel-19.0.3.199/libudunits2f_s.a f_udunits_2.o
# USING: /fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/code-tools_3.2.2_all/include/Linux_x86-64/intel-19.0.3.199/Compiler_rules
# Compiler rules applied for Intel 19.0.3.199 20190206
# + ar rvU /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/udunits-f-2.0/../../../lib/Linux_x86-64/intel-19.0.3.199/libudunits2f_s.a f_udunits_2.o
# ar: creating /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/udunits-f-2.0/../../../lib/Linux_x86-64/intel-19.0.3.199/libudunits2f_s.a
# a - f_udunits_2.o
# /bin/mv *.mod /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/udunits-f-2.0/../../../include/Linux_x86-64/intel-19.0.3.199
# /bin/rm f_udunits_2.o

add_library(f_udunits_2 f_udunits_2.f90)
install(TARGETS f_udunits_2 DESTINATION bin)

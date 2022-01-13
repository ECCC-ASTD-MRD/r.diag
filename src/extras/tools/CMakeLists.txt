add_executable(r.echo r.echo.c)
# Output of make:
####################
# s.cc -o r.echo r.echo.c
# USING: /fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/code-tools_3.2.2_all/include/Linux_x86-64/intel-19.0.3.199/Compiler_rules
# Compiler rules applied for Intel 19.0.3.199 20190206
# /bin/mv r.echo /fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/extras/tools/../../../bin/Linux_x86-64
# /bin/rm -f r.echo.o
####################
# Notes:
# r.echo.c is compiled into an executable
# Not moving anything into bin
install(TARGETS r.echo DESTINATION bin)

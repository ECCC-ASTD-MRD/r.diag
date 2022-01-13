# Note : /fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-amd64-64/include/Linux_x86-64/intel-19.0.3.199/clib_interface.cdk

macro(setup_gppf_file INPUT_FILE OUTPUT_FILE EXTRA)
    add_custom_command(
        OUTPUT ${OUTPUT_FILE}
        # Note : Backslashes before '#' are for CMake.
        COMMAND r.gppf ${EXTRA} -chop_bang -gpp -F -D__FILE__="\#file" -D__LINE__="\#line" -I/fs/ssm/eccc/mrd/rpn/utils/19.7.0/ubuntu-18.04-amd64-64/include -I/fs/ssm/eccc/mrd/rpn/utils/19.7.0/ubuntu-18.04-skylake-64/include -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-amd64-64/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-amd64-64/include -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-amd64-64/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-skylake-64/include -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/all/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/all/include -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/all/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/main/opt/openmpi/openmpi-3.1.2--hpcx-2.4.0-mofed-4.6--intel-19.0.3.199/ubuntu-18.04-amd64-64/include -I/fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/all/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/all/include -I/fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/all/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/comm/eccc/all/opt/intelcomp/intelpsxe-cluster-19.0.3.199/multi/include -I/fs/ssm/eccc/mrd/rpn/utils/19.7.0/all/share/include -I/fs/homeu1/eccc/cmd/cmds/phc001/Repositories/gitlab.science.gc.ca/RPN-SI/r.diag/src/lssub/../../include -I./Sources. -I/fs/ssm/eccc/mrd/rpn/utils/19.7.0/ubuntu-18.04-amd64-64/include -I/fs/ssm/eccc/mrd/rpn/utils/19.7.0/ubuntu-18.04-skylake-64/include -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-amd64-64/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-amd64-64/include -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-amd64-64/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/ubuntu-18.04-skylake-64/include -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/all/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/all/include -I/fs/ssm/eccc/mrd/rpn/libs/19.7.0/all/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/main/opt/openmpi/openmpi-3.1.2--hpcx-2.4.0-mofed-4.6--intel-19.0.3.199/ubuntu-18.04-amd64-64/include -I/fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/all/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/all/include -I/fs/ssm/eccc/mrd/rpn/code-tools/1.5.2/all/include/Linux_x86-64/intel-19.0.3.199 -I/fs/ssm/comm/eccc/all/opt/intelcomp/intelpsxe-cluster-19.0.3.199/multi/include -I/usr/include -Dtaille_entete=32 -Dnombre_de_taches=1 -DLittle_Endian -DWITH_intel -D__INTEL_COMPILER=1900 -DAMD64 -DLINUX_X86_64 -DWITHOUT_OpenMP ${INPUT_FILE} > ${OUTPUT_FILE}
        DEPENDS ${INPUT_FILE}
        COMMENT "Generating ${OUTPUT_FILE} from ${INPUT_FILE} with r.gppf"
    )
endmacro()

# List of all files passed through gppf
set(GPFF_FILES)

################ FTN FILES ###########################################
# message("FTN_FILES = ${FTN_FILES}")
file(GLOB FTN_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.ftn)
foreach(FTN_FILE ${FTN_FILES})
    # message("FTN_FILE : ${FTN_FILE}")
    string(REGEX REPLACE "\\.ftn" ".f" F_FILE ${FTN_FILE})
    # message("F_FILE: ${F_FILE}")
    setup_gppf_file(${CMAKE_CURRENT_SOURCE_DIR}/${FTN_FILE} ${CMAKE_CURRENT_BINARY_DIR}/${F_FILE} "")
    list(APPEND GPPF_FILES ${CMAKE_CURRENT_BINARY_DIR}/${F_FILE})
endforeach()

############# FTN90 FILES ############################################
file(GLOB FTN90_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.ftn90)
foreach(FTN90_FILE ${FTN90_FILES})
    # message("FTN90_FILE : ${FTN90_FILE}")
    string(REGEX REPLACE "\\.ftn90" ".f90" F90_FILE ${FTN90_FILE})
    # message("F90_FILE: ${F90_FILE}")
    setup_gppf_file(${CMAKE_CURRENT_SOURCE_DIR}/${FTN90_FILE} ${CMAKE_CURRENT_BINARY_DIR}/${F90_FILE} -lang-f90+)
    list(APPEND GPPF_FILES ${CMAKE_CURRENT_BINARY_DIR}/${F90_FILE})
endforeach()

add_library(lssub

    ${CMAKE_CURRENT_BINARY_DIR}/alp.f # alp.ftn
    averages_common.F90 # averages_common.cdk90
    ${CMAKE_CURRENT_BINARY_DIR}/cofg.f # cofg.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/convsub.f # convsub.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/coord.f # coord.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/ddl.f # ddl.ftn
    diag_convert_ip123.F90 # diag_convert_ip123.cdk90
    ${CMAKE_CURRENT_BINARY_DIR}/diag_convip_plus.f90 # diag_convip_plus.ftn90
    diag_toc.F90 # diag_toc.cdk90
    ${CMAKE_CURRENT_BINARY_DIR}/dimgt.f # dimgt.ftn
    divers.c
    ${CMAKE_CURRENT_BINARY_DIR}/eapl.f # eapl.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/eof.f # eof.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/fastaf2.f # fastaf2.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/fastaf.f # fastaf.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/ffgfw2.f # ffgfw2.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/fftcray.f # fftcray.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/fftini.f # fftini.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/ffwfg2.f # ffwfg2.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/filev.f # filev.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/filter.f90 # filter.ftn90
    ${CMAKE_CURRENT_BINARY_DIR}/four2.f # four2.ftn
    gaussg.F90 # gaussg.F90
    ${CMAKE_CURRENT_BINARY_DIR}/gcof.f # gcof.ftn
    gemdiag.F90 # gemdiag.F90
    ${CMAKE_CURRENT_BINARY_DIR}/get.f # get.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/ggd.f # ggd.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/gobits.f # gobits.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/inctdia.f # inctdia.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/interp.f # interp.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/ism.f # ism.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/label.f # label.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/lgtst.f # lgtst.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/lire_arg.f # lire_arg.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/lowio92.f # lowio92.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/lowio.f # lowio.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/lssub.f # lssub.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/lwbw.f # lwbw.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/mem.f # mem.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/mrcdiag.f # mrcdiag.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/newtim.f # newtim.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/pacc92.f # pacc92.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/paccrn.f # paccrn.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/pael.f # pael.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/pfa.f # pfa.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/precon.f # precon.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/prob.f # prob.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/put.f # put.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/rec.f # rec.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/sfft.f # sfft.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/spectra.f # spectra.ftn
    stats_signatures.F90 # stats_signatures.cdk90
    ${CMAKE_CURRENT_BINARY_DIR}/temperton.f # temperton.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/trans1d.f # trans1d.ftn
    util2.F90 # util2.F90
    ${CMAKE_CURRENT_BINARY_DIR}/util.f # util.ftn
    ${CMAKE_CURRENT_BINARY_DIR}/vfft.f # vfft.ftn
)
# target_compile_options(lssub PRIVATE -free)
target_compile_definitions(lssub PRIVATE -Dtaille_entete=32 -Dnombre_de_taches=1 -DLittle_Endian -DWITH_intel -D__INTEL_COMPILER=1900 -DAMD64 -DLINUX_X86_64 -DWITHOUT_OpenMP)

add_dependencies(lssub descrip)
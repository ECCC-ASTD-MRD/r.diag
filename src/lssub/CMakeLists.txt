add_library(diag_sq98
    alp.f # alp.ftn
    averages_common.f90 # averages_common.cdk90
    cofg.f # cofg.ftn
    convsub.f # convsub.ftn
    coord.f # coord.ftn
    ddl.f # ddl.ftn
    diag_convert_ip123.f90 # diag_convert_ip123.cdk90
    diag_convip_plus.f90 # diag_convip_plus.ftn90
    diag_toc.f90 # diag_toc.cdk90
    dimgt.f # dimgt.ftn
    divers.c
    eapl.f # eapl.ftn
    eof.f # eof.ftn
    fastaf2.f # fastaf2.ftn
    fastaf.f # fastaf.ftn
    ffgfw2.f # ffgfw2.ftn
    fftcray.f # fftcray.ftn
    fftini.f # fftini.ftn
    ffwfg2.f # ffwfg2.ftn
    filev.f # filev.ftn
    filter.f90 # filter.ftn90
    four2.f # four2.ftn
    gaussg.f90 # gaussg.F90
    gcof.f # gcof.ftn
    gemdiag.f90 # gemdiag.F90
    get.f # get.ftn
    ggd.f # ggd.ftn
    gobits.f # gobits.ftn
    inctdia.f # inctdia.ftn
    interp.f # interp.ftn
    ism.f # ism.ftn
    label.f # label.ftn
    lgtst.f # lgtst.ftn
    lire_arg.f # lire_arg.ftn
    lowio92.f # lowio92.ftn
    lowio.f # lowio.ftn
    lssub.f # lssub.ftn
    lwbw.f # lwbw.ftn
    mem.f # mem.ftn
    mrcdiag.f # mrcdiag.ftn
    newtim.f # newtim.ftn
    pacc92.f # pacc92.ftn
    paccrn.f # paccrn.ftn
    pael.f # pael.ftn
    pfa.f # pfa.ftn
    precon.f # precon.ftn
    prob.f # prob.ftn
    put.f # put.ftn
    rec.f # rec.ftn
    sfft.f # sfft.ftn
    spectra.f # spectra.ftn
    stats_signatures.f90 # stats_signatures.cdk90
    temperton.f # temperton.ftn
    trans1d.f # trans1d.ftn
    util2.f90 # util2.F90
    util.f # util.ftn
    vfft.f # vfft.ftn
)
# target_compile_options(lssub PRIVATE -free)
target_compile_definitions(diag_sq98 PRIVATE -Dtaille_entete=32 -Dnombre_de_taches=1 -DLittle_Endian -DWITH_intel -DAMD64 -DLINUX_X86_64 -DWITHOUT_OpenMP)
target_link_libraries(diag_sq98 PRIVATE rmn::rmn)

add_dependencies(diag_sq98 descrip)
install(TARGETS diag_sq98 DESTINATION lib)

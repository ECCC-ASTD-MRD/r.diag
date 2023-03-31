
macro(setup_ptn_to_ftn INPUT_FILE OUTPUT_FILE)
    add_custom_command(
        OUTPUT ${OUTPUT_FILE}
        DEPENDS ${INPUT_FILE}
        COMMAND sed 's/      PROGRAM /      SUBROUTINE /' ${INPUT_FILE} > ${OUTPUT_FILE}
        COMMENT "Generating ${OUTPUT_FILE} from ${INPUT_FILE} by doing `sed 's/      PROGRAM /      SUBROUTINE /' \${in} > \${out}`"
    )
endmacro()

file(GLOB PTN_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.ptn)
foreach(PTN_FILE ${PTN_FILES})
    string(REGEX REPLACE "\\.ptn" ".f" F_FILE ${PTN_FILE})
    set(input_file ${CMAKE_CURRENT_SOURCE_DIR}/${PTN_FILE})
    set(output_file ${CMAKE_CURRENT_BINARY_DIR}/${F_FILE})
    setup_ptn_to_ftn(${input_file} ${output_file})
endforeach()

file(GLOB PTN90_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.ptn90)
foreach(PTN_FILE ${PTN90_FILES})
    string(REGEX REPLACE "\\.ptn90" ".f90" F90_FILE ${PTN_FILE})
    set(input_file ${CMAKE_CURRENT_SOURCE_DIR}/${PTN_FILE})
    set(output_file ${CMAKE_CURRENT_BINARY_DIR}/${F90_FILE})
    setup_ptn_to_ftn(${input_file} ${output_file})
endforeach()

add_library(prog_sq98 STATIC

    # Missing from this list zlnplot.ptn (not in the makefile list and has weird compilation errors)
    # and maybe otheres

    # PTN90DECKS

    ${CMAKE_CURRENT_BINARY_DIR}/averages.f90 # averages.ptn90
    ${CMAKE_CURRENT_BINARY_DIR}/fstmdiag.f90 # fstmdiag.ptn90
    ${CMAKE_CURRENT_BINARY_DIR}/oilfill.f90 # oilfill.ptn90

   # PTNDECKS 

    ${CMAKE_CURRENT_BINARY_DIR}/addf.f # addf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/addtext.f # addtext.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/adjust.f # adjust.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/anomali.f # anomali.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/barx.f # barx.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/bary.f # bary.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/beta.f # beta.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/betao.f # betao.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/binach.f # binach.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/binning.f # binning.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/bins.f # bins.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/calmap.f # calmap.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/calpres.f # calpres.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/cdiv.f # cdiv.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/chabin.f # chabin.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/chklev.f # chklev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/cmlt.f # cmlt.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/cofagg.f # cofagg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/cofaps.f # cofaps.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/complex.f # complex.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/condef.f # condef.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/conjmlt.f # conjmlt.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/constr.f # constr.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/convert.f # convert.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/corpar.f # corpar.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/cosf.f # cosf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/critt.f # critt.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/crvplot.f # crvplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ctemps.f # ctemps.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/cwinds.f # cwinds.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/delhat.f # delhat.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/delhato.f # delhato.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/delx.f # delx.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/dely.f # dely.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/dertim.f # dertim.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/diftim.f # diftim.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/divf.f # divf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/dxdp.f # dxdp.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/enleve.f # enleve.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/eofrot.f # eofrot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/expone.f # expone.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/extrac.f # extrac.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/fcats.f # fcats.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/fit.f # fit.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/flat.f # flat.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/fmask.f # fmask.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/fpow.f # fpow.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/fptest.f # fptest.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/fsttri.f # fsttri.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ftest.f # ftest.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/fullcor.f # fullcor.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/fullmix.f # fullmix.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gadd.f # gadd.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gaussw.f # gaussw.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gdiv.f # gdiv.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggacof.f # ggacof.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggall.f # ggall.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggaps.f # ggaps.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggatim.f # ggatim.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggdev.f # ggdev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggdlat.f # ggdlat.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggdlon.f # ggdlon.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gghems.f # gghems.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gglob.f # gglob.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggplot.f # ggplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggsign.f # ggsign.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggstat.f # ggstat.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggtrig.f # ggtrig.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ggvecps.f # ggvecps.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/globavg.f # globavg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gmlt.f # gmlt.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gpasg.f # gpasg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gpdpd.f # gpdpd.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gphum.f # gphum.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gpvtat.f # gpvtat.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/grset.f # grset.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsapl.f # gsapl.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsaptp.f # gsaptp.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsaptp.f # gsaptp.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsapzl.f # gsapzl.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsathl.f # gsathl.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsathlt.f # gsathlt.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gshumh.f # gshumh.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsmslp.f # gsmslp.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsmslph.f # gsmslph.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsomgah.f # gsomgah.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gsomega.f # gsomega.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/gwtqd.f # gwtqd.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/hdplot.f # hdplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/hovplot.f # hovplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ijlook.f # ijlook.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/inttim.f # inttim.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/invntry.f # invntry.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/joiner.f # joiner.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/joinup.f # joinup.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/kef.f # kef.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/lagcor.f # lagcor.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/laslon.f # laslon.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/legendre.f # legendre.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/levrev.f # levrev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/linepc.f # linepc.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/linint.f # linint.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/llagg.f # llagg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/loge.f # loge.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/lpprint.f # lpprint.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/makezg.f # makezg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/memcoef.f # memcoef.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mempred.f # mempred.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mergef.f # mergef.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/meofvec.f # meofvec.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/meriavg.f # meriavg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/minvers.f # minvers.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/miroir.f # miroir.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mkmask.f # mkmask.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mksymm.f # mksymm.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mkunsy.f # mkunsy.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mltf.f # mltf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mmult.f # mmult.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/modulus.f # modulus.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/tmmult.f # tmmult.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mslpr.f # mslpr.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/mtrace.f # mtrace.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/newnam.f # newnam.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/nspec.f # nspec.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/parmsub.f # parmsub.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/pcomp.f # pcomp.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/pgen.f # pgen.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/plagalc.f # plagalc.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/psdiv.f # psdiv.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/psgrid.f # psgrid.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/psmlt.f # psmlt.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/randeof.f # randeof.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/rangrd.f # rangrd.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/rcopy.f # rcopy.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/relabl.f # relabl.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/repack.f # repack.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/rgopr.f # rgopr.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/rmax.f # rmax.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/rmlabl.f # rmlabl.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/rzonavg.f # rzonavg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/select.f # select.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/select2.f # select2.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/shiftf.f # shiftf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/signag.f # signag.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/sinf.f # sinf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/slice.f # slice.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/smooth.f # smooth.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/smspec.f # smspec.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/solflux.f # solflux.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/sortf.f # sortf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spamp.f # spamp.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spblow.f # spblow.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spcalpa.f # spcalpa.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spcdns.f # spcdns.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spconj.f # spconj.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spcsum.f # spcsum.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spdlat.f # spdlat.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spdlon.f # spdlon.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spdlsq.f # spdlsq.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spectr.f # spectr.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spflux.f # spflux.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spgdev.f # spgdev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/splapl.f # splapl.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spldiss.f # spldiss.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/splinv.f # splinv.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/splook.f # splook.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spnegm.f # spnegm.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spplot.f # spplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spreim.f # spreim.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spresol.f # spresol.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spslope.f # spslope.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spsmoo.f # spsmoo.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spvdgx.f # spvdgx.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spzdev.f # spzdev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/spzxmlt.f # spzxmlt.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/sqroot.f # sqroot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/square.f # square.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/subarea.f # subarea.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/subf.f # subf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/t2test.f # t2test.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/tfilter.f # tfilter.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/timagg.f # timagg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/timavg.f # timavg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/timcov.f # timcov.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/timdev.f # timdev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/timegen.f # timegen.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/transpos.f # transpos.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/tsafc.f # tsafc.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/tscheck.f # tscheck.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/tstep.f # tstep.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ttesta.f # ttesta.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/tteste.f # tteste.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/txtplot.f # txtplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/unbinn.f # unbinn.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/unmask.f # unmask.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/unseas.f # unseas.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/varspec.f # varspec.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/vbasd.f # vbasd.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/veint.f # veint.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/vertinc.f # vertinc.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/vminmax.f # vminmax.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/vpint.f # vpint.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/vpintl.f # vpintl.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/vpintv.f # vpintv.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/vsint.f # vsint.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/vsinth.f # vsinth.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/w2stat.f # w2stat.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/windowf.f # windowf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xappend.f # xappend.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xfind.f # xfind.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xlin.f # xlin.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xmplot.f # xmplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xpand.f # xpand.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xplot.f # xplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xsave.f # xsave.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xtrac.f # xtrac.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/xylin.f # xylin.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/ytox.f # ytox.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zadlev.f # zadlev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zdhdiv.f # zdhdiv.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zonavg.f # zonavg.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zoncov.f # zoncov.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zondev.f # zondev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zonmod.f # zonmod.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxaglb.f # zxaglb.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxdev.f # zxdev.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxdevp.f # zxdevp.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxdlat.f # zxdlat.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxdlatf.f # zxdlatf.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxgam.f # zxgam.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxint.f # zxint.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxplot.f # zxplot.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxprint.f # zxprint.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxpsi.f # zxpsi.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxtrig.f # zxtrig.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxwave.f # zxwave.ptn
    ${CMAKE_CURRENT_BINARY_DIR}/zxmav.f # zxmav.ptn

    grid_to_grid.f # from librm 19.7.0
)

target_compile_definitions(prog_sq98
    PRIVATE 
        -DNOPLOT
        -Dnombre_de_taches=1
        -DVERY_NICE=oui
        -Dtaille_entete=32
        -DNEW_INTERP
        -DLittle_Endian
        -DWITH_intel
        -D__INTEL_COMPILER=1900
        -DAMD64
        -DLINUX_X86_64
        -DWITHOUT_OpenMP
)

add_dependencies(prog_sq98 diag_sq98) 
install(TARGETS prog_sq98 DESTINATION lib)
target_link_libraries(prog_sq98 PRIVATE rmn::rmn)

add_executable(stable.r.diag driver.f)
add_dependencies(stable.r.diag prog_sq98 diag_sq98 descrip r.diag_build_info)
target_link_libraries(stable.r.diag PRIVATE prog_sq98 diag_sq98 descrip rmn::rmn BLAS::BLAS LAPACK::LAPACK)
target_compile_definitions(stable.r.diag
    PRIVATE
        -DNOPLOT
        -Dnombre_de_taches=1
        -DVERY_NICE=oui
        -Dtaille_entete=32
        -DNEW_INTERP
        -DLittle_Endian
        -DWITH_intel
        -D__INTEL_COMPILER=1900
        -DAMD64
        -DLINUX_X86_64
        -DWITHOUT_OpenMP
)
install(TARGETS stable.r.diag DESTINATION bin)

add_executable(stable.cdf2ccc cdf2ccc.F90
  # F90DECKS
    udparse.f90
  # FFDECKS
    def_dim_coord.F90
    get_coord2.F90
    get_topo.F90
    inq_file.F90
    rdlatlon2.F90
    vers_cccma.F90
    vers_netcdf.F90
  # FDECKS
    affecte_attr.f
    affecte_coord.f
    affecte_dim.f
    affecte_var.f
    attr_value.f
    attribut_coord.f
    attribut_var.f
    auxiliary_coordinate.f
    cal_date.f
    clean_char.f
    combline.f
    conv_unit.f
    decodate.f
    def_attr_projection.f
    def_cccma.f
    def_date.f
    def_level.f
    def_name.f
    def_spectral_truncation.f
    define_list.f
    define_netcdf.f
    define_var.f
    encodate.f
    enleve_bissextile2.f
    eval_lonlat.f
    eval_xcyc.f
    get_attr.f
    get_attribut.f
    get_coordonne.f
    get_dim.f
    get_name.f
    get_string.f
    get_var.f
    handle_err.f
    hybrid_vertical_coordinate.f
    init_dim.f
    initialise.f
    justifie_droite.f
    les_arg.f
    lire_arg.f
    lire_cccvar.f
    minmaxchar.f
    nblen.f
    possibilite.f
    put_attribut.f
    put_var.f
    rdspec2.f
    scanfile.f
    trier.f
    valide_range.f
    wrfile.f
    wrlalo.f
)

#----- Need to deactivate floating point error check
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fpe3")

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--warn-unresolved-symbols")
target_include_directories(stable.cdf2ccc PUBLIC ${CMAKE_BINARY_DIR}/src/extras/udunits-f-2.0)
target_link_libraries(stable.cdf2ccc PRIVATE rmn::rmn NetCDF::NetCDF_Fortran udunits2f_s diag_sq98 descrip udunits2)
target_compile_definitions(stable.cdf2ccc PRIVATE -DCDF_VERSION="2.3.5" -Dtaille_entete=32)
add_dependencies(stable.cdf2ccc udunits2f_s diag_sq98 descrip)
install(TARGETS stable.cdf2ccc DESTINATION bin)

#
# About MANDIR: From Makefile: MANDIR   = $(DIAGS)/man/pdoc
#
# About (2) : since the file is
# ###########################
# <commented documentation>
# #ifndef NOSOURCE
# <the actual source code>
# #endif
# ###########################
# the preprocessor command removes the code.
#
# About (3) : From the top of command-origin-document.sh:
# Used to retrieve the date and comments of the last
# commit in which the source of this r.diag ${Command}
# was modified and inserts them in in the $Header line
# of the source file $Document. Called in the
# .txt recipies of the lspgm Makefile.
#
# Recommendation:
#
# I believe that this documentation should be in its own separate file either in
#     ${CMAKE_SOURCE_DIR}/share/man/man1/cdf2ccc.md
# to be turned into
#     ${CMAKE_SOURCE_DIR}/share/man/man1/cdf2ccc.1
# using pandoc.
#
# Or the file could be in
#     ${CMAKE_CURRENT_SOURCE_DIR}/cdf2ccc.md
# with a relative link
#     ${CMAKE_SOURCE_DIR}/share/man/man1/cdf2ccc.md -> ../../../src/cdf2ccc/cdf2ccc.md
#
#
# Since cdf2ccc depends on the other target of this project udunits, cdf2ccc #
# could not be built standalone and therefore the idea of putting
#
# Or the file could be in
#     ${CMAKE_CURRENT_SOURCE_DIR}/cdf2ccc.md
# with a relative link
#     ${CMAKE_SOURCE_DIR}/share/man/man1/cdf2ccc.md -> ../../../src/cdf2ccc/share/man/man1/cdf2ccc.md
#
# to make it so that cdf2ccc could be built with its manpage standalone is not
# something that is worth spending effort on.


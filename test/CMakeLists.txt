if(BUILD_TESTING)
    set(RDIAG_EXEC $<TARGET_FILE:stable.r.diag>)

    add_dependencies(check stable.r.diag)
    set(f1 $ENV{ECCI_DATA_DIR}/r.diag/model/2000110100_00001d)
    set(f2 $ENV{ECCI_DATA_DIR}/r.diag/model/2000110100_00002d)
    set(f3 $ENV{ECCI_DATA_DIR}/r.diag/model/2000110100_00003d)
    set(f4 $ENV{ECCI_DATA_DIR}/r.diag/pres/2000110100_00001d)
    set(f5 $ENV{ECCI_DATA_DIR}/r.diag/pres/2000110100_00002d)
    set(f6 $ENV{ECCI_DATA_DIR}/r.diag/pres/2000110100_00003d)

    add_test(NAME r.diag_ggstat
        COMMAND ${RDIAG_EXEC} ggstat ${f1})
    add_test(NAME r.diag_enleve
        COMMAND ${RDIAG_EXEC} enleve ${f2} ./bonjour -name TT)
    add_test(NAME r.diag_joinup
        COMMAND ${RDIAG_EXEC} joinup f1_f2_joinup.rpn ${f1} ${f2})
    add_test(NAME r.diag_repack
        COMMAND ${RDIAG_EXEC} repack ${f1} f1_repack.rpn -npg =-32)
    add_test(NAME r.diag_select_I0
        COMMAND ${RDIAG_EXEC} select ${f3} f3_select.rpn -name I0)
    add_test(NAME r.diag_select_UU
        COMMAND ${RDIAG_EXEC} select ${f5} f5_select.rpn -name UU)
    add_test(NAME r.diag_subf
        COMMAND ${RDIAG_EXEC} subf ${f3} ${f2} f3_f2_subf.rpn)
    add_test(NAME r.diag_divf
        COMMAND ${RDIAG_EXEC} divf ${f6} ${f5} f6_f5_divf.rpn)
    add_test(NAME r.diag_fstmdiag
        COMMAND ${RDIAG_EXEC} fstmdiag -s ${f1} -d f1_fstmdiag -f
        # ; mv f1_fstmdiag_moyenne f1_fstmdiag_avg.rpn
        # ; mv f1_fstmdiag_variance f1_fstmdiag_std.rpn
        )
    add_test(NAME r.diag_globavg
        COMMAND ${RDIAG_EXEC} globavg ${f3} f3_globavg.rpn)
    add_test(NAME r.diag_mltf
        COMMAND ${RDIAG_EXEC} mltf ${f5} ${f6} f5_f6_mltf.rpn)
    add_test(NAME r.diag_timavg
        COMMAND ${RDIAG_EXEC} timavg ${f3} f3_timavg.rpn)
    add_test(NAME r.diag_xlin
        COMMAND ${RDIAG_EXEC} xlin ${f6} f6_xlin.rpn -a 0.0 -b 100.0 -name XLIN)
    add_test(NAME r.diag_makezg
        COMMAND ${RDIAG_EXEC} makezg ${f2} f2_makezg.rpn -i 400 -j 300)
    add_test(NAME r.diag_zonavg
        COMMAND ${RDIAG_EXEC} zonavg ${f5} f5_zonavg.rpn )
endif()

# Adding a test
# - If possible, use one of the files in ECCI_DATA_DIR/r.diag
#   and add your test inside the if(BUILD_TESTING) block.
# - If a bug is found that cannot be exposed by a test using one of the files
#    then add a test.
#
#       add_test(NAME r.diag_zonavg_xyz
#           COMMAND ${RDIAG_EXEC} zonavg /home/phc001/a_new_file )
#
#   and make sure to mention the new file in your merge request.  Someone from
#   the maintenance team will copy the file in ECCI_DATA_DIR and change the
#   file path in your test accordingly.

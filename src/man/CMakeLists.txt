file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/pdoc DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

# Transform txt doc to html
file(GLOB PTN_FILES
   ${CMAKE_SOURCE_DIR}/src/lspgm/*.ptn
   ${CMAKE_SOURCE_DIR}/src/lspgm/*.ptn90
)
list(APPEND PTN_FILES ${CMAKE_SOURCE_DIR}/src/cdf2ccc/cdf2ccc.F90)
foreach(PTN_FILE ${PTN_FILES})
   get_filename_component(TXT_FILE ${PTN_FILE} NAME_WLE)
   execute_process (
      COMMAND bash -c "r.gppf -chop_bang -gpp -F -I ${CMAKE_CURRENT_SOURCE_DIR}/../include -DNO_SOURCE -DAUTO_DOC ${PTN_FILE} 2>/dev/null | cut -c2- > ${CMAKE_CURRENT_BINARY_DIR}/pdoc/${TXT_FILE}.txt"
      OUTPUT_VARIABLE out_res
   )
endforeach()

execute_process (
    COMMAND bash -c "for i in a b c d e f g; do
          r.gppf -chop_bang -gpp -F -I ${CMAKE_CURRENT_SOURCE_DIR}/../include -DNO_SOURCE -DMORE_INFO ${CMAKE_SOURCE_DIR}/src/lspgm/driver.f 2>/dev/null | grep \"^[*]\${i}\" | sed \"s/^[*]\${i}/ /\" > ${CMAKE_CURRENT_BINARY_DIR}/pdoc/lspgm_\${i}.txt
          /bin/cat ${CMAKE_CURRENT_BINARY_DIR}/pdoc/lspgm_\${i}.txt | ${CMAKE_SOURCE_DIR}/src/bin/info2html > ${CMAKE_CURRENT_BINARY_DIR}/pdoc/lspgm_\${i}.html
       done"
    OUTPUT_VARIABLE out_res
)

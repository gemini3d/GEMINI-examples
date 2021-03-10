function(gemini_plot)

if(py_ok)

  add_test(NAME "plot:python:${name}"
    COMMAND ${Python_EXECUTABLE} -m gemini3d.plot ${out_dir} all)

  set_tests_properties("plot:python:${name}" PROPERTIES
    LABELS "plot;python;${type_label}"
    FIXTURES_CLEANUP ${name}:run_fxt
    FIXTURES_SETUP ${name}:package_fxt
    TIMEOUT 1800)

elseif(MATGEMINI_DIR)

  add_matlab_test("plot:matlab:${name}" "gemini3d.plot.plotall('${out_dir}', 'png')")

  set_tests_properties("plot:matlab:${name}" PROPERTIES
    LABELS "plot;matlab;${type_label}"
    FIXTURES_CLEANUP ${name}:run_fxt
    FIXTURES_SETUP ${name}:package_fxt
    TIMEOUT 1800)

endif()

endfunction(gemini_plot)
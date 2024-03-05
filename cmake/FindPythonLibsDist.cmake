# Find Python libraries using distutils rather than other hacks
# PYTHON_LIBRARIES: dylib of python
# PYTHON_INCLUDE_DIRS: include directories
# PYTHONLIBS_FOUND, If false, do not try to use numpy headers.

if (NOT PYTHON_LIBRARIES OR NOT PYTHON_INCLUDE_DIRS)
    execute_process (
      COMMAND "${PYTHON_EXECUTABLE}"
      -c "from distutils import sysconfig; print(sysconfig.get_config_var(\"LDLIBRARY\"))"
      OUTPUT_VARIABLE PYTHON_LIBRARIES
      RESULT_VARIABLE PYTHONLIBS_FOUND
      OUTPUT_STRIP_TRAILING_WHITESPACE)
    if (PYTHON_LIBRARIES MATCHES "Traceback")
    # Did not successfully include numpy
      set(PYTHONLIBS_FOUND FALSE)
    else ()
    # successful
      set (PYTHONLIBS_FOUND TRUE)
    endif ()

    execute_process (
      COMMAND "${PYTHON_EXECUTABLE}"
      -c "from distutils import sysconfig; print(sysconfig.get_python_inc())"
      OUTPUT_VARIABLE PYTHON_INCLUDE_DIRS
      RESULT_VARIABLE PYTHONLIBS_FOUND
      OUTPUT_STRIP_TRAILING_WHITESPACE)
    if (PYTHON_INCLUDE_DIRS MATCHES "Traceback")
    # Did not successfully include numpy
      set(PYTHONLIBS_FOUND FALSE)
    else ()
    # successful
      set (PYTHONLIBS_FOUND TRUE)
    endif ()


    mark_as_advanced (PYTHON_INCLUDE_DIRS)
    mark_as_advanced (PYTHON_LIBRARIES)
endif ()



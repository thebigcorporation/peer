#! /usr/bin/env python

# System imports
from distutils.core import *
from distutils      import sysconfig

# Third-party modules - we depend on numpy for everything
import numpy

# _Series extension module
_peer = Extension("_peer",
                    ["src/peerPYTHON_wrap.cxx"],
                    include_dirs = [numpy.get_include(),"./src"],
                    library_dirs = ['lib','./'],
                  define_macros  = [('SWIG',None)]
                  )

# Series setup
setup(name        = "peer",
      description = "Functions that work on series",
      author      = "Bill Spotz",
      py_modules  = ["peer"],
      ext_modules = [_peer],
      setup_requires=["numpy"],
      install_requires=["numpy"],
      include_dirs = [numpy.get_include(),"./src"]
      )

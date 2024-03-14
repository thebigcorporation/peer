#! /usr/bin/env python

# System imports
from distutils.core import *
from distutils import sysconfig
from glob import glob

# Third-party modules - we depend on numpy for everything
import numpy

# _Series extension module
_peer = Extension(
    "_peer",
    sources=glob("src/*.cpp"),
    include_dirs=[numpy.get_include(), "./src"],
    define_macros=[("SWIG", None)]
)

# Series setup
setup(
    name="peer",
    description="Functions that work on series",
    author="Bill Spotz",
    version="2.0.0",
    py_modules=["peer"],
    ext_modules=[_peer],
    setup_requires=["numpy"],
    install_requires=["numpy"],
    python_requires='>=3.7.0',
    include_dirs=[numpy.get_include(), "./src"],
)

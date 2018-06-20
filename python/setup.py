import os
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy

os.environ['CFLAGS'] = ('-O3 -std=c++11'
                        ' -march=native -msse2'
                        ' -Wall'
                        ' -DNDEBUG'
                        ' -I/usr/local/include/eigen3'
                        ' -I../src'
                        ' -I' + numpy.get_include())

setup(ext_modules = cythonize(Extension('qpmad',
                                        ['qpmad.pyx'],
                                        language='c++'),
                              build_dir='build'))

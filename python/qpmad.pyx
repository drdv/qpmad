import cython
import numpy as np
cimport numpy as np

cimport decl

from libcpp cimport bool

cdef class Solver:
    cdef decl.Solver *_solver

    @cython.boundscheck(False)
    @cython.wraparound(False)
    def __cinit__(self):
        """Constructor."""
        self._solver = new decl.Solver()

    def solve(self,
              np.ndarray[double, ndim=1, mode="fortran"] primal not None,
              np.ndarray[double, ndim=2, mode="fortran"] H not None,
              np.ndarray[double, ndim=1, mode="fortran"] h not None,
              np.ndarray[double, ndim=1, mode="fortran"] lb not None,
              np.ndarray[double, ndim=1, mode="fortran"] ub not None,
              np.ndarray[double, ndim=2, mode="fortran"] A not None,
              np.ndarray[double, ndim=1, mode="fortran"] Alb not None,
              np.ndarray[double, ndim=1, mode="fortran"] Aub not None):
        return self._solver.solve(&primal[0],
                                  &H[0, 0],
                                  &h[0],
                                  &lb[0],
                                  &ub[0],
                                  &A[0, 0],
                                  &Alb[0],
                                  &Aub[0],
                                  len(h),
                                  len(Alb))

    def __dealloc__(self):
        """Dealocate instance."""
        del self._solver

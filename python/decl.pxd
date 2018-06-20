# It is convenient to make all our imports here.
# Cython resolves the names in the .pxd file at compile time

from libcpp cimport bool

cdef extern from "../src/solver.h" namespace "qpmad":

    cdef cppclass Solver:
        Solver() except +

        int solve(double * primal,
                  double * H,
                  const double * h,
                  const double * lb,
                  const double * ub,
                  const double * A,
                  const double * Alb,
                  const double * Aub,
                  int n,
                  int m)

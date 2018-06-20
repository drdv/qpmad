"""A test for the qpmad python interface.

Problem from:
https://www.mathworks.com/help/optim/ug/quadprog.html
"""
import numpy as np
from qpmad import Solver

n, m = 2, 3

x = np.empty(n, order='F', dtype='double')
H = np.array([[1, -1], [-1, 2]], order='F', dtype='double')
h = np.array([-2, -6], order='F', dtype='double')
lb = np.array([0, 0], order='F', dtype='double')
ub = np.array([np.inf, np.inf], order='F', dtype='double')
A = np.array([[ 1, 1], [-1, 2], [ 2, 1]], order='F', dtype='double')
Alb = np.array([-np.inf, -np.inf, -np.inf], order='F', dtype='double')
Aub = np.array([2, 2, 3], order='F', dtype='double')

solver = Solver()
staus = solver.solve(x, H, h, lb, ub, A, Alb, Aub)

print('status:', staus)
print('   obj: ', 0.5*x.T@H@x + x.T@h)
print('   sol: ', x)

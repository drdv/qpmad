# Python interface of QPMAD
	Place this directory in the root folder of the QPMAD project
	   * cd python
	   * make setup-venv
	   * . .venv/bin/activate
	   * make (to compile the interface)
	   * python3 test.py

# Disclaimer
	This interface is not reliable: there are several hacks (ths is OK for my purposes)
	   * I added a function 'solve' (to ./src/solver.h) with arguments arrays of doubles
	     because it is not straightforward to make it work with Eigen matrices
       * I ended up performing a deep copy inside the above mentioned solve function
	     as I couldn't pass Map<...> objects due to the signature of the other solve functions
       * I assume that all numpy arrays have fortran storage
       * I simply copied the config.h file in ./src (I am being sloppy)

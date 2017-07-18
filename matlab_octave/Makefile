matlab: configure
	matlab -nosplash -nodesktop -nojvm -r 'make; quit' | tail +10

octave: configure
	octave --no-history --silent make.m

install:
	mv *.mex* ~/local/bin/qp_mex
	cp qpmad.m ~/local/bin/qp_mex

octave_test: octave_onlineqp octave_basic

octave_basic:
	octave --no-history --silent test_basic.m

octave_onlineqp:
	cd onlineqp_collection; ${MAKE} fetch
	octave --no-history --silent test_onlineqp.m


configure:
	cp config.h ../src/


clean:
	rm -f *.o
	rm -f *.mex*

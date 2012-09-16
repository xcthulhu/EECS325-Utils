PROGRAMS=critique run-tests get-tests

all : $(PROGRAMS)

%.fas %.lib : %.lisp
	clisp -c $<

critique : critique.lisp
	clisp -q -norc $<

run-tests : run-tests.lisp
	clisp -q -norc $<

get-tests : get-tests.lisp
	clisp -q -norc $<

clean :
	rm -f *.fas *.lib $(PROGRAMS)

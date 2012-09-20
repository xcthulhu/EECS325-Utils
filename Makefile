# GNU Common Lisp
LISP_RUN=clisp -q -norc
LISP_COMPILE=clisp -c

# Steel Bank Common Lisp
#LISP_RUN=sbcl --script 

PROGRAMS=critique run-tests get-tests

all : $(PROGRAMS)

%.fas %.lib : %.lisp
	$(LISP_COMPILE) $<

critique : critique.lisp
	$(LISP_RUN) $<

run-tests : run-tests.lisp
	$(LISP_RUN) $<

get-tests : get-tests.lisp
	$(LISP_RUN) $<

clean :
	rm -f *.fas *.lib $(PROGRAMS)

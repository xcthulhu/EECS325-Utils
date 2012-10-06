# Steel Bank Common Lisp
LISP_RUN=sbcl --script 

PROGRAMS=critique run-tests get-tests

all : $(PROGRAMS)

critique : critique.lisp
	$(LISP_RUN) $<

run-tests : run-tests.lisp
	$(LISP_RUN) $<

get-tests : get-tests.lisp
	$(LISP_RUN) $<

clean :
	rm -f $(PROGRAMS)

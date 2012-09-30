# GNU Common Lisp
LISP_COMPILE=clisp -c
LISP_RUN=clisp -q -norc

# Steel Bank Common Lisp
#LISP_RUN=sbcl --script 

PROGRAMS=critique run-tests get-tests #hello

all : $(PROGRAMS)

%.fas %.lib : %.lisp
	$(LISP_COMPILE) $<

critique : critique.lisp
	$(LISP_RUN) $<

run-tests : run-tests.lisp
	$(LISP_RUN) $<

get-tests : get-tests.lisp
	$(LISP_RUN) $<

hello : hello.lisp
	$(LISP_RUN) $<

clean :
	rm -f *.fas *.lib $(PROGRAMS)

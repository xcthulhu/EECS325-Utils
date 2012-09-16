LISP_BYTECODES=lisp-critic.fas

all : critique 

%.fas %.lib : %.lisp
	clisp -c $<

critique : critique.lisp
	clisp -q -norc $<

clean :
	rm -f *.fas *.lib critique

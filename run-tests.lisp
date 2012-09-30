(load "exit-program")
(load "lisp-unit") 
(load "exercise-tests")
(use-package :lisp-unit)

(defun main ()
  "Main function, parsing command line arguments"
  (let ((args
         #+clisp ext:*args*
         #+sbcl sb-ext:*posix-argv*
         #+clozure (ccl::command-line-arguments)
         #+gcl si:*command-args*
         #+ecl (loop for i from 0 below (si:argc) collect (si:argv i))
         #+cmu extensions:*command-line-strings*
         #+allegro (sys:command-line-arguments)
         #+lispworks sys:*line-arguments-list*
       ))
  (load (car args))
  (apply #'run-named-tests (cdr args))
  (exit-program)))

#+clisp (saveinitmem "run-tests" :quiet t :norc t :executable t :init-function 'main)
#+sbcl (sb-ext:save-lisp-and-die "run-tests" :executable t :toplevel 'main)

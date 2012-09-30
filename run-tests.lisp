(load "babel")
(load "lisp-unit") 
(load "exercise-tests")
(use-package :lisp-unit)

(defun main ()
  "Main function, parsing command line arguments"
  (let ((args (cdr (get-args))))
  (load (car args))
  (apply #'run-named-tests (cdr args))
  (exit-program)))

#+clisp (saveinitmem "run-tests" :quiet t :norc t :executable t :init-function 'main)
#+sbcl (sb-ext:save-lisp-and-die "run-tests" :executable t :toplevel 'main)

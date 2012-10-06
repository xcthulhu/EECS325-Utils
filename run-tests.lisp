(load "babel")
(load "ddr")
(load "lisp-unit") 
(load "exercise-tests")
(load "ddr-tests")
(load "ddr-exs-tests")
(use-package :lisp-unit)

(defun main ()
  "Main function, parsing command line arguments"
  (let ((args (cdr (get-args))))
  (load (car args))
  (apply #'run-named-tests (cdr args))
  (format t "~%")
  (exit-program)))

#+clisp (saveinitmem "run-tests" :quiet t :norc t :executable t :init-function 'main)
#+sbcl (sb-ext:save-lisp-and-die "run-tests" :executable t :toplevel 'main)

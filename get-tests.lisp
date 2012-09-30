(load "babel")
(load "lisp-unit") 
(load "exercise-tests")
(use-package :lisp-unit)

(defun main ()
  (format t "~a~%" (get-tests))
  (exit-program))

#+clisp (saveinitmem "get-tests" :quiet t :norc t :executable t :init-function 'main)
#+sbcl (sb-ext:save-lisp-and-die "get-tests" :executable t :toplevel 'main)

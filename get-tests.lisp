(load "lisp-unit") 
(load "exercise-tests")
(use-package :lisp-unit)

(defun main ()
  (format t "~a" (get-tests))
  (bye))

#+clisp (saveinitmem "get-tests" :quiet t :norc t :executable t :init-function 'main)

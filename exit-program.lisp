; http://stackoverflow.com/questions/4425400/is-there-a-command-to-halt-the-interpreter-in-common-lisp

(defun exit-program ()
  #+sbcl (sb-ext:quit)
  #+clisp (ext:exit)
  #+ccl (ccl:quit)
  #+allegro (excl:exit))

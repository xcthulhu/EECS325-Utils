; Some of these need to have a CONS for the program name - which ones??
(defun get-args ()
  #+clisp (cons nil ext:*args*)                       
  #+sbcl sb-ext:*posix-argv*                
  #+clozure (ccl::command-line-arguments)     
  #+gcl si:*command-args*
  #+ecl (loop for i from 0 below (si:argc) collect (si:argv i))
  #+cmu extensions:*command-line-strings*
  #+allegro (sys:command-line-arguments)      
  #+lispworks sys:*line-arguments-list* 
)

; http://stackoverflow.com/questions/4425400/is-there-a-command-to-halt-the-interpreter-in-common-lisp
; FIXME: Make more robust
(defun exit-program ()
  #+sbcl (sb-ext:quit)
  #+clisp (ext:exit)
  #+ccl (ccl:quit)
  #+allegro (excl:exit)
)

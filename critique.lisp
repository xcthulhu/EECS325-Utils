(load "babel")
(load "tables")
(load "extend-match")
(load "lisp-critic") 
(load "lisp-rules")
(use-package :lisp-critic)

#| This file generates the "critique" program (using GNU clisp)

Usage: 

$ critique <file1> <file2> ...

For each file, critique scans for common programming mistakes in each function declaration.  If no mistake is found, it prints nothing.  Otherwise it writes the name of the file to standard out, and lists for each problematic function criticisms it found.

If no file is given, *standard-input* is critiqued.

|#

(defun critique-file-string (file)
  "Returns a string containing output of critique-file"
  (let ((critiques-stream (make-string-output-stream)))
       (critique-file file critiques-stream)
       (get-output-stream-string critiques-stream)))

(defun pretty-critique-file (file)
  "Critiques a file, providing a header indicating which file is analyzed,
   and a warning when no such file exists"
  (if (probe-file file) 
      ; then
      (let (
	    (critiques (critique-file-string file))
	    ;(critiques "Blah")
	   )
           ; Note that EQL does not predictably match strings
           ; See http://stackoverflow.com/questions/547436/whats-the-difference-between-eq-eql-equal-and-equalp-in-common-lisp
           (unless (equal "" critiques)
                   (format t "~%*** Critiques for ~a ***~%~a" file critiques)))
      ; else
      (error "critique: ~a: no such file or directory" file)))

(defun main ()
  "Main function, parsing command line arguments"
  (let ((args (cdr (get-args))))
       (unless args (critique-file nil))
       (map nil #'pretty-critique-file args)
       (exit-program)))

#+clisp (saveinitmem "critique" :quiet t :norc t :executable t :init-function 'main)
#+sbcl (sb-ext:save-lisp-and-die "critique" :executable t :toplevel 'main)

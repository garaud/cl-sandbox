;; coding: utf-8

;; Just some basic CL function calls.

(defun shiftf-calling ()
  "Call to 'shiftf' macro."
  (let ((a 12)
        (b 15))
    (format t "before shift a:~a b:~a~%" a b)
    (shiftf a b 10)
    (format t "after shift a:~a b:~a~%" a b)))

(defun rotatef-calling ()
  "Call to 'rotatef' macro which swaps two values."
  (let ((a 12)
        (b 15))
    (format t "before rotate a:~a b:~a~%" a b)
    (rotatef a b)
    (format t "after rotate a:~a b:~a~%" a b)))

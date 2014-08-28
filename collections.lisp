;; coding: utf-8

;; Some func calls test on collections such as list, vector and has-table.

;; * try to sort *names* by a lexicographic order
;; * try apply a function such as capitalize of uppercase on the list *names*
;; * try to concatenate & merge two list of int such as *numbers*
;; * try to make a copy of the original *numbers* and then to sort it (keep both)
;; * do some simple dolist, loop, etc.
;; * make a simple hash-table (name instrument) or (name age) and try to
;;   manupulate it.


(defparameter *names* (list "miles" "herbie" "john")
  "Just names")
(defparameter *numbers* (list 12 -6 42 0 7)
  "Just integer numbers")

;; Use the destructive function 'sort'.
(format t "original ~a~%" *numbers*)
(let ((incrn (copy-list *numbers*))
      (deacrn (copy-list *numbers*)))
  (format t "increasing ~a~%" (sort incrn #'<))
  (format t "deacreasing ~a~%" (sort deacrn #'>)))

;; Lexicographic sort.
(format t "names ~a~%" *names*)
(let ((names (copy-list *names*)))
  (format t "sort by name ~a~%" (sort names 'string-lessp)))

;; (if (not (string-greaterp "zou" "bam"))
;;     (print "yes")
;;     (print "no"))

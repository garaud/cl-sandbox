;; coding: utf-8

;; Some func calls test on collections such as list, vector and has-table.

;; * try to concatenate & merge two list of int such as *numbers*
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

;; Apply uppercase and capitalize string functions.
;; Note: a string is a vector of chars. You need to pass an element-type to the
;; function 'map.
(format t "~a~%" (map 'vector 'string-upcase *names*))
(format t "~a~%" (map 'vector 'string-capitalize *names*))

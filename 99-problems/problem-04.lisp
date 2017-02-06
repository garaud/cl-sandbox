;; 04 find the number of elements of a list

(in-package :lisp-problems)


(defun element-nb (seq)
  "Find the number of elements of a list"
  (let ((result 0))
    (dolist (elt seq)
      (incf result))
    result))

;; (element-nb '(1 2 3))
;; (element-nb '())

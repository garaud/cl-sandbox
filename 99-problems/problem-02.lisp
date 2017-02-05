;; 02 Find the last but one box of a list

(in-package :lisp-problems)


(defun my-last-but (seq)
  "find the last but one element of a list"
  (when (emptyp seq)
    (error "The list is empty"))
  (when (eq (length seq) 1)
    (error "There is just a one element"))
  (first (rest (reverse seq))))

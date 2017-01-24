;; 01 find the last element of a list

(in-package #:lisp-problems)

(defun my-last (seq)
  "last element of a list"
  (first (reverse seq)))


(defparameter seq '(a b c d))


;; recursive one, more efficient
(defun my-last-rec (seq)
  (if (eq (length seq) 1)
      (first seq)
      (my-last-rec (rest seq))))

(my-last seq) ;; D
(my-last-rec seq) ;; D

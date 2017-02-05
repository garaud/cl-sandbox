;; 03 find the k-th element of a list

(in-package :lisp-problems)


(defun element-at (seq k)
  "Find the k-th element of a list"
  (when (< (length seq) k)
    (error "Out of range (k is greater than the length)"))
  (when (< k 0)
    (error "k can not be negative"))
  (if (eq (length seq) k)
      (first seq)
      (element-at (rest seq) k)))


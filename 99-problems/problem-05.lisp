;; 05 reverse a list

(in-package :lisp-problems)


(defun my-reverse (seq)
  "Reverse a list"
  (let ((result ()))
    (dolist (x seq)
      (push x result))
    result))

;; 06 Find out whether a list is a palindrome

(in-package :lisp-problems)


(defun palindrome-p (seq)
  "Is the list a palindrome?"
  (if (emptyp seq)
      nil
      (equal (reverse seq) seq)))

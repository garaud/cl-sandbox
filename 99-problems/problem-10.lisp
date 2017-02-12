;; 10 Run-length encoding of a list.

(in-package :lisp-problems)


(defun encode (seq)
  "run-length encoding of a list"
  (map 'list (lambda (x) (list (length x) (first x))) (pack seq)))

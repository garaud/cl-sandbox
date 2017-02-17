;; 11 Run-length encoding of a list.

(in-package :lisp-problems)


(defun modified-encode (seq)
  "modified run-length encoding of a list"
  (map 'list (lambda (x) (if (equal (length x) 1)
                             (first x)
                             (list (length x) (first x)))) (pack seq)))

;; (modified-encode (list 1 1 2 2 2 3)) ; => ((2 1) (3 2) 3)

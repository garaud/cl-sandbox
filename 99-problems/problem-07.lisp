;; 07 flatten a nested list structure

(in-package :lisp-problems)


(defun my-flatten (seq)
  "flatten a nest list structure"
  (labels ((recur (seq result)
             (cond
               ((null seq) result)
               ((atom seq) (cons seq result))
               (t (recur (first seq) (recur (rest seq) result))))))
    (recur seq nil)))

;; (my-flatten (list '(a b) '(1 2) :z))

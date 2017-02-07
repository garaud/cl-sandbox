;; 07 flatten a nested list structure

(in-package :lisp-problems)


(defun my-flatten (seq)
  "flatten a nested list structure"
  (let ((result ()))
    (dolist (x seq)
      (if (listp x)
          (setq result (append result x))
          (setq result (append result (list x)))))
    result))

;; (my-flatten (list '(a b) '(1 2) :z))

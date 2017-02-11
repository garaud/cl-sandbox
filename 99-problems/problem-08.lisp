;; 08 Eliminate consecutive duplicates of list elements.

(in-package :lisp-problems)


(defun uniq (seq)
  "eliminate consecutive duplicates of list elements"
  (cond
    ((null seq) ())
    ((eq (length seq) 1) seq)
    (t (let ((x (first seq))
             (y (nth 1 seq)))
         (if (eq x y)
             (append (list y) (uniq (rest (rest seq))))
             (append (list x) (uniq (rest seq))))))))

;; (uniq '(a a b c d e f f))

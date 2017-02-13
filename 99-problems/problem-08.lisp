;; 08 Eliminate consecutive duplicates of list elements.

(in-package :lisp-problems)


(defun uniq (seq)
  "eliminate consecutive duplicates of list elements"
  (cond
    ((null seq) ())
    ((eq (length seq) 1) seq)
    (t (let ((x (first seq))
             (y (second seq)))
         (if (equal x y)
             (append (list y) (uniq (rest (rest seq))))
             (append (list x) (uniq (rest seq))))))))

;; try destructuring-bind or destructuring-case
;; (uniq '(a a b c d e f f))

(destructuring-bind (x y &rest z) (list 1 2 3 4 5)
  (list :x x :y y :z z))

(destructuring-bind (x y &rest z) (list 1 2)
  (list :x x :y y :z z))

(destructuring-bind (x &optional y &rest z) (list 1)
  (list :x x :y y :z z))

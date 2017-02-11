;; 09 Pack consecutive duplicates of list elements into sublists.

(in-package :lisp-problems)


(defun pack (seq)
  "pack duplicates elements into sublists"
  (labels ((nested (seq sub result)
             (cond
               ((null seq) (cons sub result))
               ((equal (first sub) (first seq)) (nested (rest seq) (push (first seq) sub) result))
               (t (nested (rest seq) (list (first seq)) (push sub result))))))
    (if (null seq) seq
        (reverse (nested (rest seq) (list (first seq)) ())))))

;; (pack (list 1 1 2 3 3 3))
;; (pack (list 1 1 2 3 3 3 4))

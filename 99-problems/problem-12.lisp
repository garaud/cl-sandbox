;; 12 Decode a run-length encoded list.

(in-package :lisp-problems)


(defun decode (seq)
  "decode a run-length encoding of a list / uncompress it"
  (labels ((factory (pair)
             (destructuring-bind (n var) pair
               (make-list n :initial-element var))))
    (my-flatten (map 'list #'factory seq))))

;; (decode '((1 5) (3 2) (1 3))) ; => (5 2 2 2 3)
;; (decode ())

(in-package :cl-user)
(defpackage test-problems
  (:use :cl
        :lisp-unit
        :lisp-problems))
(in-package :test-problems)

;; To see the failures
(setq *print-failures* t)


;; # 01: last element
(define-test test-01-problem
    (let ((seq '(a b c d e)))
      (assert-equal (my-last seq) 'e)
      (assert-equal (my-last-rec seq) 'e)))

;; # 02: but last box
(define-test test-02-problem
  (let ((seq-a '(a b c d))
        (seq-b '(1 2)))
    (assert-equal (my-last-but seq-a) 'c)
    (assert-equal (my-last-but seq-b) 1)
    (assert-error 'simple-error (my-last-but '()))
    (assert-error 'simple-error (my-last-but '(one)))))


(run-tests :all)

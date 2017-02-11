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
      (assert-equal 'e (my-last seq))
      (assert-equal 'e (my-last-rec seq))))

;; # 02: last but one
(define-test test-02-problem
  (let ((seq-a '(a b c d))
        (seq-b '(1 2)))
    (assert-equal 'c (my-last-but seq-a))
    (assert-equal 1 (my-last-but seq-b))
    (assert-error 'simple-error (my-last-but '()))
    (assert-error 'simple-error (my-last-but '(one)))))

;; # 02: last but one (recursive way)
(define-test test-02-problem-rec
  (let ((seq-a '(a b c d))
        (seq-b '(1 2)))
    (assert-equal 'c (my-last-but-rec seq-a))
    (assert-equal 1 (my-last-but-rec seq-b))
    (assert-error 'simple-error (my-last-but-rec '()))
    (assert-error 'simple-error (my-last-but-rec '(one)))))

;; # 03: find the k-th element of a list
(define-test test-03-element-at
  (let ((seq '(a b c d)))
    (assert-equal 'c (element-at seq 2))
    (assert-error 'simple-error (element-at seq 12))
    (assert-error 'simple-error (element-at seq -1))))

;; # 04: find the number of elements of a list
(define-test test-04-element-nb
  (let ((seq '(a b c d)))
    (assert-equal 4 (element-nb seq))
    (assert-equal 0 (element-nb ()))))

;; # 05: reverse a list
(define-test test-05-reverse-a-list
  (let ((seq '(a b c d))
        (nested '((list :a :b) (list 1 2) (list t nil))))
    (assert-equal '(d c b a) (my-reverse seq))
    (assert-equal '((list t nil) (list 1 2) (list :a :b)) (my-reverse nested))))

;; # 06: find out whether a list is a palindrome
(define-test test-06-is-a-palindrome
  (let ((palindrome '(k a y a k))
        (not-palindrome '(0 1 2 3 4))
        (empty-seq ()))
    (assert-true (palindrome-p palindrome))
    (assert-false (palindrome-p not-palindrome))
    (assert-false (palindrome-p empty-seq))))

;; # 07: flatten a nested list structure
(define-test test-07-flatten-a-list
  (let ((nested (list '(:a :b) 12 '("one" "two") -5))
        (seq '(1 2 "a" t))
        (nested-2 '((a (b) c) (d (e)))))
    (assert-equal '(:a :b 12 "one" "two" -5) (my-flatten nested))
    (assert-equal '(1 2 "a" t) (my-flatten seq))
    (assert-equal '(a b c d e) (my-flatten nested-2))))

;; # 08: eliminate consecutive duplicates of list elements
(define-test test-08-drop-consecutive-duplicated
  (let ((seq-with-duplicates (list 1 2 2 3 4 5 5 2 3))
        (seq-wo-duplicates (list "a" "b" "c" "a" "b" "c"))
        (empty-seq ()))
    (assert-equal '(1 2 3 4 5 2 3) (uniq seq-with-duplicates))
    (assert-equal '("a" "b" "c" "a" "b" "c") (uniq seq-wo-duplicates))
    (assert-equal '() (uniq empty-seq))))

;; # 09: pack consecutive duplicates of list elements into sublists
(define-test test-09-pack-consecutive-duplicated
  (let ((seq-with-duplicates (list 1 2 2 3 4 5 5 2))
        (seq-wo-duplicates (list "a" "b" "c" "a"))
        (empty-seq ()))
    (assert-equal '((1) (2 2) (3) (4) (5 5) (2)) (pack seq-with-duplicates))
    (assert-equal '(("a") ("b") ("c") ("a")) (pack seq-wo-duplicates))
    (assert-equal '() (pack empty-seq))))


(run-tests :all)

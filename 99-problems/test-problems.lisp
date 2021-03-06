(in-package :cl-user)
(defpackage test-problems
  (:use :cl
        :lisp-unit
        :lisp-problems))
(in-package :test-problems)

;; To see the failures
(setq *print-failures* t)
(setq *print-errors* t)


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
        (empty-seq ())
        (nested-2 '((a (b) c) (d (e)))))
    (assert-equal '(:a :b 12 "one" "two" -5) (my-flatten nested))
    (assert-equal '(1 2 "a" t) (my-flatten seq))
    (assert-equal () (my-flatten empty-seq))
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

;; # 10: run-length encoding of a list
(define-test test-10-run-length-encoding
  (let ((seq-a (list 1 2 2 2 4 5 5))
        (seq-b (list "a" "b" "x" "x"))
        (empty-seq ()))
    (assert-equal '((1 1) (3 2) (1 4) (2 5)) (encode seq-a))
    (assert-equal '((1 "a") (1 "b") (2 "x")) (encode seq-b))
    (assert-equal '() (encode empty-seq))))

;; # 11: modified run-length encoding of a list
(define-test test-11-modified-run-length-encoding
  (let ((seq-a (list 1 2 2 2 4 5 5))
        (seq-b (list "a" "b" "x" "x"))
        (empty-seq ()))
    (assert-equal '(1 (3 2) 4 (2 5)) (modified-encode seq-a))
    (assert-equal '("a" "b" (2 "x")) (modified-encode seq-b))
    (assert-equal '() (modified-encode empty-seq))))

;; # 12: decode a run-length encoding list
(define-test test-12-decode-run-length-encoding
  (let ((seq-a '((1 1) (3 2) (1 4) (2 5)))
        (seq-b '((1 "a") (1 "b") (2 "x")))
        (empty-seq ()))
    (assert-equal '(1 2 2 2 4 5 5) (decode seq-a))
    (assert-equal '("a" "b" "x" "x") (decode seq-b))
    (assert-equal '() (decode empty-seq))))

;; # 13: encode-direct a run-length encoding list
(define-test test-13-encode-direct-run-length-encoding
  (let ((seq-a (list 1 2 2 2 4 5 5))
        (seq-b (list "a" "b" "x" "x"))
        (empty-seq ()))
    (assert-equal '(1 (3 2) 4 (2 5)) (encode-direct seq-a))
    (assert-equal '("a" "b" (2 "x")) (encode-direct seq-b))
    (assert-equal '() (encode-direct empty-seq))))

;; # 14: duplicate the elements of a list
(define-test test-14-duplicate-elements-of-a-list
  (let ((seq-a (list 1 2 2 t 5 nil))
        (seq-b (list "a" "b" "x" "x"))
        (empty-seq ()))
    (assert-equal '(1 1 2 2 2 2 t t 5 5 nil nil) (dupli seq-a))
    (assert-equal '("a" "a" "b" "x" "x" "x" "x") (dupli seq-b))
    (assert-equal '() (dupli empty-seq))))

(run-tests :all)

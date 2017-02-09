;;;; package.lisp

(defpackage #:lisp-problems
  (:use #:cl
        #:alexandria)
  (:export :my-last
           :my-last-rec
           :my-last-but
           :my-last-but-rec
           :element-at
           :element-nb
           :my-reverse
           :palindrome-p
           :my-flatten
           :uniq))

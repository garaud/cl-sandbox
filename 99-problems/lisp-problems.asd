;;;; 99-problems.asd

(asdf:defsystem #:lisp-problems
  :description "Ninety-nine Lisp Problems"
  :author "Damien Garaud"
  :license "WTFPL"
  :depends-on (#:lisp-unit
               #:alexandria)
  :serial t
  :components ((:file "package")
               (:file "problem-01")
               (:file "problem-02")
               (:file "problem-03")
               (:file "problem-04")
               (:file "problem-05")
               (:file "problem-06")
               (:file "problem-07")
               (:file "problem-08")
               (:file "problem-09")
               (:file "problem-10")
               (:file "problem-11")))


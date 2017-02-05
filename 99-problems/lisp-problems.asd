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
               (:file "problem-02")))

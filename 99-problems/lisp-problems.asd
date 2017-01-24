;;;; 99-problems.asd

(asdf:defsystem #:lisp-problems
  :description "Ninety-nine Lisp Problems"
  :author "Damien Garaud"
  :license "WTFPL"
  :depends-on (#:lisp-unit)
  :serial t
  :components ((:file "package")
               (:file "lisp-problems")))


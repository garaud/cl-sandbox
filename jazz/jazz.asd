;;;; jazz.asd

(asdf:defsystem #:jazz
  :description "Describe jazz here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:lisp-unit
               #:alexandria)
  :serial t
  :components ((:file "package")
               (:file "jazz")))


(in-package :cl-user)
(defpackage jazz.test
  (:use :cl
        :lisp-unit)
  (:import-from :jazz
                :play))
(in-package :jazz.test)

(define-test play-jazz
    (assert-equal (play) "jazz"))

(define-test wrong-play-jazz
    (assert-equal (play) "blues"))

;; (run-tests '(wrong-play-jazz))
;; To see the failures
(setq *print-failures* t)
(run-tests :all)

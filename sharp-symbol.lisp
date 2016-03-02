
;; Difference between a symbol function and the sharp-quote macro-reader #'
;; http://stackoverflow.com/questions/29320629/how-is-sharp-quote-different-from-symbol-function

;; This deals with a lexical bound function.


(defun foo ()
  'foo)

(flet ((foo () 'bar))
  (list (funcall (symbol-function 'foo))
        (funcall 'foo) ; call the "global" foo function
        (funcall #'foo)
        (funcall (function foo)) ; call the function defined in this scope
        (eq (function foo) (symbol-function 'foo))))
;; => (foo bar bar foo nil)

(eq (function foo) (symbol-function 'foo))
;; => T

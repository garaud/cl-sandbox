
;; Write a function to exponentiate or raise a number to an integer power. For
;; instance (power 3 2) => 9

(defun power (number p)
  "Raise 'number' to the integer power 'p'."
  (setq count p)
  (setq result number)
  (cond (> count 1)
  ((setq result (* result number))
   (setq count (- count 1))))
  (result))

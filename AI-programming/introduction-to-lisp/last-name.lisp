
;; Define a version of 'last-name' that handles "Rex Morgan MD", "Morton Downey,
;; Jr" and whatever (cf. book at chapter one).

;; Last char. I don't want.
(defvar *suffix*
  '(MD Jr.)
  "Suffix that I don't want in a last name.")

;; Last name function.
(defun last-name (name)
  "Get the last name of a full name."
  ;;(setq count 2)
  (if (member (first (last name)) *suffix*)
  (first (last name 2))
  (first (last name))))

(last-name '(Mr John Doe))

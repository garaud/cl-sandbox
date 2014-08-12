;; coding: utf-8

;; Try to learn and understand the car/cdr functions family.

(setq *simple-list* (list 1 2 "tree"))
(setq *sub-list* (list 1 2 (list "ab" "xy" "ql") 4 -7))
(setq *sub-list-B* (list (list "ab" "xy" "ql") -2 3 4 -7))

;; First element.
(car *simple-list*)
(car *sub-list*)

;; All but the first.
(cdr *simple-list*)
(cdr *sub-list*)

;; The 2nd element.
(cadr *simple-list*)
(cadr *sub-list*)

;; All but first of the 1st sublist.
;; NOTE: the car of the list must be a list.
(cdar *sub-list-B*)

(print *sub-list*)
;; The 3rd elemnt of the list.
(caddr *simple-list*)
(caddr *sub-list*)

;; The first elt of the sublist -- in 3rd position
(caaddr *sub-list*)

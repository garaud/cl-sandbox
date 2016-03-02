;; Invoices computation using map, filter and reduce
;; This is not the transduscer version.

(defparameter *invoices* '((:amount 50. :due-to 10 :qty 2)
                           (:amount 35. :due-to 10 :qty 1)
                           (:amount 20. :due-to 9 :qty 2)
                           (:amount 55 :due-to 9 :qty 1)))

(getf (car *invoices*) :amount)

(= 2 2)

(defun compute (invoice)
  "compute the total amount"
  (* (getf invoice :amount) (getf invoice :qty)))

(defun month-filter (invoice month)
  ""
  (= (getf invoice :due-to) month))

(month-filter (car *invoices*) 9)

(defun makef (month)
  "create a month filter for a specific"
  #'(lambda (x) (= (getf x :due-to) month)))

(reduce #'+
        (mapcar 'compute
                (remove-if-not (makef 10) *invoices*)))

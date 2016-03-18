;; Spam filter
;; Follow the chapter 23: Practical Spam Filter
;; from the Practical Common Lisp book by P.Siebel
;; http://www.gigamonkeys.com/book/practical-a-spam-filter.html

(in-package :spam-filter)

(ql:quickload "cl-ppcre")

(defvar *text* "this is just a text from mail. Believe me, I'm not an email spam!")
(defvar *feature-database* (make-hash-table :test #'equal))
(defvar *max-ham-score* 0.4)
(defvar *min-spam-score* 0.6)
(defvar *total-spam* 0)
(defvar *total-ham* 0)

(cl-ppcre:all-matches-as-strings "[a-z]{3,}" *text*)
(delete-duplicates
 (cl-ppcre:all-matches-as-strings "[a-z]{3,}" "some some duplicated words words")
 :test #'string=)


(defclass  word-feature ()
  ((word
    :initarg :word
    :accessor word
    :initform (error "Must supply :word")
    :documentation "the word this feature represents")
   (spam-count
    :initarg :spam-count
    :accessor spam-count
    :initform 0
    :documentation "Spam count")
   (ham-count
    :initarg :ham-count
    :accessor ham-count
    :initform 0
    :documentation "Ham count")))


(defun clear-database ()
  "Clear *feature-database*"
  (setf *feature-database* (make-hash-table :test #'equal)
        *total-spam* 0
        *total-ham* 0))

(clear-database)


(defun intern-feature (word)
  "insert a new word feature into the database from a word"
  (or (gethash word *feature-database*)
      (setf (gethash  word *feature-database*)
            (make-instance 'word-feature :word word))))


(defun extract-words (text)
  "extract words from a text"
  (delete-duplicates
   (cl-ppcre:all-matches-as-strings "[a-zA-Z]{3,}" text)
   :test #'string=))

(extract-words *text*)

(defun extract-features (text)
  "extracts all features from a text"
  (mapcar #'intern-feature (extract-words text)))


(defmethod print-object ((object word-feature) stream)
  "proper print word-feature"
  (print-unreadable-object (object stream :type t)
    (with-slots (word ham-count spam-count) object
      (format stream "~s :hams ~d :spams ~d" word ham-count spam-count))))


(extract-features *text*)


(defun classify (text)
  "classify a text as spam or ham"
  (classification (score (extract-features text))))


(defun classification (score)
  "is it a spam or a ham?"
  (cond
    ((<= score *max-ham-score*) 'ham)
    ((>= score *min-spam-score*) 'spam)
    (t 'unsure)))

(classification .9)


(defun train (text type)
  "train add +1 for ham or spam (type) for each word features in the text"
  (dolist (feature (extract-features text))
    (increment-count feature type))
  (increment-total-count type))


(defun increment-count (feature type)
  "increment ham or spam, i.e. type"
  (ecase type
    (ham (incf (ham-count feature)))
    (spam (incf (spam-count feature)))))


(defun increment-total-count (type)
  "increment the total number of ham/spam"
  (ecase type
    (ham (incf *total-ham*))
    (spam (incf *total-spam*))))


(train *text* 'ham)


(defun spam-probability (feature)
  (with-slots (spam-count ham-count) feature
    (let ((spam-frequency (/ spam-count (max 1 *total-spam*)))
          (ham-frequency (/ ham-count (max 1 *total-ham*))))
      (/ spam-frequency (+ spam-frequency ham-frequency)))))

;; (maphash #'(lambda (k v) (format t "~S: ~S~%" k v)) *feature-database*)

(spam-probability (gethash "mail" *feature-database*))




(defun main (text type)
  ""
  (progn
    (extract-features text)
    (train text type)))

;; coding: utf-8
;; http://www.gigamonkeys.com/book/practical-a-simple-database.html

;; I tried to write a comment above each snippet of code to specificy the
;; related section in the chapter.

(defvar *db-music* ()
  "Global variable to store music.")

;; Filling CDs
(defun make-cd (title artist year ripped)
  "Function to create a CD entry."
  (list :title title
        :artist artist
        :year year
        :ripped ripped))

;; Filling CDs
(defun add-record (album)
  "Add an new CD album to the music database."
  (push album *db-music*))

;; Looking at the DB Content
(defun dump-db ()
  "Print the content of music db in stdout."
  (dolist (record *db-music*)
    (format t "~{~a:~10t~a~%~}~%" record)))

;; Improving the User Interaction
(defun prompt-read (prompt)
  "Ask an enter to the stdin."
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

;; Improving the User Interaction
(defun prompt-cd-maker ()
  "Function for asking four entries to add a new CD to the DB."
  (make-cd (prompt-read "Title")
           (prompt-read "Artist")
           (parse-integer (prompt-read "Year") :junk-allowed t)
           (y-or-n-p "Ripped [y/n]: ")))

;; Improving the User Interaction
(defun prompt-add-cds ()
  "Main prompt to add CDs to the DB."
  (loop (add-record (prompt-cd-maker))
     (if (not (y-or-n-p "Another entry? [y/n]: ")) (return))))


;; Main.
(add-record (make-cd "Love Supreme" "John Coltrane" 1963 t))
(add-record (make-cd "Live With Britten Symph." "Jaga Jazzist" 2013 t))
(print *db-music*)
(dump-db) ;; return nil if evaluates because you print into the stdout.

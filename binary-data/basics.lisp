;; Chapter 24: Parsing Binary Files
;; Some basics

;; little-endian style. From right to left.
(ldb (byte 8 8) #xabcd) ;; 171 aka #xab
(ldb (byte 8 0) #xabcd) ;; 205 aka #xcd

;; #xabcd = (171 * 256) + 205
(+ (* 171 256) 205)  ;; 43981
(eq (+ (* 171 256) 205) #xabcd) ;; -> T

;; read a 16-bit integer
(defun read-u2 (in)
  (let ((u2 0))
    ;; 1er octet lu "à la fin"
    (setf (ldb (byte 8 8) u2) (read-byte in))
    ;; 2e octet à lire "au début"
    (setf (ldb (byte 8 0) u2) (read-byte in))))

;; write a 16-bit integer
;; convention: little-indian. Contrairement au livre qui écrit en "big"
(defun write-u2 (out value)
  (write-byte (ldb (byte 8 0) value) out)
  (write-byte (ldb (byte 8 8) value) out))

;; 384 = 256 + 128, i.e. 2^8 + 2^7
(ldb (byte 8 8) 384) ;; on a bien 1, pour le 1*2^8 = 256
(ldb (byte 8 0) 384) ;; on a 128

;; XXX je n'ai pas réussi à utiliser 'write-byte' ailleurs que dans un buffer de
;; fichier. J'aurais bien aimé écrire dans un buffer de type string stream. Mais le
;; type des string stream ne supporte pas a priori la fonction 'write-byte'.
(defvar *stream* (make-string-output-stream))

;; bon, ça ne semble pas évident d'avoir un 'stream' en-dehors d'un open fichier
;; -  24.2 An illustrative example of user defined streams http://www.lispworks.com/documentation/lw71/LW/html/lw-182.htm
;; - flexi-streams https://edicl.github.io/flexi-streams/ et https://github.com/edicl/flexi-streams
;; - Gray Streams https://www.cliki.net/trivial-gray-streams et
;;   https://github.com/trivial-gray-streams/trivial-gray-streams et
;;   https://lisp-journey.gitlab.io/gray-streams/
;; - https://ccl.clozure.com/manual/chapter10.2.html#Creating-Your-Own-Stream-Classes-with-Gray-Streams
;; - https://stackoverflow.com/questions/41378669/how-to-get-a-stream-from-a-bit-vector-in-common-lisp
;;   avec un exemple de l'extension Gray Streams
;; - spécialement avec sbcl http://www.sbcl.org/manual/index.html#Streams fundamental-binary-output-stream


;; TODO on pourrait au lieu de stocker ça dans une liste, stocker ça dans une chaine
;; donc la représentation des chiffres binaires serait la même que dans "test.bin"
(defclass jazz-binary-output-stream
    (fundamental-binary-output-stream)
  ((store :accessor store :initarg :store :initform "")))

(defmethod stream-element-type ((stream jazz-binary-output-stream))
  '(unsigned-byte 8))

(defmethod stream-write-byte ((stream jazz-binary-output-stream) int)
   (setf (store stream) (concatenate 'string (store stream) (concatenate 'string "#x" (format nil "~x" int)))))


(defparameter *mystream* (make-instance 'jazz-binary-output-stream))

(concatenate 'string (format nil "~x" 128) (format nil "~x" 14))

*mystream*

(write-u2 *mystream* 384) ;; ça fonctionne MAIS on n'a pas la représentation du contenu de *mystream* donc bon...
(ldb (byte 8 8) 384) ;; -> 1
(ldb (byte 8 0) 384) ;; -> 128

(store *mystream*) ;; (128 1)
;; on a bien, de droite à gauche, 1*2^8 + 128 = 256 + 128 = 384

;; (ql:quickload "flexi-streams")

(with-open-file (buf "test.bin"
                     :direction :output
                     :element-type '(unsigned-byte 8))
  (write-u2 buf 384))
;; on peut lire avec Python
;; > buf = open("test.bin", "rb")
;; > int.from_bytes(buf, "little")
;; > a = 384
;; >> a.to_bytes(2, "little") rend  b'\x80\x01', c'est le même que le contenu de "test.bin"
;; lecture de droite à gauche, on a bien 1*2^8 + 8*2^4 = 256 + 128 = 384

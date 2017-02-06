# Ninety-Nine Lisp Problems

From
http://www.ic.unicamp.br/~meidanis/courses/mc336/problemas-lisp/L-99_Ninety-Nine_Lisp_Problems.html

Original one for Prolog:
http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/ or https://sites.google.com/site/prologsite/prolog-problems

with some solutions here https://github.com/bbatsov/cl-99-problems or on this
blog http://akhilsbehl.github.io/blog/categories/99-problems/

You can also find Haskell, Java or Scala solutions : https://github.com/shekhargulati/99-problems/

## Requirements

* quicklisp
* lisp-unit

## Launch & Test

* Link the folder to the QuickLisp local projects directory
  (e.g. `~/quicklisp/local-projects`)
* Open Emacs, run SLIME and do `(ql:quickload 'lisp-problems')`
* Call any function with `(lisp-problems:any-func)`
* Launch tests with a simple `(load "./test-problems.lisp")`

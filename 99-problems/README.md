# Ninety-ine Lisp Problems

From
http://www.ic.unicamp.br/~meidanis/courses/mc336/problemas-lisp/L-99_Ninety-Nine_Lisp_Problems.html

with some solutions here https://github.com/bbatsov/cl-99-problems

## Requirements

* quicklisp
* lisp-unit

## Launch & Test

* Link the folder to the QuickLisp local projects directory
  (e.g. `~/quicklisp/local-projects`)
* Open Emacs, run SLIME and do `(ql:quickload 'lisp-problems')`
* Call any function with `(lisp-problems:any-func)`
* Launch tests with a simple `(load "./test-problems.lisp")`

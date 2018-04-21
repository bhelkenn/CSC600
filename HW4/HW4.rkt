#lang racket

;#1
;a) constant example
123

;b) variable definition
(define x 123)
x

;c) data structures
(set! x (+ 3 3))
(define y (* 2 3))
(define z (* 3 3))
(define lst1 (list x y))
(define lst2 (list y z))
(define lst3 lst2)

;d) equality
(equal? lst1 lst2)
(equal? lst2 lst3)

;e) passing function as argument to another function
(define func
  (lambda (n)
    (* n (+ 5 5))
  )
)
func(x)
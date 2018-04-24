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
(define (fun1 n) (* n 10))
(fun1 x)

;f) returning a function as a result of another function
(define (fun2 n)
  (lambda (z)
    (* n z)
    )
  )
(define fun3 (fun2 5))
(fun3 20)

;g) readable and printable
(set! x (read))
(define inport (open-input-file "functions"))
(set! y (read inport))
x
y

;2)
(define meanvalue
  (lambda lst
    (begin
      (define total 0)
      (for-each (+ total) lst)
      (/ total count)
      )
    )
  )
(define meanvaluesquares
  (lambda lst
    (begin 
      (define total 0)
      (for-each (+ total) (expt lst 2))
      (/ total count)
      )
    )
  )
(define sigma
  (lambda lst
    (sqrt (- (meanvaluesquares lst) (expt (meanvalue lst) 2)))
    )
  )
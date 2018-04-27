#lang racket

;#1
;a) constant example
(display "constant example: ")
123

;b) variable definition
(define x 123)
(display "x: ")
x

;c) data structures
(set! x (+ 3 3))
(define y (* 2 3))
(define z (* 3 3))
(define lst1 (list x y))
(define lst2 (list y z))
(define lst3 lst2)

;d) equality
(display "(equal? lst1 lst2): ")
(equal? lst1 lst2)
(display "(equal? lst2 lst3): ")
(equal? lst2 lst3)

;e) passing function as argument to another function
(define (fun1 n) (* n 10))
(display "(fun1 x): ")
(fun1 x)

;f) returning a function as a result of another function
(define (fun2 n)
  (lambda (z) (* n z))
  )
(define fun3 (fun2 5))
(display "(fun3 20): ")
(fun3 20)

;g) readable and printable
(set! x (read))
(define inport (open-input-file "functions"))
(set! y (read inport))
(display "x: ")
x
(display "y: ")
y

;#2) sigma equation
(define (square x)
  (* x x)
  )
(define sigma
  (lambda lst
    (sqrt
     (-
      (/
       (apply + (map square lst))
       (length lst)
       )
      (*
       (/ (apply + lst) (length lst))
       (/ (apply + lst) (length lst))
       )
      )
     )
    )
  )
(display "(sigma 1 3): ")
(sigma 1 3)
(display "(sigma 1): ")
(sigma 1)
(display "(sigma 1 3 1 3): ")
(sigma 1 3 1 3)
(display "(sigma 1 2 3 2 1): ")
(sigma 1 2 3 2 1)

;#3
;a) recursive line function
(define line
  (lambda (x)
    (if (= x 0)
        (displayln "")
        (begin
          (display "*")
          (line (sub1 x))
          )
        )
    )
  )
(display "line 5: ")
(line 5)
;b) recursive histogram function
(define histogram
  (lambda lst (for-each line lst))
  )
(displayln "histogram '(1 2 3 3 2 1): ")
(histogram 1 2 3 3 2 1)

;#4) max of f(x) on interval [x1, x2]
(define accuracy -6)
(define (fvalue x) (* x x))
(define fmax
  (lambda (x1 x2)
    (cond
      (
       (< (- (fvalue x2) (fvalue x1)) (expt 10 accuracy)) ;logical test
       (/ (+ (fvalue x2) (fvalue x1)) 2) ;return average value
       )
      (
       (> (fvalue x2) (fvalue x1)) ;logical test
       (fmax (+ x1 (/ (- x2 x1) 3)) x2) ;recursive call by moving lower range up
       )
      (
       (< (fvalue x2) (fvalue x1)) ;logical test
       (fmax x1 (- x2 (/ (- x2 x1) 3))) ;recursive call by moving upper range down
       )
      )
    )
  )
(display "fmax(x^2)[0,5]: ")
(round (fmax 0 5))
(display "fmax(x^2)[0,0.5]: ")
(fmax 0 0.5)

;#5) scalar product of two vectors
(define productsum 0)
(define scalar-product
  (lambda (v1 v2)
    (define lst1 (vector->list v1))
    (define lst2 (vector->list v2))
    (cond
      (
       (not (= (length lst1) (length lst2)))
       (displayln "ERROR: Different sizes of vectors!")
       )
      (else (apply + (map * lst1 lst2)))
      )
    )
  )
(display "#(1 2 3) * #(2 3 4): ")
(scalar-product #(1 2 3) #(2 3 4))

;#6
;a) row and col procedures
(define (loadfile filename)
  (define inport (open-input-file filename))
  (define row-count (read inport))
  (define col-count (read inport))
  (define matrix1 (make-vector row-count))
  (do ((index 0 (add1 index)))
    ((>= index row-count) (close-input-port inport) matrix1)
    (let ((row (make-vector col-count)))
      (do ((j 0 (add1 j)))
        ((>= j col-count) (vector-set! matrix1 index row))
        (vector-set! row j (read inport))
        )
      )
    )
  )

(define (display-vector v)
  (do ((index 0 (add1 index)))
    ((>= index (vector-length v)) (displayln ""))
    (begin
     (display (vector-ref v index))
     (display " ")
     )
    )
  )

(define (return-row filename index)
  (define matrix1 (loadfile filename))
  (vector-ref matrix1 index)
  )

(define (row filename index)
  (display-vector (return-row filename (- index 1)))
  )

(define (return-col filename j)
  (define matrix1 (loadfile filename))
  (define row-count (vector-length matrix1))
  (define column (make-vector row-count))
  (do ((index 0 (add1 index)))
    ((>= index row-count) column)
    (vector-set! column index
                 (vector-ref (vector-ref matrix1 index) j)
                 )
    )
  )

(define (col filename j)
  (display-vector (return-col filename (- j 1)))
  )

(display "row #2 from 'matrix1.dat': ")
(row "matrix1.dat" 2)
(display "col #3 from 'matrix2.dat': ")
(col "matrix2.dat" 1)

;b) matrix multiplication
(define (dot-product vector1 vector2)
  (do (
       (index 0 (add1 index))
       (sum 0 (+ sum (* (vector-ref vector1 index)
                        (vector-ref vector2 index))))
       )
    ((>= index (vector-length vector1)) sum)
    )
  )

(define (write-row v outport)
  (do ((index 0 (add1 index)))
    ((>= index (vector-length v)) (displayln "" outport))
    (begin
     (display (vector-ref v index) outport)
     (display " " outport)
     )
    )
  )
(define (mmul file1 file2 file3)
  (define matrix1 (loadfile file1))
  (define matrix2 (loadfile file2))
  (define row-count (vector-length matrix1))
  (define col-count (vector-length matrix2))
  (define outport (open-output-file #:exists 'append file3))
  (display row-count outport)
  (display " " outport)
  (display col-count outport)
  (displayln "" outport)
  (do ((index 0 (add1 index)))
    ((>= index row-count) (close-output-port outport) (display ""))
    (begin
     (let ((row (make-vector col-count)))
       (do ((j 0 (add1 j)))
         ((>= j col-count) (display-vector row) (write-row row outport))
         (vector-set! row j
                      (dot-product (return-row file1 index) (return-col file2 j))
                      )
         )
       )
     )
    )
  )

(displayln "multiplying matrices from 'matrix1.dat' and 'matrix2.dat': ")
(mmul "matrix1.dat" "matrix2.dat" "matrix_results")
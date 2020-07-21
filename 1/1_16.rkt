#lang racket

(define (square n) (* n n))
(define (even? n)
    (= (remainder n 2) 0))

(define (fast-expt n b)
    (define (fast-expt-iter n b a)
        (cond
            ((= n 0) a)
            ((or (not (even? n)) (= a 1)) (fast-expt-iter (- n 1) b (* a b))) ; a is required to be 1???
            (else (fast-expt-iter (/ n 2) b (square a)))))
    (fast-expt-iter n b 1))

(fast-expt 2 5)
; 25!

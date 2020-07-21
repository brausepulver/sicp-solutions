#lang racket

(define (double a) (+ a a))
(define (halve a)
    (define (halve-iter a b) (if (>= (double a) b) a (halve-iter (+ a 1) b)))
    (halve-iter 1 a))

(define (even? a)
    (= (double (halve a)) a))

(define (mul a b)
    (define (mul-iter n b a)
        (cond
            ((= n 0) a)
            ((even? n) (mul-iter (halve n) (double b) a))
            (else (mul-iter (- n 1) b (+ a b)))))
    (mul-iter b a 0))

(mul 3 6)
; 18

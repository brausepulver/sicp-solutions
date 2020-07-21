#lang racket

(define (double a) (+ a a))
(define (halve a)
    (define (halve-iter a b) (if (>= (double a) b) a (halve-iter (+ a 1) b)))
    (halve-iter 1 a))

(define (even? a)
    (= (double (halve a)) a))

(define (mul a b)
    (cond ((= b 0) 0)
          ((even? b) (double (mul a (halve b))))
          (else (+ a (mul a (- b 1))))))

(mul 2 3)
; 6

#lang racket

(define (new-if predicate then-clause else-clause)
    (cond ((predicate) then-clause)
          (else else-clause)))

(define (square x) (* x x))
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
    (average guess (/ x guess)))
(define (average x y)
    (/ (+ x y) 2))
(define (sqrt x)
    (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
; When new-if is used to attempt to compute square roots, then-clause and else-clause will both be eva-
; luated regardless if the predicate is true or not. The interpreter will keep trying to recursively
; evaluate sqrt-iter and the procedure will not terminate.

(sqrt 4)
; user break

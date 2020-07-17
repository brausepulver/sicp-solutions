#lang racket

(define (square x) (* x x))
(define (improve guess x)
    (average guess (/ x guess)))
(define (average x y)
    (/ (+ x y) 2))

(define (good-enough?-old guess x)
    (< (abs (- (square guess) x)) 0.001))
(define (sqrt-iter-old guess x)
    (if (good-enough?-old guess x)
        guess
        (sqrt-iter-old (improve guess x) x)))
(define (sqrt-old x)
    (sqrt-iter-old 1.0 x))

(define (good-enough? guess old-guess)
    (< (/ (abs (- guess old-guess)) guess) 0.001))
(define (sqrt-iter guess old-guess x)
    (if (good-enough? guess old-guess)
        guess
        (sqrt-iter (improve guess x) guess x)))
(define (sqrt x)
    (sqrt-iter 1.0 0.0 x))

(sqrt-old 0.01)
(sqrt 0.01)
; Here you go Mr. Abelson (It's my first week at MIT, how can I know about floating point T_T)

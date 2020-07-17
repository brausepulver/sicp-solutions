#lang racket

(define (square x) (* x x))
(define (average x y)
    (/ (+ x (* 2 y)) 3))
(define (improve guess x)
    (average (/ x (square guess)) guess))
(define (good-enough? guess old-guess)
    (< (/ (abs (- guess old-guess)) guess) 0.001))
(define (cubert-iter guess old-guess x)
    (if (good-enough? guess old-guess)
        guess
        (cubert-iter (improve guess x) guess x)))
(define (cubert x)
    (cubert-iter 1.0 0.0 x))

(sqrt 9)
; 3

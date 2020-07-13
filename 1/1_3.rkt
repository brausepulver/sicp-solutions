#lang racket

(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
(define (largest x y z) (begin (when (> y x) (set! x y)) (when (> z x) (set! x z)) x))
; Are begin, set! and when Racket specific? :fearfuL:

(define (totally-descriptive-procedure-name x y z)
    (largest (sum-of-squares x y) (sum-of-squares x z) (sum-of-squares y z)))

; There are 6 different cases: x and y (x >,<= y), x and z (x >,<= z), and y and z (y >,<= z):
(totally-descriptive-procedure-name 4 3 2)
(totally-descriptive-procedure-name 3 4 2)

(totally-descriptive-procedure-name 4 2 3)
(totally-descriptive-procedure-name 3 2 4)

(totally-descriptive-procedure-name 2 4 3)
(totally-descriptive-procedure-name 2 3 4)
; Should be 3^2 + 4^2 = 25 in each case.

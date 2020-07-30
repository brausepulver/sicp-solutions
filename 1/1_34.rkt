#lang sicp

(define (f g)
    (g 2))

(define (square x) (* x x))
(f square)
; 4
(f (lambda (z) (* z (+ z 1))))
; 6

(f f)
; When evaluating this combination, the interpreter will eventually try to evaluate (2 2), which will
; result in an error, since 2 is not a procedure that can be applied to arguments.

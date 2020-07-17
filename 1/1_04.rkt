#lang racket

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))
; The procedure above determines the operator to use from an if-clause, as operators can be compound 
; expressions. If b is positive, (+ a b) is evaluated, and otherwise (- a b).

(a-plus-abs-b 6 4)
(a-plus-abs-b 6 -4)
; Should be 10 in each case.

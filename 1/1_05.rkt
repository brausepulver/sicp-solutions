#lang racket

(define (p) (p))
(define (test x y)
    (if (= x 0)
        0
        y))
; Applicate-order evaluation first evaluates the subexpressions of the combination. 
; Executing the expression below would cause the interpreter to keep trying to evaluate (p), 
; which is recursively defined by itself. And most likely crash D:

; Normal-order evaluation substitutes operand expressions for parameters until it obtains an express-
; ion involving only primitive operators, and then performs evaluation.
; The expression below should therefore evaluate to 0, as 'if' is a special form and cannot be reduced, 
; and based on the true predicate expression only the consequent will be evaluated.

(test 0 (p))
; user break
; My interpreter uses applicative-order. ;_;

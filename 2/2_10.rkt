#lang sicp

(#%require "2_07.rkt") ; Constructor and selectors for intervals.
(#%require "2_11.rkt") ; mul-interval
(#%provide div-interval)

; Problem: Modify div-interval to check for zero division and to signal an error if it occurs.

(define (div-interval x y)
    (if (= (upper-bound y) (lower-bound y))
        (error "Division by interval that spans zero.")
        (mul-interval x (make-interval (/ 1.0 (lower-bound y))
                                       (/ 1.0 (upper-bound y))))))

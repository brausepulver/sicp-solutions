#lang sicp

(#%require "2_07.rkt") ; Constructor and selectors for intervals.
(#%require "2_11.rkt") ; mul-interval
(#%provide div-interval)

; Problem: Modify div-interval to check for zero division and to signal an error if it occurs.

(define (div-interval x y)
    (define (spans-zero? i) (and (>= (upper-bound i) 0) (<= (lower-bound i) 0)))
    (if (spans-zero? y)
        (error "Division by interval that spans zero.")
        (mul-interval x (make-interval (/ 1.0 (upper-bound y))
                                       (/ 1.0 (lower-bound y))))))

; (div-interval (make-interval 1 2) (make-interval 4 10))
; (0.5 . 0.1)

; (div-interval (make-interval 1 2) (make-interval -4 10))
; Division by interval that spans zero.

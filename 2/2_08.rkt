#lang sicp

(#%require "2_07.rkt") ; Constructor and selectors for intervals.
(#%provide (all-defined))

(define (add-interval x y) ; From the book.
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
    (add-interval x (make-interval (* -1 (upper-bound y)) 
                                   (* -1 (lower-bound y)))))

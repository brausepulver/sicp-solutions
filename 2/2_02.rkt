#lang sicp

(#%provide (all-defined)) ; For exercise 2.3

; Problem: Define a constructor make-segment and selectors start-segment and end-segment that define 
; the representation of segments in terms of points. 
; Specify a constructor make-point and selectors x-point and y-point that define the representation of
; points in terms of pairs of numbers. 
; Define a procedure midpoint-segment that takes a line segment as argument and returns its midpoint.

(define (print-point p) ; Given in the book.
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (make-segment start end)
    (cons start end))
(define (start-segment segment)
    (car segment))
(define (end-segment segment)
    (cdr segment))

(define (make-point x y)
    (cons x y))
(define (x-point point)
    (car point))
(define (y-point point)
    (cdr point))

(define (midpoint-segment segment)
    (define (average x y)
        (/ (+ x y) 2))
    (define (average-point p q)
        (make-point
            (average (x-point p) (x-point q))
            (average (y-point p) (y-point q))))
    (average-point 
        (start-segment segment)
        (end-segment segment)))

; (print-point (midpoint-segment (make-segment (make-point 2 3) 
;                                              (make-point 6 5))))
; (4, 4)

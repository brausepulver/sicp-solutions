#lang sicp

; (#%require "2_02.rkt") ; Use definitions from exercise 2.2

(define (make-segment start end) ; From exercise 2.2
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

; Problem: Implement a representation for rectangles in a plane. In terms of your constructors and se-
; lectors, create procedures that compute the perimeter and the area of a given rectangle.
; Now implement a different representation for rectangles, so that the same perimeter and area proce-
; dures will work using either representation

(define (length-segment segment)
    (define (square x) (* x x))
    (define (subtract-point p q)
        (make-point (- (x-point p) (x-point q))
                    (- (y-point p) (y-point q))))
    (let ((r (subtract-point (end-segment segment) 
                             (start-segment segment))))
        (sqrt (+ (square (x-point r)) (square (y-point r))))))

(define (perimeter rect a-rect b-rect)
    (* 2 (+ (length-segment (a-rect rect))
            (length-segment (b-rect rect)))))
(define (area rect a-rect b-rect)
    (* (length-segment (a-rect rect))
       (length-segment (b-rect rect))))

(define (test-rect rect a-rect b-rect)
    (display (perimeter rect a-rect b-rect))
    (newline)
    (display (area rect a-rect b-rect)))

; --- First Implementation ---

(define (make-rect p q r) ; In terms of 3 points that define 2 segments that *should* be perpendicular.
    (cons (make-segment p q) (make-segment p r)))
(define (a-rect rect)
    (car rect))
(define (b-rect rect)
    (cdr rect))

(test-rect (make-rect (make-point -2 -2)
                      (make-point -2 1)
                      (make-point 2 -2))
           a-rect
           b-rect)

; --- Second Implementation ---

; I've yet to have a good idea for this. x.x

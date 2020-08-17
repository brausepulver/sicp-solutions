#lang sicp

(#%require "2_02.rkt") ; Use definitions from exercise 2.2

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
    (display (a-rect rect))
    (newline)
    (display (b-rect rect))
    (newline)
    (display (perimeter rect a-rect b-rect))
    (newline)
    (display (area rect a-rect b-rect)))

; --- First Implementation ---

(define (make-rect p q r)
    ; p, q and r -- Points that define 2 segments that *should* be perpendicular.
    (cons (make-segment p q) (make-segment p r)))

(define (a-rect rect)
    (car rect))
(define (b-rect rect)
    (cdr rect))

(test-rect (make-rect (make-point -2.0 -2.0)
                      (make-point -2.0 1.0)
                      (make-point 2.0 -2.0))
           a-rect
           b-rect)
; 14.0
; 12.0
(newline)

; --- Second Implementation ---

(define (make-rect-2 p a b angle)
    ; p -- Starting point.
    ; a and b -- Lengths of the long and short sides of the rectangle respectively.
    ; angle -- Angle in radians to rotate the rectangle by.
    (cons (cons p (cons a b)) angle))

(define (rotate-point p angle)
    (make-point (- (* (x-point p) (cos angle))
                   (* (y-point p) (sin angle)))
                (+ (* (x-point p) (sin angle))
                   (* (y-point p) (cos angle)))))
(define (rotate-segment s angle)
    (make-segment (rotate-point (start-segment s) angle)
                  (rotate-point (end-segment s) angle)))
(define (a-rect-2 rect)
    (let ((p (car (car rect)))
          (a (car (cdr (car rect))))
          (angle (cdr rect)))
        (rotate-segment (make-segment p (make-point (+ (x-point p) a) 
                                                    (y-point p)))
                        angle)))
(define (b-rect-2 rect)
    (let ((p (car (car rect)))
          (b (cdr (cdr (car rect))))
          (angle (cdr rect)))
        (rotate-segment (make-segment p (make-point (x-point p) 
                                                    (+ (y-point p) b)))
                        angle)))

(define pi (* 4 (atan 1.0))) ; Scheme does not have an integrated pi constant?
(test-rect (make-rect-2 (make-point -2.0 -2.0)
                        4.0
                        3.0
                        (/ pi 2.0))
           a-rect-2
           b-rect-2)
; 14.0
; 12.0
; Area and perimeter are the same, despite the a and b segments being different, which is the intended
; behaviour.

; My abstraction barriers for this exercise were therefore:

; ---[area and perimeter procedures]---
; Rectangles as two line segments.
; ---------[a-rect and b-rect]---------
; Rectangles as pairs.
; ---------[cons, car and cdr]---------
    

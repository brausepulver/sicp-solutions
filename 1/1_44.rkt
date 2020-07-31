#lang sicp

(define (smooth f)
    (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

; (define f (lambda (x) x))
; Smoothing by moving average does not have an effect on continuous functions, like the one shown above.
; So I do not get why the book says dx to be 'some small number', when really it is the step size of 
; whatever continuous function I use the smooth-procedure on.

; Therefore I define f to be a discrete function with specified values at certain indices, and 0 other-
; wise.
(define (f x)
    (cond ((= x 1) 3)
          ((= x 2) 1)
          ((= x 3) 2)
          (else 0)))

(define dx 1)

((smooth f) 0)
; (0 + 0 + 3) / 3 = 1
((smooth f) 1)
; (0 + 3 + 1) / 3 = 4 / 3
((smooth f) 2)
; (3 + 1 + 2) / 3 = 6 / 3 = 2

(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
    (define (repeated-iter g k)
        (if (= k n) 
            g
            (repeated-iter (compose f g) (inc k))))
    (repeated-iter f 1))

(((repeated smooth 2) f) 1)
; By the results of the 1-fold smoothing above:
; (1 + 4 / 3 + 2) / 3 = (13/3) / 3 = 13 / 9

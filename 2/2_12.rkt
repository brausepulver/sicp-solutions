#lang sicp

(#%require "2_07.rkt") ; Constructor and selectors for intervals.
; (#%require "2_11.rkt") ; print-interval

(#%provide make-center-percent center percent)

; Problem: Define a constructor make-center-percent that takes a center and a percentage tolerance and
; produces an interval.
; Define a selector percent that produces the percentage tolerance for a given interval.

(define (make-center-percent center percent)
    (let ((t (* center (/ percent 100))))
        (make-interval (- center t) (+ center t))))

(define (tolerance interval)
    (let ((width (/ (- (upper-bound interval) (lower-bound interval)) 2)))
        (/ width (+ (lower-bound interval) width))))

(define (center interval) ; For exercise 2.14
    (/ (upper-bound interval) (+ (tolerance interval) 1)))

(define (percent interval)
    (* 100 (tolerance interval)))

; (let ((i (make-center-percent 6.8 10.0)))
;     (print-interval i)     ; (7.4799.., 6.12)
;     (newline)
;     (display (percent i))) ; 9.99..


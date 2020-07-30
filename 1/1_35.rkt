#lang sicp

(define tolerance 0.00001)
(define (fixed-point f guess)
    (let ((next (f guess)))
        (if (< (abs (- next guess)) tolerance) 
            next
            (fixed-point f next))))

(exact->inexact (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))
; 1.618032..., while the real value is φ = 1.618033...

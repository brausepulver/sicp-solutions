#lang sicp

(define tolerance 0.00000000001) ; Lowered for better accuracy of roots.
(define (fixed-point f guess)
    (define (fixed-point-iter guess cnt)
        (let ((next (f guess)))
            (display (exact->inexact guess)) ; Display current guess.
            (newline)
            (cond ((< (abs (- (/ next guess) 1)) tolerance) ; Changed for better accuracy of roots.
                       (display "Number of steps taken: ")  ; Display number of steps taken and return
                       (display cnt)                        ; final guess.
                       (newline)
                       next)
                  (else (fixed-point-iter next (inc cnt))))))
    (fixed-point-iter guess 0))

(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))

(define (average x y) (/ (+ x y) 2))
(define (average-damp f) (lambda (x) (average x (f x))))

(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
    (define (repeated-iter g k)
        (if (= k n) 
            g
            (repeated-iter (compose f g) (inc k))))
    (repeated-iter f 1))

(fixed-point-of-transform
    (lambda (x) (/ 16 (expt x 3)))
    (repeated average-damp 2)
    1.0)
; 16^-4 = 2
; 2.0

(define (root n x)
    (fixed-point-of-transform
        (lambda (x) (/ 256 (expt x 7)))
        (repeated average-damp (floor (/ (log x) (log 2))))
        1.0))

; (fixed-point-of-transform
;     (lambda (x) (/ 256 (expt x 7)))
;     (repeated average-damp 2)
;     1.0)
; Does not converge.

(root 8 256)
; 1.99

(root 17 131072)
; 1.99

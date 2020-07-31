#lang sicp

(define dx 0.00001)
(define (D f)
    (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

(define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((D g) x)))))

(define tolerance 0.00001)
(define (fixed-point f guess)
    (define (fixed-point-iter guess cnt)
        (let ((next (f guess)))
            (cond ((< (abs (- next guess)) tolerance)
                       next)
                  (else (fixed-point-iter next (inc cnt))))))
    (fixed-point-iter guess 0))

(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))

(define (newtons-method g guess)
    (fixed-point-of-transform g newton-transform guess))

(define (cubic a b c)
    (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(newtons-method (cubic 3 3 1) 1) ; Creds to mato. (｡>﹏<｡)
; We're testing (x+1)^3 = x^3 + 3x^2 + 3x + 1, so the root should be -1.
; -0.9999754400944522
; Not bad!


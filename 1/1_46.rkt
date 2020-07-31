#lang sicp

(define (iterative-improve good-enough? improve-guess)
    (define (🐱 guess)
        (if (good-enough? guess)
            guess
            (🐱 (improve-guess guess))))
    🐱)

(define tolerance 0.00001)

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (sqrt x)
    ((iterative-improve
        (lambda (guess) (< (abs (- (square guess) x)) tolerance))
        (lambda (guess) (average guess (/ x guess))))
     x))

(sqrt 9.0)
; 3.0

(define (fixed-point f guess)
    ((iterative-improve
        (lambda (guess) (< (abs (- (f guess) guess)) tolerance))
        (lambda (guess) (f guess)))
     guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
; 1.618037..., while the real value is φ = 1.618033...

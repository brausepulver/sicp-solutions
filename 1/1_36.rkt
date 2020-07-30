#lang sicp

(define tolerance 0.00001)
(define (fixed-point f guess)
    (define (fixed-point-iter guess cnt)
        (let ((next (f guess)))
            (display guess) ; Display current guess.
            (newline)
            (cond ((< (abs (- next guess)) tolerance)
                       (display "Number of steps taken: ") ; Display number of steps taken and return
                       (display cnt)                       ; final guess.
                       (newline)
                       next)
                  (else (fixed-point-iter next (inc cnt))))))
    (fixed-point-iter guess 0))

; Use let to assign result to a local variable and check it.
(let ((x (fixed-point (lambda (x) (/ (log 1000) (log x))) 2)))
    x
    (expt x x))
    ; Almost 1000! Yayy >w<
    ; Number of steps taken: 33.
(newline)

; Same computation, but using average damping.
(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))

(define (average x y) (/ (+ x y) 2))
(define (average-damp f) (lambda (x) (average x (f x))))

(let ((x (fixed-point-of-transform 
             (lambda (x) (/ (log 1000) (log x)))
             average-damp
             2)))
    x
    (expt x x))
    ; Number of steps taken: 8.

; Using average damping, the fixed-point procedure takes about 4 times less steps than without.

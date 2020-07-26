#lang racket

; Procedure from the book.
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

; Primitive procedure for integration from the book; for comparison.
(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b)
       dx))

(define (integral-simpson f a b n)
    (let ((h (/ (- b a) n)))
        (* (/ h 3)
           (sum (lambda (k) 
                    (* (cond ((or (= k 0) (= k n)) 1)
                             ((= (remainder k 2) 0) 2)
                             (else 4))
                       (f (+ a (* k h)))))
                0
                (lambda (k) (+ k 1))
                n))))

(define (cube x) (* x x x))

(integral cube 0 1 0.01)
; 0.24998750000000042
(integral-simpson cube 0 1 100)
; 1/4

(integral cube 0 1 0.001)
; 0.24998750000000042
(integral-simpson cube 0 1 1000)
; 1/4

; Compared to the 'integral' procedure, the results of the 'integral-simpson' procedure are exact.

#lang sicp

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
    (define (repeated-iter g k)
        (if (= k n) 
            g
            (repeated-iter (compose f g) (inc k))))
    (repeated-iter f 1))

(define (square x) (* x x))

((repeated square 2) 5)
; 625

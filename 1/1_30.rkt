#lang racket

; Procedure from the book.
(define (sum-rec term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

; My original iterative implementation for exercise 1.29.
(define (sum-old term a next b)
    (define (iter term a next b subsum)
        (if (> a b)
            subsum
            (iter term (next a) next b (+ subsum (term a)))))
    (iter term a next b 0))

(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))))
    (iter a 0))

(sum (lambda (x) x) 
     1 
     (lambda (x) (+ x 1)) 
     10) ; werks

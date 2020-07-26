#lang racket

(define (filtered-accumulate filter-predicate combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (if (filter-predicate a) (term a) null-value)))))
    (iter a null-value))

; a)

(define (prime? n) ; This is my own implementation, not the one from the book.
    (define (next d) 
        (if (= d 2) 3 (+ d 2)))
    (define (smallest-divisor d n)
        (cond
            ((= (remainder n d) 0) d)
            ((> (* d d) n) n)
            (else (smallest-divisor (next d) n))))
    (= (smallest-divisor 2 n) n))

(filtered-accumulate prime?
                     +
                     0
                     (lambda (k) (* k k))
                     2
                     (lambda (k) (+ k 1))
                     10)

; b)

(define (gcd a b) (if (= b 0) a (gcd b (remainder a b))))
(define n 10)

(filtered-accumulate (lambda (k) (= 1 (gcd k n)))
                     *
                     1
                     (lambda (k) (* k k))
                     2
                     (lambda (k) (+ k 1))
                     10)

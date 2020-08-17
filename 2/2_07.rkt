#lang sicp

(#%provide (all-defined))

(define (make-interval lower-bound upper-bound)
    (cons lower-bound upper-bound))

(define (lower-bound i)
    (car i))
(define (upper-bound i)
    (cdr i))

#lang sicp

; Problem:
; Define a procedure 'reverse' that takes a list as argument and returns a list of the same elements
; in reverse order.

; Solution:
(define (reverse l)
    (define (reverse-iter l1 l2)
        (if (null? l1)
            l2
            (reverse-iter (cdr l1) (cons (car l1) l2))))
    (reverse-iter l (list)))

; Test:
(reverse (list 1 3 5 7 11))
; (11 7 5 3 1)

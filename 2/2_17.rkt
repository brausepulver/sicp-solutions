#lang sicp

; Problem:
; Define a procedure 'last-pair' that returns a list containing only the last element of a given non-
; empty list.

; Solution:
(define (last-pair l)
    (if (null? (cdr l))
        l
        (last-pair (cdr l))))

; Test:
(last-pair (list 1 3 5 7 11))
; (11)

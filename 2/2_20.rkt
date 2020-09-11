#lang sicp

; Problem:
; Define a procedure 'same-parity' that takes one or more integers and returns a list of all the argu-
; ments that have the same even-odd parity as the first argument.

; Solution:
(define (same-parity x . y)
    (define (same-parity-iter l1 l2)
        (cond ((null? l1) l2)
              ((= (remainder x 2) (remainder (car l1) 2)) 
               (same-parity-iter (cdr l1) (cons (car l1) l2)))
              (else (same-parity-iter (cdr l1) l2))))
    (same-parity-iter y (list)))

; Test:
(same-parity 1 2 4 7 8 13)
; (13 7)

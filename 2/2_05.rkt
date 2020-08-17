#lang sicp

; Problem: Represent pairs of nonnegative integers using only numbers and arithmetic operations by re-
;          presenting the pair a and b as the product 2^a 3^b.

(define (cons a b)
    (* (expt 2 a) (expt 3 b)))

(define (divide-out a b cnt)
    (if (= 0 (remainder a b)) (divide-out (/ a b) b (+ 1 cnt)) cnt))
(define (car c)
    (divide-out c 2 0))
(define (cdr c)
    (divide-out c 3 0))

(let ((c (cons 3 2)))
    (display (car c))
    (newline)
    (display (cdr c)))

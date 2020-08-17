#lang sicp

; Problem: Verify that (car (cons x y)) yields x for any objects x and y. Implement cdr.

(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (x y) x)))

; (car (cons x y))
; ((cons x y) (lambda (x y) x))
; ((lambda (m) (m x y)) (lambda (x y) x))
; ((lambda (x y) x) x y)
; (x)

(define (cdr z)
    (z (lambda (x y) y)))

(let ((z (cons "Yo" "~Ho")))
    (display (car z))
    (display (cdr z)))

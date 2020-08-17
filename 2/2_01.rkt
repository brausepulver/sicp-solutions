#lang sicp

; Problem: Define a better version of make-rat that handles both positive and negative arguments. 
; Make-rat should normalize the sign so that if the rational number is positive, both the numerator 
; and denominator are positive, and if the rational number is negative, only the numerator is negative.

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
    (define (switch-sign x) 
        (* x -1))
    (let ((c (abs (gcd n d))))
        (if (< d 0)
            (cons (switch-sign (/ n c)) (switch-sign (/ d c)))
            (cons (/ n c) (/ d c)))))

(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

; Negative rational number with negative numerator and positive denominator:
(print-rat (make-rat -1 2))
; 1/-2
; Is normalized, so that the numerator is positive and the denominator negative.

; Positive rational number with negative numerator and negative denominator:
(print-rat (make-rat -1 -2))
; 1/2
; Is normalized as well, so that both numerator and denominator are positive.

#lang racket

(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                   (A x (- y 1))))))

; (A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8))) ...
; 2^10 = 1024
(A 1 10)
; Yay!

; (A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2))) ...
; 2^(2^(2^(2^1))) = 2^16 = 65356?
(A 2 4)
; Eye am the strongest.

; (A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2) ...
; (A 2 4) = 65356
(A 3 3)
; 65356

(define (f n) (A 0 n))
; 2n
(f 2)
; 2*2 = 4

(define (g n) (A 1 n))
; 2^n
(g 2)
; 2^2 = 4

(define (h n) (A 2 n))
; h(n) = 2^h(n-1), h(1) = 2 (Credit to Mato)
(h 3)
; 2^(2^(2^1)) = 16

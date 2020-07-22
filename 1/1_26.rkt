#lang racket

(define (square n) (* n n))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder 
              (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m))
              m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

; By using an explicit multiplication in expmod, rather than calling square, the procedure evaluates
; itself twice to square the value, instead of evaluating itself once and then squaring that value.

; Because of that, at each stage of the process that the exponent is divided by 2 on, which originally
; gave the process Theta(log n) in steps, the number of steps required is again multiplied by 2 by the
; procedure evaluating itself twice. This cancels the division by 2 and hence gives the process the same
; order of growth in steps that a direct translation of the recursive definition of exponentiation in-
; to a procedure would have, Theta(n).

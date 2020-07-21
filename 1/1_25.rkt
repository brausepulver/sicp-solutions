#lang racket

(define (square n) (* n n))
(define (even? n) (= (remainder n 2) 0))

(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (expmod-alt base exp m)
    (remainder (fast-expt base exp) m))

(expmod 13 7 7)
(expmod-alt 13 7 7)
; Both 6.

; Given that, for an exponent e that is even, expmod computes (b^(e/2) mod m)^2 mod m, and expmod-alt
; computes (b^(e/2))^2 mod m, it follows that (b^(e/2) mod m)^2 cong. (b^(e/2))^2 (mod m).
; By the properties of modular arithmetic, (b^(e/2) mod m) cong. (b^(e/2)) (mod m).
; But since (b^(e/2) mod m) mod m = b^(e/2) mod m, the two procedures compute the same result.

; Although they compute the same result, they do not serve equally well. While in expmod the numbers
; used throughout the computation do not get much larger than m, in expmod-alt b^e is directly compu-
; ted, which is potentially much larger than m.

; This direct computation in expmod-alt could potentially worsen its order of growth in number of steps
; and therefore make it less suitable to use for testing large prime numbers.

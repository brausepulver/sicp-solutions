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

; For an exponent e that is even, expmod computes (b^(e/2) mod m)^2 mod m. Let c be an integer such
; that (b^(e/2) mod m)^2 cong. c^2 (mod m). Then, by the properties of modular arithmetic,
; (b^(e/2) mod m) cong. c (mod m). But since (b^(e/2) mod m) mod m = b^(e/2) mod m, b^(e/2) cong. c (mod m).

; On the other hand, expmod-alt computes (b^(e/2))^2 mod m. Let d be an integer such that
; (b^(e/2))^2 cong. d^2 (mod m). Then, b^(e/2) cong. d (mod m), so that c cong. d (mod m). But then,
; c^2 cong. d^2 (mod m) so that (b^(e/2) mod m)^2 mod m = (b^(e/2))^2 mod m. Therefore the procedures
; compute the same result.

; Although they compute the same result, they do not serve equally well. While in expmod the numbers
; used throughout the computation do not get much larger than m, in expmod-alt b^e is directly compu-
; ted, which is potentially much larger than m.

; This direct computation in expmod-alt could potentially worsen its order of growth in number of steps
; and therefore make it less suitable to use for testing large prime numbers.

#lang racket

(define (square n) (* n n))
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

; Do not use fast-prime? here, otherwise Carmichael numbers would come out as prime, since fast-prime?
; is based on the Fermat test.
(define (prime? n) ; This is my own implementation, not the one from the book.
    (define (next d) 
        (if (= d 2) 3 (+ d 2)))
    (define (smallest-divisor d n)
        (cond
            ((= (remainder n d) 0) d)
            ((> (* d d) n) n)
            (else (smallest-divisor (next d) n))))
    (= (smallest-divisor 2 n) n))

(define (is-carmichael? n)
    (define (test a n)
        (if (= (remainder a n) (expmod a n n))
            (if (< a (- n 1)) ; Check if there are numbers a < n left to test.
                (test (+ a 1) n)
                true) ; If there are no numbers left, and test holds for all a < n, n is Carmichael.
            false))   ; If test does not hold, then n is not be Carmichael.
    (and (not (prime? n)) (test 2 n)))

; The first 6 Carmichael numbers are: 561, 1105, 1729, 2465, 2821, and 6601. (Footnote 47 in The Book)
(is-carmichael? 561) ; #t
(is-carmichael? 1105) ; #t
(is-carmichael? 1729) ; #t
(is-carmichael? 2465) ; #t
(is-carmichael? 2821) ; #t
(is-carmichael? 6601) ; #t
(newline)

; Now for some numbers that are prime but not Carmichael:
(is-carmichael? 563) ; #f
(is-carmichael? 1447) ; #f
(is-carmichael? 4051) ; #f
(is-carmichael? 5683) ; #f
(is-carmichael? 6089) ; #f
(is-carmichael? 7537) ; #f
(newline)

; And now some numbers that are not prime and not Carmichael:
; (I just increased all the previous primes by 1 :)
(is-carmichael? 564) ; #f
(is-carmichael? 1448) ; #f
(is-carmichael? 4052) ; #f
(is-carmichael? 5684) ; #f
(is-carmichael? 6090) ; #f
(is-carmichael? 7538) ; #f

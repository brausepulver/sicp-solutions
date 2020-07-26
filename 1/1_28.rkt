#lang racket

; Let n be a prime number and a < n a positive integer.
; By Fermat's Little Theorem, a^n cong. a (mod n). Then, by the properties of modular arithmetic,
; a^(n-1) cong. a^0 = 1 (mod n). This is the form of the theorem the Miller-Rabin test starts from.

(define (square n) (* n n))
(define (expmod-mod base exp m)
    (define (squaremod a n)           ; Additional procedure to not have to compute expmod twice.
        (if (and (not (or (= a 1)     ; Since the interpreter uses applicative-order evaluation, it is
                      (= a (- n 1)))) ; only evaluated once, on the call to squaremod.
                 (= (remainder (square a) n) 1))
            0                         ; a is a nontrivial square root of 1 modulo n.
            (remainder (square a) n)))
    (cond ((= exp 0) 1)
          ((even? exp) (squaremod (expmod-mod base (/ exp 2) m) m))
          (else (remainder (* base (expmod-mod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
    (define (try-it a)
        (not (= (expmod-mod a (- n 1) n) 0))) ; Nontrivial square root of 1 modulo n was found by squaremod.
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((miller-rabin-test n) (fast-prime? n (- times 1)))
          (else false)))

; Using the numbers from exercise 1.27, with a supposed confidence that a composite number will be de-
; clared probably prime with a probability of at most 1/4^1000.
(define conf 1000)
; The results do not really bear this out though, and non-primes come out true way more often than
; they should at higher probabilities of error than 1/4^1000.

; Carmichael numbers: (Would fool the Fermat test)
(fast-prime? 561 conf) ; #f
(fast-prime? 1105 conf) ; #f
(fast-prime? 1729 conf) ; #f
(fast-prime? 2465 conf) ; #f
(fast-prime? 2821 conf) ; #f
(fast-prime? 6601 conf) ; #f
(newline)

; Prime numbers that are not Carmichael:
(fast-prime? 563 conf) ; #t
(fast-prime? 1447 conf) ; #t
(fast-prime? 4051 conf) ; #t
(fast-prime? 5683 conf) ; #t
(fast-prime? 6089 conf) ; #t
(fast-prime? 7537 conf) ; #t
(newline)

; Numbers that are not prime and odd:
(fast-prime? 561 conf) ; #f
(fast-prime? 1445 conf) ; #f
(fast-prime? 4053 conf) ; #f
(fast-prime? 5685 conf) ; #f
(fast-prime? 6093 conf) ; #f
(fast-prime? 7539 conf) ; #f
(newline)

; Numbers that are not prime and even:
; The confidence of these might be different, since they are even, and the confidence given only holds
; for odd numbers.
(fast-prime? 564 conf) ; #f
(fast-prime? 1448 conf) ; #f
(fast-prime? 4052 conf) ; #f
(fast-prime? 5684 conf) ; #f
(fast-prime? 6090 conf) ; #f
(fast-prime? 7538 conf) ; #t This number always fools the test somehow? Lol

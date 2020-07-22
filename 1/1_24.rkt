#lang racket

(define fast-prime-times 1000) ; Constant for how many times fast-prime? should check an integer.

(define (square n) (* n n))
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)       ; The argument to (random <n>) is limited in value to 2^64. The numbers
    (define (try-it a)        ; I am checking are bigger, so get an inexact floating point value in-
        (= (expmod a n n) a)) ; stead and multiply that with the number.
    (try-it (floor (inexact->exact (* (random) n)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (current-milliseconds))) ; Racket has no runtime procedure, 
(define (start-prime-test n start-time)          ; only current-milliseconds.
    (when (fast-prime? n fast-prime-times)       ; Use fast-prime? (Fermat test) instead of prime?.
          (report-prime (- (current-milliseconds) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

; Using the primes found in exercise 1.22:
(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)
; 22 ms, on average. 15 ms without 3.

(timed-prime-test 10000000000037)
(timed-prime-test 10000000000051)
(timed-prime-test 10000000000099)
; 36 ms, on average. 21 ms without 3.

(timed-prime-test 10000000000000061)
(timed-prime-test 10000000000000069)
(timed-prime-test 10000000000000079)
; 27 ms, on average.

(timed-prime-test 100000000000000003)
(timed-prime-test 100000000000000013)
(timed-prime-test 100000000000000019)
; 27 ms, on average.

; Since the order of growth of the fast-prime? procedure is Theta(log(n)), and each of the starting
; integers in the second and third set of primes is about 1000 times the one before, the runtime of 
; the process for testing each of these prime should increase by a constant amount over the ones in 
; the set before.

; Without looking at the outliers, the data somewhat bears out the increase by a constant amount:
; 21 ms - 15 ms = 6 ms, 27 ms - 21 ms = 6 ms, although this could just be statistical noise.
; Looking at the outliers, the discrepancy might come about from the time taken to compute a random 
; number that fits the purpose, although this is unlikely, or due to the structure of certain numbers
; such as 10000000061, and its role in multiplication of that number with another large integer.

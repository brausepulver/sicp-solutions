#lang racket

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (current-milliseconds))) ; Racket has no runtime procedure, 
(define (start-prime-test n start-time)          ; only current-milliseconds.
    (when (prime? n)
          (report-prime (- (current-milliseconds) start-time))))
(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (prime? n) ; This is my own implementation, not the one from the book.
    (define (next d) 
        (if (= d 2) 3 (+ d 2)))
    (define (smallest-divisor d n)
        (cond
            ((= (remainder n d) 0) d)
            ((> (* d d) n) n)
            (else (smallest-divisor (next d) n))))
    (= (smallest-divisor 2 n) n))

; Using the primes found in exercise 1.22:
(timed-prime-test 10000000019)
(timed-prime-test 10000000033)
(timed-prime-test 10000000061)
; 1 ms on exercise 1.22 vs 1 ms now.

(timed-prime-test 10000000000037)
(timed-prime-test 10000000000051)
(timed-prime-test 10000000000099)
; 46 ms vs. 23 ms, on average.

(timed-prime-test 10000000000000061)
(timed-prime-test 10000000000000069)
(timed-prime-test 10000000000000079)
; 1380 ms vs. 719 ms, on average.

(timed-prime-test 100000000000000003)
(timed-prime-test 100000000000000013)
(timed-prime-test 100000000000000019)
; 4489 ms vs. 2271 ms, on average.

; The ratios of the speeds of the two algorithms are therefore (excluding the first 3 primes):
; 46 ms / 23 ms = 2, 1380 ms / 719 ms = 1.92 and 4489 ms / 2271 ms = 1.98.

; The results are sufficiently close to 2, and therefore the expectation that the new algorithm runs
; about twice as fast is confirmed. The reason for this is the 'next' procedure used by 
; 'smallest-divisor', which effectively halves the number of test steps the 'smallest-divisor' proce-
; dure needs to perform.

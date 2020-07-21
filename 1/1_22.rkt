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
    (define (smallest-divisor d n)
        (cond
            ((= (remainder n d) 0) d)
            ((> (* d d) n) n)
            (else (smallest-divisor (+ d 1) n))))
    (= (smallest-divisor 2 n) n))

(define (search-for-primes n cnt)
    (when (> cnt 0)
          (begin 
              (timed-prime-test n)
              (search-for-primes (+ n 2) (if (prime? n) (- cnt 1) cnt))))) ; Skip even integers.

; I had to ramp this part up a bit.. u.u
(search-for-primes 10000000001 3) ; 9 zeros
; 1 ms needed to test each prime.

(search-for-primes 10000000000001 3) ; 12 zeros
; 46 ms needed to test each prime.

(search-for-primes 10000000000000001 3) ; 15 zeros
; 1380 ms needed to test each prime, on average.

; Since the order of growth of the prime? procedure is Theta(sqrt(n)), and each of the starting inte-
; gers is about 1000 times the one before, the runtime of the process for testing each prime should be
; sqrt(1000) = ca. 31.62 times the one before. 

; 46 ms / 1 ms = 46. 1380 ms / 46 ms = 30. Since the runtimes are only approximate, the ratios are
; close enough to 31.62. The result is compatible with the notion that programs on the machine run in 
; time proportional to the number of steps required for the computation.

; This could be verified with another test with an even larger starting integer, but my machine is too
; slow to run the test with a starting integer 1000 times the last, in reasonable time. :x

; However we can test again using a starting integer 10 times, instead of 1000 times the previous:
(search-for-primes 100000000000000001 3) ; 16 zeros
; 4488.66 (based) ms needed to test each prime, on average.

; The runtime would therefore have to be sqrt(10) = ca. 3.16 times the previous, which the result does
; bear out: 4488 ms / 1380 ms = 3.25.

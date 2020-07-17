#lang racket

(define (test f n)
    (when (>= n 0)
        (begin
            (display (f n))
            (when (> n 0) (newline))
            (test f (- n 1)))))
(define test-size 8)

; Compute f by means of a recursive process:
(define (f-rec n) ; I called this f-rec because it's not possible to re-define f later.
    (if (< n 3) 
        n 
        (+ (f-rec (- n 1))
           (* 2 (f-rec (- n 2)))
           (* 3 (f-rec (- n 3))))))

(test f-rec test-size)

(newline)
(display "---すごい---")
(newline)

(define (fib n)
    (define (fib-iter a b cnt)
        (if (= cnt 0)
            b
            (fib-iter (+ a b) a (- cnt 1))))
    (fib-iter 1 0 n))

; Compute f by means of an iterative process:
; ^.^ I took inspiration from the fib procedure above.
(define (f n)
    (define (f-iter a b c cnt)
        (if (= cnt 0) 
            a
            (f-iter (+ a (* 2 b) (* 3 c)) a b (- cnt 1))))
    (cond ((> n 1) (f-iter 2 1 0 (- n 2)))
          ((= n 1) 1)
          (else 0)))

(test f test-size)

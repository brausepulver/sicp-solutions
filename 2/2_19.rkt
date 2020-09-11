#lang sicp

; Problem:
; Define the procedures 'first-denomination', 'except-first-denomination' and 'no-more?' used in the
; implementation of 'cc' in the book in terms of primitive list operations.
; Why or why not does the order of the list 'coin-values' affect the answer produced by 'cc'?

; Solution:
(define (first-denomination coin-values)
    (car coin-values))
(define (except-first-denomination coin-values)
    (cdr coin-values))
(define (no-more? coin-values)
    (null? coin-values))
; The tree generated by 'cc' will have the same number of nodes regardless of how 'coin-values' is or-
; dered. Therefore the order of 'coin-values' does not affect the answer produced by 'cc'.

; Test:
(define (cc amount coin-values)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (no-more? coin-values)) 0)
          (else (+ (cc amount (except-first-denomination coin-values))
                   (cc (- amount (first-denomination coin-values)) coin-values)))))
(define us-coins (list 50 25 10 5 1))

(cc 100 us-coins)
; 292
(cc 100 (reverse us-coins))
; 292
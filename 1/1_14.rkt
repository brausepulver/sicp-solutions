#lang racket

(define (count-change amount)
    (cc amount 5))
(define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; The number of steps required by a tree-recursive process is proportional to the number of nodes in 
; the tree. The number of nodes is a nested sum in terms of n across 4 indices.
; Therefore R(n) = Theta(n^5).

; The space required by a tree-recursive process is proportional to the maximum depth of the tree. 
; The maximum depth is n+4. Therefore R(n) = Theta(n).

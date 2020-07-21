#lang racket

; 10
; 10

(+ 5 4 3)
; 12

(- 9 1)
; 8

(/ 6 2)
; 3

(+ (* 2 4) (- 4 6))
; 6

(define a 3)
; a | This printed nothing. :p Racket specific?

(define b (+ a 1))
; b | Also nothing.

(+ a b (* a b))
; 19

(= a b)
; false | #f

(if (and (> b a) (< b (* a b)))
    b
    a)
; 4

(cond 
    ((= a 4) 6)
    ((= b 4) (+ 6 7 a))
    (else 25))
; 16

(+ 2 (if (> b a) b a))
; 6

(* (cond 
    ((> a b) a)
    ((< a b) b)
    (else -1)))
; 4

; I got everything right (almost) *yay*
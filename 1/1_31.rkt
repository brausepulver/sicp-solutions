#lang racket

(define n 1000)

; a)

(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

; Otherwise Racket gives an extremely long but accurate fraction. :roll
(exact->inexact (* 4 
                (product-iter (lambda (k) 
                                  (/ (* 2 (floor (/ (+ k 3) 2)))
                                     (+ 3 (* 2 (floor (/ k 2))))))
                              0
                              (lambda (k) (+ k 1))
                              n)))

; b)

(define (product-rec term a next b)
    (if (> a b)
        1
        (* (term a) (product-rec term (next a) next b))))

(exact->inexact (* 4 
                (product-rec (lambda (k) 
                                 (/ (* 2 (floor (/ (+ k 3) 2)))
                                    (+ 3 (* 2 (floor (/ k 2))))))
                             0
                             (lambda (k) (+ k 1))
                             n)))

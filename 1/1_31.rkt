#lang racket

(define n 1000)

; a)

(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(* 4.0
   (product-iter (lambda (k) 
                     (/ (* 2 (floor (/ (+ k 3) 2)))
                        (+ 3 (* 2 (floor (/ k 2))))))
                 0
                 inc)
                 n))

; b)

(define (product-rec term a next b)
    (if (> a b)
        1
        (* (term a) (product-rec term (next a) next b))))

(* 4.0
   (product-rec (lambda (k) 
                     (/ (* 2 (floor (/ (+ k 3) 2)))
                        (+ 3 (* 2 (floor (/ k 2))))))
                 0
                 inc)
                 n))

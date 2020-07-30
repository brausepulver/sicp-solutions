#lang sicp

; Ask Mato about cont-frac and accumulate here.
(define (tan-cf x k)
    (let ((n (lambda (i) (if (= 1 i) x (* x x))))
          (d (lambda (i) (+ 1 (* 2 (dec i))))))
        (define (tan-cf-iter i result)
            (if (= i 0)
                result
                (tan-cf-iter (dec i) (/ (n i) (- (d i) result)))))
        (tan-cf-iter (dec k) (/ (n k) (d k)))))

; Procedure to compute pi in order to test tan-cf procedure; from exercise 1.31.
; I wish there was a pi constant. >_<
(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(let ((pi (* 4 (product-iter (lambda (k) 
                                 (/ (* 2 (floor (/ (+ k 3) 2)))
                                    (+ 3 (* 2 (floor (/ k 2))))))
                             0
                             (lambda (k) (+ k 1))
                             10000))))
    (tan-cf (/ pi 4.0) 10000))
    ; This should be 1.0, right?
    ; 0.9999214887830408
    ; Close! x)

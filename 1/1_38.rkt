#lang sicp

(define (cont-frac n d k)
    (define (cont-frac-iter i result)
        (if (= i 0)
            result
            (cont-frac-iter (dec i) (/ (n i) (+ (d i) result)))))
    (cont-frac-iter (dec k) (/ (n k) (d k))))

(+ 2.0 
   (cont-frac (lambda (i) 1)
              (lambda (i) (if (= 0 (remainder (inc i) 3)) (* 2 (floor (/ (inc i) 3))) 1))
              12))
; 2.7182818229439496
(exp 1)
; 2.718281828459045
; Pretty good!!

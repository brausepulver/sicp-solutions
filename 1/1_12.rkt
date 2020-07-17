#lang racket

(define (pascal n k)
    (if (or (= k 0) (= k n) (= n 0))
        1
        (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k))))

(pascal 4 2)
; 6

(define (print-pascal n)
    (define (print-pascal-iter n k cnt)
        (when (<= cnt n) 
            (if (> k cnt)
                (begin
                    (when (< cnt n) (newline))
                    (print-pascal-iter n 0 (+ cnt 1)))
                (begin
                    (display (pascal cnt k))
                    (when (< k cnt) (display " "))
                    (print-pascal-iter n (+ k 1) cnt)))))
    (print-pascal-iter (- n 1) 0 0))

(print-pascal 5)
; No indentation on the left side of the triangle because that seems hard.

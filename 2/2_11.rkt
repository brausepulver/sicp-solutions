#lang sicp

(#%require "2_07.rkt") ; Constructor and selectors for intervals.
(#%provide mul-interval print-interval)

; Problem: Rewrite mul-interval to test the signs of the endpoints and break it into 9 cases, only one
; of which requires more than 2 multiplications.

; 1 + + + +
; 2 + + + -
; 3 + + - -
; 4 + - + +
; 5 + - + - Special case.
; 6 + - - -
; 7 - - + +
; 8 - - + -
; 9 - - - -

(define (accumulate op initial sequence) ; From the book.
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (mul-interval x y)
    (let ((n (accumulate (lambda (x y) (+ (* 2 x) y))
                         0
                         (list (upper-bound x) (lower-bound x) (upper-bound y) (lower-bound y))))
          (ac (* (upper-bound x) (upper-bound y)))
          (bd (* (lower-bound x) (lower-bound y))))
        (cond ((> n 10) (make-interval bd ac)) ; Treat the positive/negative signs as 1/0 in a binary
              ((= n 10) (if (> ac bd)          ; number.
                            (make-interval bd ac) 
                            (make-interval ac bd)))
              (else (make-interval ac bd)))))

(define (print-interval x)
    (display "(")
    (display (upper-bound x))
    (display ", ")
    (display (lower-bound x))
    (display ")"))

; (print-interval (mul-interval (make-interval 5 1) (make-interval 3 1))) 
; (newline) ; (15, 1)
; (print-interval (mul-interval (make-interval 5 -1) (make-interval -3 -1)))
; (1, -15)

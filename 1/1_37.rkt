#lang sicp

(define (test-golden-ratio f)
    (let ((n (lambda (i) 1.0))
          (d (lambda (i) 1.0)))
        (display (/ 1 (f n d 10)))
        (newline)
        (display (/ 1 (f n d 12)))
        (newline)
        (display (/ 1 (f n d 100)))
        (newline)))

; a)

; Recursive implementation.
(define (cont-frac-rec n d k)
    (define (🐱 i) ; What do you call this..?
        (if (> i k)
            0
            (/ (n i) (+ (d i) (🐱 (inc i))))))
    (🐱 1))

(test-golden-ratio cont-frac-rec)
(newline)
; 1.6181818181818184
; 1.6180555555555558
; 1.618033988749895
; The actual value is φ = 1.618033...

; To get an approximation that is accurate to 4 decimal places, k >= 12.

; b)

; Recursive implementation.
(define (cont-frac-iter n d k)
    (define (🐱 i result)
        (if (= i 0)
            result
            (🐱 (dec i) (/ (n i) (+ (d i) result)))))
    (🐱 (dec k) (/ (n k) (d k))))

(test-golden-ratio cont-frac-iter)
; 1.6181818181818184
; 1.6180555555555558
; 1.618033988749895

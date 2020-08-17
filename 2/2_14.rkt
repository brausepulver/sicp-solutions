#lang sicp

(#%require "2_07.rkt") ; Constructor and selectors for intervals.
(#%require "2_08.rkt") ; add-interval
(#%require "2_12.rkt") ; Constructors and selectors for center and percentage tolerance intervals.

; From the book:
(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
          (p2 (* (lower-bound x) (upper-bound y)))
          (p3 (* (upper-bound x) (lower-bound y)))
          (p4 (* (upper-bound x) (upper-bound y))))
        (make-interval (min p1 p2 p3 p4)
                       (max p1 p2 p3 p4))))
(define (div-interval x y)
    (mul-interval x 
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y)))))

(define (par1 r1 r2)
    (div-interval (mul-interval r1 r2)
                  (add-interval r1 r2)))
(define (par2 r1 r2)
    (let ((one (make-interval 1 1))) 
        (div-interval one
                      (add-interval (div-interval one r1)
                                    (div-interval one r2)))))

(define (print-interval-center-percent x)
    (display "(")
    (display (center x))
    (display ", ")
    (display (percent x))
    (display ")"))

(let ((i (make-center-percent 6.8 10.0))
      (j (make-center-percent 4.7 5.0)))
    (print-interval-center-percent (par1 i j))
    ; (2.844199964577264, 22.613352145193346)
    (newline)
    (print-interval-center-percent (par2 i j)))
    ; (2.777440701636504, 7.05260392723452)
    ; These two expressions are algebraically equivalent but yield different results.
(newline)
(newline)

; Behaviour of tolerance under division:
; c(1/I) = [u(1/I) + l(1/I)] / 2
;        = [1/l(I) + 1/u(I)] / 2
;        = [u(I) + l(I)] / 2 u(I) l(I)
;        = c(I) / u(I) l(I)
; w(1/I) = u(1/I) - c(1/I)
;        = 1/l(I) - c(I) / u(I) l(I)
;        = [u(I) l(I) - l(i) c(I)] / u(I) l(I)^2
;        = w(I) / u(I) l(I)
; t(1/I) = w(1/I) / c(1/I)
;        = [w(I) / u(I) l(I)] / [c(I) / u(I) l(I)]
;        = w(I) / c(I) = t(I)
; t(I / J) = t(I * 1/J) 
;          = t(I) t(1/J) + t(I) + t(1/J)
;          = t(I) t(J) + t(I) + t(J) = t(I * J)
; Tolerance therefore behaves the same under division as it does under multiplication.

; I do not know the behaviour of tolerance under addition (or subtraction), so I will investigate a sys-
; tem involving only multiplication and division for which I have investigated the behaviours of tole-
; rance.

(let ((a (make-center-percent 6.8 10.0))
      (b (make-center-percent 4.7 5.0))
      (one (make-interval 1 1)))
    (print-interval-center-percent (div-interval a a))
    (newline)
    (print-interval-center-percent (div-interval a b))
    (newline)
    (print-interval-center-percent (div-interval (mul-interval a a) a)))
    ; (7.074747474747475, 29.22330097087378)
    ; The above expression (a * a) / a should be equal to a, but obviously it is not.

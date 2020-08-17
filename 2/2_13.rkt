#lang sicp

(#%require "2_11.rkt") ; mul-interval
(#%require "2_12.rkt") ; Constructors and selectors for center and percentage tolerance intervals.

; Problem: Show that under the assumption of small percentage tolerances there is a simple formula for
; the approximate percentage tolerance of the product of two intervals in terms of the tolerances of 
; the factors. Assume for simplification that all numbers are positive.

; Assuming t(I) is the tolerance of I, w(I) the width of I, c(I) the center of I and u(I) the upper-
; bound of I.

; t(I) = w(I) / c(I)
;      = [u(I) - c(I)] / c(I)
;      = u(I) / c(I) - 1

; t(I * J) = w(IJ) / c(IJ)
;          = u(IJ) / c(IJ) - 1
;          = u(I) u(J) / [c(I) c(J)] - 1 for I, J > 0.
;          = u(I) / c(I) * u(J) / c(J) - 1
;          = [t(I) + 1] * [t(J) + 1] - 1
;          = t(I) t(J) + t(I) + t(J) + 1 - 1
;          ≈ t(I) + t(J), since t(I) t(J) << t(I) + t(J) for t(I), t(J) < 1.

(let ((i (make-center-percent 6.8 10.0))
      (j (make-center-percent 4.7 5.0)))
    (display (percent (mul-interval i j))) ; Actual computed tolerance.
    (newline)
    (display (+ (percent i) (percent j)))) ; Tolerance by formula that was derived above.
    ; 14.92.. compared to 15.00, so < 0.5% off. Not terrible. :')

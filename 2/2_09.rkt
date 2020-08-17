#lang sicp

; Problem: Show that the width of the sum (or difference) of two intervals is a function only of the
; widths of the intervals being added (or subtracted). Give examples to show that this is not true for
; multiplication or division.

; w(I) = (u(I) - l(I)) / 2

; I + J = (u(I), l(I)) + (u(J), l(J)) = (u(I) + u(J), l(I) + l(J))
; w(I + J) = (u(I) + u(J) - l(I) - l(J)) / 2
;          = (u(I) - l(I) + u(J) - l(J)) / 2
;          = (u(I) - l(I) / 2 + (u(J) - l(J)) / 2
;          = w(I) + w(J)
; w(I - J) = (u(I) - u(J) - l(I) + l(J)) / 2
;          = w(I) - w(J)

; I * J = (u(I) * u(J), l(I) * l(J))
; w(I * J) = (u(I) u(J) - l(I) l(J)) / 2 = (u(I) - l(I)) / 2 * (u(J) - l(J)) / 2 = w(I) w(J)
;            2 u(I) u(J) - 2 l(I) l(J) = u(I) u(J) - u(I) l(J) - u(J) l(I) + l(I) l(J)
;            u(I) u(J) + u(I) l(J) + u(J) l(I) = 3 l(I) l(J)
;            3 l(I) l(J) > 3 l(I) l(J) assuming u > l.
;            Contradiction.

; Counterexamples for multiplication and division:
; (5, 1) * (3, 1) = (5*3, 1*1) = (15, 1)
; w(15, 1) = 7
; w(5, 1) * w(3, 1) = 2

; (5, 1) / (3, 1) = (5, 1) * (1, 1/3) = (5, 1/3)
; w(5, 1/3) = 7/3
; w(5, 1) * w(1, 1/3) = 2 * 1/3 = 2/3

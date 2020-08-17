#lang sicp

; Consider a system of two binary operations, I * J and I / J, where I and J are either intervals or 
; compound expressions. In the previous exercises, I investigated the behaviour of tolerance under
; these operations. 
; Despite being more specific than the system for computing parallel resistances in the book, it has
; the same problem as that system, as shown in exercise 2.14. Therefore its behaviour can (probably)
; be generalized to the entire interval arithmetic system.

; As previously shown, application of these two operations can only add uncertainty to the system but
; never remove it. Thus the least uncertainty is introduced to the system when the number of operations
; is minimal, since each additional operation introduces additional uncertainty.

; Now, there can be quantities that are not uncertain, namely intervals with a tolerance of 0. Opera-
; tions involving these do not introduce any uncertainty to the system, as shown below:
; Let J be an interval with t(J) = 0.
; t(I * J) = t(I) t(J) + t(I) + t(J) = t(I)
; t(I / J) = t(I * J) = t(I)
; To specify, the least uncertainty is therefore introduced when the number of binary operations in
; which both operands are uncertain quantities is minimal.

; But the number of binary operations in which both operands are uncertain quantities being minimal
; precisely means that every uncertain quantity only appears once, if possible.
; Thus Eva Lu Ator is right, and par1 is the 'better' program for computing parallel resistances.

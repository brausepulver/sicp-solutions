#lang racket

(define (gcd a b) (if (= b 0) a (gcd b (remainder a b))))

; Process generated in normal-order evaluation of (gcd 206 40):

(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))) ; 1 (remainder ...) operation
(if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) ; 2 (remainder ...) operations
(if (= 4) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))) ; 4 (remainder ...) operations
(if (= 2 0) (remainder 40 (remainder 206 40)) (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd ...)) ; 7 (remainder ...) operations
(if (= 0 0) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (gcd ...)) ; 4 (remainder ...) operations
(if (= 0 0) 2 (gcd ...))
2

; 1 + 2 + 4 + 7 + 4 = 18 (remainder ...) operations are actually performed in normal-order evaluation.

; In applicative-order evaluation, the (remainder ...) operation is directly performed at each step,
; so that 4 (remainder ...) operations are performed in total:
; (remainder 206, 40), (remainder 40, 6), (remainder 6 4) and (remainder 4 2).

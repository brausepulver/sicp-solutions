#lang racket

; T_pq(a, b) = (bq + aq + ap, bp + aq)
; T_pq(T_pq(a, b)) = (q(bp + aq) + q(bq + aq + ap) + p(bq + aq + ap), p(bp + aq) + q(bq + aq + ap))
; = (bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2, bp^2 + apq + bq^2 + aq^2 + apq)
; = (ap^2 + apq + apq + aq^2 + aq^2 + bpq + bpq + bq^2, apq + apq + aq^2 + bp^2 + bq^2)
; = (ap^2 + 2 apq + 2 aq^2 + 2 bpq + bq^2, 2 apq + aq^2 + bp^2 + bq^2).

; Now let p' = p^2 + q^2 and let q' = 2 pq + q^2. 
; Then T_pq(T_pq(a, b)) = (bq' + aq' + ap', bp' + aq') = T_p'q'.

(define (square n) (* n n))

(define (fib n)
    (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
    (cond ((= count 0) b)
        ((even? count)
            (fib-iter a 
                      b 
                      (+ (square p) (square q)) 
                      (+ (* 2 p q) (square q)) 
                      (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 8)
; 21

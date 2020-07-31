#lang sicp

(define (double p)
    (lambda (x) (p (p x))))

((double inc) 1)
; 1 + 2 * 1 = 3

(((double (double double)) inc) 5)
; (double p)
; (double (double p))
; (double (double (double (double p))))
; (double (double (double (p (p x)))))
; (double (double (p (p (p (p x))))))
; (double (p (p (p (p (p (p (p (p x)))))))))
; (p (p (p (p (p (p (p (p (p (p (p (p (p (p (p (p x))))))))))))))))))
; 5 + 2^4 * 1 = 5 + 16 = 21

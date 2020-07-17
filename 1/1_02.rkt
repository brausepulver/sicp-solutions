#lang racket

(/ (+ 4 3 (- 2 (- 3 (+ 6 (/ 4 3)))))
   (* 3 (- 6 2) (- 2 7)))
; 2/9
; That's a lot of brackets!

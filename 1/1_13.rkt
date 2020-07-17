#lang racket
; Otherwise my VSCode complains >.<'

; Fib(n) is the closest integer to φ^n / √5, where φ = (1 + √5) / 2.

; Proof: 
; Let ψ = (1 - √5) / 2. Then Fib(n) = (φ^n - ψ^n) / √5. I will prove the proposition by induction.
; In the base case, Fib(0) = 1 is trivial and left for the reader. :v)
; 
; By the definition of the Fibonacci numbers, Fib(n+1) = Fib(n) + Fib(n-1).
; Thus Fib(n+1) = (φ^n - ψ^n) / √5 + (φ^(n-1) - ψ^(n-1)) / √5 = ((1 + φ) φ^(n-1) - (1 + ψ) ψ^(n-1)) / √5.
; 
; But by definition, φ^2 = 1 + φ and ψ^2 = 1 + ψ. Therefore Fib(n+1) = (φ^2 φ^(n-1) - ψ^2 ψ^(n-1)) / √5,
; and so Fib(n+1) = (φ^(n+1) - ψ^(n+1)) / √5, which completes the proof.

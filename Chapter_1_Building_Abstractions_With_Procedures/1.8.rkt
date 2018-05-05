#lang sicp

(define (cube x) (* x x x))

(define (average x y)
  (/ (+ x y) 3))

(define (improve guess x)
  (average (* 2 guess) (/ x (* guess guess))))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

;; Проверка
(cbrt-iter 1.0 4.0)
(cbrt-iter 1.0 9.0)
(cbrt-iter 1.0 27.0)

;; Ответ
; 1.5874096961416333
; 2.0801035255095734
; 3.0000005410641766

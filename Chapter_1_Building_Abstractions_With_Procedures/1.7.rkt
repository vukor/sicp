#lang sicp

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

;; Improve sqrt-iter

(define (good-enough-v2? prev-guess guess)
  (< (abs (- guess prev-guess)) 0.001))

(define (sqrt-iter-v2 prev-guess guess x)
  (if (good-enough-v2? prev-guess guess)
      guess
      (sqrt-iter-v2 guess
                    (improve guess x)
                    x)))

;; Проверка
(abs (- 10000.0 (square (sqrt-iter 1.0 10000.0))))
(abs (- 10000.0 (square (sqrt-iter-v2 0.0 1.0 10000.0))))

; 5.098148722026963e-05
; 0.0

(abs (- 1000.0 (square (sqrt-iter 1.0 1000.0))))
(abs (- 1000.0 (square (sqrt-iter-v2 0.0 1.0 1000.0))))

; 0.00036992436605487455
; 3.433342499192804e-11

(abs (- 20.0 (square (sqrt-iter 1.0 20.0))))
(abs (- 20.0 (square (sqrt-iter-v2 0.0 1.0 20.0))))

; 3.812109644840689e-05
; 1.816147232602816e-11

(abs (- 9.0 (square (sqrt-iter 1.0 9.0))))
(abs (- 9.0 (square (sqrt-iter-v2 0.0 1.0 9.0))))

; 0.0005493331704400362
; 8.381903171539307e-09

(abs (- 4.0 (square (sqrt-iter 1.0 4.0))))
(abs (- 4.0 (square (sqrt-iter-v2 0.0 1.0 4.0))))

; 3.716891878724482e-07
; 3.716891878724482e-07

(abs (- 0.5 (square (sqrt-iter 0.1 0.5))))
(abs (- 0.5 (square (sqrt-iter-v2 0.0 0.1 0.5))))

; 0.00022070726849143796
; 2.434510293358727e-08

(abs (- 0.2 (square (sqrt-iter 0.01 0.2))))
(abs (- 0.2 (square (sqrt-iter-v2 0.0 0.01 0.2))))

; 8.514848864660252e-06
; 9.062445238683381e-11

(abs (- 0.1 (square (sqrt-iter 0.01 0.1))))
(abs (- 0.1 (square (sqrt-iter-v2 0.0 0.01 0.1))))

; 0.00012171682319481181
; 3.699243661392515e-08

;; Ответ
; Для чисел 10000, 1000, 20, 9, 0.5, 0.2, 0.1 функция sqrt-iter-v2 вычисляет квадратный корень точнее, для числа 4.0 результат одинаковый.
; Вывод: на больших и маленьких числах функция sqrt-iter-v2 работает лучше.


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

;; Проверка
(sqrt-iter 1.0 4.0)

;; Ответ
;; При аппликативном режиме получим зацикливание, т.к. в этом случае "интерпретатор сначала вычисляет оператор (sqrt-iter) и операнды (guess и x), а затем применяет получившуюся процедуру к получившимся аргументам." (стр. 33), т.е. интерпретатор "попытается" вычислить все выражения, в том числе "(sqrt-iter (improve guess x)" и зациклится.
;; If - особая форма, которая не вычисляет "(sqrt-iter (improve guess x)" если guess < 0.001

;; Проверка
;(define (new-if predicate then-clause else-clause)
;  (cond (predicate then-clause)
;        (else else-clause)))

;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x)
;                     x)))

;(sqrt-iter 2.0 4.0)
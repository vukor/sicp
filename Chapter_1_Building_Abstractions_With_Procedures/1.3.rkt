#lang sicp

;; Ответ
(define (largest x y)
  (if (not (> x y))
      y
      x))

(define (smallest x y)
  (if (not (< x y))
      y
      x))

(define (sum_square x y z)
  (+ (* (largest x y) (largest x y))
     (* (largest (smallest x y) z) (largest (smallest x y) z))))

;; Проверка
(sum_square 1 2 3)

(sum_square 1 3 2)

(sum_square 2 1 3)

(sum_square 2 3 1)

(sum_square 3 2 1)

(sum_square 3 1 2)


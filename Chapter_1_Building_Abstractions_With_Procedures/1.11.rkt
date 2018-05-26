#lang sicp

; Реализация рекурсивного процесса
(define (fib-recursive-proc n)
  (cond ((< n 3) n)
        (else (+ (fib-recursive-proc (- n 1))
                 (fib-recursive-proc (- n 2))
                 (fib-recursive-proc (- n 3))))))
; Проверка
(fib-recursive-proc 0)
(fib-recursive-proc 1)
(fib-recursive-proc 2)
(fib-recursive-proc 3)
(fib-recursive-proc 4)
(fib-recursive-proc 5)

; Реализация итеративного процесса
(define (fib-iter-proc n)
  (fib-iter 2 1 0 n))

(define (fib-iter a b c count)
  (cond ((= count 2) a)
        ((= count 1) b)
        ((= count 0) c)
        (else (fib-iter (+ a b c) a b (- count 1)))))

; Проверка
(fib-iter-proc 0)
(fib-iter-proc 1)
(fib-iter-proc 2)
(fib-iter-proc 3)
(fib-iter-proc 4)
(fib-iter-proc 5)

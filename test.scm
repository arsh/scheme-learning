;; A procedure for counting the n:th Fibonacci number
;; See SICP, p. 37
(define fib
  (lambda (n)
    (cond ((= n 0) 0)  
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2)))))))
;(fib 50)
(define sqr
  (lambda (n)
    (* n n)))

;(sqr 9)
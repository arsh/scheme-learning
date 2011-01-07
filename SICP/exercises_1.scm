; exercise 1.5

(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
; it seems that if the interpreter is using applicative-order evaluation this will cause an infinite loop since when the interpreter tries to evaluate the argument (p) it will cause and endless loop. Conversely if normal-order is being used it will replace the call (p) with that procedure body and not cause a infinite loop. (Need to verify with peers).


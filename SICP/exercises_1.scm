;explanation
;given these
(define (square x)
  (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

;evaluate the combination
(f 5)

;aplicative order
(f 5)
(sum-of-squares (+ a 1) (* a 2))
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136

;normal order
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square (+ 5 1) (square (* 5 2))))
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136


;exercise 1.2
(/ (+ 5 (+ 4 (- 2 (- 3 (+ 6 (/ 4 5)))))) (* 3 (- 6 2) (- 2 7)))

;exercise 1.3
(define (sum-square-of-max a b c)
  (+ (if (> a b) (* a a) (* b b))
     (if (< b c) (* c c))))

(sum-square-of-max 2 3 1)

;exercise 1.5

(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
;it seems that if the interpreter is using applicative-order evaluation this will cause 
;an infinite loop since when the interpreter tries to evaluate the argument (p) it will 
;cause and endless loop. Conversely if normal-order is being used it will replace the 
;call (p) with that procedure body and not cause a infinite loop and result in zero.

;absolute value
(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))
;simplified version
(define (abs x)
  (if (< x 0) (- x) x))

(abs -4)
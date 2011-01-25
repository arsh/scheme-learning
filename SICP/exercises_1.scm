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
(define (min a b)
  (if (< a b) a b))
(define (square x)
  (* x x))
(define (sum-of-square a b)
  (+ (square a) (square b)))

(define (sum-square-of-max a b c)
  (cond ((= (min a b c) a) (sum-of-square b c))
	((= (min a b c) b) (sum-of-square a c))
	((= (min a b c) c) (sum-of-square a b))))
	
;tests
(= 13 (sum-square-of-max 2 3 1))
(= 13 (sum-square-of-max 1 3 2))
(= 13 (sum-square-of-max 3 2 1))
(= 13 (sum-square-of-max 1 2 3))
       

(test-sum-square-of-max)


(sum-square-of-max 2 3 1)
;returns:13
(sum-square-of-max 2 3 1)
;returns:13
(sum-square-of-max 2 3 1)
;returns:13


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

;newton's square root procedures
(define (average x y)
  (/ (+ x y) 2.0))
(average 10 5)
(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))



(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

;mit scheme makes difference between 1 and 1.0
(define (sqrt x)
  (sqrt-iter 1.0 x))

(untrace sqrt)

(sqrt 900)

;exercise 1.6
;using new-if it never ends since new-if uses applicative-order unlike
;if "special form" that uses normal-order

;exercise 1.7
(trace sqrt-iter)
(sqrt 0.00025)
;problem
(square .033869844451165365) ; .0011471663631461373
(- .0011471663631461373 .00025) ; .0008971663631461373
(good-enough? .033869844451165365 0.00025)
(square 1.5821027443396047e-2)
;makig good-enough? compare againts a smaller number,
;will cause to work for certain small numbers
;testing large numbers
(untrace sqrt-iter)
(sqrt 12345678912345)


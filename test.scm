;; A procedure for counting the n:th Fibonacci number
;; See SICP, p. 37
(define fib
  (lambda (n)
    (cond ((= n 0) 0)  
	  ((< n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2)))))))



;(fib 50)
(define sqr
  (lambda (n)
    (* n n)))

(sqr 9)

(define sum
  (lambda a (apply + a)))


(define list
  (lambda args args))

;let
(let ((x 2) (y 4))
  (+ x y))
; let like but using lambda
((lambda (x y)
  (+ x y)) 2 4)

; variable scope with let
(define u 8)
(+ (let ((u 20)) (+ u 1)) u)

(let ((t 1)) (+ t t))

(define x 5)
(let* ((x 1) (y (+ x 1))) y)
; is pending to prove that let* = let(let())...
(define x 5)
(let ((x 1))
  (let ((y (+ x 1))))

; defining functions with let
(let sum ((a 1)
	  (b 2))
  (+ a b))

(define factorial
  (lambda (n)
    (let iter ((product 1)
               (counter 1))
      (if (> counter n)
          product
          (iter (* counter product) (+ counter 1))))))

 (define (simple-unsharp-mask filename
			       radius
			       amount
			       threshold)
    (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
          (drawable (car (gimp-image-get-active-layer image))))
     (plug-in-unsharp-mask RUN-NONINTERACTIVE
	                   image drawable radius amount threshold)
     (gimp-file-save RUN-NONINTERACTIVE image drawable filename filename)
     (gimp-image-delete image)))
  

(define ms
  (lambda (a b)
    (if (< a b)
	(square a)
	(square b))))

(define sawtooth?
  (lambda (x1 x2 x3)
    (if (< x1 x2)
	1 0)))
	;(> x2 x3))))

(define tl
  (lambda (n)
    (cond (> n 6) (> n 5))))

(define x 10)
(let* ((x 5)
      (y (* x 2)))
      (+ x y))

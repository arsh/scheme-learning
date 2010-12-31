;simple let expression
(let ((x 2) (y 5))
  (+ x y))

; the above is syntactic sugar for:
((lambda (x y)
  (+ x y)) 2 5)

;tricky for variable scope
(define x 10)
(+ (let ((x 5))
  (* x (+ x 2))) x) 
;the last x=10, since it's outside the let body
;this result in 45 --> 5+2*5 + 10

;another with variable scope
(define x 10)
(let ((x 5)
      (y (* x 2)))
  (+ x y))
;result=25, since y asignment is outside the let body hence x at that point equals 10

; same example but using let* which is a recursive let
(define x 10)
(let* ((x 5)
      (y (* x 2)))
  (+ x y))
; result=15 since x=5 and y=10
; the same example re-written as recursive let
(define x 10)
(let ((x 5))
  (let ((y (* x 2)))
    (+ x y)))
;result=15 since i'm using recursive let, the y definition is not longer in the variable declaration but in the body of the first let, so it's using the inner x declaration


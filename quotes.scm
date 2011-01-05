;quotes

(quote andres)

;quasiquote
`(1 2)

`(1 ,(+ 2 3) 4)
;return (1 5 4) since the commad is unquoting the expression
;equivalent to
`(1 (unquote (+ 2 3)) 4)

;taken from SICP, nice feature
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 5 -1)

(quote 10)
'10
(quote (quote foo))
(quote 'foo)
''foo

;list
'(a 1 2)
;if not quoted the interpreter will try to call procedure a with two parameters
;quasiquotes
`(1 2)
;equivalent
(quasiquote (1 2))

`(1 ,(+ 2 3) 4)
;the expresion following the comma is evaluated and the value returned is place in the comma, so the above results in (1 5 4)
(define e 15)
`(1 ,e ,(+ e 1))
;will result in (1 15 16)
`(1 ,e)
;result in (1 15), but this can also be written with unquote, e.g.
`(1 (unquote e))
;will result in the same (1 15)

;more samples
`(,e 10)
;result: (15 10)

;using the @ sign to indicate that what preceeds the comma is a list
`(,e ,@'(1 2 3))
;using cdr(which at this point I only know that this return all the elements in a list except for the first one
`(,@(cdr '(1 2 3)))
;returns (2 3)

;cdr sample
(cdr '(1 2 3))
;will return (2 3)
(cdr '(1))
;will return ()

;map
(map sqrt '(1 4 9 16 25))
;not sure how this work, but this is getting the square root of all the elements of the list

`(1 ,(acos -1) ,@(map sqrt '(1 4 9 16 25)))

;define a list
(define ls '(1 2 3))
;use that list
`(,ls 4 5 6)
;results in ((1 2 3) 4 5 6)
`(,@ls 4 5 6)
;results in (1 2 3 4 5 6)



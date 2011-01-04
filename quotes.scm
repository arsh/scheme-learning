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

'(quote foo)
'foo

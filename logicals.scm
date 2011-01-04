;logicals samples

(and (> 5 4) (= 8 8) (<= 1 9))
;return #t

(define a 3)
(or (< 2 5) (number? a))
;return #t

(not #t)
;return #f
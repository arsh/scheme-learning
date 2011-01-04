;conditionals in scheme

(if (= 5 5) #t #f)
;will always return #t(true)
;print "yes" just in case the number passed is even
(define is_even
  (lambda (n)
    (= 0 (remainder n 2))))

(is_even 7) ;will return #f(false) since (remainder 7 2) = 1

;cond
(define is_even
  (lambda (n)
    (cond ((= 0 (remainder n 2)) #t)
	  (else #f))))

(is_even 8) ;will return #t(true)

;Exercise 1.3.  Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

;max of 2 numbers
(define (max a b)
  (if (> a b) a b))

(max 5 6)
(max 4 1)
;max of 3 numbers
(define (maxx a b c)
  (max (max a b) c))

;case

(case 't
  ((one) 1)
  ((two) 2)
  ((three) 3)
  (else 'none))
  
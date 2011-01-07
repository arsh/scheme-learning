;procedures

(define fact
  (lambda (n)
    (if (= n 0)                  ; the terminating condition
        1                        ; returning 1
        (* n (fact (- n 1))))))  ; the recursive step

(fact 7)
(trace fact)
(fact 7)
(untrace fact)
(fact 7)

;appending 2 lists
(append '(1 4) '(2 3))

(define ls '(1 2 3))
(car ls) ; returns the first element of ls --> (1)
(cdr ls) ; returns all elements but the first --> (2 3)

;defining my own append procedure
(define app
  (lambda (ls1 ls2)
    (if (null? ls1)
        ls2
        (cons (car ls1) (app (cdr ls1) ls2)))))
(trace app)
(app '(a b c) '(d e f))
(untrace app)

(cons 'a '(b c d))

(pair? '(1 2 3))
(not (pair? '()))

;deep recursion sample
(define count-leaves
  (lambda (ls)
    (cond ((null? ls) 0)
          ((not (pair? ls)) 1)
	  (else (+ (count-leaves (car ls))
                   (count-leaves (cdr ls)))))))

(count-leaves '(1 2 (3 (4 (7) 9 ))))


;tail recursion
(car '(1 . 3))
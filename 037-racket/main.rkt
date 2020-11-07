#lang racket

(define (isprime n)
  (cond [(< n 2) #f]
        [(equal? n 2) #t]
        [else (primehelper n 2 (floor (sqrt n)))]))

;; checks the 2 -> sqrt(n) divisible case for the isprime func
(define (primehelper n cur till)
  (if (> cur till)
    #t
    (if (equal? (remainder n cur) 0)
      #f
      (primehelper n (+ cur 1) till))))

(define (remove-left n)
  (let ([digit-length (string-length (format "~a" n))])
    (remainder n (expt 10 (- digit-length 1)))))

(define (remove-right n)
  (floor (/ n 10)))

;; tfunc: function which truncates this left to right or right to left
(define (truncate-one-way n tfunc)
  (if (not (isprime n))
    #f
    (if (< n 10)
      #t
      (truncate-one-way (tfunc n) tfunc))))

(define (is-truncatable n)
  (and (truncate-one-way n remove-left) (truncate-one-way n remove-right)))

(define (solve n result result-len)
  (if (equal? result-len 11)
    result
    (if (is-truncatable n)
      (solve (+ n 1) (+ result n) (+ result-len 1))
      (solve (+ n 1) result result-len))))

(printf "~a\n" (solve 10 0 0))

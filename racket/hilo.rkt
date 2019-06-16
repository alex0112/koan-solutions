#lang racket/base
;(require dyoo-while-loop)


(define (getrand upper)
  (random 0 upper))

(define (getsecret)
  (print "Upper: ")
  (getrand (read)))

(define secret (getsecret))

(while (not (string=? (read-line) (secret))
            (print "Guess: ")
            (define guess (read))
            
            (cond [(= guess secret) (printf "You win!\n") (exit)]
                  [(< guess secret) (printf "Too low.\n")]
                  [(> guess secret) (printf "Too high.\n")]
                  )))



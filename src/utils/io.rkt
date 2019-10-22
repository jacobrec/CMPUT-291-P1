#lang racket

(provide prompt)
(provide confirm)

(define (prompt word)
  (display word)
  (flush-output)
  (read-line))

(define (confirm word)
  (display word)
  (displayln ": y/n")
  (get-confirm #f))

(define (get-confirm show-err)
  (when show-err
    (displayln "Please type y/n"))
  (define res (read-line))
  (cond
    [(string=? "y" res) #t]
    [(string=? "n" res) #f]
    [else (get-confirm #t)]))


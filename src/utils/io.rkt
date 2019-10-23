#lang racket

(provide prompt)
(provide prompt-type)
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


(define (prompt-type word type [show-err #f])
  (when show-err
    (display "Invalid input for type: ")
    (displayln type))
 (define val (prompt word))
 (cond [(and (string=? "date" type) (not (validate-date val))) (prompt-type word type #t)]
       [(and (string=? "date-or-today" type) (not (validate-date-or-today val))) (prompt-type word type #t)]
       [(and (string=? "number" type) (not (validate-number val))) (prompt-type word type #t)]
       [(and (string=? "text" type) (not (validate-text val))) (prompt-type word type #t)]
       [else val]))

(define (validate-text input)
  #t)

(define (validate-number input)
  (string->number input 10 'number-or-false))

(define (validate-date input)
  (regexp-match-exact? #px"\\d\\d\\d\\d-((1[012])|(0\\d))-(([012]\\d)|(3[01]))" input))

(define (validate-date-or-today input)
  (or
    (not (non-empty-string? input))
    (regexp-match-exact? #px"\\d\\d\\d\\d-((1[012])|(0\\d))-(([012]\\d)|(3[01]))" input)))

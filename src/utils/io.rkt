#lang racket

(provide prompt)
(provide prompt-type)
(provide confirm)
(provide prompt-number-in-range)

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



(define (prompt-number-in-range word lower upper [show-err #f])
  (when show-err
    (printf "Please enter a number from ~a to ~a~%" lower upper))
  (define n (string->number (prompt-type word "number")))
  (if (or (> n upper) (< n lower))
    (prompt-number-in-range word lower upper #t)
    n))

(define (prompt-type word type [show-err #f])
  (when show-err
    (display "Invalid input for type: ")
    (displayln type))
 (define val (prompt word))
 (cond [(and (string=? "date" type) (not (validate-date val))) (prompt-type word type #t)]
       [(and (string=? "date-or-today" type) (not (validate-date-or-today val))) (prompt-type word type #t)]
       [(and (string=? "number" type) (not (validate-number val))) (prompt-type word type #t)]
       [(string=? "number-ish" type) (if (validate-number val) val (if (non-empty-string? val) (prompt-type word type #t) "%"))]
       [(string=? "text" type) val]
       [(string=? "text-ish" type) (string-append "%" val "%")]
       [else val]))

(define (validate-number input)
  (string->number input 10 'number-or-false))

(define (validate-date input)
  (regexp-match-exact? #px"\\d\\d\\d\\d-((1[012])|(0\\d))-(([012]\\d)|(3[01]))" input))

(define (validate-date-or-today input)
  (or
    (not (non-empty-string? input))
    (regexp-match-exact? #px"\\d\\d\\d\\d-((1[012])|(0\\d))-(([012]\\d)|(3[01]))" input)))

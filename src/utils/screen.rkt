#lang racket

(provide screen)

(define (screen title options [show-err #f])
  (when show-err
    (displayln "Invalid option"))
  (displayln title)
  (for ([o options]
        [i (range (length options))])
    (display (+ 1 i))
    (display ") ")
    (displayln (car o)))
  (flush-output)

  (define val (read-line))
  (define nval (string->number val 10 'number-or-false))
  (define fn
    (if (and nval (>= (length options) nval))
     (cdr (list-ref options (- nval 1)))
     (and (dict-has-key? options val) (dict-ref options val))))

  (if fn
      (fn)
      (screen title options #t)))




; Example
;(screen "Test screen"
; `(("Option A" . ,(lambda () (displayln "a")))
;   ("Option B" . ,(lambda () (displayln "b")))))

#lang racket

(provide screen)

(define (screen title options [show-err #f])
  (when show-err
    (displayln "Invalid option")
    (displayln "Enter valid command number or full command name"))
  (displayln title)
  (for ([o options]
        [i (range (length options))])
    (display (+ 1 i))
    (display ") ")
    (displayln (car o)))

  (flush-output)
  (define val (input-or-exit))
  (if val
    (screen-val title options val)
    #f))

(define (screen-val title options val)
  (define nval (string->number val 10 'number-or-false))
  (define fn
    (if (and nval (> nval 0) (>= (length options) nval))
     (cdr (list-ref options (- nval 1)))
     (and (dict-has-key? options val) (dict-ref options val))))

  (with-handlers ([exn:fail?
                    (lambda (e)
                      (parameterize-break #t
                        (screen title options #f)))])
    (if fn
        (fn)
        (screen title options #t))))

(define (input-or-exit)
  (define val (read-line))
  (if (not (eof-object? val)) (string-downcase val) #f))



; Example
;(screen "Test screen"
; `(("Option A" . ,(lambda () (displayln "a")))
;   ("Option B" . ,(lambda () (displayln "b")))))

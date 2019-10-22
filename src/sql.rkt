#lang racket

(require db)
(require "utils/sqlifier.rkt")
(provide sqlify-row)
(provide sqlify-rows)
(provide sqlify-list)
(provide sqlify-maybe-row)
(provide sqlify-value)
(provide sqlify-maybe-value)
(provide sqlify-exec)
(provide sqlify-display)

(define db-name (vector-ref (current-command-line-arguments) 0))
(define jdb (sqlite3-connect #:database db-name #:mode 'create))

(define (sqlify-maybe-row file params)
  (sqlify jdb query-maybe-row file params))

(define (sqlify-row file params)
  (sqlify jdb query-row file params))

(define (sqlify-list file params)
  (sqlify jdb query-list file params))

(define (sqlify-rows file params)
  (sqlify jdb query-rows file params))

(define (sqlify-value file params)
  (sqlify jdb query-value file params))

(define (sqlify-maybe-value file params)
  (sqlify jdb query-maybe-value file params))

(define (sqlify-exec file params)
  (sqlify jdb query-exec file params))

(define (sqlify-display rows columns-have [columns-want #f] [widths #f])
  (unless columns-want
    (set! columns-want columns-have))
  (unless widths
    (set! widths (for/list ([x columns-want]) 15)))


  (define should-show
    (for/list ([n columns-have])
      (not (empty? (filter
                     (lambda (a) (string=? a n))
                     columns-want)))))

  ; Get widths
  (unless (= (length widths) (length columns-have))
    (define ws widths)
    (set! widths
      (for/list ([s should-show])
        (define x 0)
        (when s
          (set! x (car ws))
          (set! ws (cdr ws)))
        x)))
  (define vwidths (list->vector widths))

  ; Display header
  (sqlify-display-column
    should-show
    (list->vector columns-have) vwidths)
  (displayln (make-string
               (+ (* 2 (length columns-want))
                  (apply + widths))
               #\=))

  ; Display rows
  (for ([r rows])
    (sqlify-display-column should-show r vwidths)))


(define (sqlify-display-column should-show data widths)
  (define i 0)
  ; Display column
  (for ([t should-show])
    (when t
      (define w (vector-ref widths i))
      (define n (vector-ref data i))
      ;(displayln n)
      (define lw (quotient (- w (string-length n)) 2))
      (define lpad (make-string lw #\ ))
      (define rpad (make-string (- w (string-length n) lw) #\ ))
      (printf "|~a|" (string-append lpad n rpad)))
    (set! i (+ i 1)))
  (displayln ""))

;; Example of how to use sql display
; (sqlify-display
;   (sqlify-rows "src/sql/queries/0_login.sql"
;     `(("usr" . "jacob") ("passwd" . "password"))
;   '("First Name" "Last Name" "utype" "city")
;   '("First Name" "Last Name")
;   '(15 15)))

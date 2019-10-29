#lang racket

(require db)
(require racket/date)
(require racket/random)
(require "utils/sqlifier.rkt")
(require "utils/io.rkt")

(provide create-id)
(provide sqlify-date)
(provide sqlify-row)
(provide sqlify-rows)
(provide sqlify-list)
(provide sqlify-maybe-row)
(provide sqlify-value)
(provide sqlify-maybe-value)
(provide sqlify-exec)
(provide sqlify-display)
(provide sqlify-select-and-expand)
(provide get-dict-from-user)

(define (create-id)
  (define byt (crypto-random-bytes 16))
  (define res 0)
  (for ([b (bytes->list byt)])
    (set! res (bitwise-ior b (arithmetic-shift res 8))))
  res)


(define (sqlify-date tdate)
  (string-append
    (number->string (date-year tdate))
    "-"
    (if (> 10 (date-month tdate))
        (string-append "0" (number->string (date-month tdate)))
        (number->string (date-month tdate)))
    "-"
    (if (> 10 (date-day tdate))
        (string-append "0" (number->string (date-day tdate)))
        (number->string (date-day tdate)))))

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
  (unless columns-want (set! columns-want columns-have))
  (unless widths (set! widths (for/list ([x columns-want]) 15)))
  (set! widths (take widths (length columns-want)))

  (define should-show
    (for/list ([n columns-have])
      (not (empty? (filter (lambda (a) (string=? a n))
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
  (sqlify-display-column should-show
    (list->vector columns-have) vwidths)
  (define ends (for/list ([w widths]) 0))
  (set! ends (list-set ends 0 -1))
  (for ([w widths]
        [i ends])
    (when (> w 0)
      (define l (if (= i -1) "╞" "╪"))
      (display (string-append l (make-string w #\═)))))
  (displayln "╡")

  ; Display rows
  (for ([r rows])
    (sqlify-display-column should-show r vwidths)))


(define (sqlify-display-column should-show data widths)
  (define i 0)
  ; Display column
  (for ([t should-show])
    (when t
      (define w (vector-ref widths i))
      (define n (to-string (vector-ref data i)))
      ;(displayln n)
      (define lw (quotient (- w (string-length n)) 2))
      (define lpad (make-string lw #\ ))
      (define rpad (make-string (- w (string-length n) lw) #\ ))
      (printf "│~a" (string-append lpad n rpad)))
    (set! i (+ i 1)))
  (displayln "│"))

;; Example of how to use sql display
; (sqlify-display
;   (sqlify-rows "src/sql/queries/0_login.sql"
;     `(("usr" . "jacob") ("passwd" . "password"))
;   '("First Name" "Last Name" "utype" "city")
;   '("First Name" "Last Name")
;   '(15 15)))

;; TODO: make this work
(define (sqlify-select-and-expand data have-columns want-columns widths expanded-columns)
  (define row-have-columns (cons "Row" have-columns))
  (define row-want-columns (cons "Row" want-columns))
  (define row-widths (cons 8 widths))
  (define row-data
    (for/list ([r data]
               [i (range (length data))])
      (vector-append (vector (+ i 1)) r)))
  (sqlify-display row-data row-have-columns row-want-columns row-widths)
  (define row
    (prompt-number-in-range "Select a row to get more info: "
      1 (length data)))
  (sqlify-display (list (list-ref data (- row 1)))
    have-columns expanded-columns widths))




(define (get-dict-from-user params-in)
  (define params-out (make-hash))
  (for/list ([l params-in])
    (define name (car l))
    (define key (cadr l))
    (define type (caddr l))
    (define val (prompt-type (string-append name ": ") type))
    (dict-set! params-out key val)
    (when (and (string=? type "date-or-today")
               (not (non-empty-string? val)))
      (dict-set! params-out key (sqlify-date (current-date)))))
  params-out)
; (get-dict-from-user '(("Make" . "make") ("Model" . "model")))

(define (to-string arg)
  (cond
    ((string? arg) arg)
    ((number? arg) (number->string arg))
    (else "")))


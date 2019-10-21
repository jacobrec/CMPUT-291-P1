#lang racket

(provide sqlify)
(provide sqlify-content)

(define (sqlify db-ref query-fn file params)
  (sqlify-content db-ref query-fn (file->string file) params))

(define (sqlify-content db-ref query-fn content params)
  (define data (sqlify-string content params))
  (apply query-fn db-ref (car data) (cdr data)))

(define (sqlify-string contents params)
  (define replTok ":")
  (define forReplacing (regexp-match*
                         (pregexp (string-append replTok "\\w+"))
                         contents))
  (define sql-string
    (for/fold ([res contents])
       ([dirty forReplacing])
      (string-replace res dirty "?")))
  (define sql-vals
    (for/list
      ([v forReplacing])
      (dict-ref params (string-trim v replTok))))
  (cons sql-string sql-vals))



; Example
; (define test "SELECT name, :name FROM tmp WHERE id = :name")
; (displayln (sqlify-string test '(("name" . "Josh") ("col1" . "age"))))
; This will run the following sql
; "SELECT name, age FROM tmp WHERE id = Josh"

; Example
; (require db)
; (define db-name (vector-ref (current-command-line-arguments) 0))
; (define jdb (sqlite3-connect #:database db-name #:mode 'create))
; (displayln (sqlify-content jdb query-maybe-row
;            "SELECT * FROM users WHERE uid = :usr AND pwd = :passwd"
;            '(("usr" . "jacob") ("passwd" . "password"))))

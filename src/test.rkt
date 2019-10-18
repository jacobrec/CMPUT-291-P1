#lang racket

(require db)

(define (setup-database db-name)
  (define jdb (sqlite3-connect #:database db-name #:mode 'create))
  (for ([stm (string-split (file->string "create_tables.sql") ";" #:trim? #t)])
    (define stm-stripped (string-trim stm))
    (unless (= (string-length stm-stripped) 0)
      (query-exec jdb stm-stripped))))

(define (add-fake-data db-name)
  (define jdb (sqlite3-connect #:database db-name #:mode 'create))
  (query-exec jdb ""))

(setup-database
  (vector-ref (current-command-line-arguments) 0))


#lang racket

(require db)

(define (run-sql-file db-name sql-file-name)
  (define jdb (sqlite3-connect #:database db-name #:mode 'create))
  (for ([stm (string-split (file->string sql-file-name) ";" #:trim? #t)])
    (define stm-stripped (string-trim stm))
    (unless (= (string-length stm-stripped) 0)
      (query-exec jdb stm-stripped))))

;;;; Test
(define db-name "sql/test.db")
(run-sql-file db-name "sql/tables.sql") ; Create tables
(run-sql-file db-name "sql/data.sql")   ; Load our test data


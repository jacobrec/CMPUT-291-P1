#lang racket

(require db)
(provide db-signin)

(define db-name (vector-ref (current-command-line-arguments) 0))
(define jdb (sqlite3-connect #:database db-name #:mode 'create))

(define (db-signin usr passwd)
  (query-maybe-row jdb
    "SELECT * FROM users WHERE uid = ? AND pwd = ?"
     usr passwd))

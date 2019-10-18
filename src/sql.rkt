#lang racket

(require db)
(provide db-signin)

(define jdb (sqlite3-connect #:database db-name #:mode 'create))

(define (db-signin usr passwd)
  (displayln (list usr passwd)))

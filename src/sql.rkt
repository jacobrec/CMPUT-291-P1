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

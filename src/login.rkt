#lang racket

(require "password.rkt")
(require "sql.rkt")
(provide login-user)

(define (login-user)
  (printf "Username: ")
  (define user (read-line))
  (define passwd (read-password "Password: "))
  (db-signin user passwd))

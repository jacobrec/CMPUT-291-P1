#lang racket

(require "password.rkt")
(provide login-user)

(define (login-user)
  (printf "Username: ")
  (define user (read-line))
  (define passwd (read-password "Password: "))
  (list user passwd))

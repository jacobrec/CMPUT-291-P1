#lang racket

(require "login.rkt")

(define user (login-user))
(displayln user)


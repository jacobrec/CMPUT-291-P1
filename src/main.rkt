#lang racket

(require "login.rkt")

(define user (login-screen))
(displayln user)


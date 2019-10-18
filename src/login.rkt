#lang racket

(require "password.rkt")
(require "sql.rkt")
(provide login-screen)

(define (user-not-found)
  (displayln "User not found")
  (login-screen))

(define (login-screen)
  (displayln "Enter a command:")
  (displayln "1) login")
  (displayln "2) exit")
  (define option (read-line))
  (cond [(or (string=? option "2") (string=? option "exit"))
         #f]
        [(or (string=? option "1") (string=? option "login"))
         (or (login-user) (user-not-found))]
        [else (login-screen)]))


(define (login-user)
  (printf "Username: ")
  (define user (read-line))
  (define passwd (read-password "Password: "))
  (db-signin user passwd))

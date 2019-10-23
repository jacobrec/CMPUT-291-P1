#lang racket

(require "../utils/password.rkt")
(require "../utils/io.rkt")
(require "../utils/screen.rkt")
(require "../sql.rkt")
(provide login-screen)

(define (user-not-found)
  (displayln "User not found")
  (login-screen))

(define (login-user)
  (define user (prompt "Username: "))
  (define passwd (read-password "Password: "))
  (sqlify-maybe-row "src/sql/queries/0_login.sql"
     `(("usr" . ,user) ("passwd" . ,passwd))))


(define (login-screen)
  (screen "Please sign in to use App:"
    `(("login" . ,(lambda () (or (login-user) (user-not-found))))
      ("exit" . ,(lambda () #f)))))

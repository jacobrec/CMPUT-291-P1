#lang racket

(require "../utils/password.rkt")
(require "../sql.rkt")
(provide login-screen)

(define (user-not-found)
  (displayln "User not found")
  (login-screen))

(define (test-menu-item m1 m2 option)
  (or (string=? m1 option)
      (string=? m2 option)))

(define (login-screen)
  (displayln "Please sign in to use App:")
  (displayln "1) login")
  (displayln "2) exit")
  (flush-output)
  (define option (read-line))
  (cond
         [(test-menu-item "1" "login" option) (or (login-user) (user-not-found))]
         [(test-menu-item "2" "exit" option) #f]
         [else (login-screen)]))


(define (login-user)
  (define user (prompt "Username: "))
  (define passwd (read-password "Password: "))
  (db-signin user passwd))

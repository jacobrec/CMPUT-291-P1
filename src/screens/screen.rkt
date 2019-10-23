#lang racket

(require racket/generator)

(require "../utils/password.rkt")
(require "../sql.rkt")

(provide main-menu)

(define (create-screen prompt options)
  ;Create hashtable with entries for both text and number of the menu entry
  (define menu-items
    (for/hash ([kv-pair (stream-append
                          (for/stream ([i (in-naturals)][o (map cadr options)])
                                      (cons (number->string i) o))
                          options)])
              (values (car kv-pair) (cdr kv-pair))))
  ;Define function to print menu and handle input
  (define (screen)
    (displayln prompt)
    (displayln menu-items)
    (define chosen-fn (hash-ref menu-items (read-line) #f))
    (displayln chosen-fn)
    ;TODO: Figure out exactly what this function should return
    ;so that it can easily guide program flow
    (if (procedure? chosen-fn) (chosen-fn) chosen-fn))
  screen)

(define (login-user)
  (define user (prompt "Username: "))
  (define passwd (read-password "Password: "))

  (sqlify-maybe-row "sql/queries/0_login.sql"
     `(("usr" . ,user) ("passwd" . ,passwd))))

(define main-menu (create-screen "Please sign in:"
                     (list (list "login" (lambda () (or (login-user) (displayln "Unknown user.")))) (list "exit" #t))))
(define (welcome)
  (unless (main-menu) (welcome)))
(welcome)

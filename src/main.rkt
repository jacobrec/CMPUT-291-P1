#lang racket

(require "screens/login.rkt")
(require "screens/options.rkt")

(define (welcome)
  (define user (login-screen))

  ;; If user is false, they gave up and signed out
  (when user
    (begin
      (option-screen
        (vector-ref user 2)
        (vector-ref user 3))
      (welcome))))

(with-handlers ([exn:break?
                  (lambda (e)
                    (displayln "Bye Bye"))])
  (welcome))

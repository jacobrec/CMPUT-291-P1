#lang racket

(require "../operations.rkt")
(require "../utils/screen.rkt")
(provide option-screen)

(define (other-screen)
  (screen
    "You are not a traffic officer, or a registry agent. Please leave"
    `(("signout" . ,(lambda () #f)))))

(define (officer-screen)
  (screen "Enter a command:"
    `(("issue a ticket" . ,issue-ticket)
      ("find a car owner" . ,find-car-owner)
      ("signout" . ,(lambda () #f)))))

(define (agent-screen city)
  (screen "Enter a command:"
    `(("register a birth" . ,(lambda () (register-a-birth city)))
      ("register a marriage" . ,(lambda () (register-a-marriage city)))
      ("renew a vehicle registration" . ,renew-vehicle-registration)
      ("process a bill of sale" . ,process-bill-of-sale)
      ("process a payment" . ,process-payment)
      ("get a driver abstract" . ,get-driver-abstract)
      ("signout" . ,(lambda () #f)))))


(define (option-screen user-type city)
  (and (cond
         [(string=? "o" user-type) (officer-screen)]
         [(string=? "a" user-type) (agent-screen city)]
         [else (other-screen)])
       (option-screen user-type city)))


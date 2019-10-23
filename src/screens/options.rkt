#lang racket

(require "../operations.rkt")
(require "../utils/screen.rkt")
(provide option-screen)

(define (officer-screen)
  (screen "Enter a command:"
    `(("Issue a ticket" . ,issue-ticket)
      ("Find a car owner" . ,find-car-owner)
      ("signout" . ,(lambda () #f)))))

(define (agent-screen)
  (screen "Enter a command:"
    `(("Register a birth" . ,register-a-birth)
      ("Register a marriage" . ,register-a-marriage)
      ("Renew a vehicle registration" . ,renew-vehicle-registration)
      ("Process a bill of sale" . ,process-bill-of-sale)
      ("Process a payment" . ,process-payement)
      ("Get a driver abstract" . ,get-driver-abstract)
      ("signout" . ,(lambda () #f)))))


(define (option-screen is-officer)
  (and (if is-officer
         (officer-screen)
         (agent-screen))
       (option-screen is-officer)))


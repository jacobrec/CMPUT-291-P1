#lang racket

(require "../operations.rkt")
(require "../utils/screen.rkt")
(provide option-screen)

(define (officer-screen)
  (screen "Enter a command:"
    `(("issue a ticket" . ,issue-ticket)
      ("find a car owner" . ,find-car-owner)
      ("signout" . ,(lambda () #f)))))

(define (agent-screen)
  (screen "Enter a command:"
    `(("register a birth" . ,register-a-birth)
      ("register a marriage" . ,register-a-marriage)
      ("renew a vehicle registration" . ,renew-vehicle-registration)
      ("process a bill of sale" . ,process-bill-of-sale)
      ("process a payment" . ,process-payement)
      ("get a driver abstract" . ,get-driver-abstract)
      ("signout" . ,(lambda () #f)))))


(define (option-screen is-officer)
  (and (if is-officer
         (officer-screen)
         (agent-screen))
       (option-screen is-officer)))


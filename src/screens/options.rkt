#lang racket

(require "../operations.rkt")
(provide option-screen)

(define (test-menu-item m1 m2 option)
  (or (string=? m1 option)
      (string=? m2 option)))

(define (option-screen is-officer)
  (if is-officer
    (begin
      (displayln "1) Issue a ticket")
      (displayln "2) Find a car owner"))
    (begin
      (displayln "Enter a command:")
      (displayln "1) Register a birth")
      (displayln "2) Register a marriage")
      (displayln "3) Renew a vehicle registration")
      (displayln "4) Process a bill of sale")
      (displayln "5) Process a payment")
      (displayln "6) Get a driver abstract")))
  (define sout-num (if is-officer 3 7))
  (printf "~a) logout\n" sout-num)
  (define option (read-line))
  (define is-repeat
    (cond
      [(and (not is-officer) (test-menu-item "1" "Register a birth" option))
       (register-a-birth)]
      [(and (not is-officer) (test-menu-item "2" "Register a marriage" option))
       (register-a-marriage)]
      [(and (not is-officer) (test-menu-item "3" "Renew a vehicle registration" option))
       (renew-vehicle-registration)]
      [(and (not is-officer) (test-menu-item "4" "Process a bill of sale" option))
       (process-bill-of-sale)]
      [(and (not is-officer) (test-menu-item "5" "Process a payment" option))
       (process-payement)]
      [(and (not is-officer) (test-menu-item "6" "Get a driver abstract" option))
       (get-driver-abstract)]
      [(and is-officer (test-menu-item "1" "Issue a ticket" option))
       (issue-ticket)]
      [(and is-officer (test-menu-item "2" "Find a car owner" option))
       (find-car-owner)]
      [(test-menu-item (number->string sout-num) "signout" option) #f]))
  (when is-repeat
    (option-screen is-officer)))


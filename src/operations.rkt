#lang racket

(require "sql.rkt")
(require "utils/io.rkt")
(provide (all-defined-out))


(define (register-a-birth city)
  void)

(define (register-a-marriage city)
  void)

(define (renew-vehicle-registration)
  void)

(define (process-bill-of-sale)
  void)

(define (process-payment)
  (define tickParams (get-dict-from-user '(("Ticket Number" "tno" "number"))))
  (define tick (sqlify-maybe-row "src/sql/queries/5_get_ticket.sql" tickParams))
  (displayln tick)
  (when tick (sqlify-display (list tick) '("Registration" "Fine" "Violation" "Date")))
  (when (confirm "Make Payment")
    (define pParams '())
    (sqlify-exec "src/sql/queries/5_make_payment.sql" pParams))
  )

(define (get-driver-abstract)
  void)

(define (issue-ticket)
  (define regParams (get-dict-from-user '(("Registration Number" "regno" "number"))))
  (define regInfo
    (sqlify-maybe-row "src/sql/queries/7_display_reg.sql"
      regParams))

  (when regInfo
    (sqlify-display
      (list regInfo)
     '("First Name" "Last Name" "Make" "Model" "Color" "Year"))

    (when (confirm "Issue Ticket")
      (define params
        (get-dict-from-user
          '(("Violation Date" "vdate" "date-or-today")
            ("Violation Text" "vtext" "text")
            ("Fine Amount" "vamount" "number"))))
      (dict-set! params "regno" (dict-ref regParams "regno"))
      (dict-set! params "tno" (create-id))
      (sqlify-exec "src/sql/queries/7_issue_ticket.sql" params)))

  (unless regInfo
    (displayln "Registration not found, try again")
    (issue-ticket)))


(define (find-car-owner)
  (define returned-columns
   '("Make" "Model" "Color" "Year" "Plate" "Registration Date" "Expiry Date" "First Name" "Last Name"))
  (define returned-lengths
    '(15 15 15 6 9 20 20 15 15))
  (define params
      (get-dict-from-user
        '(("Make" "make" "text-ish")
          ("Model" "model" "text-ish")
          ("Color" "color" "text-ish")
          ("Year" "year" "number-ish")
          ("Plate" "plate" "text-ish"))))
  (define data
    (sqlify-rows "src/sql/queries/8_find_cars.sql"
      params))

  (define used-columns '("Make" "Model" "Color" "Year" "Plate"))

  (if (> (length data) 4)
    (sqlify-select-and-expand data
      returned-columns
      used-columns
      returned-lengths
      returned-columns)
    (sqlify-display data
      returned-columns
      returned-columns
      returned-lengths)))


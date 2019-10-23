#lang racket

(require "sql.rkt")
(require "utils/io.rkt")
(provide (all-defined-out))


(define (register-a-birth)
  void)

(define (register-a-marriage)
  void)

(define (renew-vehicle-registration)
  void)

(define (process-bill-of-sale)
  void)

(define (process-payement)
  void)

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
    (issue-ticket)))


(define (find-car-owner)
  void)

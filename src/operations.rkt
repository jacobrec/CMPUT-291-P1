#lang racket

(require racket/date)
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
  (define regParams (get-dict-from-user '(("Registration Number" . "regno"))))
  (define regInfo
    (sqlify-maybe-row "src/sql/queries/7_display_reg.sql"
      regParams))

  (when regInfo
    (sqlify-display
      (list regInfo)
     '("fname" "lname" "make" "model" "color" "year"))

    (when (confirm "Issue Ticket")
      (define params
        (get-dict-from-user
          '(("Violation Date" . "vdate")
            ("Violation Text" . "vtext")
            ("Fine Amount" . "vamount"))))
      (dict-set! params "regno" (dict-ref regParams "regno"))
      (dict-set! params "tno" (create-id))
      (unless (non-empty-string? (dict-ref params "vdate"))
        (dict-set! params "vdate" (sqlify-date (current-date))))
      (sqlify-exec "src/sql/queries/7_issue_ticket.sql" params)))

  (unless regInfo
    (issue-ticket)))


(define (find-car-owner)
  void)

(issue-ticket)
(exit)

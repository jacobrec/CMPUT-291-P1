#lang racket

(require "sql.rkt")
(require "utils/io.rkt")
(require "utils/iterutils.rkt")
(require db)
(provide (all-defined-out))

(define (create-person fname lname)
  (displayln (string-append "Enter details for " fname " " lname))
  (define params (get-dict-from-user '(("Birth Date" "bdate" "date-or-null")
				       ("Birth Place" "bplace" "text")
				       ("Address" "address" "text")
				       ("Phone Number" "phone" "phone-or-null"))))
  (dict-set! params "fname" fname)
  (dict-set! params "lname" lname)
  (sqlify-exec "src/sql/queries/1_create_person.sql" params))

(define (register-a-birth city)
  ;Get info about baby
  (define regParams (get-dict-from-user '(("First Name" "n_fname" "text-not-null")
					 ("Last Name" "n_lname" "text-not-null")
					 ("Gender" "n_gender" "gender")
					 ("Birth Date" "bdate" "date")
					 ("Birth Place" "bplace" "text-not-null")
					 ("Mother's First Name" "m_fname" "text-not-null")
					 ("Mother's Last Name" "m_lname" "text-not-null")
					 ("Father's First Name" "f_fname" "text-not-null")
					 ("Father's Last Name" "f_lname" "text-not-null"))))
  (dict-set! regParams "regno" (create-id))
  (dict-set! regParams "regplace" city)
  ;Check to see if parents exist in people table.  If they don't, make them
  (cond [(not(sqlify-maybe-row "src/sql/queries/1_find_mother.sql" regParams)) 
	 (create-person (dict-ref regParams "m_fname") (dict-ref regParams "m_lname"))])
  (cond [(not(sqlify-maybe-row "src/sql/queries/1_find_father.sql" regParams)) 
	 (create-person (dict-ref regParams "f_fname") (dict-ref regParams "f_lname"))])
  ;Create newborn in people table and register the birth
  (sqlify-exec "src/sql/queries/1_register_birth.sql" regParams)
  (sqlify-exec "src/sql/queries/1_create_newborn.sql" regParams))

(define (register-a-marriage city)
  ;Get info from user
  (define regParams (get-dict-from-user '(("Partner 1 - First Name" "p1_fname" "text-not-null")
					  ("Partner 1 - Last Name" "p1_lname" "text-not-null")
					  ("Partner 2 - First Name" "p2_fname" "text-not-null")
					  ("Partner 2 - Last Name" "p2_lname" "text-not-null"))))
  (dict-set! regParams "regno" (create-id))
  (dict-set! regParams "regplace" city)
  ;Check if partners exist in person table.  If they don't, make them
  (cond [(not(sqlify-maybe-row "src/sql/queries/2_find_partner1.sql" regParams))
	 (create-person (dict-ref regParams "p1_fname") (dict-ref regParams "p1_lname"))])
  (cond [(not(sqlify-maybe-row "src/sql/queries/2_find_partner2.sql" regParams))
	 (create-person (dict-ref regParams "p2_fname") (dict-ref regParams "p2_lname"))])
  (sqlify-exec "src/sql/queries/2_register_marriage.sql" regParams))

(define (renew-vehicle-registration)
  (define regParams (get-dict-from-user '(("Registration Number" "regno" "number"))))
  (sqlify-exec "src/sql/queries/3_renew_vehicle.sql"
    regParams)

  (define data
    (sqlify-maybe-row "src/sql/queries/3_return_vehicle.sql"
      regParams))

  (if data
    (sqlify-display (list data)
      '("Registration Number" "First Name" "Last Name" "Expiry Date")
      '("Registration Number" "First Name" "Last Name" "Expiry Date")
      '(22 20 20 20))
    (displayln "No registration found")))

(define (process-bill-of-sale)
  (define vin (get-dict-from-user '(("vin" "vin" "text-not-null"))))
  (define currOwn (get-dict-from-user '(("Current Owner's Name" "c" "name"))))
  (displayln vin)
  (define allOwners (sqlify-rows "src/sql/queries/4_owner.sql" vin))
  (displayln allOwners)
  (cond [(empty? allOwners) (displayln "No registration for the given vin.")]
        [(not (andmap string-ci=? (vector->list (car allOwners)) (dict-values currOwn)))
         (displayln "Given owner is not the most recent, aborting.")]
        [else (let ([newParams (get-dict-from-user '(("New Owner's Name" "n" "name")
                                                     ("New Plate Number" "pno" "text-not-null")))])
                (dict-set! newParams "regno" (create-id))
                (dict-set! newParams "vin" vin)
                (dict-set! newParams "c_fn" (dict-ref currOwn "c_fn"))
                (dict-set! newParams "c_ln" (dict-ref currOwn "c_ln"))
                (sqlify-exec "src/sql/queries/4_transfer.sql" newParams)
            )])
  )

(define (process-payment)
  (define tickParams (get-dict-from-user '(("Ticket Number" "tno" "number"))))
  (define tick (sqlify-maybe-row "src/sql/queries/5_ticket_info.sql" tickParams))
  (if tick
    (begin
      (sqlify-display (list tick) '("Registration" "Fine" "Violation" "Date")
                      #:print-styler sqlify-wrap-text)
      (when (confirm "Make Payment")
        (define amtLeft (- (vector-ref tick 1) (vector-ref tick 4)))
        (define prompt (string-append "Amount (" (number->string amtLeft) " Owed)"))
        (define pParams (get-dict-from-user `((,prompt "pamt" "number"))))
        (if (< amtLeft (string->number (dict-ref pParams "pamt"))) (displayln "Cannot pay more than what is owed.")
          (begin
            (dict-set! pParams "tno" (dict-ref tickParams "tno"))
            (sqlify-exec "src/sql/queries/5_make_payment.sql" pParams)))))
    (displayln "No ticket found.")))


(define (get-driver-abstract)
  (define driverParams (get-dict-from-user '(("Driver's Name" "d" "name"))))
  (define abstract (sqlify-maybe-row "src/sql/queries/6_get_abstract.sql" driverParams))
  (displayln abstract)
  (when abstract
    (sqlify-display (list abstract)
                    '("Tickets Recieved" "Demerit Notices Recieved" "Demerit Points in the Past 2 Years" "Total Demerit Points")
                    #:print-styler sqlify-wrap-text)
    (when (confirm "See Ticket Details?")
      (define ticks (map vector->list (sqlify-rows "src/sql/queries/6_ticks.sql" driverParams)))
      (for/and ([s (segment ticks 2)])
               (sqlify-display s '("Ticket Number" "Date Issued" "Violation" "Fine" "Registration" "Make" "Model") #:print-styler sqlify-wrap-text)
               (confirm "See more?")
               ))
  )
  (unless abstract (displayln "Could not find the given driver.")))

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


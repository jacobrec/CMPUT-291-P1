#lang racket

(require "../sql.rkt")
(require "io.rkt")
(provide find-person)
(provide create-person)
(provide insert-person)

(define (find-person inputs) 
  (sqlify-maybe-row "src/sql/queries/1_find_person.sql" inputs))

(define (create-person details)
  ;requires that you pass in a first and last name in details
  ;try to fill in any missing details (everything but name can be void)
  (define params (get-dict-from-user '(("Birth Date" "bdate" "date-or-null")
				       ("Birth Place" "blace" "text")
				       ("Address" "address" "text")
				       ("Phone Number" "phone" "phone-or-null"))))
  (dict-set! params "fname" (dict-ref details "fname"))
  (dict-set! params "lname" (dict-ref details "lname"))
  (sqlify-exec "src/sql/queries/1_create_person.sql" params))

(define (insert-person details)
  ;details MUST include first and last name, this isn't checked here
  ;and should have entries (can be null) for birth date, place, address, and phone number
  (sqlify-exec "src/sql/queries/1_create_person.sql" details))

#lang racket

(require ffi/unsafe)
(require "io.rkt")
(provide read-password)

(define read-password prompt)
(define libm (ffi-lib #f))

; Usage
; (displayln (read-password "Prompt:"))
(set! read-password
  (get-ffi-obj 'getpass libm (_fun _string/utf-8 -> _string/utf-8)
         (lambda () (prompt))))

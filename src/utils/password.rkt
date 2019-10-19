#lang racket

(provide read-password)

(require ffi/unsafe)
(define libm (ffi-lib "/usr/lib/libc-2.30"))


; Usage
; (displayln (read-password "Prompt:"))
(define read-password
  (get-ffi-obj 'getpass libm (_fun _string/utf-8 -> _string/utf-8)
         (lambda () (read-line))))


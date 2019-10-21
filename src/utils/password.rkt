#lang racket

(require ffi/unsafe)
(provide read-password)
(provide prompt)


(define has-libc #t)
(define (prompt word)
  (if has-libc
    (display word)
    (begin (displayln word) (flush-output)))
  (read-line))
(define read-password prompt)
(define libm (ffi-lib "/usr/lib/libc-2.30"
                      #:fail (lambda () (set! has-libc #f))))


; Usage
; (displayln (read-password "Prompt:"))
(when has-libc
  (set! read-password
    (get-ffi-obj 'getpass libm (_fun _string/utf-8 -> _string/utf-8)
           (lambda () (read-line)))))


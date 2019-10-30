#lang racket

(provide zip-longest)

(define (zip-longest fill-value . sqns)
  ;(map list sqns) ;works if all sequences have same length
  ;(apply map list sqns) ;works as above, but takes one list of sequences
  ;(define (falses) (stream-cons #f (falses))) ;Infinite sequence
  (let loop ([all sqns][has 0]) 
    ;(displayln all)
    (for/lists (fsts rsts 
                     #:result (if (= has 0) empty-stream (stream-cons fsts (loop rsts 0))))
               ([s all])
      ;(printf "~a ~a\n" s emptied)
      (unless (empty? s) (set! has 1)) 
      (values (if (empty? s) fill-value (car s)) 
              (if (empty? s) '() (cdr s)))
      )))

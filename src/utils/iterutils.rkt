#lang racket

(provide zip-longest)
(provide segment)

(define (zip-longest fill-value . sqns)
  ;(map list sqns) ;works if all sequences have same length
  ;(apply map list sqns) ;works as above, but takes one list of sequences
  ;(define (falses) (stream-cons #f (falses))) ;Infinite sequence
  (let loop ([all sqns][has 0]) 
    (for/lists (fsts rsts 
                     #:result (if (= has 0) empty-stream (stream-cons fsts (loop rsts 0))))
               ([s all])
      (unless (empty? s) (set! has 1)) 
      (values (if (empty? s) fill-value (car s)) 
              (if (empty? s) '() (cdr s)))
      )))

(define (segment lst size)
  (let loop ([left lst])
    (for/fold ([seg '()][rem left]
               #:result (stream-cons (reverse seg) (if (empty? rem) empty-stream (loop rem))))
               ([l left][i (in-range 0 size)])
      (values (cons l seg) (cdr rem))
      )))

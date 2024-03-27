#lang racket
;TDA type

(define isType?
  (lambda (type-class)
    (if (or
         (or
          (or (equal? type-class "r") (equal? type-class "m")) (equal? type-class "c")) (equal? type-class "t"))
        (car (cons type-class null))
        (display "La letra de tipo ingresada no es valida"))))
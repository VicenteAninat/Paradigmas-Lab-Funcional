#lang racket
;TDA type


;Pertenencia

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define (is-type? char)
  (cond
    ((char=? char #\c) 'c)
    ((char=? char #\t) 't)
    ((char=? char #\r) 'r)
    ((char=? char #\m) 'm)))


;Constructores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define c
  (is-type? #\c))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define t
  (is-type? #\t))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define r
  (is-type? #\r))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define m
  (is-type? #\m))

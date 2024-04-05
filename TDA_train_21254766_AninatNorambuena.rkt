#lang racket

;TDA train


;Constructor

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define train
  (lambda (id maker rail-type speed station-stay-type . pcar)
    (list id maker rail-type speed station-stay-type pcar)))


;Selectores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-id-train
  (lambda train
    (car train)))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-maker-train
  (lambda train
    (car (cdr train))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-rail-type-train
  (lambda train
    (car (cddr train))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-speed-train
  (lambda train
    (car (cdddr train))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-station-stay-type
  (lambda train
    (car (cdr(cdddr train)))))

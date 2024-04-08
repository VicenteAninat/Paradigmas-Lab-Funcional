#lang racket

;TDA driver


;Constructor

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define driver
  (lambda (id nombre train-maker)
    (list id nombre train-maker)))


;Selectores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-id-driver
  (lambda (driver)
    (car driver)))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-nombre-driver
  (lambda (driver)
    (car (cdr driver))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-train-maker
  (lambda (driver)
    (car (cddr driver))))

#lang racket

;TDA driver


;Constructor

;Descripción: Función que permite crear un conductor cuya habilitación
;de conducción depende del fabricante de tren (train-maker)
;Dominio: id (int) X nombre (string) X train-maker (string)
;Recorrido: driver
;Recursión: No aplica
(define driver
  (lambda (id nombre train-maker)
    (list id nombre train-maker)))


;Selectores

;Descripción: Extrae el id de un conductor
;Dominio: driver
;Recorrido: int
;Recursión: No aplica
(define get-id-driver
  (lambda (driver)
    (car driver)))

;Descripción: Extrae el nombre de un conductor
;Dominio: driver
;Recorrido: int
;Recursión: No aplica
(define get-nombre-driver
  (lambda (driver)
    (car (cdr driver))))

;Descripción: Extrae el train maker de un conductor
;Dominio: driver
;Recorrido: string
;Recursión: No aplica
(define get-train-maker
  (lambda (driver)
    (car (cddr driver))))

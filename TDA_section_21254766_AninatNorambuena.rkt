#lang racket
(require "TDA_type_21254766_AninatNorambuena.rkt")
(require "TDA_station_21254766_AninatNorambuena.rkt")
(provide section)
(provide get-point1-section)
(provide get-point2-section)
(provide get-distance-section)
(provide get-cost-section)

;TDA section


;Constructor

;Descripción: Función que permite establecer enlaces entre dos estaciones.
;Dominio: point1 (station)  X point2 (station) X distance (int positivo)
;X cost (int positivo). 
;Recorrido: section
;Recursión: No aplica
(define section
  (lambda (point1 point2 distance cost)
    (list point1 point2 distance cost)))


;Selectores

;Descripción: Extrae el point1 de una section
;Dominio: section
;Recorrido: station
;Recursión: No aplica
(define get-point1-section
  (lambda (section)
    (car section)))

;Descripción: Extrae el point2 de una station
;Dominio: section
;Recorrido: station
;Recursión: No aplica
(define get-point2-section
  (lambda (section)
    (car (cdr section))))

;Descripción: Extrae la distancia de una section
;Dominio: section
;Recorrido: int positivo
;Recursión: No aplica
(define get-distance-section
  (lambda (section)
    (car (cddr section))))

;Descripción: Extrae el costo de una section
;Dominio: section
;Recorrido: int positivo
;Recursión: No aplica
(define get-cost-section
  (lambda (section)
    (car (cdddr section))))


;Modificadores

;Descripción: Modifica el point1 de una section
;Dominio: section X station
;Recorrido: section 
;Recursión: No aplica
(define set-point1-section
  (lambda (section point1)
    (list point1 (get-point2-section section)
          (get-distance-section section) (get-cost-section section))))

;Descripción: Modifica el point2 de una section
;Dominio: section X station
;Recorrido: section
;Recursión: No aplica
(define set-point2-section
  (lambda (section point2)
    (list (get-point1-section section) point2
          (get-distance-section section) (get-cost-section section))))

;Descripción: Modifica la distania de una section
;Dominio: section X int positivo
;Recorrido: section
;Recursión: No aplica
(define set-distance-section
  (lambda (section distance)
    (list (get-point1-section section) (get-point2-section section)
          distance (get-cost-section section))))

;Descripción: Modifica el costo de una section
;Dominio: section X int positivo
;Recorrido: section
;Recursión: No aplica
(define set-cost-section
  (lambda (section cost)
    (list (get-point1-section section) (get-point2-section section)
          (get-distance-section section) cost)))

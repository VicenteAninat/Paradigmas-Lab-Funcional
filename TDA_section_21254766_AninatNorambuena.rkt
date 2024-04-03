#lang racket
;TDA section

;Constructor

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define section
  (lambda (point1 point2 distance cost)
    (list point1 point2 distance cost)))


;Selectores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define get-point1-section
  (lambda section
    (car section)))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define get-point2-section
  (lambda section
    (car (cdr section))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define get-distance-section
  (lambda section
    (car (cddr section))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define get-cost-section
  (lambda section
    (car (cdddr section))))


;Modificadores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define set-point1-section
  (lambda (section point1)
    (list point1 (get-point2-section section)
          (get-distance-section section) (get-cost-section section))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define set-point2-section
  (lambda (section point2)
    (list (get-point1-section section) point2
          (get-distance-section section) (get-cost-section section))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define set-distance-section
  (lambda (section distance)
    (list (get-point1-section section) (get-point2-section section)
          distance (get-cost-section section))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:
(define set-cost-section
  (lambda (section cost)
    (list (get-point1-section section) (get-point2-section section)
          (get-distance-section section) cost)))

#lang racket

;TDA pcar


;Constructor

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define pcar
  (lambda (id capacity model type)
    (list id capacity model type)))


;Selectores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-id-pcar
  (lambda pcar
    (car pcar)))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-capacity-pcar
  (lambda pcar
    (car (cdr pcar))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-model-pcar
  (lambda pcar
    (car (cddr pcar))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-type-pcar
  (lambda pcar
    (car (cdddr pcar))))


;Modificadores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define set-id-pcar
  (lambda (pcar id)
    (list id (get-capacity-pcar pcar)
          (get-model-pcar pcar) (get-type-pcar pcar))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define set-capacity-pcar
  (lambda (pcar capacity)
    (list (get-id-pcar pcar) capacity
          (get-model-pcar pcar) (get-type-pcar pcar))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define set-model-pcar
  (lambda (pcar model)
    (list (get-id-pcar pcar) (get-capacity-pcar pcar)
          model (get-type-pcar pcar))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define set-type-pcar
  (lambda (pcar type)
    (list (get-id-pcar pcar) (get-capacity-pcar pcar)
          (get-model-pcar pcar) type)))

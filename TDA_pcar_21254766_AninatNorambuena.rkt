#lang racket

;TDA pcar


;Constructor

;Descripción: Permite crear los carros de pasajeros que conforman un convoy.
;Los carros pueden ser de tipo terminal (t) o central (c)
;Dominio: id (int) X capacity (positive integer) X model (string) X type (car-type)
;Recorrido: pcar
;Recursión: No aplica
(define pcar
  (lambda (id capacity model type)
    (list id capacity model type)))


;Selectores

;Descripción: Función que extrae el id de un pcar
;Dominio: pcar
;Recorrido: int
;Recursión: No aplica
(define get-id-pcar
  (lambda pcar
    (car pcar)))

;Descripción: Función que extrae la capacidad de un pcar
;Dominio: pcar
;Recorrido: int
;Recursión: No aplica
(define get-capacity-pcar
  (lambda pcar
    (car (cdr pcar))))

;Descripción: Función que extrae el modelo de un pcar
;Dominio: pcar
;Recorrido: string
;Recursión: No aplica
(define get-model-pcar
  (lambda pcar
    (car (cddr pcar))))

;Descripción: Función que extrae el tipo de carro de un pcar
;Dominio: pcar
;Recorrido: car-type
;Recursión: No aplica
(define get-type-pcar
  (lambda pcar
    (car (cdddr pcar))))


;Modificadores

;Descripción: Modifica el id de un pcar
;Dominio: pcar X int
;Recorrido: pcar
;Recursión: No aplica
(define set-id-pcar
  (lambda (pcar id)
    (list id (get-capacity-pcar pcar)
          (get-model-pcar pcar) (get-type-pcar pcar))))

;Descripción: Modifica la capacidad de un pcar
;Dominio: pcar X int
;Recorrido: pcar
;Recursión: No aplica
(define set-capacity-pcar
  (lambda (pcar capacity)
    (list (get-id-pcar pcar) capacity
          (get-model-pcar pcar) (get-type-pcar pcar))))

;Descripción: Modifica el modelo de un pcar
;Dominio: pcar X string
;Recorrido: pcar
;Recursión: No aplica
(define set-model-pcar
  (lambda (pcar model)
    (list (get-id-pcar pcar) (get-capacity-pcar pcar)
          model (get-type-pcar pcar))))

;Descripción: Modifica el tipo de carro de un pcar
;Dominio: pcar X car-type
;Recorrido: pcar
;Recursión: No aplica
(define set-type-pcar
  (lambda (pcar type)
    (list (get-id-pcar pcar) (get-capacity-pcar pcar)
          (get-model-pcar pcar) type)))

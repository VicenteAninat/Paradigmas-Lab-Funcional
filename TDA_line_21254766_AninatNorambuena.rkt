#lang racket
;TDA line


;Constructor

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define line
  (lambda (id name rail-type . section)
    (list id name rail-type (delete-duplicate section))))


;Selectores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-id-line
  (lambda line
    (car line)))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-name-line
  (lambda line
    (car (cdr line))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-rail-type-line
  (lambda line
    (car (cddr line))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-section-line
  (lambda line
    (car (cdddr line))))


;Modificadores

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define set-id-line
  (lambda (line id)
    (list id (get-name-line line)
          (get-rail-type-line line) (get-section-line line))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define set-name-line
  (lambda (line name)
    (list (get-id-line line) name
          (get-rail-type-line line) (get-section-line line))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define set-rail-type-line
  (lambda (line rail-type)
    (list (get-id-line line) (get-name-line line)
          rail-type (get-section-line line))))

;Descripción: Función que permite añadir tramos a una línea
;Dominio:
;Recorrido:
;Recursión:




;Pertenencia

;Descripción: Función que permite determinar si un elemento
;cumple con las restricciones señaladas en apartados
;anteriores en relación a las estaciones y tramos para
;poder conformar una línea.
;Dominio:
;Recorrido:
;Recursión:



;Auxiliares

;Descripción: Función que permite determinar el largo total
;de una línea
;Dominio:
;Recorrido:
;Recursión: No aplica



;Descripción: Función que permite determinar el trayecto entre una estación origen y una final.
;Dominio:
;Recorrido:
;Recursión:



;Descripción: Función que permite determinar el costo total (monetario) de recorrer una línea.
;Dominio:
;Recorrido:
;Recursión:



;Descripción: Función que permite determinar el costo de un trayecto entre una estación origen y una final.
;Dominio:
;Recorrido:
;Recursión:



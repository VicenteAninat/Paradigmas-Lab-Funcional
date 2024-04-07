#lang racket
(require "TDA_type_21254766_AninatNorambuena.rkt")
(require "TDA_station_21254766_AninatNorambuena.rkt")
(require "TDA_section_21254766_AninatNorambuena.rkt")
(provide line)
(provide get-section-line)
(provide get-id-line)
(provide line-length)
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
  (lambda (line)
    (car line)))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-name-line
  (lambda (line)
    (car (cdr line))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-rail-type-line
  (lambda (line)
    (car (cddr line))))

;Descripción:
;Dominio:
;Recorrido:
;Recursión:

(define get-section-line
  (lambda (line)
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

(define line-length
  (lambda (line)
    (apply + (map get-distance-section(get-section-line line)))))


(define identificar-station
  (lambda (name station)
    (if (equal? (get-name-station station) name)
        station
        null)))

;(define identificar-section-start
;  (lambda station section-list null))
    

(define cortar-linea
  (lambda (section-list station-name) null))
    

;Descripción: Función que permite determinar el trayecto entre una estación origen y una final.
;Dominio:
;Recorrido:
;Recursión:

;(define line-section-length
;  (lambda (line station1-name station2-name)
;    ((define argumentos (station1-name (map get-point1-section (get-section-line line))))
;     (apply identificar-station argumentos))))

;Descripción: 
;Dominio:
;Recorrido:
;Recursión:

(define intern-cost
      (lambda (section-list)
        (if (null? section-list)
            0
            (+ (get-cost-section (car section-list)) (intern-cost (cdr section-list)))
            )))

;Descripción: Función que permite determinar el costo total (monetario) de recorrer una línea.
;Dominio:
;Recorrido:
;Recursión:

(define line-cost
  (lambda (line)
    (intern-cost (get-section-line line))))

;Descripción: Función que permite determinar el costo de un trayecto entre una estación origen y una final.
;Dominio:
;Recorrido:
;Recursión:



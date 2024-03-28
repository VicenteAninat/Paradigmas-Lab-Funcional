#lang racket
;TDA station


;Constructor

;Descripción: Función constructora de una estación de metro
;Dominio: id (int) X name (string) X type (station-type) X stop-time (int positivo)
;Recorrido: station
;Recursión: No aplica
(define station
  (lambda (id name type stop-time)
    (list id name type stop-time)
    ))


;Selectores

;Descripción: Extrae el id de una estación
;Domino: station
;Recorrido: id (int)
;Recursión: No aplica
(define get-id-station
  (lambda station
    (car station)
    ))

;Descripción: Extrae el nombre de una estación
;Domino: station
;Recorrido: name (string)
;Recursión: No aplica
(define get-name-station
  (lambda station
    (car (cdr station))
    ))

;Descripción: Extrae el tipo de una estación
;Domino: station
;Recorrido: type (station-type)
;Recursión: No aplica
(define get-type-station
  (lambda station
    (car (cddr station))
    ))

;Descripción: Extrae el tiempo de detención de una estación
;Domino: station
;Recorrido: stop-time (int positivo)
;Recursión: No aplica
(define get-stop-time-station
  (lambda station
    (car (cdddr station))
    ))


;Modificadiores

;Descripción: Modifica el id de una estación
;Domino: station X id (int)
;Recorrido: station
;Recursión: No aplica
(define set-id-station
  (lambda (station id)
    (list id (get-name-station station) (get-type-station)
          (get-stop-time-station station))
    ))

;Descripción: Modifica el nombre de una estación
;Domino: station X name (string)
;Recorrido: station
;Recursión: No aplica
(define set-name-station
  (lambda (station name)
    (list (get-id-station station) name (get-type-station station)
          (get-stop-time-station station))
    ))

;Descripción: Modifica el tipo de una estación
;Domino: station X type (station-type)
;Recorrido: station
;Recursión: No aplica
(define set-type-station
  (lambda (station type)
    (list (get-id-station station) (get-name-station station)
          type (get-stop-time-station station))
    ))

;Descripción: Modifica el tiempo de detención de una estación
;Domino: station X stop-time (int positivo)
;Recorrido: station
;Recursión: No aplica
(define set-stop-time-station
  (lambda (station stop-time)
    (list (get-id-station station) (get-name-station station)
          (get-type-station station) stop-time)
    ))

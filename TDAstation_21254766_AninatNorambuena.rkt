#lang racket
(require "TDAtype_21254766_AninatNorambuena.rkt")
(provide station)
(provide get-id-station)
(provide get-name-station)
(provide get-type-station)
(provide get-stop-time-station)
(provide filtrar)
(provide delete-duplicate)
(provide member?)

;TDA station


;Constructor

;Descripción: Función constructora de una estación de metro, el tipo puede
;ser r (abordar y dejar pasajeros), t (terminal), c (combinación)
;o m () mantención
;Dominio: id (int) X name (String)  X type (station-type) X stop-time (int positivo)
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
  (lambda (station)
    (car station)
    ))

;Descripción: Extrae el nombre de una estación
;Domino: station
;Recorrido: name (string)
;Recursión: No aplica
(define get-name-station
  (lambda (station)
    (car (cdr station))
    ))

;Descripción: Extrae el tipo de una estación
;Domino: station
;Recorrido: type (station-type)
;Recursión: No aplica
(define get-type-station
  (lambda (station)
    (car (cddr station))
    ))

;Descripción: Extrae el tiempo de detención de una estación
;Domino: station
;Recorrido: stop-time (int positivo)
;Recursión: No aplica
(define get-stop-time-station
  (lambda (station)
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


;Auxiliares

;Descripción: Retorna una lista de todos los elementos que sean distintos a un numero
;Dominio: lista (list) X elem (int)
;Recorrido: list
;Recursión: Natural
(define filtrar
  (lambda (lista elem)
    (if (null? lista)
        '()
        (if (not (equal? elem (car lista)))
            (cons (car lista) (filtrar (cdr lista) elem))
            (filtrar (cdr lista) elem)))))


;Descripción: Elimina duplicados de una lista
;Dominio: lista (list)
;Recorrido: list
;Recursión: Natural
(define delete-duplicate
  (lambda (lista)
    (if (null? lista)
        '()
        (cons (car lista) (delete-duplicate (filtrar lista (car lista)))))))

;Descripción: Determina si un elemento está en una lista
;Dominio: n(any) - list(any list)
;Recorrido: bool
;Recursión: No aplica
(define member?
  (lambda (n list)
    (not (equal? (member n list) #f))))

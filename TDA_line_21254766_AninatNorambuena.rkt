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

;Descripción: Función que permite crear una línea
;Dominio: id (int) X name (string) X rail-type (string) X section*
;Recorrido: line
;Recursión: No aplica
(define line
  (lambda (id name rail-type . section)
    (list id name rail-type (delete-duplicate section))))


;Selectores

;Descripción: Extrae el id de una linea
;Dominio: line
;Recorrido: int
;Recursión: No aplica
(define get-id-line
  (lambda (line)
    (car line)))

;Descripción: Extrae el nombre de una linea
;Dominio: line
;Recorrido: string
;Recursión: No aplica
(define get-name-line
  (lambda (line)
    (car (cdr line))))

;Descripción: Extrae el tipo de rail de una linea
;Dominio: line
;Recorrido: string
;Recursión: No aplica
(define get-rail-type-line
  (lambda (line)
    (car (cddr line))))

;Descripción: Extrae las secciones de una linea
;Dominio: line
;Recorrido: section*
;Recursión: No aplica
(define get-section-line
  (lambda (line)
    (car (cdddr line))))


;Modificadores

;Descripción: Modifica el id de una linea
;Dominio: line X int
;Recorrido: line
;Recursión: No aplica
(define set-id-line
  (lambda (line id)
    (list id (get-name-line line)
          (get-rail-type-line line) (get-section-line line))))

;Descripción: Modifica el nombre de una linea
;Dominio: line X string
;Recorrido: line
;Recursión: No aplica
(define set-name-line
  (lambda (line name)
    (list (get-id-line line) name
          (get-rail-type-line line) (get-section-line line))))

;Descripción: Modifica el tipo de rail de una linea
;Dominio: line X string
;Recorrido: line
;Recursión: No aplica
(define set-rail-type-line
  (lambda (line rail-type)
    (list (get-id-line line) (get-name-line line)
          rail-type (get-section-line line))))

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO

;Descripción: Función que permite añadir tramos a una línea
;Dominio:
;Recorrido:
;Recursión:


(define line-add-section
  (lambda (line section)
    (if ()
        ()
        (list (get-id-line line) (get-name-line line) (get-rail-type-line line) ()))))

(define line-add-section
  (lambda (line section)
    (if (member? (section) (get-section-line line))
        (list (get-id-line line) (extract-name-msg flow) (extract-option flow) )
        (list (extract-id flow) (extract-name-msg flow) (append (extract-option flow) option)))))

(define line-add-section
  (lambda (line section)
    (cond ()


    (if (equal? (get-section-line line) null)
        (section)
        (if (equal? (car (get-section-line line)) section)
            ()
            (list (get-id-line line) (get-name-line line) (get-rail-type-line line) ()))))))
            
;-----------------------------------------------------------------------------------------------------

;Pertenencia

;-----------------------------------------------------------------------------------------------------
;
;Descripción: Función que permite determinar si un elemento
;cumple con las restricciones señaladas en apartados
;anteriores en relación a las estaciones y tramos para
;poder conformar una línea.
;Dominio: line
;Recorrido: bool
;Recursión:



;Auxiliares

;Descripción: Función que permite determinar el largo total
;de una línea
;Dominio: line
;Recorrido: int
;Recursión: No aplica
(define line-length
  (lambda (line)
    (apply + (map get-distance-section(get-section-line line)))))    

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite determinar el trayecto entre una estación origen y una final.
;Dominio:
;Recorrido:
;Recursión:


;-----------------------------------------------------------------------------------------------------

;Descripción: Funcion interna para el trabajo de la sublista 
;Dominio: section*
;Recorrido: int
;Recursión: Natural
(define intern-cost
      (lambda (section-list)
        (if (null? section-list)
            0
            (+ (get-cost-section (car section-list)) (intern-cost (cdr section-list)))
            )))

;Descripción: Función que permite determinar el costo total (monetario) de recorrer una línea.
;Dominio: line
;Recorrido: int
;Recursión: Natural
(define line-cost
  (lambda (line)
    (intern-cost (get-section-line line))))

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite determinar el costo de un trayecto entre una estación origen y una final.
;Dominio:
;Recorrido:
;Recursión:

(define line-section-cost
  (lambda (line station1-name station2-name)))

;-----------------------------------------------------------------------------------------------------
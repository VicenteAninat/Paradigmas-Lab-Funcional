#lang racket
(require "TDAtype_21254766_AninatNorambuena.rkt")
(require "TDAstation_21254766_AninatNorambuena.rkt")
(require "TDAsection_21254766_AninatNorambuena.rkt")
(provide line)
(provide get-section-line)
(provide get-id-line)
(provide get-name-line)
(provide get-rail-type-line)
(provide line-length)
(provide line-section-length)
(provide line-cost)
(provide line-add-section)
(provide line-section-cost)
(provide line?)

;(provide lista-section?)


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
;Descripción: Función interna que permite añadir tramos a una línea
;Dominio: section* X section (section)
;Recorrido: section*
;Recursión: Natural
(define añadir-section
  (lambda (lista-section section)
    (if (equal? lista-section null)
        (cons section null)
        (if (equal? (car lista-section) section)
            (cons lista-section null)
            (cons (car lista-section) (añadir-section (cdr lista-section) section))))))

;Descripción: Función que permite añadir tramos a una línea
;Dominio: line (line) X section (section)
;Recorrido: line
;Recursión: Natural
(define line-add-section
  (lambda (line section)
    (list (get-id-line line) (get-name-line line) (get-rail-type-line line) (añadir-section (get-section-line line) section))))
            
;-----------------------------------------------------------------------------------------------------

;Pertenencia

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
(define llegada-universal-circular
  (lambda (lista-section)
    null
    ))

(define llegada-universal
  (lambda (lista-section)
    null))
    

;Descripción: Función que permite determinar si un elemento
;cumple con las restricciones señaladas en apartados
;anteriores en relación a las estaciones y tramos para
;poder conformar una línea.
;Dominio: line
;Recorrido: bool
;Recursión: 
(define line?
  (lambda (line)
    (cond
      [(equal? (get-section-line line) null) #f]
      [(not (equal? (get-section-line line) null)) #t];Place holder
      [(equal? (get-point1-section (car (get-section-line line)))
               (get-point2-section (car (reverse (get-section-line line)))))
       (llegada-universal-circular (get-section-line line))]
      [else (llegada-universal (get-section-line line))])
    ))

;-----------------------------------------------------------------------------------------------------
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
;Descripción: Función que permite determinar el largo de una lista de sections
;Dominio: section*
;Recorrido: int
;Recursión: No aplica
(define sacar-distancia
  (lambda (lista-sections)
    (apply + (map get-distance-section lista-sections))))

;Descripción: Función que retorna lo que hay en medio de dos elementos de una lista
;Dominio: Lista X Any X Any
;Recorrido: Lista
;Recursión: No aplica
(define cortar-lista
  (lambda (lista elem1 elem2)
    (reverse (member elem2 (reverse (member elem1 lista))))))

;Descripción: Función que retorna una estacion o vacio en base a su coincidencia con un nombre
;Dominio: station X string
;Recorrido: station
;Recursión: No aplica
(define comprobar-nombre
  (lambda (estacion nombre)
    (if (equal? (get-name-station estacion) nombre)
        (estacion)
        '())))

;Descripción: Función que encuentra una estación de una lista de estaciones
;Dominio: station*
;Recorrido: station
;Recursión: No aplica
(define encontrar-estacion
  (lambda (lista-estaciones nombre)
    (if (equal? lista-estaciones null)
        null
        (if (equal? (get-name-station (car lista-estaciones)) nombre)
            (car lista-estaciones)
            (encontrar-estacion (cdr lista-estaciones) nombre)))))

;Descripción: Función que retorna una section o vacio en base a su coincidencia con una estacion
;Dominio: 
;Recorrido: 
;Recursión: No aplica
(define comprobar-point1
  (lambda (lista-seccion estacion)
    (if (equal? lista-seccion  null)
        null
        (if (equal? (get-point1-section (car lista-seccion)) estacion)
            (car lista-seccion)
            (comprobar-point1 (cdr lista-seccion) estacion)))))

(define comprobar-point2
  (lambda (lista-seccion estacion)
    (if (equal? lista-seccion  null)
        null
        (if (equal? (get-point2-section (car lista-seccion)) estacion)
            (car lista-seccion)
            (comprobar-point2 (cdr lista-seccion) estacion)))))

;Descripción: Función que permite determinar el trayecto entre una estación origen y una final.
;Dominio:
;Recorrido:
;Recursión:
(define line-section-length
  (lambda (line nombre1 nombre2)
    (sacar-distancia (cortar-lista (get-section-line line)
                                   (comprobar-point1 (get-section-line line)
                                        (encontrar-estacion (map get-point1-section (get-section-line line)) nombre1))
                                   (comprobar-point2 (get-section-line line)
                                        (encontrar-estacion (map get-point2-section (get-section-line line)) nombre2))))))

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

(define sacar-costo
  (lambda (lista-section)
    (define sacar-costo-interno
      (lambda (lista-section acum)
        (if (equal? lista-section null)
            acum
            (sacar-costo-interno (cdr lista-section) (+ acum (get-cost-section (car lista-section)))))))
    (sacar-costo-interno lista-section 0)))

;Descripción: Función que permite determinar el costo de un trayecto entre una estación origen y una final.
;Dominio: line
;Recorrido: int
;Recursión: De cola
(define line-section-cost
  (lambda (line nombre1 nombre2)
    (sacar-costo (cortar-lista (get-section-line line)
                                   (comprobar-point1 (get-section-line line)
                                        (encontrar-estacion (map get-point1-section (get-section-line line)) nombre1))
                                   (comprobar-point2 (get-section-line line)
                                        (encontrar-estacion (map get-point2-section (get-section-line line)) nombre2))))))

;-----------------------------------------------------------------------------------------------------
#lang racket
(require "TDA_type_21254766_AninatNorambuena.rkt")
(require "TDA_station_21254766_AninatNorambuena.rkt")
(require "TDA_section_21254766_AninatNorambuena.rkt")
(provide line)
(provide get-section-line)
(provide get-id-line)
(provide line-length)
(provide line-section-length)
(provide line-cost)
(provide line-add-section)

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
            (lista-section)
            (cons (car lista-section) (cons (añadir-section (cdr lista-section) section) null))))))

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
;Descripción: Función que permite añadir tramos a una línea
;Dominio: line (line) X section (section)
;Recorrido: line
;Recursión: Natural
(define verificar-sections
  (lambda (lista-sections)
    (if (lista-sections)
;Si la lista es nula dar true
        ;sino proguntar por el primer elemento, si es section pasar al siguiente, sino falso
       
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
      ((not (integer? (get-id-line line))) #f)
      ((not (string? (get-name-line line))) #f)
      ((not (string? (get-rail-type-line line))) #f)
      ((verificar-sections (get-section-line line)) #t))
    ))

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
  (lambda lista-sections
    (apply + lista-sections)))

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
(define encontrar-estacion-1
  (lambda (lista-estaciones nombre)
    (car (map comprobar-nombre lista-estaciones nombre))))

;Descripción: Función que retorna una section o vacio en base a su coincidencia con una estacion
;Dominio: 
;Recorrido: 
;Recursión: No aplica
(define comprobar-point1
  (lambda (seccion estacion)
    (if (equal? (get-point1-section seccion) estacion)
        (seccion)
        '())))

(define comprobar-point2
  (lambda (seccion estacion)
    (if (equal? (get-point2-section seccion) estacion)
        (seccion)
        '())))

;Descripción: Función que encuentra una seccion de una lista de secciones
;Dominio: station*
;Recorrido: station
;Recursión: No aplica
(define encontrar-estacion-2
  (lambda (lista-estaciones nombre)
    (car (map comprobar-nombre lista-estaciones nombre))))

;Descripción: Función que permite determinar el trayecto entre una estación origen y una final.
;Dominio:
;Recorrido:
;Recursión:
(define line-section-length
  (lambda (line nombre1 nombre2)
    (sacar-distancia (cortar-lista (get-section-line line)
                                   (map comprobar-point1 (get-section-line line)
                                        (encontrar-estacion-1 (map get-point1-section (get-section-line line)) nombre1))
                                   (map comprobar-point2 (get-section-line line)
                                        (encontrar-estacion-1 (map get-point2-section (get-section-line line)) nombre2))))))

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
;Dominio: line
;Recorrido: int
;Recursión: De cola
    

;-----------------------------------------------------------------------------------------------------
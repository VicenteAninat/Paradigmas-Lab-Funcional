#lang racket
(provide train)
;TDA train


;Constructor

;Descripción: Función que permite crear un tren o convoy.
;Dominio: id (int) X maker (string) X rail-type (string) X speed (int positivo)
;X station-stay-time (int positivo) X pcar*
;Recorrido: train
;Recursión: No aplica
(define train
  (lambda (id maker rail-type speed station-stay-type . pcar)
    (list id maker rail-type speed station-stay-type pcar)))


;Selectores

;Descripción: Extrae el id de un tren
;Dominio: train
;Recorrido: int
;Recursión: No aplica
(define get-id-train
  (lambda train
    (car train)))

;Descripción: Extrae el maker de un tren
;Dominio: train
;Recorrido: string
;Recursión: No aplica
(define get-maker-train
  (lambda train
    (car (cdr train))))

;Descripción: Extrae el tipo de rail de un tren
;Dominio: train
;Recorrido: string
;Recursión: No aplica
(define get-rail-type-train
  (lambda train
    (car (cddr train))))

;Descripción: Extrae la velocidad de un tren
;Dominio: train
;Recorrido: int positivo
;Recursión: No aplica
(define get-speed-train
  (lambda train
    (car (cdddr train))))

;Descripción: Extrae el tipo de estancia de un tren
;Dominio: train
;Recorrido: int
;Recursión: No aplica
(define get-station-stay-type
  (lambda train
    (car (cdr(cdddr train)))))

;Descripción: Extrae los carros de un tren
;Dominio: train
;Recorrido: pcar*
;Recursión: No aplica
(define get-pcar-station
  (lambda (train)
    (car (cdr (cddddr train)))))


;Modificadores

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite añadir carros a un tren en una posición dada.
;Dominio: train (train) X pcar (pcar) X position (int positivo)
;Recorrido: train
;Recursión: De cola

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite eliminar un carro desde el convoy.
;Dominio: train (train) X position (int positivo)
;Recorrido: train
;Recursión: De cola

;-----------------------------------------------------------------------------------------------------

;Pertenencia

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite determinar si un elemento es un tren válido,
;esto es, si el elemento tiene la estructura de tren y los carros que lo conforman
;son compatibles (mismo modelo) y tienen una disposición coherente con carros
;terminales (t) en los extremos y centrales (c) en medio del convoy.
;Dominio: train
;Recorrido: boolean
;Recursión: 

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite determinar la capacidad máxima de pasajeros del tren.
;Dominio: train
;Recorrido: int positivo
;Recursión:

;-----------------------------------------------------------------------------------------------------
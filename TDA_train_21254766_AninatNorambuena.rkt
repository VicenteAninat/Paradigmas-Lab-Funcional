#lang racket
(require "TDA_pcar_21254766_AninatNorambuena.rkt")
(provide train)
(provide train-add-car)
(provide train-remove-car)

;TDA train


;Constructor

;Descripción: Función que permite crear un tren o convoy.
;Dominio: id (int) X maker (string) X rail-type (string) X speed (int positivo)
;X station-stay-time (int positivo) X pcar*
;Recorrido: train
;Recursión: No aplica
(define train
  (lambda (id maker rail-type speed station-stay-type . pcar)
    (if (equal? pcar null)
        (list id maker rail-type speed station-stay-type '())
        (if (and (equal? (get-type-pcar (car pcar)) "terminal")
                 (comprobar-pcar (cdr (reverse (cdr pcar))))
                 (equal? (get-type-pcar (car (reverse pcar))) "terminal"))
            (list id maker rail-type speed station-stay-type pcar)
            (list id maker rail-type speed station-stay-type '())))))


;Selectores

;Descripción: Extrae el id de un tren
;Dominio: train
;Recorrido: int
;Recursión: No aplica
(define get-id-train
  (lambda (train)
    (car train)))

;Descripción: Extrae el maker de un tren
;Dominio: train
;Recorrido: string
;Recursión: No aplica
(define get-maker-train
  (lambda (train)
    (car (cdr train))))

;Descripción: Extrae el tipo de rail de un tren
;Dominio: train
;Recorrido: string
;Recursión: No aplica
(define get-rail-type-train
  (lambda (train)
    (car (cddr train))))

;Descripción: Extrae la velocidad de un tren
;Dominio: train
;Recorrido: int positivo
;Recursión: No aplica
(define get-speed-train
  (lambda (train)
    (car (cdddr train))))

;Descripción: Extrae el tipo de estancia de un tren
;Dominio: train
;Recorrido: int
;Recursión: No aplica
(define get-station-stay-time-train
  (lambda (train)
    (car (cdr(cdddr train)))))

;Descripción: Extrae los carros de un tren
;Dominio: train
;Recorrido: pcar*
;Recursión: No aplica
(define get-pcar-train
  (lambda (train)
    (car (cdr (cddddr train)))))


;Modificadores

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO

(define añadir
  (lambda (lista-pcar pcar position)
    (define añadir-interno
      (lambda (lista-pcar pcar positionOBJ positionACT)
        (cond
          [(and (equal? lista-pcar null) (> positionACT positionOBJ)) null]
          [(and (equal? positionOBJ positionACT))
           (append (list pcar) (añadir-interno lista-pcar pcar positionOBJ (+ positionACT 1)))]
          [else
           (append (list (car lista-pcar)) (añadir-interno (cdr lista-pcar) pcar positionOBJ (+ positionACT 1)))])))
    (añadir-interno lista-pcar pcar position 0)))

;Descripción: Función que permite añadir carros a un tren en una posición dada.
;Dominio: train (train) X pcar (pcar) X position (int positivo)
;Recorrido: train
;Recursión: De cola
(define train-add-car
  (lambda (train pcar position)
    (cond
      [(and (equal? position 0) (equal? (get-pcar-train train) null))
       (list (get-id-train train) (get-maker-train train) (get-rail-type-train train)
          (get-speed-train train) (get-station-stay-time-train train) (list pcar))]
      [else (list (get-id-train train) (get-maker-train train) (get-rail-type-train train)
          (get-speed-train train) (get-station-stay-time-train train)
          (añadir (get-pcar-train train) pcar position))])))

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO

(define remover
  (lambda (lista-pcar position)
    (define remover-interno
      (lambda (lista-pcar positionOBJ positionACT)
        (cond
          [(and (equal? lista-pcar null) (> positionACT positionOBJ)) null]
          [(equal? positionOBJ positionACT)
           (remover-interno (cdr lista-pcar) positionOBJ (+ positionACT 1))]
          [else
           (append (list (car lista-pcar)) (remover-interno (cdr lista-pcar) positionOBJ (+ positionACT 1)))])))
    (remover-interno lista-pcar position 0)))

#|(define remover
  (lambda (lista-pcar position)
    (define remover-interno
      (lambda (lista-pcar positionOBJ positionACT)
        (if (equal? lista-pcar null)
            lista-pcar
            (if (equal? positionOBJ positionACT)
                (cdr lista-pcar)
                (append (car lista-pcar)
                        (remover-interno (cdr lista-pcar) positionOBJ (+ positionACT 1)))))))
    (remover-interno lista-pcar position 0)))|#

;Descripción: Función que permite eliminar un carro desde el convoy.
;Dominio: train (train) X position (int positivo)
;Recorrido: train
;Recursión: De cola
(define train-remove-car
  (lambda (train position)
    (list (get-id-train train) (get-maker-train train) (get-rail-type-train train)
          (get-speed-train train) (get-station-stay-time-train train)
          (remover (get-pcar-train train) position))))

;-----------------------------------------------------------------------------------------------------

;Pertenencia

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
(define centro-valido-tren
  (lambda (lista-tren)
    (cond
      [(< (length lista-tren) 3) pasan cosas]
      []

(define mismo-modelo
  (lambda (lista-pcar)
    (define mismo-modelo-interno
      (lambda (lista-pcar modelo)
        (cond
          [(equal? lista-pcar null) #t]
          [(equal? (get-model-pcar (car lista-pcar)) modelo) (mismo-modelo-interno (cdr lista-pcar) modelo)]
          [else #f])))
    (mismo-modelo-interno lista-pcar (get-model-pcar (car lista-pcar)))))

(define extremos-validos-tren
  (lambda (lista-pcar)
    (cond
      [(and (equal? (get-type-pcar (car lista-pcar)) "terminal")
            (equal? (get-type-pcar (car (reverse lista-pcar))) "terminal")) #t]
      [else #f])))

;Descripción: Función que permite determinar si un elemento es un tren válido,
;esto es, si el elemento tiene la estructura de tren y los carros que lo conforman
;son compatibles (mismo modelo) y tienen una disposición coherente con carros
;terminales (t) en los extremos y centrales (c) en medio del convoy.
;Dominio: train
;Recorrido: boolean
;Recursión:
(define train?
  (lambda (train)
    (cond
      [(equal? (get-pcar-train train) null) #f]
      [(and
        (mismo-modelo (get-pcar-train train))
        (extremos-validos-tren (get-pcar-train train))
        (centro-valido-tren (get-pcar-train train))) #t]
      [else #f])))

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite determinar la capacidad máxima de pasajeros del tren.
;Dominio: train
;Recorrido: int positivo
;Recursión:

;-----------------------------------------------------------------------------------------------------
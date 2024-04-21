#lang racket
(require "TDA_type_21254766_AninatNorambuena.rkt")
(require "TDA_station_21254766_AninatNorambuena.rkt")
(require "TDA_section_21254766_AninatNorambuena.rkt")
(require "TDA_line_21254766_AninatNorambuena.rkt")
(require "TDA_car-type_21254766_AninatNorambuena.rkt")
(require "TDA_pcar_21254766_AninatNorambuena.rkt")
(require "TDA_train_21254766_AninatNorambuena.rkt")
(require "TDA_driver_21254766_AninatNorambuena.rkt")
(require "TDA_subway_21254766_AninatNorambuena.rkt")


;SCRIPT DE PRUEBAS N°1

;Estaciones L1 simplificada metro santiago
(define e0 (station 0 "San Pablo" t 90))
(define e1 (station 1 "Neptuno" r 45))
(define e2 (station 2 "Pajaritos" t 45))
(define e3 (station 3 "Las Rejas" r 45))
(define e4 (station 4 "Ecuador" r 60))
(define e5 (station 5 "San Alberto Hurtado" r 40))
(define e6 (station 6 "Universidad de Santiago de Chile" c 40))
(define e7 (station 7 "Estación Central" c 3600))
(define e8 (station 8 "Unión Latinoamericana" r 30))
(define e9 (station 9 "República" r 40))
(define e10 (station 10 "Los Héroes" c 60))
(define e11 (station 11 "La Moneda" r 40))
(define e12 (station 12 "Universidad de Chile" c 90))
(define e13 (station 13 "Santa Lucía" r 40))
(define e14 (station 14 "Universidad Católica" c 60))
(define e15 (station 15 "Baquedano" r 40))
(define e16 (station 16 "Los Dominicos" t 90))
(define e17 (station 17 "Cochera Neptuno" m 3600))

;Estaciones L2 simplificada metro santiago, para una versión circular
(define e18 (station 18 "El Llano" r 60))
(define e19 (station 19 "Franklin" r 50))
(define e20 (station 20 "Rondizzoni" r 55))
(define e21 (station 21 "Parque O'Higgins" r 65))
(define e22 (station 22 "Toesca" r 65))
(define e23 (station 23 "Santa Ana" c 65))
(define e24 (station 24 "Puente Cal y Canto" r 65))

;Tramos Línea 1
(define s0 (section e0 e1 4 15))
(define s1 (section e1 e2 3 14))
(define s2 (section e2 e3 2.5 10))
(define s3 (section e3 e4 4.5 17))
(define s4 (section e4 e5 4.7 18))
(define s5 (section e5 e6 4.3 17))
(define s6 (section e6 e7 3.8 12))
(define s7 (section e7 e8 2.5 10))
(define s8 (section e8 e9 4.5 17))
(define s9 (section e9 e10 4.7 18))
(define s10 (section e10 e11 4.3 17))
(define s11 (section  e11 e12 3.8 12))
(define s12 (section e12 e13 4.5 17))
(define s13 (section e13 e14 4.7 18))
(define s14 (section e14 e15 4.3 17))
(define s15 (section e15 e16 4.2 17))
;enlace cochera
(define s16 (section e1 e17 3.8 12))

;Tramos Línea 2, línea circular
(define s17 (section e18 e19 4 15))
(define s18 (section e19 e20 3 12))
(define s19 (section e20 e21 5 18))
(define s20 (section e21 e22 4.5 16))
(define s21 (section e22 e10 4.2 16))
(define s22 (section e10 e23 4.2 16))
(define s23 (section e23 e24 4.2 16))
(define s24 (section e24 e18 28 90))

;Creación de Línea 1 con todos los tramos
(define l1 (line 1 "Línea 1" "UIC 60 ASCE" s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15))
;Creación de Línea 2 sin incluir tramos
(define l2 (line 2 "Línea 2" "100 R.E."))

(line-length l1) ;resultado debe ser 64,3 si considera
;inclusive los tramos hacia estaciones de mantenimiento
(line-length l2) ;resultado debe ser 0
(line-section-length l1 "San Pablo" "Las Rejas")  ;respuesta es 9.5

(line-cost l1) ;resultado debe ser 246 si considera
;inclusive los tramos hacia estaciones de mantenimiento
(line-cost l2) ;resultado debe ser 0
(line-section-cost l1 "San Pablo" "Las Rejas")     ;respuesta es 39

;añadiendo tramos a l2
(define l2a (line-add-section l2 s17))
(define l2b (line-add-section l2a s18))
(define l2c (line-add-section l2b s19))
(define l2d (line-add-section l2c s20))
(define l2e (line-add-section l2d s21))
(define l2f (line-add-section l2e s22))
(define l2g (line-add-section l2c s23))
(define l2h (line-add-section l2d s24))
(define l2i (line-add-section l2h s19))  ;dependiendo de
;como implemente la función, esta operación no añade la
;estación duplicada. Puede lanzar un “error o excepción”
;(no un mensaje de error como String, para no comprometer
;el recorrido de la función) o bien devolver la línea de
;entrada intacta. En este caso, l2i sería igual a l2h.

(display "----------LINE?----------")
(display "\n")
(line? l1)  ;devuelve true
(line? l2)  ;devuelve false
(line? l2e)  ;devuelve false
(line? l2h)  ;devuelve true
(display "-------------------------")
(display "\n")

;creando carros
(define pc0 (pcar 0 100 "NS-74" tr))
(define pc1 (pcar 1 100 "NS-74" ct))
(define pc2 (pcar 2 150 "NS-74" ct))
(define pc3 (pcar 3 100 "NS-74" ct))
(define pc4 (pcar 4 100 "NS-74" tr))
(define pc5 (pcar 5 100 "AS-2014" tr))
(define pc6 (pcar 6 100 "AS-2014" ct))
(define pc7 (pcar 7 100 "AS-2014" ct))
(define pc8 (pcar 8 100 "AS-2014" ct))
(define pc9 (pcar 9 100 "AS-2014" tr))
(define pc10 (pcar 10 100 "AS-2014" tr))
(define pc11 (pcar 11 100 "AS-2016" ct))
(define pc12 (pcar 12 100 "AS-2016" ct))
(define pc13 (pcar 13 150 "AS-2016" ct))
(define pc14 (pcar 14 100 "AS-2016" ct))
(define pc15 (pcar 15 100 "AS-2016" ct))
(define pc16 (pcar 16 100 "AS-2016" ct))
(define pc17 (pcar 17 100 "AS-2016" tr))


;creando trenes
(define t0 (train 0 "CAF" "UIC 60 ASCE" 60 1.5))
;tren sin carros definidos
(define t1 (train 1 "CAF" "UIC 60 ASCE" 70  2 pc0 pc1 pc2 pc3 pc4))
;tren válido
(define t2 (train 2 "CAF" "100 R.E." 70  2 pc5 pc6 pc7 pc8 pc9))
;tren válido
(define t3 (train 3 "CAF" "100 R.E." 70  2 pc10 pc11 pc12 pc13 pc14 pc15 pc16 pc17))
;tren válido
(define t4 (train 4 "CAF" "100 R.E." 70  2 pc1 pc2 pc3))
;tren inválido sin terminales en extremos
(define t5 (train 5 "CAF" "100 R.E." 70  2 pc0 pc5 pc9 pc12 pc17))
;tren inválido por incompatibilidad de carros

(define t0a (train-add-car t0 pc5 0))
(define t0b (train-add-car t0a pc6 1))
(define t0c (train-add-car t0b pc7 2))
(define t0d (train-add-car t0c pc8 3))
(define t0e (train-add-car t0d pc9 4)) ;tren válido

(define t1a (train-remove-car t1 0))
(define t1b (train-remove-car t1 2))

;verificación de válidez en la conformación de trenes
(display "----------TRAIN?----------")
(display "\n")
(train? t0) ;debe arrojar #f
(train? t1) ;debe arrojar #t
(train? t2) ;debe arrojar #t
(train? t3) ;debe arrojar #f
(train? t4) ;debe arrojar #f
(train? t0a) ;debe arrojar #f
(train? t0b) ;debe arrojar #f
(train? t0c) ;debe arrojar #f
(train? t0d) ;debe arrojar #f
(train? t0e) ;debe arrojar #t
(train? t1a) ;debe arrojar #f
(train? t1b) ;debe arrojar #t
(display "-------------------------")
(display "\n")

;determinar capacidad del tren
(train-capacity t0) ;debe arrojar 0
(train-capacity t1) ;debe arrojar 550

;Creando drivers
(define d0 (driver 0 "Juan" "CAF"))
(define d1 (driver 1 "Alejandro" "Alsthom"))
(define d2 (driver 2 "Diego" "Alsthom"))
(define d3 (driver 2 "Pedro" "CAF"))

;Creando Metros
(define sw0 (subway 0 "Metro de Santiago"))
(define sw1 (subway 1 "Subte"))

;Agregando trenes
(define sw0a (subway-add-train sw0 t1 t2 t0e))

;Agregando lineas
(define sw0b (subway-add-line sw0a l1 l2h))

;Agregando drivers
(define sw0c (subway-add-driver sw0b d0 d1 d2 d3))

#|
;Expresado subway como string
(subway->string sw0c)

;Aumentando los costos de las estaciones en un 30%
(define sw0d (subway-rise-section-cost (lambda (c) (* c 1.3))))

;Cambiando el tiempo de parada de algunas estaciones
(define sw0e (subway-set-station-stoptime sw0d "Los Heroes" 180))
(define sw0f (subway-set-station-stoptime sw0e "San Pablo" 50))

;Asignando trenes a líneas
(define sw0g (subway-assign-train-to-line sw0f 0 1))
(define sw0h (subway-assign-train-to-line sw0g 2 2))

;Asignando conductores a trenes
(define sw0i (subway-assign-driver-to-train sw0h 1 0 "11:00:00" "San Pablo" "Los Hérores"))
(define sw0j (subway-assign-driver-to-train sw0i 2 2 "12:00:00" "El Llano" "Toesca"))

;preguntando dónde está el tren
(where-is-train sw0j 0 "11:12:00")  ;Debería estar mas cerca de Las Rejas. Hasta esta hora el tren debería haber recorrido 12km (asumiendo esta unidad), sumando los tiempos de parada en las estaciones


;produciendo la ruta que sigue el tren
(subway-train-path sw0j 0 "11:30:00")
|#
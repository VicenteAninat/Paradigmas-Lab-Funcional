#lang racket
(require "TDA_type_21254766_AninatNorambuena.rkt")
(require "TDA_station_21254766_AninatNorambuena.rkt")
(require "TDA_section_21254766_AninatNorambuena.rkt")
(require "TDA_line_21254766_AninatNorambuena.rkt")

;Script de prueba Personal

(define e0 (station 1 "USACH" c 30))
(define e1 (station 2 "Estación Central" c 45))
(define e2 (station 3 "ULA" r 45))
(define e3 (station 3 "República" r 45))
(define e4 (station 4 "Los Héroes" c 60))
(define e5 (station 5 "Toesca" r 40))
(define e6 (station 6 "La Moneda" r 40))
(define e7 (station 7 "Cochera" m 3600))
(define e8 (station 8 "Parque OHiggins" r 30))
(define e9 (station 9 "San Pablo" t 40))
(define e10 (station 10 "Los Dominicos" t 60))


(define s0 (section e0 e1 2 50))
(define s1 (section e1 e2 2.5 55))
(define s2 (section e2 e3 1.5  30))
(define s3 (section e3 e4 3  45))
(define s4 (section e4 e5 3  45))
(define s5 (section e4 e6 1.4  50))
(define s6 (section e5 e8 2  40))
(define s7 (section e0 e7 3  0))
(define s8 (section e0 e9 7  100))
(define s9 (section e6 e10 15  250))

(define l0 (line 0 "Línea 0" "UIC 60 ASCE"))
(define l1 (line 1 "Línea 1" "100 R.E." s0 s1 s2 s3 s5 s7 s8 s9))

(line-length l1)
(line-length l0)

;(line-section-length l1 "USACH" "Los Héroes")
(line-cost l1)

(define l2 (line-add-section l0 s0))
(define l3 (line-add-section l2 s1))
(define l4 (line-add-section l3 s2))
(define l5 (line-add-section l4 s3))

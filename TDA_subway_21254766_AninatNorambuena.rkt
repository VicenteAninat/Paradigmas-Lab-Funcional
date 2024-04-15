#lang racket

;TDA subway


;Constructor

;Descripción: Función que permite crear una red de metro.
;Dominio: id (int) X nombre (string)
;Recorrido: subway
;Recursión: No aplica
(define subway
  (lambda (id nombre)
    (list id nombre)))


;Selectores

;Modificadores

;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite añadir trenes a una red de metro.
;Dominio: sub (subway) X train* (pueden ser 1 o más trenes)
;Recorrido: subway
;Recursión:

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite añadir trenes a una red de metro.
;Dominio: sub (subway) X train* (pueden ser 1 o más trenes)
;Recorrido: subway
;Recursión:

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite añadir líneas a una red de metro.
;Dominio: sub (subway) X line* (pueden ser 1 o más líneas)
;Recorrido: subway
;Recursión:

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite añadir conductores a una red de metro.
;Dominio: sub (subway) X driver* (pueden ser 1 o más conductores)
;Recorrido: subway
;Recursión:

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite expresar una red de metro en un formato String.
;Dominio: sub (subway)
;Recorrido: string
;Recursión:

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite aumentar o reducir los costos de todos los
;tramos en base a una función especificada por el usuario que arroja un
;cambio porcentual en los costos.
;Dominio: sub (subway) X function
;Recorrido: subway
;Recursión: No aplica

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite modificar el tiempo de parada de una estación.
;Dominio: sub (subway) X stationName (String) X time
;Recorrido: subway
;Recursión: No aplica

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite asignar un tren a una línea.
;Dominio: sub (subway) X trainId (int) X time
;Recorrido: subway
;Recursión: No aplica

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite asignar un conductor a un tren en un horario
;de salida determinado considerando estación de partida y de llegada.
;Dominio: sub (subway) X driverId (int) X trainId (int) X
;departureTime(String en formato HH:MM:SS de 24 hrs) X
;departure-station (String) X arrival-station (String)
;Recorrido: subway
;Recursión: 

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite determinar dónde está un tren a partir de
;una hora indicada del día. Para ello se basa en los tiempos de partida de
;los trenes desde una determinada estación para estimar el cálculo en función
;de la ruta, distancia y tiempos de parada en estaciones. La respuesta debe
;entregar la estación más próxima en la que se encuentre un tren considerando
;los tramos en una línea.
;Dominio: sub (subway) X trainId (int) X
;time (String en formato HH:MM:SS d 24 hrs)
;Recorrido: station
;Recursión: 

;-----------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------
;EN DESARROLLO
;Descripción: Función que permite ir armando el recorrido del tren a partir
;de una hora especificada y de manera perezosa dejando el registro de la
;ruta en una lista infinita de paradas.
;Dominio: sub (subway) X trainId (int) X
;time (String en formato HH:MM:SS d 24 hrs)
;Recorrido: list
;Recursión: 

;-----------------------------------------------------------------------------------------------------
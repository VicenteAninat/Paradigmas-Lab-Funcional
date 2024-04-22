# lab1_21254766_VicenteAninat
Repositorio destinado al desarrollo de las actividades de laboratorio correspondientes a la asignatura Paradigmas de programación.

Cada una de las funciones se llama con el nombre de la función y los parámetros de entrada requeridos entre paréntesis, ejemplo (station 1 "Metro ejemplo" r 9999). Para los tipos de estación se tienen solo c,m,r y t que son combinación, mantención, regular y terminal respectivamente, y para los tipos de estación se tienen ct y tr, central y terminal respectivamente, estos son los únicos tipos admitidos.

Para guardar los resultados del uso de las funciones se recomienda hacer uso de la función “define” de la librería base de Racket, de esta forma si se escribe (define E1 (station 1 "Metro ejemplo" r 9999)), al escribir E1 por consola esta mostrará ("Metro ejemplo" “regular” 9999), que corresponde al metro definido.

Es importante mencionar que los requerimientos funcionales, desde expresar una red de metro en formato string (subway->string) en adelante no se encuentran implementadas, por lo que se recomienda abstenerse de usarlas, además la función “line?”, puede no devolver el resultado esperado.

Finalmente, para el uso del sistema en general usar el archivo main donde se cargan todos los archivos necesarios para el funcionamiento, puesto que usar el sistema en el archivo de un TDA puede no entregar los resultados esperados. Esto para tener una estructura más ordenada de todo el desarrollo.

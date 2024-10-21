¿Qué es un INNER JOIN y cómo funciona?

Un INNER JOIN devuelve las filas que tienen coincidencias en ambas tablas. Solo muestra los registros donde los valores en las columnas seleccionadas coinciden en ambas tablas.

¿En qué casos usarías un INNER JOIN? 
los estudiantes que están inscritos en un curso específico y que también han presentado un examen

SELECT nombre.estudiantes, nombre.examen
from estudiantes
INNER JOIN examen
ON estudiantes.id = nombre_alumno.examen

¿Qué ocurre si no hay coincidencias en las tablas al realizar un INNER JOIN?
no se devuelven registros en el resultado. El conjunto resultante estará vacío.

------------------------------------------------------------------------------

Left Join:
¿Cuál es la diferencia entre un INNER JOIN y un LEFT JOIN?
Un LEFT JOIN devuelve todas las filas de la tabla izquierda, incluso si no hay coincidencias en la tabla derecha.

¿Qué tipo de datos retorna un LEFT JOIN si no encuentra coincidencias en la tabla de la derecha?
Si no encuentra coincidencias en la tabla derecha, las columnas correspondientes de la tabla derecha tendrán valores NULL.

¿En qué casos usarías un LEFT JOIN? 
los estudiantes que están inscritos en un curso específico mostrando tambien de esos estudiantes quien ha presentado un examen


SELECT nombre.estudiantes, nombre.examen
from estudiantes
LEFT JOIN examen
ON estudiantes.id = nombre_alumno.examen
-------------------------------------------------------------------------------------------------------

Full Join:
¿Qué es un FULL JOIN y qué tipo de datos retorna?
Un FULL JOIN devuelve todas las filas de ambas tablas, mostrando las coincidencias cuando las hay y rellenando con NULL cuando no las hay.

¿En qué casos usarías un FULL JOIN? 
cuando quiero todos los estudiantes y todos los que hicieron el examen inicial.

SELECT nombre.estudiantes, nombre.examen
from estudiantes
FULL JOIN examen
ON estudiantes.id = nombre_alumno.examen


----------------------------------------------------------------------------------------
TEMA NUEVO: CROSS JOIN 
Un CROSS JOIN devuelve el producto cartesiano de dos tablas. Esto significa que combina cada fila de la primera tabla con todas las filas de la segunda tabla. Si la primera tabla tiene m filas y la segunda tabla tiene n filas, el resultado del CROSS JOIN será de m * n filas.

¿En qué casos usarías un FULL JOIN?  
Para un menú que combine todas las comidas con todas las bebidas.

SELECT *
FROM tabla_uno
CROSS JOIN tabla_dos

-----------
ejemplo para PSQL
CREATE TABLE colores (color VARCHAR(50));
CREATE TABLE tamaños (tamaño VARCHAR(50));

INSERT INTO colores VALUES ('Rojo'), ('Azul'), ('Verde');
INSERT INTO tamaños VALUES ('Pequeño'), ('Mediano'), ('Grande');


SELECT colores.color, tamaños.tamaño
FROM colores
CROSS JOIN tamaños;

--------------------------------------------------------
Ejercicio 1:
Tienes dos tablas: empleados (con columnas id_empleado, nombre_empleado) y turnos (con columnas id_turno, turno). Realiza un CROSS JOIN para mostrar todas las combinaciones posibles de empleados y turnos.
CREATE TABLE empleados (id_empleado SERIAL PRIMARY KEY, nombre_empleado VARCHAR(50));
INSERT INTO empleados (nombre_empleado) VALUES ('Ana'), ('Luis'), ('María');

CREATE TABLE turnos (id_turno SERIAL PRIMARY KEY, turno VARCHAR(50));
INSERT INTO turnos (turno) VALUES ('Mañana'), ('Tarde'), ('Noche')

Ejercicio 2:
Dadas las tablas productos (con columnas id_producto, nombre_producto) y precios (con columnas id_precio, precio). Usa un CROSS JOIN para generar una lista que combine todos los productos con todos los precios disponibles.

CREATE TABLE productos (id_producto SERIAL PRIMARY KEY, nombre_producto VARCHAR(50));
INSERT INTO productos (nombre_producto) VALUES ('Camiseta'), ('Pantalón'), ('Zapatos');

CREATE TABLE precios (id_precio SERIAL PRIMARY KEY, precio NUMERIC(10, 2));
INSERT INTO precios (precio) VALUES (19.99), (29.99), (49.99);

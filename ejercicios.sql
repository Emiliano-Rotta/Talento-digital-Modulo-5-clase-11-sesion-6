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
INSERT INTO turnos (turno) VALUES ('Mañana'), ('Tarde'), ('Noche');

SELECT empleados.nombre_empleado, turnos.turno
FROM empleados
CROSS JOIN turnos;

Ejercicio 2:
Dadas las tablas productos (con columnas id_producto, nombre_producto) y precios (con columnas id_precio, precio). Usa un CROSS JOIN para generar una lista que combine todos los productos con todos los precios disponibles.

CREATE TABLE productos (id_producto SERIAL PRIMARY KEY, nombre_producto VARCHAR(50));
INSERT INTO productos (nombre_producto) VALUES ('Camiseta'), ('Pantalón'), ('Zapatos');

CREATE TABLE precios (id_precio SERIAL PRIMARY KEY, precio NUMERIC(10, 2));
INSERT INTO precios (precio) VALUES (19.99), (29.99), (49.99);

SELECT productos.nombre_producto, precios.precio
FROM productos
CROSS JOIN precios;

----------------------------------
No se puede asegurar el comportamiento por defecto, porque lo hace de la manera mas eficiente, pero puedo obligarlo a que se ordene de una determinada manera con un order by

SELECT productos.nombre_producto, precios.precio
FROM productos
CROSS JOIN precios
ORDER BY productos.nombre_producto, precios.precio;



------------------------------------------------------------
Ejercicios Grupales:

crear una base de datos ejercicio_sesion_seis y agrega estas tablas. Luego hacer las peticiones.

Tabla estudiantes:

CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO estudiantes (nombre) VALUES
('Juan'), ('María'), ('Luis'), ('Ana');

Tabla cursos:

CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre_curso VARCHAR(50)
);

INSERT INTO cursos (nombre_curso) VALUES
('Matemáticas'), ('Historia'), ('Ciencias'), ('Arte');

Tabla inscripciones:

CREATE TABLE inscripciones (
    id_inscripcion SERIAL PRIMARY KEY,
    id_estudiante INT REFERENCES estudiantes(id_estudiante),
    id_curso INT REFERENCES cursos(id_curso)
);

INSERT INTO inscripciones (id_estudiante, id_curso) VALUES
(1, 1), (2, 2), (3, 3), (4, 1), (2, 3);



Ejercicio 1: LEFT JOIN
Realiza un LEFT JOIN para mostrar todos los estudiantes y los cursos en los que están inscritos. Si un estudiante no está inscrito en ningún curso, muestra NULL en la columna del curso.

Ejercicio 2: RIGHT JOIN
Utiliza un RIGHT JOIN para listar todos los cursos junto con los estudiantes inscritos en ellos. Si un curso no tiene estudiantes, muestra NULL en las columnas del estudiante.

Ejercicio 3: FULL JOIN
Realiza un FULL JOIN para mostrar todos los estudiantes y los cursos, incluidos aquellos estudiantes sin cursos inscritos y cursos sin estudiantes.

Ejercicio 4: INNER JOIN
Usa un INNER JOIN para listar solo los estudiantes que están inscritos en algún curso, mostrando el nombre del estudiante y el nombre del curso.

Ejercicio 5: CROSS JOIN 
Realiza un CROSS JOIN para mostrar todas las combinaciones posibles de estudiantes y cursos, independientemente de si están inscritos o no.

Ejercicio 6: CROSS JOIN 
Usa un CROSS JOIN para generar una lista de todas las combinaciones posibles de estudiantes y cursos. Filtra los resultados para mostrar solo aquellos estudiantes que no están inscritos en los cursos.
NOT IN (SELECT id_estudiante, id_curso FROM inscripciones);



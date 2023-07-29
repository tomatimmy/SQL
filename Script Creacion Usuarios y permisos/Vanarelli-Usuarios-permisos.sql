
/* DESAFIO COMPLEMENTARIO */

USE mysql; -- Seleccionamos el esquema MYSQL para acceder a la tabla de usuarios

CREATE USER 'usuario01' identified by 'password01'; -- Creamos al usuario 1
CREATE USER 'usuario02' identified by 'password02'; -- Creamos al usuario 2

/* Controlamos que los usuarios fueron creados */

SELECT * FROM USER;

/* Asignamos permisos especiales a los usuarios */

GRANT SELECT ON proyecto_final.* TO 'usuario01'; /* Asignamos permiso de solo lectura a todas las tablas del
esquema proyecto_final */

GRANT SELECT, INSERT, UPDATE ON proyecto_final.* to 'usuario02'; /* Asignamos permiso de lectura, insercion y
modificacion a todas las tablas del esquema proyecto_final */

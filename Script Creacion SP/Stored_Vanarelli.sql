/* Creacion de SP para ordenar la tabla Clientes */

DELIMITER $$
CREATE PROCEDURE ordenar_tabla_clientes(IN p_campo_ordenamiento VARCHAR(30), IN p_tipo_ordenamiento VARCHAR(4))
BEGIN
    SET @consulta = CONCAT('SELECT * FROM clientes ORDER BY ', p_campo_ordenamiento, ' ', p_tipo_ordenamiento, ';');
    PREPARE consulta FROM @consulta;
    EXECUTE consulta;
END$$
DELIMITER ;

/*LLamado al SP:

Se deben indicar 2 parametros, el nombre del campo que sera pivote de ordenamiento
y el tipo de ordenamiento (ASC, DESC)
Ejemplo: */


call ordenar_tabla_clientes('apellido', 'DESC');


/* Creacion de SP para agregar registros nuevos a la tabla Clientes (siempre y cuando no existan) */

DELIMITER $$
CREATE PROCEDURE crear_nuevo_cliente(IN p_id INT, IN p_dni INT, IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_direccion VARCHAR(100), IN p_mail VARCHAR(50), in p_telefono INT)
BEGIN
    IF NOT EXISTS (SELECT * FROM clientes WHERE id = p_id OR dni = p_dni) THEN
        INSERT INTO clientes (id, dni, nombre, apellido, direccion, mail, telefono) VALUES (p_id, p_dni, p_nombre, p_apellido, p_direccion, p_mail, p_telefono);
        SELECT 'Registro creado exitosamente.' AS mensaje;
    ELSE
        SELECT 'El registro ya existe en la tabla.' AS mensaje;
    END IF;
END$$
DELIMITER ;

/*LLamado al SP:

Se deben indicar los 7 parametros que poblaran el registro de la tabla Clientes
Si el campo ID o el campo DNI ya existe en la tabla, el SP devolvera el mensaje de registro existente
Si tanto el ID como el DNI no existen en la tabla, el SP devolvera el mensaje de registro creado.

Ejemplo con ID repetido: */
call crear_nuevo_cliente(2, 34309425, 'raul', 'alfonsin', 'ejemplo', 'a@b.com', 1112312);

/* Ejemplo con nuevos datos: */
call crear_nuevo_cliente(7, 34309425, 'matias', 'perez', 'loyola 424', 'matias@gmail.com', 1123445512); 
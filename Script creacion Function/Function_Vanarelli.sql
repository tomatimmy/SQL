/* Creacion de funcion para obtener nombre y apellido de un cliente
pasandole un ID como parametro de busqueda */

DELIMITER $$
CREATE FUNCTION obtener_datos(p_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nombre_y_apellido VARCHAR(100);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombre_y_apellido FROM clientes WHERE id = p_id;
    RETURN nombre_y_apellido;
END$$
DELIMITER ;

/* Ejemplo de llamado a la funcion */

select obtener_datos(1) AS 'Nombre y Apellido';

/* Creacion de funcion para obtener valor total de la venta
pasando como parametro una orden de compra */

DELIMITER $$
CREATE FUNCTION stock_x_producto(p_id_prod INT)
RETURNS FLOAT
NO SQL
BEGIN
    DECLARE total INT;
    SET total = (select stock FROM productos prod WHERE prod.id = p_id_prod);
    RETURN total;
END$$
DELIMITER ;

/* Ejemplo de llamado a la funcion */
select stock_x_producto(2) AS 'Stock total';

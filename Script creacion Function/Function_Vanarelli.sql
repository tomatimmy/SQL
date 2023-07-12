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
drop function obtener_datos;

/* Ejemplo de llamado a la funcion */

select obtener_datos(1) AS 'Nombre y Apellido';

/* Creacion de funcion para obtener valor total de la venta
pasando como parametro una orden de compra */

DELIMITER $$
CREATE FUNCTION valor_venta_x_oc(p_nro_oc INT)
RETURNS FLOAT
NO SQL
BEGIN
    DECLARE total FLOAT;
    SET total = (select cantidad FROM orden_de_compra oc WHERE oc.nro_oc = p_nro_oc);
    SET total = ROUND(total * (select precio_venta FROM ventas_detalle vd WHERE vd.nro_oc_referido = p_nro_oc), 2);
    RETURN total;
END$$
DELIMITER ;

/* Ejemplo de llamado a la funcion */
select valor_venta_x_oc(1) AS 'Valor de Venta Total';




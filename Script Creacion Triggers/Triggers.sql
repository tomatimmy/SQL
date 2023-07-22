/* CREACION DE TABLA DE LOG PARA LA REGISTRACION DE NUEVAS ORDENES DE COMPRA */

CREATE TABLE orden_de_compra_log(
	nro_oc INT PRIMARY KEY,
    fecha DATE,
    cantidad INT,
    id_cliente INT,
    id_proveedor INT,
    accion VARCHAR(30),
    usuario_sistema VARCHAR(30),
    fecha_log DATE,
    hora_log TIME);


/* CREACION DE TABLA DE LOG PARA LA ELIMINACION DE CLIENTES */
  
CREATE TABLE baja_clientes_log(
	id INT PRIMARY KEY,
    dni INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    direccion VARCHAR(100),
    mail VARCHAR(50),
    telefono INT,
    accion VARCHAR(30),
    usuario_sistema VARCHAR(30),
    fecha_log DATE,
    hora_log TIME);

/* CREACION DE TRIGGER DE ACTUALIZACION DE TABLA DE NUEVAS ORDENES DE COMPRA (LOG) */

CREATE TRIGGER t_orden_de_compra
AFTER INSERT ON orden_de_compra
FOR EACH ROW
INSERT INTO orden_de_compra_log(nro_oc, fecha, cantidad, id_cliente, id_proveedor, accion, usuario_sistema, fecha_log, hora_log)
VALUES (new.nro_oc, new.fecha, new.cantidad, new.id_cliente, new.id_proveedor,'nueva oc', system_user(), now(), curdate());

/* CREACION DE TRIGGER DE ACTUALIZACION DE TABLA DE BAJA DE CLIENTES (LOG) */

CREATE TRIGGER t_baja_clientes
BEFORE DELETE ON clientes
FOR EACH ROW
INSERT INTO baja_clientes_log(id, dni, nombre, apellido, direccion, mail, telefono, accion, usuario_sistema, fecha_log, hora_log)
VALUES (old.id, old.dni, old.nombre, old.apellido, old.direccion, old.mail, old.telefono, 'eliminado', system_user(), now(), curtime());


/* PRUEBA DE TRIGGER DE CREACION DE NUEVAS ORDENES DE COMPRA */

INSERT INTO orden_de_compra VALUES (13, '2023-06-06', 5, 2, 2);
select * from orden_de_compra_log;


/* PRUEBA DE TRIGGER DE BAJA DE CLIENTES */

INSERT INTO clientes VALUES (
6, 50505050, 'mati', 'vanarelli', 'lalala', 'mati@vanarelli.com', 123123123);

DELETE FROM clientes WHERE id = 6;

SELECT * FROM baja_clientes_log;
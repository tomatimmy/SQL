CREATE TRIGGER t_orden_de_compra
AFTER INSERT ON orden_de_compra
FOR EACH ROW
INSERT INTO orden_de_compra_log(nro_oc, fecha, id_cliente, accion, usuario_sistema, fecha_log, hora_log)
VALUES (new.nro_oc, new.fecha, new.id_cliente, 'nueva oc', system_user(), now(), curtime());


CREATE TRIGGER t_baja_clientes
BEFORE DELETE ON clientes
FOR EACH ROW
INSERT INTO baja_clientes_log(id, dni, nombre, apellido, direccion, id_provincia, mail, telefono, accion, usuario_sistema, fecha_log, hora_log)
VALUES (old.id, old.dni, old.nombre, old.apellido, old.direccion, old.id_provincia, old.mail, old.telefono, 'eliminado', system_user(), now(), curtime());


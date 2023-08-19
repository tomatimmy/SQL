CREATE VIEW v_productos_rojos AS
SELECT p.descripcion as descripcion_producto, c.descripcion as color
FROM Productos p
INNER JOIN colores c on p.id_color = c.id
WHERE id_color = 1;

select * from v_productos_rojos;

CREATE VIEW v_productos_por_categoria AS
SELECT p.descripcion as descripcion_producto, c.descripcion as categoria
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id;

select * from v_productos_por_categoria;

CREATE VIEW v_clientes_por_orden_de_compra AS
SELECT nro_oc, fecha, c.nombre, c.apellido
FROM orden_de_compra
INNER JOIN clientes c ON id_cliente = c.id;

select * from v_clientes_por_orden_de_compra;

CREATE VIEW v_orden_de_compra_junio_2023 AS
SELECT nro_oc, fecha, c.nombre, c.apellido
FROM orden_de_compra
INNER JOIN clientes c on id_cliente = c.id
WHERE fecha >= '2023-06-01' and fecha <= '2023-06-30';

select * from v_orden_de_compra_junio_2023;

CREATE VIEW v_orden_de_compra_total AS
SELECT oc.nro_oc, oc.fecha, c.nombre, c.apellido, p.descripcion, i.cantidad, t.descripcion as talle
FROM orden_de_compra oc
INNER JOIN clientes c on id_cliente = c.id
INNER JOIN integra i on oc.nro_oc = i.nro_oc
INNER JOIN productos p on i.productos_id = p.id
INNER JOIN talles t on p.id_talle = t.id
ORDER BY nro_oc;

select * from v_orden_de_compra_total;

CREATE VIEW v_productos_por_proveedor AS
SELECT prod.descripcion as descripcion_producto, col.descripcion, c.descripcion as categoria, prov.razon_social
FROM productos prod
INNER JOIN categorias c on prod.id_categoria = c.id
INNER JOIN colores col on prod.id_color = col.id
INNER JOIN proveen pv on prod.id = pv.productos_id
INNER JOIN proveedores prov on pv.proveedores_id = prov.id
ORDER BY prov.razon_social;

select * from v_productos_por_proveedor;

CREATE VIEW v_ventas_detalle AS
SELECT v.nro_fc, v.fecha, c.nombre, c.apellido, oc.nro_oc, p.descripcion, i.cantidad, p.precio_venta, v.descuento, round((i.cantidad * p.precio_venta) - v.descuento, 2) as total
FROM Ventas v
INNER JOIN clientes c on v.id_cliente = c.id
INNER JOIN orden_de_compra oc on nro_oc_referido = oc.nro_oc
INNER JOIN integra i on i.nro_oc = oc.nro_oc
INNER JOIN productos p on i.productos_id = p.id;

select * from v_ventas_detalle;
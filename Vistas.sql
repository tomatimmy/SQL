CREATE VIEW productos_negros AS
SELECT descripcion, color
FROM Productos
WHERE color = 'negro';

CREATE VIEW productos_por_categoria AS
SELECT p.descripcion, c.descripcion as categoria
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id;

CREATE VIEW clientes_por_orden_de_compra AS
SELECT nro_oc, fecha, c.nombre, c.apellido
FROM orden_de_compra
INNER JOIN clientes c ON id_cliente = c.id;

CREATE VIEW orden_de_compra_junio_2023 AS
SELECT nro_oc, fecha, c.nombre, c.apellido
FROM orden_de_compra
INNER JOIN clientes c on id_cliente = c.id
WHERE fecha >= '2023-06-01' and fecha <= '2023-06-30';

CREATE VIEW productos_por_proveedor AS
SELECT prod.descripcion as producto, prod.color, c.descripcion as categoria, p.razon_social
FROM productos prod
INNER JOIN categorias c on id_categoria = c.id
INNER JOIN proveedores p on id_proveedor = p.id;
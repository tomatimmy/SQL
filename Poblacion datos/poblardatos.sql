/* POBLACION DE TABLAS */

/* Seteo del autocommit */

SET AUTOCOMMIT = 0;

/* Tabla Provincias */

INSERT INTO provincias (descripcion) VALUES
('Ciudad Autonoma de Bs. As.'),
('Provincia Bs. As.'),
('Catamarca'),
('Chaco'),
('Chubut'),
('Córdoba'),
('Corrientes'),
('Entre Ríos'),
('Formosa'),
('Jujuy'),
('La Pampa'),
('La Rioja'),
('Mendoza'),
('Misiones'),
('Neuquén'),
('Río Negro'),
('Salta'),
('San Juan'),
('San Luis'),
('Santa Cruz'),
('Santa Fe'),
('Santiago del Estero'),
('Tierra del Fuego'),
('Tucumán');

/* Tabla Colores */

INSERT INTO colores (descripcion) VALUES
('Rojo'),
('Verde'),
('Azul'),
('Amarillo'),
('Naranja'),
('Rosa'),
('Morado'),
('Blanco'),
('Negro'),
('Gris'),
('Marrón'),
('Turquesa');

/* Tabla Talles */

INSERT INTO talles (descripcion) VALUES
('Small'),
('Medium'),
('Large'),
('Extra-large');

/* Tabla Clientes (utilizando transaccion) */

START TRANSACTION;
INSERT INTO CLIENTES VALUES (1, 10883170, 'Carlos', 'Villagran', 'Santa Cruz 655, piso 2', 1, 'kiko@hotmail.com', 1551219876);
INSERT INTO CLIENTES VALUES (2, 8345643, 'Ramon', 'Valdes', 'Casa nro 7', 2, 'donramon@gmail.com', 1545332145);
INSERT INTO CLIENTES VALUES (3, 17686091, 'Florinda', 'Meza', 'Vecindad, casa nro 2', 3, 'florinda@yahoo.com', 1551998446);
INSERT INTO CLIENTES VALUES (4, 5345677, 'Edgar', 'Vivar', 'Calle 12 casa 4', 4, 'barriga@gmail.com', 1555556512);
INSERT INTO CLIENTES VALUES (5, 83334512, 'Roberto', 'Gomez', 'La vecindad, nro 8', 5, 'elchavo@gmail.com', 1244144440);
INSERT INTO CLIENTES VALUES (6, 4895559, 'Maria Antonieta', 'De las Nieves', 'Casa nro 7', 1,  'chilindrina@hotmail.com', 1234444412);
INSERT INTO CLIENTES VALUES (7, 234441341, 'Matias', 'Martin', 'Calle Las palmas 1244', 3, 'matiasmartin@gmail.com', 1521334886);
INSERT INTO CLIENTES VALUES (8, 10999413, 'Diego', 'Torres', 'Gorostiaga 1333 piso 2', 3, 'dieguito@lastorres.com', 1444451233);
INSERT INTO CLIENTES VALUES (9, 12415551, 'Liliana', 'Salina', 'Del pilar 1144', 1, 'salinalili@gmail.com', 1555119833);
INSERT INTO CLIENTES VALUES (10, 3444155, 'Hugo', 'Valencia', 'Antartida Argentina 10', 2, 'hvalencia@hotmail.com', 1543327880);
COMMIT;

/* Tabla Proveedores */

INSERT INTO PROVEEDORES VALUES
(1, 20252280955, 'La Soñada SRL', 'Moreno 553', 1, 'soñadatextil@lasoñada.com.ar', 45322245),
(2, 27283349677, 'Estampados Klaf SA', 'Av Jujuy 6611', 12, 'estampados@klaf.com.ar', 48996522),
(3, 20886435215, 'Textil Andina SA', 'Thomas Roosevelt 14', 9, 'andinatex@textilandina.com.ar', 45538831),
(4, 27176649937, 'Hilos Finos SRL', 'Independencia 114', 3, 'hilos@gmail.com', 43315632),
(5, 27884907325, 'Alvarez y Hnos SA', 'Francisco Bucarelli 2234', 1, 'alvarezhnos@textil.com.ar', 44365574);

/* Tabla Categorías */

INSERT INTO Categorias VALUES
(1, 'Camisetas'),
(2, 'Pantalones'),
(3, 'Shorts'),
(4, 'Vestidos'),
(5, 'Chaquetas'),
(6, 'Blusas'),
(7, 'Bufandas'),
(8, 'Sweaters'),
(9, 'Jeans');

/* Tabla Productos */

INSERT INTO productos VALUES
(1, 'Camiseta Modelo Clásico Algodón', 1, 4, 1, '2023-08-17', 15.99, 29.99, 100),
(2, 'Pantalón Jeans Skinny', 2, 2, 2, '2023-08-16', 25.50, 49.99, 80),
(3, 'Vestido Floral Elegante Poliéster', 3, 3, 4, '2023-08-15', 30.75, 59.99, 60),
(4, 'Bufanda Lana Tejida', 4, 1, 7, '2023-08-14', 8.25, 16.99, 120),
(5, 'Chaqueta Cuero Sintético', 5, 2, 5, '2023-08-13', 45.90, 89.99, 40),
(6, 'Camiseta Estampado Vintage Algodón', 1, 5, 1, '2023-08-12', 14.50, 28.99, 90),
(7, 'Shorts Denim Rasgado Verano', 2, 4, 3, '2023-08-11', 20.25, 39.99, 75),
(8, 'Sweater Cuello Alto Lana Merino', 3, 3, 8, '2023-08-10', 35.00, 69.99, 55),
(9, 'Blusa Estilo Boho Lino', 4, 2, 6, '2023-08-09', 18.75, 36.99, 110),
(10, 'Jeans Ajustados Tiro Alto', 5, 1, 9, '2023-08-08', 29.90, 59.99, 70),
(11, 'Camiseta Estampado Retro Algodón', 1, 3, 1, '2023-08-07', 12.99, 24.99, 85),
(12, 'Pantalón Chino Corte Slim', 2, 4, 2, '2023-08-06', 24.50, 47.99, 65),
(13, 'Blusa Manga Larga Encaje', 3, 5, 6, '2023-08-05', 19.75, 38.99, 100),
(14, 'Vestido Fiesta Elegante Satén', 4, 1, 4, '2023-08-04', 28.90, 56.99, 50),
(15, 'Chaqueta Invierno Plumón Capucha', 5, 2, 5, '2023-08-03', 42.50, 82.99, 30),
(16, 'Camiseta Vintage Retro Algodón', 1, 4, 1, '2023-08-02', 13.75, 26.99, 95),
(17, 'Pantalón Jogger Deportivo', 2, 3, 2, '2023-08-01', 22.00, 42.99, 70),
(18, 'Shorts Playa Estampado Palmas', 3, 2, 3, '2023-07-31', 18.25, 35.99, 105),
(19, 'Sweater Cuello V Lana Acogedor', 4, 1, 8, '2023-07-30', 38.90, 76.99, 60),
(20, 'Vestido Verano Casual Algodón', 5, 4, 4, '2023-07-29', 31.50, 61.99, 40);

/* Tabla Proveen */

INSERT INTO Proveen VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 1),
(7, 4),
(8, 5),
(9, 4),
(10, 5),
(11, 1),
(12, 1),
(13, 4),
(14, 2),
(15, 3),
(16, 1),
(17, 1),
(18, 4),
(19, 5),
(20, 2);

/* Tabla Orden_de_compra */

INSERT INTO orden_de_compra VALUES
(1, '2023-01-15', 5),
(2, '2023-02-08', 3),
(3, '2023-03-21', 8),
(4, '2023-04-09', 2),
(5, '2023-05-12', 6),
(6, '2023-06-28', 4),
(7, '2023-07-03', 9),
(8, '2023-08-18', 1),
(9, '2023-09-05', 7),
(10, '2023-10-11', 10),
(11, '2023-11-09', 3),
(12, '2023-12-25', 6),
(13, '2023-01-03', 9),
(14, '2023-02-14', 2),
(15, '2023-03-19', 4),
(16, '2023-04-22', 7),
(17, '2023-05-07', 5),
(18, '2023-06-11', 1),
(19, '2023-07-29', 8),
(20, '2023-08-02', 10),
(21, '2023-09-17', 3),
(22, '2023-10-23', 6),
(23, '2023-11-30', 9),
(24, '2023-12-08', 2),
(25, '2023-01-28', 4),
(26, '2023-02-10', 7),
(27, '2023-03-09', 5),
(28, '2023-04-16', 1),
(29, '2023-05-20', 8),
(30, '2023-06-27', 10);

/* Tabla Integra */

INSERT INTO integra VALUES
(1, 11, 2, 1),
(1, 9, 1, 2),
(2, 12, 1, 3),
(2, 6, 3, 2),
(2, 11, 5, 1),
(3, 4, 5, 4),
(3, 6, 2, 1),
(4, 8, 2, 2),
(4, 19, 2, 3),
(4, 12, 5, 1),
(5, 5, 4, 4),
(5, 18, 2, 1),
(5, 20, 4, 2),
(6, 5, 5, 3),
(6, 7, 1, 4),
(6, 10, 2, 1),
(7, 9, 2, 2),
(7, 6, 3, 1),
(7, 13, 3, 3),
(8, 14, 5, 1),
(8, 2, 5, 2),
(9, 2, 3, 3),
(9, 3, 1, 1),
(9, 8, 1, 4),
(10, 1, 3, 2),
(10, 4, 4, 1),
(10, 8, 5, 3),
(11, 8, 1, 4),
(11, 10, 2, 1),
(11, 16, 5, 2),
(12, 1, 3, 3),
(12, 3, 5, 1),
(12, 12, 1, 4),
(13, 18, 3, 2),
(13, 4, 5, 3),
(14, 3, 2, 1),
(14, 9, 1, 4),
(14, 19, 2, 2),
(15, 13, 4, 1),
(15, 15, 3, 2),
(15, 17, 5, 3),
(16, 5, 4, 4),
(16, 10, 1, 1),
(16, 16, 4, 2),
(17, 17, 1, 3),
(17, 18, 4, 4),
(17, 20, 3, 1),
(18, 4, 1, 2),
(18, 15, 1, 3),
(19, 16, 4, 1),
(19, 17, 2, 2),
(19, 19, 3, 3),
(20, 1, 4, 4),
(20, 2, 3, 1),
(20, 4, 3, 2);

INSERT INTO Ventas VALUES
(1, '2023-01-15', 5, -10.5, 150.75, 10),
(2, '2023-02-08', 3, -5.25, 200.50, 5),
(3, '2023-03-21', 8, -15.75, 350.25, 15),
(4, '2023-04-09', 2, -8.00, 120.00, 8),
(5, '2023-05-12', 6, -12.25, 180.80, 12),
(6, '2023-06-28', 4, -7.75, 300.30, 7),
(7, '2023-07-03', 9, -20.00, 250.50, 20),
(8, '2023-08-18', 1, -3.50, 400.25, 3),
(9, '2023-09-05', 7, -5.00, 280.75, 5),
(10, '2023-10-11', 10, -15.25, 500.00, 15),
(11, '2023-11-09', 3, -10.75, 220.50, 10),
(12, '2023-12-25', 6, -8.25, 150.00, 8),
(13, '2023-01-03', 9, -12.50, 180.25, 12),
(14, '2023-02-14', 2, -5.75, 270.80, 5),
(15, '2023-03-19', 4, -7.00, 300.00, 7),
(16, '2023-04-22', 7, -10.25, 230.50, 10),
(17, '2023-05-07', 5, -8.50, 140.75, 8),
(18, '2023-06-11', 1, -2.75, 390.20, 2),
(19, '2023-07-29', 8, -10.00, 320.15, 10),
(20, '2023-08-02', 10, -18.25, 450.00, 18);


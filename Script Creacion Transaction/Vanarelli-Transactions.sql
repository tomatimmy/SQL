/* PRIMERA CONSIGNA */

/* Control y seteo del autocommit */

SELECT @@autocommit;
SET AUTOCOMMIT = 0;

/* Eliminamos un registro de la tabla ventas mediante una transaccion */

START TRANSACTION;

DELETE FROM Ventas WHERE nro_fc = 10;

/* Hasta que no indicamos el comando "ROLLBACK" o el comando "COMMIT", 
la trasnsaccion no finaliza */

-- ROLLBACK

COMMIT;  -- -> En este punto la transaccion queda finalizada

/* Agregamos nuevamente el registro */

INSERT INTO Ventas VALUES (10, '2023-07-07', 1, 0, 143, 2);


/* SEGUNDA CONSIGNA */

START TRANSACTION; -- Comenzamos transaccion

INSERT INTO CLIENTES VALUES (6, 10883170, 'Carlos', 'Villagran', 'Santa Cruz 655, piso 2', 'kiko@hotmail.com', 1551219876);
INSERT INTO CLIENTES VALUES (7, 8345643, 'Ramon', 'Valdes', 'Casa nro 7', 'donramon@gmail.com', 1545332145);
INSERT INTO CLIENTES VALUES (8, 17686091, 'Florinda', 'Meza', 'Vecindad, casa nro 2', 'florinda@yahoo.com', 1551998446);
INSERT INTO CLIENTES VALUES (9, 5345677, 'Edgar', 'Vivar', 'Calle 12 casa 4', 'barriga@gmail.com', 1555556512);

SAVEPOINT lote_01; -- Realizamos un primer savepoint

INSERT INTO CLIENTES VALUES (10, 83334512, 'Roberto', 'Gomez', 'La vecindad, nro 8', 'elchavo@gmail.com', 1244144440);
INSERT INTO CLIENTES VALUES (11, 4895559, 'Maria Antonieta', 'De las Nieves', 'Casa nro 7', 'chilindrina@hotmail.com', 1234444412);
INSERT INTO CLIENTES VALUES (12, 234441341, 'Matias', 'Martin', 'Calle Las palmas 1244', 'matiasmartin@gmail.com', 1521334886);
INSERT INTO CLIENTES VALUES (13, 10999413, 'Diego', 'Torres', 'Gorostiaga 1333 piso 2', 'dieguito@lastorres.com', 1444451233);

SAVEPOINT lote_02; -- Realizamos segundo savepoint

/* Controlamos la carga en la tabla Clientes, en este punto podemos realizar un 
rollback a cualquier de los savepoints anteriormente creados */

SELECT * FROM Clientes; -- > Clientes cargados

/* Ahora solo nos queda realizar un commit de los cambios, o realizar un rollback
a alguno de los savepoints */

-- RELEASE SAVEPOINT lote_01;






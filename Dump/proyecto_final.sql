-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: proyecto_final
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `baja_clientes_log`
--

DROP TABLE IF EXISTS `baja_clientes_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baja_clientes_log` (
  `id` int NOT NULL,
  `dni` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `accion` varchar(30) DEFAULT NULL,
  `usuario_sistema` varchar(30) DEFAULT NULL,
  `fecha_log` date DEFAULT NULL,
  `hora_log` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baja_clientes_log`
--

LOCK TABLES `baja_clientes_log` WRITE;
/*!40000 ALTER TABLE `baja_clientes_log` DISABLE KEYS */;
INSERT INTO `baja_clientes_log` VALUES (6,50505050,'mati','vanarelli','lalala','mati@vanarelli.com',123123123,'eliminado','root@localhost','2023-07-22','14:02:30');
/*!40000 ALTER TABLE `baja_clientes_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Buzos'),(2,'Camperas'),(3,'Remeras'),(4,'Gorras'),(5,'Pantalones');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,10833170,'Carlos','Piacuadio','Bucarelli 123','carlos@piacuadio.net',155112345),(2,10123040,'Maria','Carla','Av Correa 456','maria@carla.com',15511235),(3,34131333,'Juan','Perez','Av Lavalle 1012','juan@perez.net',123444121),(4,25666928,'Fernando','Ibañez','Echeverria 3350','fibañez@aol.net',12981344),(5,40555121,'Ricardo','Gomez','Cerrito 313','ricardogomez@gmail.com',41511151);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientes_por_orden_de_compra`
--

DROP TABLE IF EXISTS `clientes_por_orden_de_compra`;
/*!50001 DROP VIEW IF EXISTS `clientes_por_orden_de_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientes_por_orden_de_compra` AS SELECT 
 1 AS `nro_oc`,
 1 AS `fecha`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Integra`
--

DROP TABLE IF EXISTS `Integra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Integra` (
  `Orden_de_compra_nro_oc` int NOT NULL,
  `Productos_id` int NOT NULL,
  PRIMARY KEY (`Orden_de_compra_nro_oc`,`Productos_id`),
  KEY `fk_Orden_de_compra_has_Productos_Productos1_idx` (`Productos_id`),
  KEY `fk_Orden_de_compra_has_Productos_Orden_de_compra1_idx` (`Orden_de_compra_nro_oc`),
  CONSTRAINT `fk_Orden_de_compra_has_Productos_Orden_de_compra1` FOREIGN KEY (`Orden_de_compra_nro_oc`) REFERENCES `Orden_de_compra` (`nro_oc`),
  CONSTRAINT `fk_Orden_de_compra_has_Productos_Productos1` FOREIGN KEY (`Productos_id`) REFERENCES `Productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Integra`
--

LOCK TABLES `Integra` WRITE;
/*!40000 ALTER TABLE `Integra` DISABLE KEYS */;
INSERT INTO `Integra` VALUES (1,1),(6,1),(9,1),(2,2),(4,2),(7,2),(3,3),(8,3),(5,4),(10,5);
/*!40000 ALTER TABLE `Integra` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Log_integra` AFTER INSERT ON `integra` FOR EACH ROW INSERT INTO integra(orden_de_compra_nro_oc, productos_id) values (new.orden_de_compra_nro_oc, new.productos_id) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Orden_de_compra`
--

DROP TABLE IF EXISTS `Orden_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orden_de_compra` (
  `nro_oc` int NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`nro_oc`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `orden_de_compra_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id`),
  CONSTRAINT `orden_de_compra_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orden_de_compra`
--

LOCK TABLES `Orden_de_compra` WRITE;
/*!40000 ALTER TABLE `Orden_de_compra` DISABLE KEYS */;
INSERT INTO `Orden_de_compra` VALUES (1,'2023-06-01',4,1,2),(2,'2023-06-02',5,1,2),(3,'2023-06-02',10,2,2),(4,'2023-06-04',3,3,3),(5,'2023-06-04',12,3,3),(6,'2023-06-04',5,3,3),(7,'2023-06-06',8,5,1),(8,'2023-06-06',3,4,1),(9,'2023-06-10',3,4,2),(10,'2023-06-10',2,4,2),(12,'2023-10-10',3,1,2);
/*!40000 ALTER TABLE `Orden_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orden_de_compra_junio_2023`
--

DROP TABLE IF EXISTS `orden_de_compra_junio_2023`;
/*!50001 DROP VIEW IF EXISTS `orden_de_compra_junio_2023`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orden_de_compra_junio_2023` AS SELECT 
 1 AS `nro_oc`,
 1 AS `fecha`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orden_de_compra_log`
--

DROP TABLE IF EXISTS `orden_de_compra_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_de_compra_log` (
  `nro_oc` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `accion` varchar(30) DEFAULT NULL,
  `usuario_sistema` varchar(30) DEFAULT NULL,
  `fecha_log` date DEFAULT NULL,
  `hora_log` time DEFAULT NULL,
  PRIMARY KEY (`nro_oc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_de_compra_log`
--

LOCK TABLES `orden_de_compra_log` WRITE;
/*!40000 ALTER TABLE `orden_de_compra_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_de_compra_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orden_de_compra_total`
--

DROP TABLE IF EXISTS `orden_de_compra_total`;
/*!50001 DROP VIEW IF EXISTS `orden_de_compra_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orden_de_compra_total` AS SELECT 
 1 AS `nro_oc`,
 1 AS `fecha`,
 1 AS `cantidad`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `productos_id`,
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `color` varchar(30) NOT NULL,
  `id_categoria` int NOT NULL,
  `fecha_compra` date NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `stock` int NOT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  KEY `proveedores_idx` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `Categorias` (`id`),
  CONSTRAINT `proveedores` FOREIGN KEY (`id_proveedor`) REFERENCES `Proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'Gorro trucker','negro',4,'2023-05-01',8.9,17.8,10,2),(2,'Gorro baseball','rojo',4,'2023-05-01',8,16,10,2),(3,'Gorro lana invierno','blanco',4,'2023-05-01',5.4,10.8,5,2),(4,'Remera lisa','blanco',3,'2023-05-01',13.34,26.68,15,1),(5,'Remera escote en V','rojo',3,'2023-05-01',13.5,27,15,1),(6,'Remera manga larga','negro',3,'2023-05-01',14.21,28.42,15,1),(7,'Buzo canguro','negro',1,'2023-05-01',16.4,32.8,8,3),(8,'Buzo sweater','blanco',1,'2023-05-01',16.4,32.8,8,3),(9,'Pantalon chino','negro',5,'2023-05-01',21.99,43.98,12,3),(10,'Campera de jean','azul',2,'2023-05-01',22.31,44.62,4,3);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productos_negros`
--

DROP TABLE IF EXISTS `productos_negros`;
/*!50001 DROP VIEW IF EXISTS `productos_negros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productos_negros` AS SELECT 
 1 AS `descripcion`,
 1 AS `color`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productos_por_categoria`
--

DROP TABLE IF EXISTS `productos_por_categoria`;
/*!50001 DROP VIEW IF EXISTS `productos_por_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productos_por_categoria` AS SELECT 
 1 AS `descripcion`,
 1 AS `categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productos_por_proveedor`
--

DROP TABLE IF EXISTS `productos_por_proveedor`;
/*!50001 DROP VIEW IF EXISTS `productos_por_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productos_por_proveedor` AS SELECT 
 1 AS `producto`,
 1 AS `color`,
 1 AS `categoria`,
 1 AS `razon_social`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuit` bigint NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,20343004245,'Textil S.A.','Av Diaz Velez 111','textilsa@hotmail.com',1546544445),(2,27888716123,'Retazos y cosas S.R.L.','Av Carabobo 9844','retazosycosas@hotmail.com',1144431312),(3,20223525128,'Cierres textiles S.A.','Pedro Moran 2231','cierresyt@gmail.com',151235665);
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveen`
--

DROP TABLE IF EXISTS `Proveen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveen` (
  `Productos_id` int NOT NULL,
  `Proveedores_id` int NOT NULL,
  PRIMARY KEY (`Productos_id`,`Proveedores_id`),
  KEY `fk_Productos_has_Proveedores_Proveedores1_idx` (`Proveedores_id`),
  KEY `fk_Productos_has_Proveedores_Productos1_idx` (`Productos_id`),
  CONSTRAINT `fk_Productos_has_Proveedores_Productos1` FOREIGN KEY (`Productos_id`) REFERENCES `Productos` (`id`),
  CONSTRAINT `fk_Productos_has_Proveedores_Proveedores1` FOREIGN KEY (`Proveedores_id`) REFERENCES `Proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveen`
--

LOCK TABLES `Proveen` WRITE;
/*!40000 ALTER TABLE `Proveen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proveen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ventas`
--

DROP TABLE IF EXISTS `Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ventas` (
  `nro_fc` int NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int NOT NULL,
  `descuento` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `nro_oc_referido` int NOT NULL,
  PRIMARY KEY (`nro_fc`,`nro_oc_referido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `fk_Ventas_Orden_de_compra1_idx` (`nro_oc_referido`),
  CONSTRAINT `fk_Ventas_Orden_de_compra1` FOREIGN KEY (`nro_oc_referido`) REFERENCES `Orden_de_compra` (`nro_oc`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
INSERT INTO `Ventas` VALUES (1,'2023-06-01',1,0,0,1),(2,'2023-06-02',1,0,0,2),(3,'2023-06-02',2,0,0,3),(4,'2023-06-04',3,0,0,4),(5,'2023-06-04',3,0,0,5),(6,'2023-06-04',3,0,0,6),(7,'2023-06-06',5,0,0,7),(8,'2023-06-06',4,0,0,8),(9,'2023-06-10',4,0,0,9),(10,'2023-06-10',4,0,0,10);
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!50001 DROP VIEW IF EXISTS `ventas_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_detalle` AS SELECT 
 1 AS `nro_fc`,
 1 AS `fecha`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `nro_oc_referido`,
 1 AS `id_producto`,
 1 AS `descripcion`,
 1 AS `cantidad`,
 1 AS `precio_venta`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'proyecto_final'
--

--
-- Dumping routines for database 'proyecto_final'
--
/*!50003 DROP FUNCTION IF EXISTS `obtener_datos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_datos`(p_id INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE nombre_y_apellido VARCHAR(100);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombre_y_apellido FROM clientes WHERE id = p_id;
    RETURN nombre_y_apellido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `valor_venta_x_oc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `valor_venta_x_oc`(p_nro_oc INT) RETURNS float
    NO SQL
BEGIN
    DECLARE total FLOAT;
    SET total = (select cantidad FROM orden_de_compra oc WHERE oc.nro_oc = p_nro_oc);
    SET total = ROUND(total * (select precio_venta FROM ventas_detalle vd WHERE vd.nro_oc_referido = p_nro_oc), 2);
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear_nuevo_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_nuevo_cliente`(IN p_id INT, IN p_dni INT, IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_direccion VARCHAR(100), IN p_mail VARCHAR(50), in p_telefono INT)
BEGIN
    IF NOT EXISTS (SELECT * FROM clientes WHERE id = p_id OR dni = p_dni) THEN
        INSERT INTO clientes (id, dni, nombre, apellido, direccion, mail, telefono) VALUES (p_id, p_dni, p_nombre, p_apellido, p_direccion, p_mail, p_telefono);
        SELECT 'Registro creado exitosamente.' AS mensaje;
    ELSE
        SELECT 'El registro ya existe en la tabla.' AS mensaje;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ordenar_tabla_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_tabla_clientes`(IN p_campo_ordenamiento VARCHAR(30), IN p_tipo_ordenamiento VARCHAR(4))
BEGIN
    SET @consulta = CONCAT('SELECT * FROM clientes ORDER BY ', p_campo_ordenamiento, ' ', p_tipo_ordenamiento, ';');
    PREPARE consulta FROM @consulta;
    EXECUTE consulta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `clientes_por_orden_de_compra`
--

/*!50001 DROP VIEW IF EXISTS `clientes_por_orden_de_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientes_por_orden_de_compra` AS select `orden_de_compra`.`nro_oc` AS `nro_oc`,`orden_de_compra`.`fecha` AS `fecha`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from (`orden_de_compra` join `clientes` `c` on((`orden_de_compra`.`id_cliente` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orden_de_compra_junio_2023`
--

/*!50001 DROP VIEW IF EXISTS `orden_de_compra_junio_2023`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orden_de_compra_junio_2023` AS select `orden_de_compra`.`nro_oc` AS `nro_oc`,`orden_de_compra`.`fecha` AS `fecha`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from (`orden_de_compra` join `clientes` `c` on((`orden_de_compra`.`id_cliente` = `c`.`id`))) where ((`orden_de_compra`.`fecha` >= '2023-06-01') and (`orden_de_compra`.`fecha` <= '2023-06-30')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orden_de_compra_total`
--

/*!50001 DROP VIEW IF EXISTS `orden_de_compra_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orden_de_compra_total` AS select `oc`.`nro_oc` AS `nro_oc`,`oc`.`fecha` AS `fecha`,`oc`.`cantidad` AS `cantidad`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`i`.`Productos_id` AS `productos_id`,`p`.`descripcion` AS `descripcion` from (((`orden_de_compra` `oc` left join `clientes` `c` on((`oc`.`id_cliente` = `c`.`id`))) left join `integra` `i` on((`oc`.`nro_oc` = `i`.`Orden_de_compra_nro_oc`))) left join `productos` `p` on((`i`.`Productos_id` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productos_negros`
--

/*!50001 DROP VIEW IF EXISTS `productos_negros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productos_negros` AS select `productos`.`descripcion` AS `descripcion`,`productos`.`color` AS `color` from `productos` where (`productos`.`color` = 'negro') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productos_por_categoria`
--

/*!50001 DROP VIEW IF EXISTS `productos_por_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productos_por_categoria` AS select `p`.`descripcion` AS `descripcion`,`c`.`descripcion` AS `categoria` from (`productos` `p` join `categorias` `c` on((`p`.`id_categoria` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productos_por_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `productos_por_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productos_por_proveedor` AS select `prod`.`descripcion` AS `producto`,`prod`.`color` AS `color`,`c`.`descripcion` AS `categoria`,`p`.`razon_social` AS `razon_social` from ((`productos` `prod` join `categorias` `c` on((`prod`.`id_categoria` = `c`.`id`))) join `proveedores` `p` on((`prod`.`id_proveedor` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_detalle`
--

/*!50001 DROP VIEW IF EXISTS `ventas_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_detalle` AS select `v`.`nro_fc` AS `nro_fc`,`v`.`fecha` AS `fecha`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`v`.`nro_oc_referido` AS `nro_oc_referido`,`p`.`id` AS `id_producto`,`p`.`descripcion` AS `descripcion`,`oc`.`cantidad` AS `cantidad`,`p`.`precio_venta` AS `precio_venta`,round((`oc`.`cantidad` * `p`.`precio_venta`),2) AS `total` from ((((`ventas` `v` left join `clientes` `c` on((`v`.`id_cliente` = `c`.`id`))) left join `integra` `i` on((`v`.`nro_oc_referido` = `i`.`Orden_de_compra_nro_oc`))) left join `productos` `p` on((`i`.`Productos_id` = `p`.`id`))) left join `orden_de_compra` `oc` on((`v`.`nro_oc_referido` = `oc`.`nro_oc`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-22 15:26:08

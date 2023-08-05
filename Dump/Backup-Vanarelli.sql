-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: proyecto_final
-- ------------------------------------------------------
-- Server version	8.0.21

-- Tablas exportadas:

/* baja_clientes_log
   Categorías
   Clientes
   Integra
   Orden_de_compra
   orden_de_compra_log
   Productos
   Proveedores
   Proveen
   Ventas /*

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
-- Dumping data for table `baja_clientes_log`
--

LOCK TABLES `baja_clientes_log` WRITE;
/*!40000 ALTER TABLE `baja_clientes_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `baja_clientes_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Buzos'),(2,'Camperas'),(3,'Remeras'),(4,'Gorras'),(5,'Pantalones');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,10833170,'Carlos','Piacuadio','Bucarelli 123','carlos@piacuadio.net',155112345),(2,10123040,'Maria','Carla','Av Correa 456','maria@carla.com',15511235),(3,34131333,'Juan','Perez','Av Lavalle 1012','juan@perez.net',123444121),(4,25666928,'Fernando','Ibañez','Echeverria 3350','fibañez@aol.net',12981344),(5,40555121,'Ricardo','Gomez','Cerrito 313','ricardogomez@gmail.com',41511151),(6,10883170,'Carlos','Villagran','Santa Cruz 655, piso 2','kiko@hotmail.com',1551219876),(7,8345643,'Ramon','Valdes','Casa nro 7','donramon@gmail.com',1545332145),(8,17686091,'Florinda','Meza','Vecindad, casa nro 2','florinda@yahoo.com',1551998446),(9,5345677,'Edgar','Vivar','Calle 12 casa 4','barriga@gmail.com',1555556512),(10,83334512,'Roberto','Gomez','La vecindad, nro 8','elchavo@gmail.com',1244144440),(11,4895559,'Maria Antonieta','De las Nieves','Casa nro 7','chilindrina@hotmail.com',1234444412),(12,234441341,'Matias','Martin','Calle Las palmas 1244','matiasmartin@gmail.com',1521334886),(13,10999413,'Diego','Torres','Gorostiaga 1333 piso 2','dieguito@lastorres.com',1444451233);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Integra`
--

LOCK TABLES `Integra` WRITE;
/*!40000 ALTER TABLE `Integra` DISABLE KEYS */;
INSERT INTO `Integra` VALUES (1,1),(6,1),(9,1),(2,2),(4,2),(7,2),(3,3),(8,3),(5,4),(10,5);
/*!40000 ALTER TABLE `Integra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Orden_de_compra`
--

LOCK TABLES `Orden_de_compra` WRITE;
/*!40000 ALTER TABLE `Orden_de_compra` DISABLE KEYS */;
INSERT INTO `Orden_de_compra` VALUES (1,'2023-06-01',4,1,2),(2,'2023-06-02',5,1,2),(3,'2023-06-02',10,2,2),(4,'2023-06-04',3,3,3),(5,'2023-06-04',12,3,3),(6,'2023-06-04',5,3,3),(7,'2023-06-06',8,5,1),(8,'2023-06-06',3,4,1),(9,'2023-06-10',3,4,2),(10,'2023-06-10',2,4,2);
/*!40000 ALTER TABLE `Orden_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orden_de_compra_log`
--

LOCK TABLES `orden_de_compra_log` WRITE;
/*!40000 ALTER TABLE `orden_de_compra_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_de_compra_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'Gorro trucker','negro',4,'2023-05-01',8.9,17.8,10,2),(2,'Gorro baseball','rojo',4,'2023-05-01',8,16,10,2),(3,'Gorro lana invierno','blanco',4,'2023-05-01',5.4,10.8,5,2),(4,'Remera lisa','blanco',3,'2023-05-01',13.34,26.68,15,1),(5,'Remera escote en V','rojo',3,'2023-05-01',13.5,27,15,1),(6,'Remera manga larga','negro',3,'2023-05-01',14.21,28.42,15,1),(7,'Buzo canguro','negro',1,'2023-05-01',16.4,32.8,8,3),(8,'Buzo sweater','blanco',1,'2023-05-01',16.4,32.8,8,3),(9,'Pantalon chino','negro',5,'2023-05-01',21.99,43.98,12,3),(10,'Campera de jean','azul',2,'2023-05-01',22.31,44.62,4,3);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,20343004245,'Textil S.A.','Av Diaz Velez 111','textilsa@hotmail.com',1546544445),(2,27888716123,'Retazos y cosas S.R.L.','Av Carabobo 9844','retazosycosas@hotmail.com',1144431312),(3,20223525128,'Cierres textiles S.A.','Pedro Moran 2231','cierresyt@gmail.com',151235665);
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Proveen`
--

LOCK TABLES `Proveen` WRITE;
/*!40000 ALTER TABLE `Proveen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proveen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
INSERT INTO `Ventas` VALUES (1,'2023-06-01',1,0,0,1),(2,'2023-06-02',1,0,0,2),(3,'2023-06-02',2,0,0,3),(4,'2023-06-04',3,0,0,4),(5,'2023-06-04',3,0,0,5),(6,'2023-06-04',3,0,0,6),(7,'2023-06-06',5,0,0,7),(8,'2023-06-06',4,0,0,8),(9,'2023-06-10',4,0,0,9),(10,'2023-07-07',1,0,143,2);
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-05 16:50:33

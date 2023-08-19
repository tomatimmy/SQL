-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto_final
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_final
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_final` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `proyecto_final` ;

-- -----------------------------------------------------
-- Table `proyecto_final`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`Categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`Clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dni` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `mail` VARCHAR(50) NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`Proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuit` BIGINT NOT NULL,
  `razon_social` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `mail` VARCHAR(50) NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`Orden_de_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`Orden_de_compra` (
  `nro_oc` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `cantidad` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_proveedor` INT NOT NULL,
  PRIMARY KEY (`nro_oc`),
  INDEX `id_cliente` (`id_cliente` ASC) VISIBLE,
  INDEX `id_proveedor` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `orden_de_compra_ibfk_2`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `proyecto_final`.`Clientes` (`id`),
  CONSTRAINT `orden_de_compra_ibfk_3`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `proyecto_final`.`Proveedores` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`Productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `color` VARCHAR(30) NOT NULL,
  `id_categoria` INT NOT NULL,
  `fecha_compra` DATE NOT NULL,
  `precio_compra` FLOAT NOT NULL,
  `precio_venta` FLOAT NOT NULL,
  `stock` INT NOT NULL,
  `id_proveedor` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_categoria` (`id_categoria` ASC) VISIBLE,
  INDEX `proveedores_idx` (`id_proveedor` ASC) VISIBLE,
  CONSTRAINT `productos_ibfk_2`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `proyecto_final`.`Categorias` (`id`),
  CONSTRAINT `proveedores`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `proyecto_final`.`Proveedores` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`Integra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`Integra` (
  `Orden_de_compra_nro_oc` INT NOT NULL,
  `Productos_id` INT NOT NULL,
  PRIMARY KEY (`Orden_de_compra_nro_oc`, `Productos_id`),
  INDEX `fk_Orden_de_compra_has_Productos_Productos1_idx` (`Productos_id` ASC) VISIBLE,
  INDEX `fk_Orden_de_compra_has_Productos_Orden_de_compra1_idx` (`Orden_de_compra_nro_oc` ASC) VISIBLE,
  CONSTRAINT `fk_Orden_de_compra_has_Productos_Orden_de_compra1`
    FOREIGN KEY (`Orden_de_compra_nro_oc`)
    REFERENCES `proyecto_final`.`Orden_de_compra` (`nro_oc`),
  CONSTRAINT `fk_Orden_de_compra_has_Productos_Productos1`
    FOREIGN KEY (`Productos_id`)
    REFERENCES `proyecto_final`.`Productos` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`Proveen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`Proveen` (
  `Productos_id` INT NOT NULL,
  `Proveedores_id` INT NOT NULL,
  PRIMARY KEY (`Productos_id`, `Proveedores_id`),
  INDEX `fk_Productos_has_Proveedores_Proveedores1_idx` (`Proveedores_id` ASC) VISIBLE,
  INDEX `fk_Productos_has_Proveedores_Productos1_idx` (`Productos_id` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_has_Proveedores_Productos1`
    FOREIGN KEY (`Productos_id`)
    REFERENCES `proyecto_final`.`Productos` (`id`),
  CONSTRAINT `fk_Productos_has_Proveedores_Proveedores1`
    FOREIGN KEY (`Proveedores_id`)
    REFERENCES `proyecto_final`.`Proveedores` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`Ventas` (
  `nro_fc` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  `descuento` FLOAT NULL DEFAULT NULL,
  `total` FLOAT NULL DEFAULT NULL,
  `nro_oc_referido` INT NOT NULL,
  PRIMARY KEY (`nro_fc`, `nro_oc_referido`),
  INDEX `id_cliente` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_Ventas_Orden_de_compra1_idx` (`nro_oc_referido` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Orden_de_compra1`
    FOREIGN KEY (`nro_oc_referido`)
    REFERENCES `proyecto_final`.`Orden_de_compra` (`nro_oc`),
  CONSTRAINT `ventas_ibfk_2`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `proyecto_final`.`Clientes` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`baja_clientes_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`baja_clientes_log` (
  `id` INT NOT NULL,
  `dni` INT NULL DEFAULT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `apellido` VARCHAR(50) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `mail` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` INT NULL DEFAULT NULL,
  `accion` VARCHAR(30) NULL DEFAULT NULL,
  `usuario_sistema` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_log` DATE NULL DEFAULT NULL,
  `hora_log` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `proyecto_final`.`orden_de_compra_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`orden_de_compra_log` (
  `nro_oc` INT NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  `id_cliente` INT NULL DEFAULT NULL,
  `id_proveedor` INT NULL DEFAULT NULL,
  `accion` VARCHAR(30) NULL DEFAULT NULL,
  `usuario_sistema` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_log` DATE NULL DEFAULT NULL,
  `hora_log` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`nro_oc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `proyecto_final` ;

-- -----------------------------------------------------
-- Placeholder table for view `proyecto_final`.`clientes_por_orden_de_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`clientes_por_orden_de_compra` (`nro_oc` INT, `fecha` INT, `nombre` INT, `apellido` INT);

-- -----------------------------------------------------
-- Placeholder table for view `proyecto_final`.`orden_de_compra_junio_2023`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`orden_de_compra_junio_2023` (`nro_oc` INT, `fecha` INT, `nombre` INT, `apellido` INT);

-- -----------------------------------------------------
-- Placeholder table for view `proyecto_final`.`orden_de_compra_total`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`orden_de_compra_total` (`nro_oc` INT, `fecha` INT, `cantidad` INT, `nombre` INT, `apellido` INT, `productos_id` INT, `descripcion` INT);

-- -----------------------------------------------------
-- Placeholder table for view `proyecto_final`.`productos_negros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`productos_negros` (`descripcion` INT, `color` INT);

-- -----------------------------------------------------
-- Placeholder table for view `proyecto_final`.`productos_por_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`productos_por_categoria` (`descripcion` INT, `categoria` INT);

-- -----------------------------------------------------
-- Placeholder table for view `proyecto_final`.`productos_por_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`productos_por_proveedor` (`producto` INT, `color` INT, `categoria` INT, `razon_social` INT);

-- -----------------------------------------------------
-- Placeholder table for view `proyecto_final`.`ventas_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_final`.`ventas_detalle` (`nro_fc` INT, `fecha` INT, `nombre` INT, `apellido` INT, `nro_oc_referido` INT, `id_producto` INT, `descripcion` INT, `cantidad` INT, `precio_venta` INT, `total` INT);

-- -----------------------------------------------------
-- procedure crear_nuevo_cliente
-- -----------------------------------------------------

DELIMITER $$
USE `proyecto_final`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_nuevo_cliente`(IN p_id INT, IN p_dni INT, IN p_nombre VARCHAR(50), IN p_apellido VARCHAR(50), IN p_direccion VARCHAR(100), IN p_mail VARCHAR(50), in p_telefono INT)
BEGIN
    IF NOT EXISTS (SELECT * FROM clientes WHERE id = p_id OR dni = p_dni) THEN
        INSERT INTO clientes (id, dni, nombre, apellido, direccion, mail, telefono) VALUES (p_id, p_dni, p_nombre, p_apellido, p_direccion, p_mail, p_telefono);
        SELECT 'Registro creado exitosamente.' AS mensaje;
    ELSE
        SELECT 'El registro ya existe en la tabla.' AS mensaje;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function obtener_datos
-- -----------------------------------------------------

DELIMITER $$
USE `proyecto_final`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_datos`(p_id INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE nombre_y_apellido VARCHAR(100);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombre_y_apellido FROM clientes WHERE id = p_id;
    RETURN nombre_y_apellido;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ordenar_tabla_clientes
-- -----------------------------------------------------

DELIMITER $$
USE `proyecto_final`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_tabla_clientes`(IN p_campo_ordenamiento VARCHAR(30), IN p_tipo_ordenamiento VARCHAR(4))
BEGIN
    SET @consulta = CONCAT('SELECT * FROM clientes ORDER BY ', p_campo_ordenamiento, ' ', p_tipo_ordenamiento, ';');
    PREPARE consulta FROM @consulta;
    EXECUTE consulta;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function valor_venta_x_oc
-- -----------------------------------------------------

DELIMITER $$
USE `proyecto_final`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `valor_venta_x_oc`(p_nro_oc INT) RETURNS float
    NO SQL
BEGIN
    DECLARE total FLOAT;
    SET total = (select cantidad FROM orden_de_compra oc WHERE oc.nro_oc = p_nro_oc);
    SET total = ROUND(total * (select precio_venta FROM ventas_detalle vd WHERE vd.nro_oc_referido = p_nro_oc), 2);
    RETURN total;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `proyecto_final`.`clientes_por_orden_de_compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_final`.`clientes_por_orden_de_compra`;
USE `proyecto_final`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proyecto_final`.`clientes_por_orden_de_compra` AS select `proyecto_final`.`orden_de_compra`.`nro_oc` AS `nro_oc`,`proyecto_final`.`orden_de_compra`.`fecha` AS `fecha`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from (`proyecto_final`.`orden_de_compra` join `proyecto_final`.`clientes` `c` on((`proyecto_final`.`orden_de_compra`.`id_cliente` = `c`.`id`)));

-- -----------------------------------------------------
-- View `proyecto_final`.`orden_de_compra_junio_2023`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_final`.`orden_de_compra_junio_2023`;
USE `proyecto_final`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proyecto_final`.`orden_de_compra_junio_2023` AS select `proyecto_final`.`orden_de_compra`.`nro_oc` AS `nro_oc`,`proyecto_final`.`orden_de_compra`.`fecha` AS `fecha`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from (`proyecto_final`.`orden_de_compra` join `proyecto_final`.`clientes` `c` on((`proyecto_final`.`orden_de_compra`.`id_cliente` = `c`.`id`))) where ((`proyecto_final`.`orden_de_compra`.`fecha` >= '2023-06-01') and (`proyecto_final`.`orden_de_compra`.`fecha` <= '2023-06-30'));

-- -----------------------------------------------------
-- View `proyecto_final`.`orden_de_compra_total`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_final`.`orden_de_compra_total`;
USE `proyecto_final`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proyecto_final`.`orden_de_compra_total` AS select `oc`.`nro_oc` AS `nro_oc`,`oc`.`fecha` AS `fecha`,`oc`.`cantidad` AS `cantidad`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`i`.`Productos_id` AS `productos_id`,`p`.`descripcion` AS `descripcion` from (((`proyecto_final`.`orden_de_compra` `oc` left join `proyecto_final`.`clientes` `c` on((`oc`.`id_cliente` = `c`.`id`))) left join `proyecto_final`.`integra` `i` on((`oc`.`nro_oc` = `i`.`Orden_de_compra_nro_oc`))) left join `proyecto_final`.`productos` `p` on((`i`.`Productos_id` = `p`.`id`)));

-- -----------------------------------------------------
-- View `proyecto_final`.`productos_negros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_final`.`productos_negros`;
USE `proyecto_final`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proyecto_final`.`productos_negros` AS select `proyecto_final`.`productos`.`descripcion` AS `descripcion`,`proyecto_final`.`productos`.`color` AS `color` from `proyecto_final`.`productos` where (`proyecto_final`.`productos`.`color` = 'negro');

-- -----------------------------------------------------
-- View `proyecto_final`.`productos_por_categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_final`.`productos_por_categoria`;
USE `proyecto_final`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proyecto_final`.`productos_por_categoria` AS select `p`.`descripcion` AS `descripcion`,`c`.`descripcion` AS `categoria` from (`proyecto_final`.`productos` `p` join `proyecto_final`.`categorias` `c` on((`p`.`id_categoria` = `c`.`id`)));

-- -----------------------------------------------------
-- View `proyecto_final`.`productos_por_proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_final`.`productos_por_proveedor`;
USE `proyecto_final`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proyecto_final`.`productos_por_proveedor` AS select `prod`.`descripcion` AS `producto`,`prod`.`color` AS `color`,`c`.`descripcion` AS `categoria`,`p`.`razon_social` AS `razon_social` from ((`proyecto_final`.`productos` `prod` join `proyecto_final`.`categorias` `c` on((`prod`.`id_categoria` = `c`.`id`))) join `proyecto_final`.`proveedores` `p` on((`prod`.`id_proveedor` = `p`.`id`)));

-- -----------------------------------------------------
-- View `proyecto_final`.`ventas_detalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proyecto_final`.`ventas_detalle`;
USE `proyecto_final`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `proyecto_final`.`ventas_detalle` AS select `v`.`nro_fc` AS `nro_fc`,`v`.`fecha` AS `fecha`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`v`.`nro_oc_referido` AS `nro_oc_referido`,`p`.`id` AS `id_producto`,`p`.`descripcion` AS `descripcion`,`oc`.`cantidad` AS `cantidad`,`p`.`precio_venta` AS `precio_venta`,round((`oc`.`cantidad` * `p`.`precio_venta`),2) AS `total` from ((((`proyecto_final`.`ventas` `v` left join `proyecto_final`.`clientes` `c` on((`v`.`id_cliente` = `c`.`id`))) left join `proyecto_final`.`integra` `i` on((`v`.`nro_oc_referido` = `i`.`Orden_de_compra_nro_oc`))) left join `proyecto_final`.`productos` `p` on((`i`.`Productos_id` = `p`.`id`))) left join `proyecto_final`.`orden_de_compra` `oc` on((`v`.`nro_oc_referido` = `oc`.`nro_oc`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE `proyecto_final`;

DELIMITER $$
USE `proyecto_final`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `proyecto_final`.`t_baja_clientes`
BEFORE DELETE ON `proyecto_final`.`Clientes`
FOR EACH ROW
INSERT INTO baja_clientes_log(id, dni, nombre, apellido, direccion, mail, telefono, accion, usuario_sistema, fecha_log, hora_log)
VALUES (old.id, old.dni, old.nombre, old.apellido, old.direccion, old.mail, old.telefono, 'eliminado', system_user(), now(), curtime())$$

USE `proyecto_final`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `proyecto_final`.`t_orden_de_compra`
AFTER INSERT ON `proyecto_final`.`Orden_de_compra`
FOR EACH ROW
INSERT INTO orden_de_compra_log(nro_oc, fecha, cantidad, id_cliente, id_proveedor, accion, usuario_sistema, fecha_log, hora_log)
VALUES (new.nro_oc, new.fecha, new.cantidad, new.id_cliente, new.id_proveedor,'nueva oc', system_user(), now(), curdate())$$

USE `proyecto_final`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `proyecto_final`.`Log_integra`
AFTER INSERT ON `proyecto_final`.`Integra`
FOR EACH ROW
INSERT INTO integra(orden_de_compra_nro_oc, productos_id) values (new.orden_de_compra_nro_oc, new.productos_id)$$


DELIMITER ;

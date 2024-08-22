CREATE DATABASE  IF NOT EXISTS `casoestudiomn` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `casoestudiomn`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: casoestudiomn
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `casassistema`
--

DROP TABLE IF EXISTS `casassistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casassistema` (
  `IdCasa` bigint(20) NOT NULL AUTO_INCREMENT,
  `DescripcionCasa` varchar(30) NOT NULL,
  `PrecioCasa` decimal(10,2) NOT NULL,
  `UsuarioAlquiler` varchar(30) DEFAULT NULL,
  `FechaAlquiler` datetime DEFAULT NULL,
  PRIMARY KEY (`IdCasa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casassistema`
--

LOCK TABLES `casassistema` WRITE;
/*!40000 ALTER TABLE `casassistema` DISABLE KEYS */;
INSERT INTO `casassistema` VALUES (1,'Casa en San José',190000.00,NULL,NULL),(2,'Casa en Alajuela',145000.00,NULL,NULL),(3,'Casa en Cartago',115000.00,NULL,NULL),(4,'Casa en Heredia',122000.00,NULL,NULL),(5,'Casa en Guanacaste',105000.00,NULL,NULL);
/*!40000 ALTER TABLE `casassistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'casoestudiomn'
--

--
-- Dumping routines for database 'casoestudiomn'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizarCasas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCasas`(
    IN p_IdCasa INT,
    IN p_usuarioAlquiler VARCHAR(255),
    IN p_fechaAlquiler DATE
)
BEGIN
  
    IF p_usuarioAlquiler IS NULL OR TRIM(p_usuarioAlquiler) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El campo UsuarioAlquiler no puede estar vacío';
    ELSE
        
        UPDATE casassistema
        SET 
            UsuarioAlquiler = p_usuarioAlquiler,
            FechaAlquiler = IFNULL(p_fechaAlquiler, CURDATE())
        WHERE IdCasa = p_IdCasa
          AND FechaAlquiler IS NULL; 
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarCasas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarCasas`()
BEGIN
	SELECT
    IdCasa,
    DescripcionCasa ,
    PrecioCasa  ,
    UsuarioAlquiler ,
    DATE_FORMAT(FechaAlquiler, '%d/%m/%Y') AS "Fecha"
FROM
    casassistema
WHERE
    PrecioCasa BETWEEN 115000 AND 180000
ORDER BY
    FechaAlquiler IS NULL DESC,
    FechaAlquiler ASC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrarDescripcionCasa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarDescripcionCasa`()
BEGIN
	SELECT  IdCasa, DescripcionCasa
	FROM 	`casoestudiomn`.`casassistema`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-22  8:59:54

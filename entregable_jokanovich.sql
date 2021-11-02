-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
CREATE database if not EXISTS `entregable_joka` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `entregable_joka`;
--
-- Host: localhost    Database: entregable_joka
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'importantes'),(2,'no importantes'),(3,'recordatorios'),(4,'poesia'),(5,'internet'),(6,'r'),(7,'recuerdos'),(8,'chistes'),(9,'de todos los dias'),(10,'a definir');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `descripcion` text NOT NULL,
  `eliminable` tinyint(4) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e0941ba1-4171-4e4e-a50c-f393ac5a764f` (`usuario_id`),
  CONSTRAINT `FK_e0941ba1-4171-4e4e-a50c-f393ac5a764f` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'regalos','2020-10-08 00:00:00','2021-10-08 00:00:00','ropa',0,4),(2,'precios de tazas','2019-10-08 00:00:00','2021-07-08 00:00:00','800-900',0,1),(3,'no olvidar','2021-10-09 00:00:00','2021-10-09 00:00:00','la ropa en el balcon',0,7),(4,'proximo feriado','2018-10-08 00:00:00','2021-10-06 00:00:00','el jueves que viene',1,9),(5,'resultados futbol','2020-10-08 00:00:00','2021-10-08 00:00:00','1-1 2-1 20-8',0,4),(6,'las mejores tazas del pais','2007-10-08 00:00:00','2007-10-08 00:00:00','Mos Tazas Sublimadas',0,4),(7,'links importantes','2021-02-08 00:00:00','2021-10-08 00:00:00','www.mostazas.com.ar',0,1),(8,'diario intimo','2006-05-18 00:00:00','2021-10-08 00:00:00','me gusta ricardito',0,7),(9,'sueÃ±os','2004-10-08 00:00:00','2011-10-08 00:00:00','anoche soÃ±e con dinosaurios',1,3),(10,'compras','2020-10-06 00:00:00','2021-11-08 00:00:00','comida y bebida',1,5);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_categoria`
--

DROP TABLE IF EXISTS `notas_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `nota_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5beab557-fe2c-4d2a-bbf2-cda6d4d92a8a` (`categoria_id`),
  KEY `FK_8defc2db-d001-47ca-b647-0ddfec0caf6d` (`nota_id`),
  CONSTRAINT `FK_5beab557-fe2c-4d2a-bbf2-cda6d4d92a8a` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `FK_8defc2db-d001-47ca-b647-0ddfec0caf6d` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_categoria`
--

LOCK TABLES `notas_categoria` WRITE;
/*!40000 ALTER TABLE `notas_categoria` DISABLE KEYS */;
INSERT INTO `notas_categoria` VALUES (1,3,1),(2,2,2),(3,1,3),(4,6,4),(5,10,5),(6,6,6),(7,9,7),(8,5,8),(9,6,9),(10,10,10);
/*!40000 ALTER TABLE `notas_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `e-mail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Pedro Picapiedra','pedro_pica@gmail.com'),(2,'Pablo Marmol','pablo_marmol@hotmail.com'),(3,'Vilma Picapiedra','vilma_pica@gmail.com'),(4,'MartÃ­n Martinez','martinmartinez@gmail.com'),(5,'Mario Bros','mariobrother@gmail.com'),(6,'Carlos Carlin Carlo','carlincarlo@gmail.com'),(7,'Romualdo Lopez','info@romulopez.com'),(8,'MartÃ­n Mariano Martinez','martinmmartinez@gmail.com'),(9,'Jokan Jokanovich','jokan@gmail.com'),(10,'Gonzalo Gonzalez','gg@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'entregable_joka'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-02 16:46:06
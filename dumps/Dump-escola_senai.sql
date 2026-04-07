CREATE DATABASE  IF NOT EXISTS `escola_senai` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `escola_senai`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: escola_senai
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Table structure for table `tb_aluno`
--

DROP TABLE IF EXISTS `tb_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_aluno` (
  `ra_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(255) NOT NULL,
  `dt_nasc_aluno` date DEFAULT NULL,
  `cpf_aluno` char(11) NOT NULL,
  `sexo_aluno` enum('M','F') DEFAULT NULL,
  PRIMARY KEY (`ra_aluno`),
  UNIQUE KEY `cpf_aluno` (`cpf_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_aluno`
--

LOCK TABLES `tb_aluno` WRITE;
/*!40000 ALTER TABLE `tb_aluno` DISABLE KEYS */;
INSERT INTO `tb_aluno` VALUES (1,'João','2007-02-12','12345678999','M'),(2,'Thiago','2008-02-01','21232367129','M'),(3,'Maria','2002-04-23','22245678999','F'),(4,'Arthur','2004-05-02','56712345678','M'),(5,'Beatriz','2006-01-18','33345678999','F'),(6,'Pedro','2008-01-14','43212345679','M'),(7,'Lucas','2005-03-10','98765432100','M'),(8,'Ana','2003-07-22','65498732111','F'),(9,'Carla','2001-11-05','78912345600','F'),(10,'Bruno','2007-09-30','32165498722','M');
/*!40000 ALTER TABLE `tb_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso`
--

DROP TABLE IF EXISTS `tb_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_curso` (
  `cod_curs` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curs` varchar(255) DEFAULT NULL,
  `per_curs` int(11) DEFAULT NULL,
  `dur_curs` int(11) DEFAULT NULL,
  `valor_curs` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`cod_curs`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
INSERT INTO `tb_curso` VALUES (1,'Desenvolvimento de Sistemas',1,200,500.00),(2,'Banco de Dados',2,180,600.00),(3,'Redes',3,160,550.00),(4,'Java',1,220,700.00),(5,'Engenharia de Software',2,210,650.00);
/*!40000 ALTER TABLE `tb_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_matricula`
--

DROP TABLE IF EXISTS `tb_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_matricula` (
  `cod_mat` int(11) NOT NULL AUTO_INCREMENT,
  `data_mat` date NOT NULL,
  `cod_curs` int(11) NOT NULL,
  `ra_aluno` int(11) NOT NULL,
  PRIMARY KEY (`cod_mat`),
  KEY `ra_aluno` (`ra_aluno`),
  KEY `cod_curs` (`cod_curs`),
  CONSTRAINT `tb_matricula_ibfk_1` FOREIGN KEY (`ra_aluno`) REFERENCES `tb_aluno` (`ra_aluno`),
  CONSTRAINT `tb_matricula_ibfk_2` FOREIGN KEY (`cod_curs`) REFERENCES `tb_curso` (`cod_curs`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_matricula`
--

LOCK TABLES `tb_matricula` WRITE;
/*!40000 ALTER TABLE `tb_matricula` DISABLE KEYS */;
INSERT INTO `tb_matricula` VALUES (1,'2026-02-12',2,3),(2,'2026-04-16',1,5),(3,'2026-01-03',4,10),(4,'2026-01-18',4,4),(5,'2026-01-20',5,5),(6,'2026-01-22',1,6),(7,'2026-01-25',2,7),(8,'2026-01-28',3,8),(9,'2026-02-01',4,9),(10,'2026-02-03',5,10),(11,'2026-02-05',1,2),(12,'2026-02-08',2,3),(13,'2026-02-10',3,4),(14,'2026-02-12',4,5),(15,'2026-02-15',5,6),(16,'2026-02-18',1,7),(17,'2026-02-20',2,8),(18,'2026-02-22',3,9),(19,'2026-02-25',4,10),(20,'2026-02-28',5,1);
/*!40000 ALTER TABLE `tb_matricula` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-06 19:06:59

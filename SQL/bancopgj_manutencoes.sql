-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: bancopgj
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `manutencoes`
--

DROP TABLE IF EXISTS `manutencoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manutencoes` (
  `id_manutencao` int NOT NULL AUTO_INCREMENT,
  `id_maquina` int NOT NULL,
  `id_operador` int NOT NULL,
  `tipo_manutencao` varchar(50) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data_manutencao` datetime NOT NULL,
  PRIMARY KEY (`id_manutencao`),
  KEY `id_maquina` (`id_maquina`),
  KEY `id_operador` (`id_operador`),
  CONSTRAINT `manutencoes_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas` (`id_maquina`),
  CONSTRAINT `manutencoes_ibfk_2` FOREIGN KEY (`id_operador`) REFERENCES `operadores` (`id_operador`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manutencoes`
--

LOCK TABLES `manutencoes` WRITE;
/*!40000 ALTER TABLE `manutencoes` DISABLE KEYS */;
INSERT INTO `manutencoes` VALUES (5,1,1,'Preventiva','Troca de óleo e limpeza geral','2026-03-20 10:00:00'),(6,2,1,'Corretiva','Substituição de peça danificada','2026-03-21 14:30:00'),(7,1,2,'Preditiva','Análise de vibração','2026-03-22 09:15:00'),(8,3,2,'Corretiva','Reparo no motor','2026-03-23 16:45:00'),(9,1,1,'Preventiva','Troca de óleo e limpeza geral','2026-03-20 10:00:00'),(10,2,1,'Corretiva','Substituição de peça danificada','2026-03-21 14:30:00'),(11,1,2,'Preditiva','Análise de vibração','2026-03-22 09:15:00'),(12,3,2,'Corretiva','Reparo no motor','2026-03-23 16:45:00');
/*!40000 ALTER TABLE `manutencoes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-26 15:25:29

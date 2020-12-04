-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: 157a_project
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
-- Table structure for table `tester`
--

DROP TABLE IF EXISTS `tester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tester` (
  `Account ID` int NOT NULL,
  `Tester Name` varchar(45) DEFAULT NULL,
  `Verified` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Account ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tester`
--

LOCK TABLES `tester` WRITE;
/*!40000 ALTER TABLE `tester` DISABLE KEYS */;
INSERT INTO `tester` VALUES (32,'Fabio Di Troia','1'),(33,'Ethan Cruz','1'),(34,'Kyle Tran','0'),(35,'Andrew Pham','1'),(36,'David Vance','0'),(37,'Christopher Vongchanh','1'),(38,'Nick Dao','1'),(39,'Andy Nguyen','0'),(40,'Sonny Huynh','1'),(41,'Vincent Pham','1'),(42,'Hirohiko Araki','1'),(43,'Ethan Ly','0'),(44,'Crystal Ford','1'),(45,'Kathryn Coleman','0'),(46,'Tina Simmons','1'),(90,'Current Tester','1'),(91,'newtester newtester','1'),(92,'dsadasds adasdsadsa','0'),(93,'Live Testing','0');
/*!40000 ALTER TABLE `tester` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-03 19:00:42

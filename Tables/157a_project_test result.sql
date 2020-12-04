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
-- Table structure for table `test result`
--

DROP TABLE IF EXISTS `test result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test result` (
  `Test ID` int NOT NULL AUTO_INCREMENT,
  `Tester Email` varchar(45) DEFAULT NULL,
  `Client Email` varchar(45) DEFAULT NULL,
  `Date Processed` date DEFAULT NULL,
  `Date Tested` date DEFAULT NULL,
  `Result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Test ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test result`
--

LOCK TABLES `test result` WRITE;
/*!40000 ALTER TABLE `test result` DISABLE KEYS */;
INSERT INTO `test result` VALUES (1,'fabio.ditroia@gmail.com','david.zhang@gmail.com','2020-10-31','2020-10-30','Negative'),(2,'fabio.ditroia@gmail.com','selena.suen@gmail.com','2020-10-31','2020-10-30','Positive'),(3,'fabio.ditroia@gmail.com','kevin.nguyen@gmail.com','2020-10-31','2020-10-30','Positive'),(4,'fabio.ditroia@gmail.com','josh.hardmon@gmail.com','2020-10-31','2020-10-30','Negative'),(5,'fabio.ditroia@gmail.com','judith.cox@gmail.com','2020-10-31','2020-10-30','Positive'),(6,'fabio.ditroia@gmail.com','rose.howard@gmail.com','2020-10-31','2020-10-30','Negative'),(7,'fabio.ditroia@gmail.com','janice.ward@gmail.com','2020-10-31','2020-10-30','Positive'),(8,'fabio.ditroia@gmail.com','kelly.torres@gmail.com','2020-10-31','2020-10-30','Negative'),(9,'fabio.ditroia@gmail.com','catherine.ly@gmail.com','2020-10-31','2020-10-30','Positive'),(10,'fabio.ditroia@gmail.com','holly.le@gmail.com','2020-10-31','2020-10-30','Positive'),(11,'fabio.ditroia@gmail.com','lori.wood@gmail.com','2020-10-31','2020-10-30','Negative'),(12,'fabio.ditroia@gmail.com','rachel.barnes@gmail.com','2020-10-31','2020-10-30','Positive'),(13,'fabio.ditroia@gmail.com','tammy.sanders@gmail.com','2020-10-31','2020-10-30','Negative'),(14,'fabio.ditroia@gmail.com','sara.perry@gmail.com','2020-10-31','2020-10-30','Negative'),(15,'fabio.ditroia@gmail.com','anne.powell@gmail.com','2020-10-31','2020-10-30','Positive'),(16,'fabio.ditroia@gmail.com','anne.powell@gmail.com','2020-10-31','2020-10-30','Positive'),(18,'123@gmail.com','david.zhang@gmail.com','2020-12-02','2020-12-02','Positive'),(19,'132@gmail.com','david.zhang@gmail.com','2020-12-03','2020-12-03','Negative'),(20,'123@gmail.com','selena.suen@gmail.com	','2020-12-03','2020-12-02','Positive'),(21,'123@gmail.com','selena.suen@gmail.com','2020-12-02','2020-12-03','Positive'),(22,'123@gmail.com','david.zhang@gmail.com','2020-12-03','2020-12-01','Negative');
/*!40000 ALTER TABLE `test result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-03 19:00:43

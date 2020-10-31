-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cs157a_project
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `Address ID` int NOT NULL AUTO_INCREMENT,
  `City ID` varchar(45) DEFAULT NULL,
  `State ID` varchar(45) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Zip Code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Address ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1','18','3600 Florida Blvd., Baton Rouge, LA 70806','70806'),(2,'2','18','1419 Basin St., New Orleans, LA 70116','70116'),(3,'2','18','6801 Franklin Ave., New Orleans, LA 70122','70122'),(4,'3','18','2000 Segnette Blvd., Westwego, LA 70094','70094'),(5,'4','18','5600 Coliseum Blvd, Alexandria, LA 71303','71303'),(6,'5','18','7001 Gulf Highway, Lake Charles LA 70607','70607'),(7,'5','18','2000 Opelousas Street, Lake Charles LA 70601','70601'),(8,'5','18','1000 Walters Street, Lake Charles, LA 70607','70607'),(9,'2','18','5620 Read Blvd, New Orleans, LA 70127 ','70127 '),(10,'2','18','2700 S. Broad Street, New Orleans, LA 70118','70118'),(11,'6','18','506 North Acadia Road, Thibodaux, LA 70301','70301'),(12,'7','18','855 Belanger Street, Houma LA 70360','70360'),(13,'2','18','1631 Elysian Fields Ave., New Orleans LA 70117','70117'),(14,'2','18','4100 Canal St., New Orleans, LA 70119','70119'),(15,'7','18','5922 W. Main St., Ste. A, Houma LA 70360','70360');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-30 20:49:01

-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: cs157a
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
-- Table structure for table `testing location`
--

DROP TABLE IF EXISTS `testing location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing location` (
  `Location ID` int NOT NULL AUTO_INCREMENT,
  `Address ID` int DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Appointments` varchar(45) DEFAULT NULL,
  `Drive Through` varchar(45) DEFAULT NULL,
  `Open Hours` varchar(45) DEFAULT NULL,
  `Turnaround Time` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `URL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Location ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testing location`
--

LOCK TABLES `testing location` WRITE;
/*!40000 ALTER TABLE `testing location` DISABLE KEYS */;
INSERT INTO `testing location` VALUES (1,9,'Test Center 1','TRUE','TRUE','8AM-2PM','10','111-222-3333','https://testcenter1.com'),(2,3,'Test Center 3','TRUE','TRUE','10AM-4PM','4','333-444-5555','https://testcenter3.com'),(3,7,'Test Center 4','FALSE','FALSE','12PM-6PM','3','444-555-6666','https://testcenter4.com'),(4,12,'Test Center 5','FALSE','TRUE','10AM-4PM','7','555-666-7777','https://testcenter5.com'),(5,0,'Test Center 6','FALSE','FALSE','8AM-2PM','8','666-777-8888','https://testcenter6.com'),(6,5,'Test Center 7','FALSE','FALSE','11AM-5PM','6','777-888-9999','https://testcenter7.com'),(7,4,'Test Center 8','TRUE','TRUE','9AM-3PM','4','888-999-0000','https://testcenter8.com'),(8,14,'Test Center 9','TRUE','FALSE','12PM-6PM','6','999-000-1111','https://testcenter9.com'),(9,13,'Test Center 10','FALSE','FALSE','9AM-3PM','9','000-111-2222','https://testcenter10.com'),(10,8,'Test Center 11','FALSE','FALSE','9AM-3PM','10','123-456-7890','https://testcenter11.com'),(11,1,'Test Center 12','TRUE','TRUE','8AM-2PM','9','234-567-8901','https://testcenter12.com'),(12,10,'Test Center 13','TRUE','FALSE','12PM-6PM','7','345-567-8901','https://testcenter13.com'),(13,6,'Test Center 14','TRUE','TRUE','10AM-4PM','8','456-789-0123','https://testcenter14.com'),(14,11,'Test Center 15','FALSE','TRUE','11AM-5PM','5','567-890-1234','https://testcenter15.com');
/*!40000 ALTER TABLE `testing location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-01 12:23:54

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `Location ID` varchar(45) NOT NULL,
  `State ID` varchar(45) NOT NULL,
  `City ID` varchar(45) NOT NULL,
  `Zip Code` varchar(45) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Location ID`,`State ID`,`City ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('1','18','5','70607','1000 Walters Street, Lake Charles, LA 70607'),('10','18','4','71303','5600 Coliseum Blvd, Alexandria, LA 71303'),('11','18','2','70127 ','5620 Read Blvd, New Orleans, LA 70127 '),('12','18','7','70360','5922 W. Main St., Ste. A, Houma LA 70360'),('13','18','2','70122','6801 Franklin Ave., New Orleans, LA 70122'),('14','18','5','70607','7001 Gulf Highway, Lake Charles LA 70607'),('15','18','7','70360','855 Belanger Street, Houma LA 70360'),('2','18','2','70116','1419 Basin St., New Orleans, LA 70116'),('20','1','19','123','123123, 123, AL 123'),('3','18','2','70117','1631 Elysian Fields Ave., New Orleans LA 70117'),('4','18','5','70601','2000 Opelousas Street, Lake Charles LA 70601'),('5','18','3','70094','2000 Segnette Blvd., Westwego, LA 70094'),('6','18','2','70118','2700 S. Broad Street, New Orleans, LA 70118'),('7','18','1','70806','3600 Florida Blvd., Baton Rouge, LA 70806'),('8','18','2','70119','4100 Canal St., New Orleans, LA 70119'),('9','18','6','70301','506 North Acadia Road, Thibodaux, LA 70301');
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

-- Dump completed on 2020-12-03 19:00:43

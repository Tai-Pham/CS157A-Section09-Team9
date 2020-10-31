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
-- Table structure for table `testing location`
--

DROP TABLE IF EXISTS `testing location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testing location` (
  `Location ID` int NOT NULL AUTO_INCREMENT,
  `Address ID` int DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Appointments` tinyint(1) DEFAULT NULL,
  `Drive Through` tinyint(1) DEFAULT NULL,
  `Open Hours` varchar(45) DEFAULT NULL,
  `Turnaround Time` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `URL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Location ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testing location`
--

LOCK TABLES `testing location` WRITE;
/*!40000 ALTER TABLE `testing location` DISABLE KEYS */;
INSERT INTO `testing location` VALUES (1,1,'Baton Rouge General Medical Center',1,1,'Open 24 hours','4',' (225) 387-7000','https://www.brgeneral.org/'),(2,2,'Mahalia Jackson Theatre',0,1,'Not Available Anymore',NULL,NULL,NULL),(3,3,'University of New Orleans Lakefront Arena',0,1,'Not Available Anymore',NULL,NULL,NULL),(4,4,'Alario Event Center',0,1,'Not Available Anymore',NULL,NULL,NULL),(5,5,'Office of Public Health - Rapides Parish Coliseum',1,1,'Open 24 hours','4',NULL,NULL),(6,6,'Burton Coliseum Complex',0,1,'Not Available Anymore',NULL,NULL,'https://www.burtoncomplexevents.com/'),(7,7,'SWLA Center for Health Services',1,1,'8AM-5PM','3','(337) 439-9983','www.swlahealth.org'),(8,8,'Moss Memorial Health Clinic',1,1,'	8AM–5PM','4','(337) 480-8100','https://www.lcmh.com/locations/moss-memorial-health-clinic/'),(9,9,'New Orleans East Hospital',1,1,'Open 24 hours','5','(504) 592-6600','https://www.noehospital.org'),(10,10,'Odyssey House Louisiana Inc',0,1,'7AM–7PM','6','(504) 821-9211','https://www.ohlinc.org/'),(11,11,'Thibodaux Regional Health System',1,1,'Open 24 hours','4','(985) 447-5500','https://www.thibodaux.com/'),(12,12,'TGMC Medical Arts facility',0,1,'Not Available Anymore',NULL,NULL,'https://www.tgmc.com/news/drive-through-coronavirus-testing-available-tgmc/'),(13,13,'CrescentCare',1,1,'8:30AM–5PM','4','(504) 821-2601','https://crescentcarehealth.org/'),(14,14,'Ochsner Health Center and Urgent Care - Mid City at Canal',1,1,'8AM–8PM','4','(504) 218-4853','https://www.ochsner.org/locations/urgent-care-mid-city?utm_source=YextGoogle&utm_medium=Yext'),(15,15,'Ochsner Urgent Care - Houma',1,1,'8AM–8PM','4','(985) 262-8015','https://www.ochsner.org/locations/urgent-care-houma?utm_source=YextGoogle&utm_medium=Yext');
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

-- Dump completed on 2020-10-30 21:47:27

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `Account ID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Account ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (3,'GroverWoodley@sjsu.edu','GroverWoodley','woodley'),(4,'KodiFranklin@sjsu.edu','KodiFranklin','franklin'),(5,'AlisterCortes@sjsu.edu','AlisterCortes','cortes'),(6,'ZayneGardiner@sjsu.edu','ZayneGardiner','gardiner'),(7,'VioletMunro@sjsu.edu','VioletMunro','munro'),(8,'Gracie-MayCurry@sjsu.edu','Gracie-MayCurry','curry'),(9,'LucianaBallard@sjsu.edu','LucianaBallard','ballard'),(10,'VivianMckee@sjsu.edu','VivianMckee','mckee'),(11,'AairahCarrillo@sjsu.edu','AairahCarrillo','carrillo'),(12,'KylieRatcliffe@sjsu.edu','KylieRatcliffe','ratcliffe'),(13,'AimieWebber@sjsu.edu','AimieWebber','webber'),(14,'RozaLe@sjsu.edu','RozaLe','le'),(15,'LarryDavis@sjsu.edu','LarryDavis','davis'),(16,'DuncanRyan@sjsu.edu','DuncanRyan','ryan'),(17,'NawalClarkson@sjsu.edu','NawalClarkson','clarkson'),(18,'NadeemStephenson@sjsu.edu','NadeemStephenson','stephenson'),(19,'MihaiHerrera@sjsu.edu','MihaiHerrera','herrera'),(20,'SuzannaAmin@sjsu.edu','SuzannaAmin','amin'),(21,'AleezaGood@sjsu.edu','AleezaGood','good'),(22,'Lola-MaeMunro@sjsu.edu','Lola-MaeMunro','munro'),(23,'TamannaWalls@sjsu.edu','TamannaWalls','walls'),(24,'KayanRowley@sjsu.edu','KayanRowley','rowley'),(25,'ZephaniahStevens@sjsu.edu','ZephaniahStevens','stevens'),(26,'Mila-RoseCox@sjsu.edu','Mila-RoseCox','cox'),(27,'AaliyaWalters@sjsu.edu','AaliyaWalters','walters'),(28,'SanjeevKeller@sjsu.edu','SanjeevKeller','keller'),(29,'MylesJuarez@sjsu.edu','MylesJuarez','juarez'),(30,'YanisBallard@sjsu.edu','YanisBallard','ballard'),(31,'AlysLister@sjsu.edu','AlysLister','lister'),(32,'BellaSquires@sjsu.edu','BellaSquires','squires'),(33,'EsmaeCochran@sjsu.edu','EsmaeCochran','cochran'),(34,'RaheemMccoy@sjsu.edu','RaheemMccoy','mccoy'),(35,'KarlGregory@sjsu.edu','KarlGregory','gregory'),(36,'CaolanAldred@sjsu.edu','CaolanAldred','aldred'),(37,'JohannaPatrick@sjsu.edu','JohannaPatrick','patrick'),(38,'ChelsyHayward@sjsu.edu','ChelsyHayward','hayward'),(39,'EfanRiggs@sjsu.edu','EfanRiggs','riggs'),(40,'DeonMcgee@sjsu.edu','DeonMcgee','mcgee'),(41,'JadaHead@sjsu.edu','JadaHead','head'),(42,'NoelLozano@sjsu.edu','NoelLozano','lozano'),(43,'ZachariaJarvis@sjsu.edu','ZachariaJarvis','jarvis'),(44,'AdelinaWelsh@sjsu.edu','AdelinaWelsh','welsh'),(45,'StarPalacios@sjsu.edu','StarPalacios','palacios'),(46,'IsmaMcneil@sjsu.edu','IsmaMcneil','mcneil'),(47,'ReissClegg@sjsu.edu','ReissClegg','clegg');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-01 12:23:52

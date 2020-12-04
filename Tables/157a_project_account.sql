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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'mary.smith@gmail.com','marysmith','123'),(2,'patricia.johnson@gmail.com','patriciajohnson','123'),(3,'linda.williams@gmail.com','lindawilliams','123'),(4,'barbara.jones@gmail.com','barabarajones','123'),(5,'elizabeth.brown@gmail.com','elizabethbrown','123'),(6,'calvin.luong@gmail.com','calvinluong','123'),(7,'tai.pham@gmail.com','taipham','123'),(8,'nathan.phan@gmail.com','nathanphan','123'),(9,'mike.wu@gmail.com','mikewu','123'),(10,'nancy.thomas@gmail.com','nancythomas','123'),(11,'sarah.lewis@gmail.com','sarahlewis','123'),(12,'amy.lopez@gmail.com','amylopez','123'),(13,'shirley.allen@gmail.com','shirleyallen','123'),(14,'john.jones@gmail.com','johnjones','123'),(15,'helen.harris@gmail.com','helenharris','123'),(16,'brian.tran@gmail.com','briantran','123'),(17,'david.zhang@gmail.com','davidzhang','123'),(18,'selena.suen@gmail.com','selenasuen','123'),(19,'kevin.nguyen@gmail.com','kevinnguyen','123'),(20,'josh.harmon@gmail.com','joshharmon','123'),(21,'judith.cox@gmail.com','judithcox','123'),(22,'rose.howard@gmail.com','rosehoward','123'),(23,'janice.ward@gmail.com','janiceward','123'),(24,'kelly.torres@gmail.com','kellytorres','123'),(25,'catherine.ly@gmail.com','catherinely','123'),(26,'holly.le@gmail.com','hollyle','123'),(27,'lori.wood@gmail.com','loriwood','123'),(28,'rachel.barnes@gmail.com','rachelbarnes','123'),(29,'tammy.sanders@gmail.com','tammysanders','123'),(30,'sara.perry@gmail.com','saraperry','123'),(31,'anne.powell@gmail.com','annepowell','123'),(32,'fabio.ditroia@gmail.com','fabioditroia','123'),(33,'ethan.cruz@gmail.com','ethancruz','123'),(34,'kyle.tran@gmail.com','kyletran','123'),(35,'andrew.pham@gmail.com','andrewpham','123'),(36,'david.vance@gmail.com','davidvance','123'),(37,'christopher.vongchanh@gmail.com','christophervongchanh','123'),(38,'nick.dao@gmail.com','nickdao','123'),(39,'andy.nguyen@gmail.com','andynguyen','123'),(40,'sonny.huynh@gmail.com','sonnyhuynh','123'),(41,'vincent.pham@gmail.com','vincentpham','123'),(42,'hirohiko.araki@gmail.com','hirohikoaraki','123'),(43,'ethan.ly@gmail.com','ethanly','123'),(44,'crystal.ford@gmail.com','crystalford','123'),(45,'kathryn.coleman@gmail.com','kathryncoleman','123'),(46,'tina.simmons@gmail.com','tinasimmons','123'),(47,'annette.olson@gmail.com','annetteolson','123'),(48,'june.carroll@gmail.com','junecarroll','123'),(49,'samantha.duncan@gmail.com','samanthaduncan','123'),(50,'marion.snyder@gmail.com','marionsnyder','123'),(51,'dana.hart@gmail.com','danahart','123'),(52,'stacy.cunning@gmail.com','stacycunning','123'),(53,'ana.bradley@gmail.com','anabradley','123'),(54,'renee.lake@gmail.com','reneelake','123'),(55,'ida.andrews@gmail.com','idaandrews','123'),(56,'vivian.ruiz@gmail.com','vivianruiz','123'),(57,'robert.harper@gmail.com','robertharper','123'),(58,'holly.fox@gmail.com','hollyfox','123'),(59,'brittany.riley@gmail.com','brittanyriley','123'),(60,'melanie.armstrong@gmail.com','melaniearmstrong','123'),(61,'yolanda.weaver@gmail.com','yolandaweaver','123'),(62,'jean.greene@gmail.com','jeangreene','123'),(63,'katie.elliott@gmail.com','katieelliott','123'),(64,'kaiden.ly@gmail.com','kaidenly','123'),(65,'eileen.carr@gmail.com','eileencarr','123'),(66,'joseph.jackson@gmail.com','josephjackson','123'),(67,'johnny.joe@gmail.com','johnnyjoe','123'),(68,'coco.belle@gmail.com','cocobelle','123'),(69,'ella.oliver@gmail.com','ellaoliver','123'),(70,'tony.li@gmail.com','tonyli','123'),(71,'cara.liu@gmail.com','caraliu','123'),(72,'tony.zhuo@gmail.com','tonyzhuo','123'),(73,'gina.williams@gmail.com','ginawilliams','123'),(74,'david.doe@gmail.com','daviddoe','123'),(75,'jimmy.jones@gmail.com','jimmyjones','123'),(90,'123@gmail.com','currentTester','123'),(91,'132@gmail.com','newtester','123'),(92,'asddsada','dsad','123'),(93,'12ddd3@gmail.com','liveTesting','123');
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

-- Dump completed on 2020-12-03 19:00:42

CREATE DATABASE  IF NOT EXISTS `bids4job_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bids4job_db`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: bids4job_db
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bid` (
  `bid_ID` int(11) NOT NULL AUTO_INCREMENT,
  `task_ID` int(11) NOT NULL,
  `pro_user_ID` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `bid_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bid_ID`),
  KEY `fk_Bid_1_idx` (`pro_user_ID`),
  KEY `fk_Bid_2_idx` (`task_ID`),
  CONSTRAINT `fk_Pro_User_to_Bid_1` FOREIGN KEY (`pro_user_ID`) REFERENCES `pro_user` (`pro_user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Task_to_Bid_1` FOREIGN KEY (`task_ID`) REFERENCES `task` (`task_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,1,2,20,'2016-10-26 12:38:28'),(2,1,11,22,'2016-10-26 12:38:28'),(3,1,12,24,'2016-10-26 12:38:28'),(4,1,13,19,'2016-10-26 12:38:28'),(5,2,2,30,'2016-10-26 12:38:28'),(6,2,11,40,'2016-10-26 12:38:28'),(7,3,4,100,'2016-10-26 12:38:28'),(8,4,3,50,'2016-10-26 12:38:28'),(9,4,13,50,'2016-10-26 12:38:28'),(10,4,14,50,'2016-10-26 12:38:28'),(11,4,15,60,'2016-10-26 12:38:28'),(12,4,16,55,'2016-10-26 12:38:28'),(13,4,17,55,'2016-10-26 12:38:28'),(14,5,1,100,'2016-10-26 12:38:28'),(15,5,1,100,'2016-10-26 12:38:28'),(16,7,17,200,'2016-10-26 12:38:28'),(17,8,3,300,'2016-10-26 12:38:28'),(18,8,16,400,'2016-10-26 12:38:28'),(19,9,6,200,'2016-10-26 12:38:28'),(20,9,18,150,'2016-10-26 12:38:28'),(25,9,10,300,'2016-11-02 13:08:10'),(26,9,10,300,'2016-11-02 13:09:26'),(27,9,10,300,'2016-11-02 13:10:31'),(28,3,10,300,'2016-11-02 13:11:00'),(29,3,10,300,'2016-11-02 13:29:54');
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `contract_ID` int(11) NOT NULL AUTO_INCREMENT,
  `bid_ID` int(11) NOT NULL,
  `task_ID` int(11) NOT NULL,
  `contract_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contract_ID`),
  KEY `fk_Contract_Tasks1_idx` (`task_ID`),
  KEY `fk_Bid_to_Contract_1` (`bid_ID`),
  CONSTRAINT `fk_Bid_to_Contract_1` FOREIGN KEY (`bid_ID`) REFERENCES `bid` (`bid_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Task_to_Contract_1` FOREIGN KEY (`task_ID`) REFERENCES `task` (`task_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,1,1,'2016-10-29 21:00:00'),(2,6,2,'2016-10-29 21:00:00'),(3,7,3,'2016-10-29 21:00:00'),(4,12,4,'2016-10-29 21:00:00'),(5,14,5,'2016-10-29 21:00:00'),(6,15,6,'2016-10-29 21:00:00'),(7,16,7,'2016-10-29 21:00:00'),(8,18,8,'2016-10-29 21:00:00'),(9,20,9,'2016-10-29 21:00:00');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_user`
--

DROP TABLE IF EXISTS `pro_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_user` (
  `pro_user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `profession` varchar(45) NOT NULL,
  PRIMARY KEY (`pro_user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_user`
--

LOCK TABLES `pro_user` WRITE;
/*!40000 ALTER TABLE `pro_user` DISABLE KEYS */;
INSERT INTO `pro_user` VALUES (1,'Ioannis','Kranas','Berlin','Developer'),(2,'Chris','Stevens','London','Developer'),(3,'Petros','Petropoulos','Xios','Painter'),(4,'Helen','Niklaidou','KORAH','Public Relations'),(6,'Apostolis','Xatzignatiou','Faliro','Logistics'),(7,'Kostas','Xatzinathanail','Argiroupoli','Trainer'),(8,'Giorgos','Xondrogiannis','London','Telecoms'),(9,'Xrhstos','Stefanou','Kallithea','Programer'),(10,'Pavlos','Kranas','Kentro','Developer'),(11,'Petros','Petrou','Kentro','Barber'),(12,'Athanassia','Gerontiou','Glyfada','Barber'),(13,'Petros','Tsoulis','Glyfada','Barber'),(14,'Axilleas','tasoulis','Argiroupoli','Banker'),(15,'Giannis','Tsaousis','Exarxeia','Banker'),(16,'Alexia','Alexandrou','Petroupoli','Banker'),(17,'Fwtis','Twtiou','Xania','Banker'),(18,'Olga','Petrou','Ksanthi','Logistics'),(19,'Pavlos','Kranas','Kentro','Developer'),(20,'Petros','Antoniou','Kentro','Teacher'),(22,'Manolis','Gombakis','Xania','Cofee Expert'),(23,'Giannis','Dimitriou','Korah','Developer'),(24,'Olga','Ioakeim','Koropi','Developer'),(25,'Giannis','Kranas','Kopsaxeila','Barber'),(26,'Ioannis','Koulopoulos','Xania','Student'),(27,'Kwstas','Kwstis','asdad','Developer'),(28,'Orestis','Zafeiriou','Rotterdam','Musician'),(29,'Giannis','Petrou','Xania','Developer'),(30,'Thanos','Petropoulos','London','Banker'),(31,'Odysseas','Zafeiriou','Amsterdam','Musician'),(32,'Stefanos','Leontiou','Korah','Teacher'),(33,'John','Koulopoulos','Xania','Developer'),(34,'Manolis','Athanasiou','New York','Architect'),(36,'Kwstas','Gialammas','Nea Smyrnh','Reikh'),(37,'Petros','Athinaiou','London','Banker'),(38,'Panagiotis','Leontopoulos','Larissa','Trainer'),(39,'Alexis','Lambrinakos','Nea Smyrnh','Barber'),(40,'Pyrros','Koletsis','Marousi','Manager'),(42,'Archontia','Nikoli','Athens','Logistics'),(43,'George','Konstantos','Athens','Garden Designer'),(44,'Alex','Konstantos','Athens','Painter');
/*!40000 ALTER TABLE `pro_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_user`
--

DROP TABLE IF EXISTS `simple_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_user` (
  `simple_user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  PRIMARY KEY (`simple_user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_user`
--

LOCK TABLES `simple_user` WRITE;
/*!40000 ALTER TABLE `simple_user` DISABLE KEYS */;
INSERT INTO `simple_user` VALUES (1,'Giannis','Kranas','Faliro'),(2,'Petros','Petrou','Kenro'),(3,'Maria','Ioannou','Faliro'),(4,'Marielena','Rossetou','Stuttgard'),(5,'Dimitris','Kranas','Glyfada'),(6,'Giwrgos','Spyridakis','Zografou'),(7,'Dimitris','Theodoropoulos','Hlioupoli'),(8,'Giwrgos','Mbartzis','Xalandri'),(9,'Eleni','Nikolaidou','Petroupoli'),(10,'Xristina','Koletsi','Marousi'),(11,'Pyrros','Koletsis','Marousi'),(12,'Xristos','Palaiologos','Marousi'),(13,'Thodoris','Tzanoudakis','Glyfada'),(14,'Rania','Karpathi','Argiroupoli'),(15,'Alexia','Psyllaki','Thessaloniki'),(16,'Patritsia','Zndoff','Kentro');
/*!40000 ALTER TABLE `simple_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_ID` int(11) NOT NULL AUTO_INCREMENT,
  `deadline` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `work_field` varchar(45) NOT NULL,
  `simple_user_ID` int(11) NOT NULL,
  PRIMARY KEY (`task_ID`),
  KEY `fk_Task_1_idx` (`simple_user_ID`),
  CONSTRAINT `fk_Simple_User_to_Task_1` FOREIGN KEY (`simple_user_ID`) REFERENCES `simple_user` (`simple_user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'2016-11-04 22:00:00','Barber',1),(2,'2016-11-08 22:00:00','Barber',1),(3,'2016-12-04 22:00:00','Programmer',2),(4,'2016-12-09 22:00:00','Banker',3),(5,'2016-11-29 22:00:00','Programmer',3),(6,'2016-11-30 22:00:00','Banker',3),(7,'2016-10-31 22:00:00','Banker',4),(8,'2016-11-08 22:00:00','Banker',5),(9,'2016-12-04 22:00:00','Logistics',6);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-08 12:26:46

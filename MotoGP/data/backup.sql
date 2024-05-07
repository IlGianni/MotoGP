-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: motogp
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `idCategory` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `percentage_race_distance` int(11) NOT NULL,
  `lap_slower` int(11) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'MotoGP',100,100),(2,'Moto2',90,95),(3,'Moto3',75,89),(4,'No Team',0,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteo`
--

DROP TABLE IF EXISTS `meteo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteo` (
  `idMeteo` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `percentage_difference` bigint(20) NOT NULL,
  PRIMARY KEY (`idMeteo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteo`
--

LOCK TABLES `meteo` WRITE;
/*!40000 ALTER TABLE `meteo` DISABLE KEYS */;
INSERT INTO `meteo` VALUES (1,'Sunny',0),(2,'Light Rain',25),(3,'Heavy Rain',50);
/*!40000 ALTER TABLE `meteo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `points` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  PRIMARY KEY (`points`,`position`,`session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (0,10,'Sprint'),(0,11,'Sprint'),(0,12,'Sprint'),(0,13,'Sprint'),(0,14,'Sprint'),(0,15,'Sprint'),(0,16,'Race'),(0,16,'Sprint'),(0,17,'Race'),(0,17,'Sprint'),(0,18,'Race'),(0,18,'Sprint'),(0,19,'Race'),(0,19,'Sprint'),(0,20,'Race'),(0,20,'Sprint'),(0,21,'Race'),(0,21,'Sprint'),(0,22,'Race'),(0,22,'Sprint'),(0,23,'Race'),(0,24,'Race'),(0,25,'Race'),(0,26,'Race'),(0,27,'Race'),(0,28,'Race'),(0,29,'Race'),(0,30,'Race'),(1,9,'Sprint'),(1,15,'Race'),(2,8,'Sprint'),(2,14,'Race'),(3,7,'Sprint'),(3,13,'Race'),(4,6,'Sprint'),(4,12,'Race'),(5,5,'Sprint'),(5,11,'Race'),(6,4,'Sprint'),(6,10,'Race'),(7,3,'Sprint'),(7,9,'Race'),(8,8,'Race'),(9,2,'Sprint'),(9,7,'Race'),(10,6,'Race'),(11,5,'Race'),(12,1,'Sprint'),(13,4,'Race'),(16,3,'Race'),(20,2,'Race'),(25,1,'Race');
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualifying`
--

DROP TABLE IF EXISTS `qualifying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qualifying` (
  `idRider` bigint(20) NOT NULL,
  `idRace` bigint(20) NOT NULL,
  `lap_time` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `session` varchar(255) NOT NULL,
  PRIMARY KEY (`idRace`,`idRider`,`session`) USING BTREE,
  KEY `idRider` (`idRider`),
  CONSTRAINT `qualifying_ibfk_1` FOREIGN KEY (`idRace`) REFERENCES `race` (`idRace`),
  CONSTRAINT `qualifying_ibfk_2` FOREIGN KEY (`idRider`) REFERENCES `rider` (`idRider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualifying`
--

LOCK TABLES `qualifying` WRITE;
/*!40000 ALTER TABLE `qualifying` DISABLE KEYS */;
/*!40000 ALTER TABLE `qualifying` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `race` (
  `idRace` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTrack` bigint(20) NOT NULL,
  `idMeteo` bigint(20) DEFAULT NULL,
  `idSeason` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`idRace`),
  KEY `idMeteo` (`idMeteo`),
  KEY `idSeason` (`idSeason`),
  KEY `idTrack` (`idTrack`),
  CONSTRAINT `race_ibfk_1` FOREIGN KEY (`idMeteo`) REFERENCES `meteo` (`idMeteo`),
  CONSTRAINT `race_ibfk_2` FOREIGN KEY (`idSeason`) REFERENCES `season` (`idSeason`),
  CONSTRAINT `race_ibfk_3` FOREIGN KEY (`idTrack`) REFERENCES `track` (`idTrack`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (1,1,1,1,'Finished','MotoGP'),(15,2,2,1,'Finished','MotoGP'),(16,3,1,1,'Finished','MotoGP'),(17,4,1,1,'Finished','MotoGP'),(18,5,1,1,'Finished','MotoGP'),(19,6,1,1,'Finished','MotoGP'),(20,7,3,1,'Finished','MotoGP'),(21,8,1,1,'Finished','MotoGP'),(22,9,3,1,'Finished','MotoGP'),(23,10,2,1,'Finished','MotoGP'),(24,11,3,1,'Finished','MotoGP'),(25,12,2,1,'Finished','MotoGP'),(26,13,1,1,'Finished','MotoGP'),(27,14,2,1,'Finished','MotoGP'),(28,15,1,1,'Finished','MotoGP'),(29,16,3,1,'Finished','MotoGP'),(30,17,1,1,'Finished','MotoGP'),(31,18,1,1,'Finished','MotoGP'),(32,19,2,1,'Finished','MotoGP'),(33,20,1,1,'Finished','MotoGP'),(34,21,1,1,'Finished','MotoGP'),(36,1,1,2,'Finished','MotoGP'),(37,2,1,2,'Finished','MotoGP'),(38,3,1,2,'Finished','MotoGP'),(39,4,3,2,'Finished','MotoGP'),(40,5,3,2,'Finished','MotoGP'),(41,6,1,2,'Finished','MotoGP'),(42,7,1,2,'Finished','MotoGP'),(43,8,1,2,'Finished','MotoGP'),(44,9,2,2,'Finished','MotoGP'),(45,10,1,2,'Finished','MotoGP'),(46,11,2,2,'Finished','MotoGP'),(47,12,3,2,'Finished','MotoGP'),(48,13,1,2,'Finished','MotoGP'),(49,14,1,2,'Finished','MotoGP'),(50,15,3,2,'Finished','MotoGP'),(51,16,2,2,'Finished','MotoGP'),(52,17,3,2,'Finished','MotoGP'),(53,18,1,2,'Finished','MotoGP'),(54,19,1,2,'Finished','MotoGP'),(55,20,1,2,'Finished','MotoGP'),(56,21,1,2,'Finished','MotoGP'),(58,1,1,3,'Finished','MotoGP'),(59,2,1,3,'Finished','MotoGP'),(60,3,1,3,'Finished','MotoGP'),(61,4,3,3,'Finished','MotoGP'),(62,5,3,3,'Finished','MotoGP'),(63,6,1,3,'Finished','MotoGP'),(64,7,3,3,'Finished','MotoGP'),(65,8,2,3,'Finished','MotoGP'),(66,9,2,3,'Finished','MotoGP'),(67,10,3,3,'Finished','MotoGP'),(68,11,3,3,'Finished','MotoGP'),(69,12,1,3,'Finished','MotoGP'),(70,13,1,3,'Finished','MotoGP'),(71,14,1,3,'Finished','MotoGP'),(72,15,2,3,'Finished','MotoGP'),(73,16,2,3,'Finished','MotoGP'),(74,17,3,3,'Finished','MotoGP'),(75,18,2,3,'Finished','MotoGP'),(76,19,2,3,'Finished','MotoGP'),(77,20,1,3,'Finished','MotoGP'),(78,21,NULL,3,'Pre_Qualifying','Moto3');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race_results`
--

DROP TABLE IF EXISTS `race_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `race_results` (
  `idRider` bigint(20) NOT NULL,
  `idRace` bigint(20) NOT NULL,
  `session` varchar(255) NOT NULL,
  `total_time` bigint(20) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lap` int(11) NOT NULL,
  `points` int(11) DEFAULT NULL,
  `DNF` tinyint(1) NOT NULL,
  PRIMARY KEY (`idRider`,`idRace`,`session`,`lap`) USING BTREE,
  KEY `idRace` (`idRace`),
  CONSTRAINT `race_results_ibfk_1` FOREIGN KEY (`idRace`) REFERENCES `race` (`idRace`),
  CONSTRAINT `race_results_ibfk_2` FOREIGN KEY (`idRider`) REFERENCES `rider` (`idRider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race_results`
--

LOCK TABLES `race_results` WRITE;
/*!40000 ALTER TABLE `race_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `race_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rider`
--

DROP TABLE IF EXISTS `rider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rider` (
  `idRider` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `nation` varchar(255) NOT NULL,
  `race_performance` float DEFAULT NULL,
  `qualy_performance` float DEFAULT NULL,
  `wet_performance` float DEFAULT NULL,
  `crash_possibility` float DEFAULT NULL,
  `average` float DEFAULT NULL,
  `idTeam` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idRider`),
  KEY `idTeam` (`idTeam`),
  CONSTRAINT `rider_ibfk_1` FOREIGN KEY (`idTeam`) REFERENCES `team` (`idTeam`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rider`
--

LOCK TABLES `rider` WRITE;
/*!40000 ALTER TABLE `rider` DISABLE KEYS */;
INSERT INTO `rider` VALUES (1,'Francesco','Bagnaia',1,'Italy',1.66667,2.33333,1.8,6,2.63333,2),(2,'Enea','Bastianini',23,'Italy',2.33333,3.66667,4.33333,1.5,2.97222,2),(3,'Jorge','Martin',89,'Spain',1.3,1.3,5.3,8,3.08333,7),(4,'Franco','Morbidelli',21,'Italy',7,7.9,7,21,9.63333,10),(5,'Alex','Marquez',73,'Spain',4.2,5.3,6.78,27,8.79667,40),(6,'Marc','Marquez',93,'Spain',2.66667,2,2.66667,18,5,3),(7,'Luca','Marini',10,'Italy',6.5,6,5.1,4,5.68333,10),(8,'Joan','Mir',36,'Spain',8.33333,7,8.33333,33,12,40),(9,'Fabio','Quartararo',20,'France',3,2,5.6,15,5.1,5),(10,'Alex','Rins',42,'Spain',6.8,8.1,4,22.5,9.38333,40),(11,'Marco','Bezzecchi',72,'Italy',4.2,4.5,5,14,6.06667,3),(12,'Fabio','Di Giannantonio',49,'Italy',5.66667,4.33333,5,9,5.66667,6),(13,'Aleix','Espargaro',41,'Spain',4.5,2.6,2.5,9,4.28333,5),(14,'Maverick','Vinales',12,'Spain',2.1,1.8,4.8,12,4.1,1),(15,'Raul','Fernandez',25,'Spain',6.9,6.85,8,25,10.0833,40),(16,'Miguel','Oliveira',88,'Portugal',4.8,4.8,1.4,8,4.76667,11),(17,'Johann','Zarco',5,'France',7,6,4,23,8.83333,4),(18,'Takaaki','Nakagami',30,'Japan',8,8,7.33333,31.5,11.8056,40),(19,'Pedro','Acosta',37,'Spain',2.4,2.3,5,3,2.9,9),(20,'Augusto','Fernandez',89,'Spain',7.8,8.7,9,30,12,40),(21,'Brad','Binder',33,'South Africa',2.4,4,1,11,4.13333,9),(22,'Jack','Miller',43,'Australia',5,4.66667,3.33333,28.5,8.52778,40),(23,'David','Munoz',64,'Spain',17.4,19.9,22,27,20.6,12),(24,'Joel','Kelso',66,'Australia',11,11.3333,10,3,9.6111,38),(25,'Joel','Esteban',78,'Spain',19.6,20,23,19,20.2,21),(26,'David','Alonso',80,'Spain',11,10,16,6.5,10.75,38),(27,'Riccardo','Rossi',54,'Italy',18.6667,17,17,27,19.2222,19),(28,'Noah','Dettwiler',55,'Switzerland',24.2,24.2,21.5,26,24.05,14),(29,'Tatchakorn','Buasri',5,'Thailand',24.5,23.3333,21,13.5,21.6944,15),(30,'Taiyo','Furusato',72,'Japan',20,19.6,13,14,17.7,16),(31,'Adrian','Fernandez',31,'Spain',21.3333,22.6667,17,37.5,23.75,17),(32,'Angel','Piqueras',36,'Spain',11.3,12,15,18,13.2667,27),(33,'Tatsuki','Suzuki',24,'Japan',24.7,24.9,19,19,22.8667,23),(34,'Collin','Veijer',96,'Netherlands',13.5,13,10.5,25,14.75,34),(35,'Scott','Ogden',19,'United Kingdom',21.8,23,19,30,23.1,18),(36,'Joshua','Whatley',70,'United Kingdom',23.3333,24,22,24,23.4444,40),(37,'Ryusei','Yamanaka',6,'Japan',18.9,16.9,21,14,17.7667,19),(38,'Ivan','Ortola',48,'Spain',13.8,13.9,17,12,14.0667,27),(39,'Nicola','Carraro',10,'Italy',22,21.6,15,22,20.7,20),(40,'Stefano','Nepa',82,'Italy',12,13,14,6,11.6667,30),(41,'Jacob','Roulstone',12,'Australia',11,11.5,15,5,10.8333,32),(42,'Daniel','Holgado',96,'Spain',10,11.8,13,11,11.2667,36),(43,'Xabi','Zurutuza',85,'Spain',13.7,14,15,18,14.7333,25),(44,'Jose Antonio','Rueda',99,'Spain',12.8,13,14,27,15.4333,25),(45,'Matteo','Bertelle',18,'Italy',13,13.2,10,11,12.2333,31),(46,'David','Almansa',22,'Spain',18.6667,21.3333,20.6667,21,20.2778,23),(47,'Filippo','Farioli',7,'Italy',19.8,18.4,20,27,20.5667,20),(48,'Luca','Lunetta',58,'Italy',21.9,19,21,28,21.8,17),(49,'Sergio','Garcia',3,'Spain',7.3,7.5,16,6,8.6,11),(50,'Jaume','Masia',5,'Spain',17,17.3333,18,33,19.9444,34),(51,'Barry','Baltus',7,'Belgium',14.3333,13.3333,14.3333,28.5,16.3611,37),(52,'Diogo','Moreira',10,'Brasil',13.3,13.3,14.3,17,14.0833,30),(53,'Filip','Salač',12,'Cech Republic',12.6,12.5,13.7,3,11.15,26),(54,'Celestino','Vietti',13,'Italy',7.1,7.6,10,6,7.56667,6),(55,'Tony','Arbolino',14,'Italy',6.8,7,4,3,5.76667,7),(56,'Darryn','Binder',15,'South Africa',15,16.6667,15,36,19.0556,40),(57,'Joe','Roberts',16,'USA',9.66667,10,9.66667,21,11.6667,33),(58,'Alex','Escrig',17,'Spain',16.3333,16.7,15.3,13.2,15.7611,28),(59,'Manuel','Gonzalez',18,'Spain',11,12,12,24,13.6667,40),(60,'Xavi','Cardelus',20,'Andorra',17.4,17.9,16.1,36,20.45,28),(61,'Alonso','Lopez',21,'Spain',8,7.7,11,19.5,10.3167,8),(62,'Ayumu','Sasaki',22,'Japan',16.6667,15.6667,17.6667,42,20.7222,39),(63,'Marcos','Ramírez',24,'Spain',10.5,10.66,9,9,10.0533,33),(64,'Izan','Guevara',28,'Spain',12.8,12.7,9.9,25,14.3167,37),(65,'Mario','Aji',34,'Indonesia',18,17.6667,16,45,22.0556,40),(66,'Somkiat','Chantra',35,'Thailand',14.6667,13,10.3333,37.5,17.1944,29),(67,'Xavier','Artigas',43,'Spain',17.3333,15.3333,17.3333,34.5,19.5278,40),(68,'Aron','Canet',44,'Spain',6.99,7.33333,10,9,7.94111,8),(69,'Jeremy','Alcoba',52,'Spain',12.1,13.3333,8.5,27,14.3944,26),(70,'Deniz','Oncu',53,'Turkey',15,14.3,14,13,14.2667,36),(71,'Fermin','Aldeguer',54,'Spain',2.8,3,8,7,4.43333,1),(72,'Bo','Bendsneyder',64,'Netherlands',12.9,13.4,8,22,13.7667,39),(73,'Dennis','Foggia',71,'Italy',9.9,9,10,9,9.46667,32),(74,'Albert','Arenas',75,'Spain',11.6667,9.33333,11.6667,24,12.9444,35),(75,'Ai','Ogura',79,'Japan',8.1,8.8,13.1,13,9.98333,4),(76,'Senna','Agius',81,'Australia',15,16,16,24,17,31),(77,'Zonta','V d Goorbergh',84,'Netherlands',12.2,13.1,13.4,12,12.6667,35),(78,'Jake','Dixon',96,'United Kingdom',13,11.6667,14,43.5,17.8056,40),(83,'Alvaro','Carpe',83,'Spain',17,18.1,20,18,18.0333,22),(84,'Ric','Salmela',27,'Finland',17.3,18,19,16,17.6,22),(85,'Guido','Pini',94,'Italy',22.8,21.6,26,14,21.4667,24),(86,'Marco','Morelli',97,'Argentina',18.3,20,15,12,17.2667,12),(87,'Giulio','Pugliese',31,'Italy',17.9,19,17,14,17.4667,13),(88,'David','Gonzalez',11,'Spain',24.7,25,29,27,25.9,14),(89,'Zen','Mitani',2,'Japan',18,17.4,12,32,19.1333,29),(90,'Jesus','Rios',54,'Spain',21,19.9,17,27,20.9667,16),(91,'Adrian','Cruces',11,'Spain',19.9,21,24,30,22.6333,13),(92,'Alessandro','Morosi',19,'Italy',19,20,14,19,18.5,24),(93,'Casey James','O Gorman',67,'Ireland',21.9,22,16,24,21.3,18),(94,'Kiandra','Ramdhipa',7,'Indonesia',24,24,17,35,24.6667,15),(95,'Máximo','Quile',28,'Spain',20,20.1,24,29,22.2,21);
/*!40000 ALTER TABLE `rider` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_average` BEFORE UPDATE ON `rider`
 FOR EACH ROW BEGIN
    SET NEW.average = (NEW.race_performance + NEW.qualy_performance + (NEW.wet_performance / 2) + (NEW.crash_possibility / 2)) / 3;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `idSeason` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` bigint(20) NOT NULL,
  PRIMARY KEY (`idSeason`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,2024),(2,2025),(3,2026);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standings`
--

DROP TABLE IF EXISTS `standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standings` (
  `idRider` bigint(20) NOT NULL,
  `idSeason` bigint(20) NOT NULL,
  `points` bigint(20) NOT NULL,
  `idCategory` bigint(20) NOT NULL,
  PRIMARY KEY (`idSeason`,`idRider`),
  KEY `idRider` (`idRider`),
  KEY `idCategory` (`idCategory`),
  CONSTRAINT `standings_ibfk_1` FOREIGN KEY (`idRider`) REFERENCES `rider` (`idRider`),
  CONSTRAINT `standings_ibfk_2` FOREIGN KEY (`idSeason`) REFERENCES `season` (`idSeason`),
  CONSTRAINT `standings_ibfk_3` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standings`
--

LOCK TABLES `standings` WRITE;
/*!40000 ALTER TABLE `standings` DISABLE KEYS */;
INSERT INTO `standings` VALUES (1,1,709,1),(2,1,546,1),(3,1,490,1),(4,1,123,1),(5,1,88,1),(6,1,236,1),(7,1,37,1),(8,1,2,1),(9,1,93,1),(10,1,17,1),(11,1,176,1),(12,1,112,1),(13,1,328,1),(14,1,277,1),(15,1,33,1),(16,1,143,1),(17,1,13,1),(18,1,2,1),(19,1,185,1),(20,1,19,1),(21,1,258,1),(22,1,82,1),(23,1,90,3),(24,1,300,3),(25,1,119,3),(26,1,382,3),(27,1,8,3),(28,1,1,3),(29,1,6,3),(30,1,57,3),(31,1,81,3),(32,1,147,3),(33,1,86,3),(34,1,207,3),(35,1,2,3),(36,1,1,3),(37,1,102,3),(38,1,133,3),(39,1,12,3),(40,1,131,3),(41,1,205,3),(42,1,406,3),(43,1,120,3),(44,1,213,3),(45,1,62,3),(46,1,39,3),(47,1,19,3),(48,1,11,3),(49,1,345,2),(50,1,0,2),(51,1,11,2),(52,1,49,2),(53,1,70,2),(54,1,220,2),(55,1,155,2),(56,1,3,2),(57,1,207,2),(58,1,8,2),(59,1,123,2),(60,1,3,2),(61,1,228,2),(62,1,2,2),(63,1,239,2),(64,1,7,2),(65,1,0,2),(66,1,4,2),(67,1,0,2),(68,1,279,2),(69,1,30,2),(70,1,86,2),(71,1,388,2),(72,1,13,2),(73,1,96,2),(74,1,125,2),(75,1,221,2),(76,1,5,2),(77,1,23,2),(78,1,0,2),(1,2,658,1),(2,2,483,1),(3,2,400,1),(4,2,9,1),(6,2,193,1),(7,2,30,1),(9,2,86,1),(10,2,27,1),(11,2,243,1),(12,2,129,1),(13,2,316,1),(14,2,382,1),(15,2,25,1),(16,2,152,1),(17,2,15,1),(19,2,288,1),(20,2,10,1),(21,2,319,1),(23,2,132,3),(24,2,154,2),(25,2,136,3),(26,2,47,2),(27,2,56,3),(28,2,0,3),(29,2,48,3),(30,2,77,3),(31,2,96,3),(32,2,365,3),(33,2,71,3),(34,2,5,2),(35,2,7,3),(37,2,149,3),(38,2,10,2),(39,2,51,3),(40,2,285,3),(41,2,365,3),(42,2,142,2),(43,2,180,3),(44,2,7,2),(45,2,262,3),(46,2,66,3),(47,2,44,3),(48,2,11,3),(49,2,354,2),(50,2,0,2),(51,2,22,2),(52,2,79,2),(53,2,150,2),(54,2,38,1),(55,2,381,2),(57,2,252,2),(58,2,3,2),(59,2,70,2),(60,2,6,2),(61,2,359,2),(62,2,3,2),(63,2,265,2),(64,2,22,2),(65,2,0,2),(66,2,4,2),(67,2,0,2),(68,2,30,1),(69,2,111,2),(70,2,69,2),(71,2,133,1),(72,2,13,2),(73,2,248,2),(74,2,91,2),(75,2,3,1),(76,2,5,2),(77,2,68,2),(83,2,156,3),(84,2,163,3),(85,2,6,3),(86,2,56,3),(87,2,139,3),(88,2,0,3),(89,2,19,3),(1,3,622,1),(2,3,372,1),(3,3,299,1),(4,3,6,1),(6,3,245,1),(7,3,64,1),(9,3,111,1),(11,3,121,1),(12,3,45,1),(13,3,185,1),(14,3,399,1),(16,3,258,1),(17,3,14,1),(19,3,316,1),(21,3,394,1),(23,3,128,3),(24,3,315,2),(25,3,104,3),(26,3,178,2),(27,3,146,3),(28,3,1,3),(29,3,40,3),(30,3,301,3),(31,3,35,3),(32,3,65,2),(33,3,36,3),(34,3,49,2),(35,3,9,3),(37,3,86,3),(38,3,21,2),(39,3,122,3),(40,3,80,2),(41,3,188,2),(42,3,188,2),(43,3,27,2),(44,3,14,2),(45,3,66,2),(46,3,82,3),(47,3,86,3),(48,3,61,3),(49,3,31,1),(50,3,0,2),(51,3,6,2),(52,3,69,2),(53,3,107,2),(54,3,4,1),(55,3,92,1),(57,3,253,2),(58,3,0,2),(60,3,0,2),(61,3,0,1),(62,3,0,2),(63,3,323,2),(64,3,71,2),(66,3,6,2),(68,3,3,1),(69,3,79,2),(70,3,43,2),(71,3,199,1),(72,3,83,2),(73,3,361,2),(74,3,102,2),(75,3,0,1),(76,3,1,2),(77,3,105,2),(83,3,257,3),(84,3,239,3),(85,3,22,3),(86,3,286,3),(87,3,301,3),(88,3,1,3),(89,3,0,2),(90,3,80,3),(91,3,59,3),(92,3,144,3),(93,3,91,3),(94,3,26,3),(95,3,57,3);
/*!40000 ALTER TABLE `standings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `idTeam` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nation` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `performance` float NOT NULL,
  `idCategory` bigint(20) NOT NULL,
  PRIMARY KEY (`idTeam`),
  KEY `idCategory` (`idCategory`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Aprilia Racing','Italy','5cb33a',1.5,1),(2,'Ducati Lenovo Team','Italy','cc0000',1,1),(3,'Gresini Racing','Italy','9db4d9',4,1),(4,'MT Helmets MSI Honda','Spain','eb9354',6,1),(5,'Monster Energy Yamaha','Japan','0c368c',4.5,1),(6,'Yamaha VR46 Racing Team','Italy','dbff03',5.5,1),(7,'Prima Pramac Racing','Italy','8234c2',3,1),(8,'Red Bull GASGAS Tech3','Austria','990726',5,1),(9,'Red Bull KTM Factory Racing','Austria','ff6600',2,1),(10,'Repsol Honda Team','Japan','ffa00f',3.5,1),(11,'OnlyFans American Racing Team','USA','ffffff',2.5,1),(12,'BOE Motorsports','Spain','d1ff18',2,3),(13,'CFMOTO Aspar Team','Spain','007984',1,3),(14,'CIP Green Power','France','77d25c',7,3),(15,'Honda Team Asia','Japan','ffffff',5,3),(16,'Leopard Racing','Luxembourg','75cbd1',2.5,3),(17,'Liqui Moly Husqvarna Intact GP','Germany','344966',3,3),(18,'MLav Racing','United Kingdom','00a19c',6.5,3),(19,'MT Helmets MSI','Spain','eb9354',3.5,3),(20,'MTA Team','Italy','fe1a8b',4.5,3),(21,'Red Bull GASGAS Tech3','Austria','990726',4,3),(22,'Red Bull KTM Ajo','Austria','ff6600',1.5,3),(23,'Rivacold Snipers Team','Italy','baa404',6,3),(24,'SIC58 Squadra Corse','Italy','e42327',5.5,3),(25,'CFMOTO Aspar Team','Spain','007984',5.5,2),(26,'ELF Marc VDS Racing Team','Belgium','682a38',3,2),(27,'Fantic Racing','Italy','e4032c',5,2),(28,'Forward Team','Italy','7bdcb5',8,2),(29,'IDEMITSU Honda Team Asia','Japan','a39a65',7,2),(30,'Italtrans Racing Team','Italy','106ba9',3.5,2),(31,'Liqui Moly Husqvarna Intact GP','Germany','344966',7.5,2),(32,'MT Helmets MSI','Spain','eb9354',1.5,2),(33,'OnlyFans American Racing Team','USA','ffffff',2,2),(34,'Pertamina Mandalika GAS UP Team','Indonesia','d83a3b',6.5,2),(35,'QJMOTOR Gresini Moto2','Italy','9db4d9',4,2),(36,'Red Bull KTM Ajo','Austria','ff6600',2.5,2),(37,'RW Racing GP','Netherlands','999999',4.5,2),(38,'SpeedUp Racing','Italy','f08019',1,2),(39,'Yamaha VR46 Master Camp Team','Japan','e0ff00',6,2),(40,'No Team','None','888888',0,4);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track` (
  `idTrack` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lap_time` bigint(20) NOT NULL,
  `race_distance` int(11) NOT NULL,
  `percentage_rain` bigint(20) NOT NULL,
  PRIMARY KEY (`idTrack`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (1,'Qatar Airways Grand Prix of Qatar',110759,21,2),(2,'Grande Premio Tissot de Portugal',97706,25,15),(3,'Red Bull Grand Prix of The Americas',120864,20,8),(4,'Gran Premio Estrella Galicia 0,0 de Espana',97216,25,10),(5,'Michelin Grand Prix de France',90705,27,20),(6,'Gran Premi Monster Energy de Catalunya',98639,24,15),(7,'Gran Premio d\'Italia',104855,23,20),(8,'Grand Prix of Kazakhstan',96404,26,10),(9,'Motul TT Assen',91472,26,20),(10,'Liqui Moly Motorrad Grand Prix Deutschland',81409,30,25),(11,'Monster Energy British Grand Prix',117767,20,30),(12,'Motorrad Grand Prix von Osterreich',88539,28,15),(13,'Gran Premio GoPro de Aragon',106069,23,10),(14,'Gran Premio Red Bull di San Marino e della Riviera di Rimini',90390,27,15),(15,'Grand Prix of India',103947,22,20),(16,'Pertamina Grand Prix of Indonesia',89978,27,35),(17,'Motul Grand Prix of Japan',103198,24,25),(18,'Australian Motorcycle Grand Prix',87246,27,15),(19,'OR Thalland Grand Prix',89287,26,20),(20,'PETRONAS Grand Prix of Malaysia',117491,20,15),(21,'Gran Premio Motul de la Comunitat Valenciana',88931,27,5);
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25 20:55:27

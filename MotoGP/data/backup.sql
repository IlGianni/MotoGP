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
INSERT INTO `qualifying` VALUES (1,34,89040,8,'Pre_Qualifying'),(1,34,88988,1,'Qualifying_Two'),(2,34,88939,2,'Pre_Qualifying'),(2,34,89004,3,'Qualifying_Two'),(3,34,89012,6,'Pre_Qualifying'),(3,34,89129,7,'Qualifying_Two'),(4,34,88948,3,'Pre_Qualifying'),(4,34,89498,12,'Qualifying_Two'),(5,34,89288,11,'Pre_Qualifying'),(5,34,89113,5,'Qualifying_One'),(6,34,89331,12,'Pre_Qualifying'),(6,34,89015,2,'Qualifying_One'),(6,34,89003,2,'Qualifying_Two'),(7,34,89487,14,'Pre_Qualifying'),(7,34,89239,8,'Qualifying_One'),(8,34,89535,17,'Pre_Qualifying'),(8,34,89291,9,'Qualifying_One'),(9,34,89271,10,'Pre_Qualifying'),(9,34,89048,5,'Qualifying_Two'),(10,34,89015,7,'Pre_Qualifying'),(10,34,89384,11,'Qualifying_Two'),(11,34,89520,15,'Pre_Qualifying'),(11,34,89129,6,'Qualifying_One'),(12,34,89544,18,'Pre_Qualifying'),(12,34,89550,11,'Qualifying_One'),(13,34,88981,5,'Pre_Qualifying'),(13,34,89167,8,'Qualifying_Two'),(14,34,88954,4,'Pre_Qualifying'),(14,34,89123,6,'Qualifying_Two'),(15,34,89767,20,'Pre_Qualifying'),(15,34,89169,7,'Qualifying_One'),(16,34,89532,16,'Pre_Qualifying'),(16,34,89041,3,'Qualifying_One'),(17,34,89859,21,'Pre_Qualifying'),(17,34,89006,1,'Qualifying_One'),(17,34,89006,4,'Qualifying_Two'),(18,34,89867,22,'Pre_Qualifying'),(18,34,89783,12,'Qualifying_One'),(19,34,89424,13,'Pre_Qualifying'),(19,34,89074,4,'Qualifying_One'),(20,34,89618,19,'Pre_Qualifying'),(20,34,89339,10,'Qualifying_One'),(21,34,88931,1,'Pre_Qualifying'),(21,34,89305,10,'Qualifying_Two'),(22,34,89044,9,'Pre_Qualifying'),(22,34,89263,9,'Qualifying_Two'),(23,34,99959,12,'Pre_Qualifying'),(23,34,99959,12,'Qualifying_Two'),(24,34,100227,17,'Pre_Qualifying'),(24,34,98941,2,'Qualifying_One'),(24,34,99833,10,'Qualifying_Two'),(25,34,100428,18,'Pre_Qualifying'),(25,34,100565,8,'Qualifying_One'),(26,34,99928,11,'Pre_Qualifying'),(26,34,99803,8,'Qualifying_Two'),(27,34,98758,1,'Pre_Qualifying'),(27,34,99297,5,'Qualifying_Two'),(28,34,100811,24,'Pre_Qualifying'),(28,34,100665,9,'Qualifying_One'),(29,34,101083,26,'Pre_Qualifying'),(29,34,101299,12,'Qualifying_One'),(30,34,100684,22,'Pre_Qualifying'),(30,34,99673,3,'Qualifying_One'),(30,34,99880,11,'Qualifying_Two'),(31,34,100859,25,'Pre_Qualifying'),(31,34,100933,11,'Qualifying_One'),(32,34,100530,19,'Pre_Qualifying'),(32,34,98782,1,'Qualifying_One'),(32,34,99748,7,'Qualifying_Two'),(33,34,100552,21,'Pre_Qualifying'),(33,34,100236,5,'Qualifying_One'),(34,34,100022,13,'Pre_Qualifying'),(34,34,98946,2,'Qualifying_Two'),(35,34,99146,4,'Pre_Qualifying'),(35,34,100387,14,'Qualifying_Two'),(36,34,99443,8,'Pre_Qualifying'),(36,34,101166,18,'Qualifying_Two'),(37,34,100065,14,'Pre_Qualifying'),(37,34,99524,6,'Qualifying_Two'),(38,34,99893,10,'Pre_Qualifying'),(38,34,100078,13,'Qualifying_Two'),(39,34,99342,5,'Pre_Qualifying'),(39,34,100783,16,'Qualifying_Two'),(40,34,99756,9,'Pre_Qualifying'),(40,34,100866,17,'Qualifying_Two'),(41,34,98941,2,'Pre_Qualifying'),(41,34,99237,3,'Qualifying_Two'),(42,34,100173,16,'Pre_Qualifying'),(42,34,100190,4,'Qualifying_One'),(42,34,99265,4,'Qualifying_Two'),(43,34,99427,6,'Pre_Qualifying'),(43,34,100406,15,'Qualifying_Two'),(44,34,100114,15,'Pre_Qualifying'),(44,34,100274,6,'Qualifying_One'),(45,34,100535,20,'Pre_Qualifying'),(45,34,100720,10,'Qualifying_One'),(46,34,100746,23,'Pre_Qualifying'),(46,34,100514,7,'Qualifying_One'),(47,34,99436,7,'Pre_Qualifying'),(47,34,99833,9,'Qualifying_Two'),(48,34,98997,3,'Pre_Qualifying'),(48,34,98879,1,'Qualifying_Two'),(49,34,94084,16,'Pre_Qualifying'),(49,34,93790,3,'Qualifying_One'),(49,34,93603,4,'Qualifying_Two'),(50,34,94108,17,'Pre_Qualifying'),(50,34,93422,1,'Qualifying_One'),(50,34,94064,8,'Qualifying_Two'),(51,34,94935,29,'Pre_Qualifying'),(51,34,94138,7,'Qualifying_One'),(52,34,93637,6,'Pre_Qualifying'),(52,34,94397,13,'Qualifying_Two'),(53,34,93970,15,'Pre_Qualifying'),(53,34,94236,9,'Qualifying_One'),(54,34,94273,20,'Pre_Qualifying'),(54,34,93955,4,'Qualifying_One'),(54,34,94212,10,'Qualifying_Two'),(55,34,93862,11,'Pre_Qualifying'),(55,34,93393,2,'Qualifying_Two'),(56,34,94647,25,'Pre_Qualifying'),(56,34,94981,15,'Qualifying_One'),(57,34,93904,13,'Pre_Qualifying'),(57,34,93770,6,'Qualifying_Two'),(58,34,93654,8,'Pre_Qualifying'),(58,34,95333,18,'Qualifying_Two'),(59,34,94727,27,'Pre_Qualifying'),(59,34,93539,2,'Qualifying_One'),(59,34,93759,5,'Qualifying_Two'),(60,34,94337,21,'Pre_Qualifying'),(60,34,94990,16,'Qualifying_One'),(61,34,94113,18,'Pre_Qualifying'),(61,34,94002,6,'Qualifying_One'),(62,34,93435,1,'Pre_Qualifying'),(62,34,95151,17,'Qualifying_Two'),(63,34,93767,10,'Pre_Qualifying'),(63,34,94418,14,'Qualifying_Two'),(64,34,95336,30,'Pre_Qualifying'),(64,34,94520,11,'Qualifying_One'),(65,34,94656,26,'Pre_Qualifying'),(65,34,94830,13,'Qualifying_One'),(66,34,94466,23,'Pre_Qualifying'),(66,34,94908,14,'Qualifying_One'),(67,34,93463,2,'Pre_Qualifying'),(67,34,93997,7,'Qualifying_Two'),(68,34,93485,3,'Pre_Qualifying'),(68,34,94247,12,'Qualifying_Two'),(69,34,94220,19,'Pre_Qualifying'),(69,34,93974,5,'Qualifying_One'),(70,34,93942,14,'Pre_Qualifying'),(70,34,93378,1,'Qualifying_Two'),(71,34,93650,7,'Pre_Qualifying'),(71,34,94140,9,'Qualifying_Two'),(72,34,94877,28,'Pre_Qualifying'),(72,34,94449,10,'Qualifying_One'),(73,34,93880,12,'Pre_Qualifying'),(73,34,94618,16,'Qualifying_Two'),(74,34,93763,9,'Pre_Qualifying'),(74,34,94228,11,'Qualifying_Two'),(75,34,93614,5,'Pre_Qualifying'),(75,34,93531,3,'Qualifying_Two'),(76,34,94628,24,'Pre_Qualifying'),(76,34,94190,8,'Qualifying_One'),(77,34,93493,4,'Pre_Qualifying'),(77,34,94511,15,'Qualifying_Two'),(78,34,94390,22,'Pre_Qualifying'),(78,34,94824,12,'Qualifying_One');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (1,1,1,1,'Finished','MotoGP'),(15,2,2,1,'Finished','MotoGP'),(16,3,1,1,'Finished','MotoGP'),(17,4,1,1,'Finished','MotoGP'),(18,5,1,1,'Finished','MotoGP'),(19,6,1,1,'Finished','MotoGP'),(20,7,3,1,'Finished','MotoGP'),(21,8,1,1,'Finished','MotoGP'),(22,9,3,1,'Finished','MotoGP'),(23,10,2,1,'Finished','MotoGP'),(24,11,3,1,'Finished','MotoGP'),(25,12,2,1,'Finished','MotoGP'),(26,13,1,1,'Finished','MotoGP'),(27,14,2,1,'Finished','MotoGP'),(28,15,1,1,'Finished','MotoGP'),(29,16,3,1,'Finished','MotoGP'),(30,17,1,1,'Finished','MotoGP'),(31,18,1,1,'Finished','MotoGP'),(32,19,2,1,'Finished','MotoGP'),(33,20,1,1,'Finished','MotoGP'),(34,21,1,1,'Finished','MotoGP'),(36,1,NULL,2,'Pre_Qualifying','Moto3');
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
INSERT INTO `race_results` VALUES (1,34,'Race',0,1,0,NULL,0),(1,34,'Race',89048,1,1,NULL,0),(1,34,'Race',178108,1,2,NULL,0),(1,34,'Race',267161,1,3,NULL,0),(1,34,'Race',356185,1,4,NULL,0),(1,34,'Race',445189,1,5,NULL,0),(1,34,'Race',534237,1,6,NULL,0),(1,34,'Race',623267,1,7,NULL,0),(1,34,'Race',712326,1,8,NULL,0),(1,34,'Race',801366,1,9,NULL,0),(1,34,'Race',890427,1,10,NULL,0),(1,34,'Race',979469,1,11,NULL,0),(1,34,'Race',1068497,1,12,NULL,0),(1,34,'Race',1157507,1,13,NULL,0),(1,34,'Race',1246533,1,14,NULL,0),(1,34,'Race',1335549,1,15,NULL,0),(1,34,'Race',1424550,1,16,NULL,0),(1,34,'Race',1513612,1,17,NULL,0),(1,34,'Race',1602634,1,18,NULL,0),(1,34,'Race',1691652,1,19,NULL,0),(1,34,'Race',1780658,1,20,NULL,0),(1,34,'Race',1869665,1,21,NULL,0),(1,34,'Race',1958674,1,22,NULL,0),(1,34,'Race',2047708,1,23,NULL,0),(1,34,'Race',2136731,1,24,NULL,0),(1,34,'Race',2225793,1,25,NULL,0),(1,34,'Race',2314837,NULL,26,NULL,0),(1,34,'Race',2403881,1,27,NULL,0),(1,34,'Sprint',0,1,0,NULL,0),(1,34,'Sprint',89007,1,1,NULL,0),(1,34,'Sprint',178061,1,2,NULL,0),(1,34,'Sprint',267083,1,3,NULL,0),(1,34,'Sprint',356147,1,4,NULL,0),(1,34,'Sprint',445158,1,5,NULL,0),(1,34,'Sprint',534189,1,6,NULL,0),(1,34,'Sprint',623252,1,7,NULL,0),(1,34,'Sprint',712279,1,8,NULL,0),(1,34,'Sprint',801319,1,9,NULL,0),(1,34,'Sprint',890346,1,10,NULL,0),(1,34,'Sprint',979357,1,11,NULL,0),(1,34,'Sprint',1068406,1,12,NULL,0),(1,34,'Sprint',1157434,NULL,13,NULL,0),(1,34,'Sprint',1246496,1,14,NULL,0),(2,34,'Race',400,2,0,NULL,0),(2,34,'Race',89456,2,1,NULL,0),(2,34,'Race',178486,2,2,NULL,0),(2,34,'Race',267520,2,3,NULL,0),(2,34,'Race',356548,2,4,NULL,0),(2,34,'Race',445578,2,5,NULL,0),(2,34,'Race',534606,2,6,NULL,0),(2,34,'Race',623650,2,7,NULL,0),(2,34,'Race',712682,2,8,NULL,0),(2,34,'Race',801767,2,9,NULL,0),(2,34,'Race',890794,2,10,NULL,0),(2,34,'Race',979845,2,11,NULL,0),(2,34,'Race',1068859,2,12,NULL,0),(2,34,'Race',1157927,2,13,NULL,0),(2,34,'Race',1246977,2,14,NULL,0),(2,34,'Race',1336009,2,15,NULL,0),(2,34,'Race',1425080,2,16,NULL,0),(2,34,'Race',1514097,2,17,NULL,0),(2,34,'Race',1603155,2,18,NULL,0),(2,34,'Race',1692198,2,19,NULL,0),(2,34,'Race',1781226,2,20,NULL,0),(2,34,'Race',1870284,2,21,NULL,0),(2,34,'Race',1959327,2,22,NULL,0),(2,34,'Race',2048417,2,23,NULL,0),(2,34,'Race',2137490,2,24,NULL,0),(2,34,'Race',2226513,2,25,NULL,0),(2,34,'Race',2315579,NULL,26,NULL,0),(2,34,'Race',2404623,2,27,NULL,0),(2,34,'Sprint',400,3,0,NULL,0),(2,34,'Sprint',89472,2,1,NULL,0),(2,34,'Sprint',178563,2,2,NULL,0),(2,34,'Sprint',267656,2,3,NULL,0),(2,34,'Sprint',356727,2,4,NULL,0),(2,34,'Sprint',445765,2,5,NULL,0),(2,34,'Sprint',534833,2,6,NULL,0),(2,34,'Sprint',623893,2,7,NULL,0),(2,34,'Sprint',712980,2,8,NULL,0),(2,34,'Sprint',801997,2,9,NULL,0),(2,34,'Sprint',891045,2,10,NULL,0),(2,34,'Sprint',980117,2,11,NULL,0),(2,34,'Sprint',1069153,2,12,NULL,0),(2,34,'Sprint',1158188,NULL,13,NULL,0),(2,34,'Sprint',1247232,2,14,NULL,0),(3,34,'Race',1200,5,0,NULL,0),(3,34,'Race',90231,4,1,NULL,0),(3,34,'Race',179284,4,2,NULL,0),(3,34,'Race',268379,4,3,NULL,0),(3,34,'Race',357405,3,4,NULL,0),(3,34,'Race',446443,3,5,NULL,0),(3,34,'Race',535500,3,6,NULL,0),(3,34,'Race',624559,3,7,NULL,0),(3,34,'Race',713624,3,8,NULL,0),(3,34,'Race',802679,3,9,NULL,0),(3,34,'Race',891699,3,10,NULL,0),(3,34,'Race',980762,3,11,NULL,0),(3,34,'Race',1069830,3,12,NULL,0),(3,34,'Race',1158901,3,13,NULL,0),(3,34,'Race',1247970,3,14,NULL,0),(3,34,'Race',1336999,3,15,NULL,0),(3,34,'Race',1426045,3,16,NULL,0),(3,34,'Race',1515092,3,17,NULL,0),(3,34,'Race',1604140,3,18,NULL,0),(3,34,'Race',1693167,3,19,NULL,0),(3,34,'Race',1782233,3,20,NULL,0),(3,34,'Race',1871281,3,21,NULL,0),(3,34,'Race',1960345,3,22,NULL,0),(3,34,'Race',2049436,3,23,NULL,0),(3,34,'Race',2138522,3,24,NULL,0),(3,34,'Race',2227585,3,25,NULL,0),(3,34,'Race',2316682,NULL,26,NULL,0),(3,34,'Race',2405760,3,27,NULL,0),(3,34,'Sprint',1200,7,0,NULL,0),(3,34,'Sprint',90297,5,1,NULL,0),(3,34,'Sprint',179359,4,2,NULL,0),(3,34,'Sprint',268406,4,3,NULL,0),(3,34,'Sprint',357435,4,4,NULL,0),(3,34,'Sprint',446522,3,5,NULL,0),(3,34,'Sprint',535555,3,6,NULL,0),(3,34,'Sprint',624648,3,7,NULL,0),(3,34,'Sprint',713680,3,8,NULL,0),(3,34,'Sprint',802726,3,9,NULL,0),(3,34,'Sprint',891749,3,10,NULL,0),(3,34,'Sprint',980816,3,11,NULL,0),(3,34,'Sprint',1069870,3,12,NULL,0),(3,34,'Sprint',1158910,NULL,13,NULL,0),(3,34,'Sprint',1247998,3,14,NULL,0),(4,34,'Race',2200,10,0,NULL,0),(4,34,'Race',91361,10,1,NULL,0),(4,34,'Race',180524,10,2,NULL,0),(4,34,'Race',269867,9,3,NULL,0),(4,34,'Race',359039,8,4,NULL,0),(4,34,'Race',448330,8,5,NULL,0),(4,34,'Race',537632,8,6,NULL,0),(4,34,'Race',626957,8,7,NULL,0),(4,34,'Race',716124,8,8,NULL,0),(4,34,'Race',805400,8,9,NULL,0),(4,34,'Race',894760,8,10,NULL,0),(4,34,'Race',984038,8,11,NULL,0),(4,34,'Race',1073355,8,12,NULL,0),(4,34,'Race',1162527,8,13,NULL,0),(4,34,'Race',1251848,8,14,NULL,0),(4,34,'Race',1341013,8,15,NULL,0),(4,34,'Race',1430284,8,16,NULL,0),(4,34,'Race',1519492,8,17,NULL,0),(4,34,'Race',1608729,7,18,NULL,0),(4,34,'Race',1698002,7,19,NULL,0),(4,34,'Race',1787182,6,20,NULL,0),(4,34,'Race',1876427,6,21,NULL,0),(4,34,'Race',1965583,5,22,NULL,0),(4,34,'Race',2054937,5,23,NULL,0),(4,34,'Race',2144202,5,24,NULL,0),(4,34,'Race',2233512,5,25,NULL,0),(4,34,'Race',2322684,NULL,26,NULL,0),(4,34,'Race',2414543,8,27,NULL,0),(4,34,'Sprint',2200,11,0,NULL,0),(4,34,'Sprint',91411,11,1,NULL,0),(4,34,'Sprint',180765,11,2,NULL,0),(4,34,'Sprint',269947,11,3,NULL,0),(4,34,'Sprint',359188,10,4,NULL,0),(4,34,'Sprint',448429,10,5,NULL,0),(4,34,'Sprint',537668,10,6,NULL,0),(4,34,'Sprint',626848,10,7,NULL,0),(4,34,'Sprint',716046,10,8,NULL,0),(4,34,'Sprint',805317,9,9,NULL,0),(4,34,'Sprint',894679,9,10,NULL,0),(4,34,'Sprint',983827,8,11,NULL,0),(4,34,'Sprint',1073168,8,12,NULL,0),(4,34,'Sprint',1162337,NULL,13,NULL,0),(4,34,'Sprint',1251545,8,14,NULL,0),(5,34,'Race',2800,14,0,NULL,0),(5,34,'Race',91994,13,1,NULL,0),(5,34,'Race',181222,13,2,NULL,0),(5,34,'Race',270448,13,3,NULL,0),(5,34,'Race',359795,12,4,NULL,0),(5,34,'Race',449127,13,5,NULL,0),(5,34,'Race',538500,13,6,NULL,0),(5,34,'Race',627866,12,7,NULL,0),(5,34,'Race',717203,12,8,NULL,0),(5,34,'Race',806441,12,9,NULL,0),(5,34,'Race',895623,12,10,NULL,0),(5,34,'Race',984970,12,11,NULL,0),(5,34,'Race',1074312,12,12,NULL,0),(5,34,'Race',1163564,11,13,NULL,0),(5,34,'Race',1252860,11,14,NULL,0),(5,34,'Race',1342098,11,15,NULL,0),(5,34,'Race',1431401,11,16,NULL,0),(5,34,'Race',1520786,11,17,NULL,0),(5,34,'Race',1610154,15,18,NULL,0),(5,34,'Race',1703143,14,19,NULL,0),(5,34,'Race',1792328,14,20,NULL,0),(5,34,'Race',1881609,14,21,NULL,0),(5,34,'Race',1970847,13,22,NULL,0),(5,34,'Race',2060220,13,23,NULL,0),(5,34,'Race',2149514,13,24,NULL,0),(5,34,'Race',2238759,12,25,NULL,0),(5,34,'Race',2327944,NULL,26,NULL,0),(5,34,'Race',2417281,12,27,NULL,0),(5,34,'Sprint',2800,15,0,NULL,0),(5,34,'Sprint',92009,14,1,NULL,0),(5,34,'Sprint',181317,13,2,NULL,0),(5,34,'Sprint',270504,12,3,NULL,0),(5,34,'Sprint',359696,12,4,NULL,0),(5,34,'Sprint',448917,11,5,NULL,0),(5,34,'Sprint',538157,11,6,NULL,0),(5,34,'Sprint',627523,11,7,NULL,0),(5,34,'Sprint',716759,11,8,NULL,0),(5,34,'Sprint',806130,10,9,NULL,0),(5,34,'Sprint',895329,10,10,NULL,0),(5,34,'Sprint',984591,10,11,NULL,0),(5,34,'Sprint',1073788,10,12,NULL,0),(5,34,'Sprint',1163043,NULL,13,NULL,0),(5,34,'Sprint',1252250,10,14,NULL,0),(6,34,'Race',200,15,0,NULL,0),(6,34,'Race',92339,15,1,NULL,0),(6,34,'Race',181489,14,2,NULL,0),(6,34,'Race',270686,14,3,NULL,0),(6,34,'Race',359893,14,4,NULL,0),(6,34,'Race',449205,12,5,NULL,0),(6,34,'Race',538441,11,6,NULL,0),(6,34,'Race',627706,11,7,NULL,0),(6,34,'Race',716982,10,8,NULL,0),(6,34,'Race',806179,9,9,NULL,0),(6,34,'Race',895422,9,10,NULL,0),(6,34,'Race',984564,9,11,NULL,0),(6,34,'Race',1073821,9,12,NULL,0),(6,34,'Race',1163128,9,13,NULL,0),(6,34,'Race',1252295,9,14,NULL,0),(6,34,'Race',1341452,9,15,NULL,0),(6,34,'Race',1430757,9,16,NULL,0),(6,34,'Race',1519970,9,17,NULL,0),(6,34,'Race',1609244,8,18,NULL,0),(6,34,'Race',1698549,NULL,19,NULL,0),(6,34,'Race',1698549,NULL,20,NULL,1),(6,34,'Sprint',200,2,0,NULL,0),(6,34,'Sprint',89407,3,1,NULL,0),(6,34,'Sprint',178570,3,2,NULL,0),(6,34,'Sprint',267769,3,3,NULL,0),(6,34,'Sprint',357057,3,4,NULL,0),(6,34,'Sprint',446346,4,5,NULL,0),(6,34,'Sprint',535589,4,6,NULL,0),(6,34,'Sprint',624716,4,7,NULL,0),(6,34,'Sprint',713927,4,8,NULL,0),(6,34,'Sprint',803220,5,9,NULL,0),(6,34,'Sprint',892368,5,10,NULL,0),(6,34,'Sprint',981535,5,11,NULL,0),(6,34,'Sprint',1070832,5,12,NULL,0),(6,34,'Sprint',1160006,NULL,13,NULL,0),(6,34,'Sprint',1249179,5,14,NULL,0),(7,34,'Race',3400,18,0,NULL,0),(7,34,'Race',93011,21,1,NULL,0),(7,34,'Race',182702,18,2,NULL,0),(7,34,'Race',272037,20,3,NULL,0),(7,34,'Race',361704,20,4,NULL,0),(7,34,'Race',451231,20,5,NULL,0),(7,34,'Race',540926,20,6,NULL,0),(7,34,'Race',630637,19,7,NULL,0),(7,34,'Race',720260,18,8,NULL,0),(7,34,'Race',809631,17,9,NULL,0),(7,34,'Race',899158,17,10,NULL,0),(7,34,'Race',988565,17,11,NULL,0),(7,34,'Race',1078124,17,12,NULL,0),(7,34,'Race',1167795,17,13,NULL,0),(7,34,'Race',1257178,17,14,NULL,0),(7,34,'Race',1346817,17,15,NULL,0),(7,34,'Race',1436536,17,16,NULL,0),(7,34,'Race',1525875,17,17,NULL,0),(7,34,'Race',1615446,16,18,NULL,0),(7,34,'Race',1705017,15,19,NULL,0),(7,34,'Race',1794660,15,20,NULL,0),(7,34,'Race',1884211,15,21,NULL,0),(7,34,'Race',1973710,14,22,NULL,0),(7,34,'Race',2063097,14,23,NULL,0),(7,34,'Race',2152500,14,24,NULL,0),(7,34,'Race',2242215,14,25,NULL,0),(7,34,'Race',2331610,NULL,26,NULL,0),(7,34,'Race',2421021,14,27,NULL,0),(7,34,'Sprint',3400,18,0,NULL,0),(7,34,'Sprint',93123,19,1,NULL,0),(7,34,'Sprint',182638,20,2,NULL,0),(7,34,'Sprint',272365,20,3,NULL,0),(7,34,'Sprint',361856,20,4,NULL,0),(7,34,'Sprint',451395,20,5,NULL,0),(7,34,'Sprint',541094,19,6,NULL,0),(7,34,'Sprint',630597,19,7,NULL,0),(7,34,'Sprint',720324,19,8,NULL,0),(7,34,'Sprint',809859,19,9,NULL,0),(7,34,'Sprint',899350,19,10,NULL,0),(7,34,'Sprint',988881,19,11,NULL,0),(7,34,'Sprint',1078388,19,12,NULL,0),(7,34,'Sprint',1167991,NULL,13,NULL,0),(7,34,'Sprint',1257406,19,14,NULL,0),(8,34,'Race',3600,19,0,NULL,0),(8,34,'Race',93077,18,1,NULL,0),(8,34,'Race',182459,NULL,2,NULL,0),(8,34,'Race',182459,NULL,3,NULL,1),(8,34,'Sprint',3600,22,0,NULL,0),(8,34,'Sprint',94283,22,1,NULL,0),(8,34,'Sprint',186776,22,2,NULL,0),(8,34,'Sprint',276184,22,3,NULL,0),(8,34,'Sprint',368451,22,4,NULL,0),(8,34,'Sprint',457880,22,5,NULL,0),(8,34,'Sprint',547292,21,6,NULL,0),(8,34,'Sprint',637046,21,7,NULL,0),(8,34,'Sprint',726449,21,8,NULL,0),(8,34,'Sprint',815839,21,9,NULL,0),(8,34,'Sprint',905585,20,10,NULL,0),(8,34,'Sprint',995153,20,11,NULL,0),(8,34,'Sprint',1084899,20,12,NULL,0),(8,34,'Sprint',1174515,NULL,13,NULL,0),(8,34,'Sprint',1263888,20,14,NULL,0),(9,34,'Race',800,3,0,NULL,0),(9,34,'Race',90046,5,1,NULL,0),(9,34,'Race',179555,6,2,NULL,0),(9,34,'Race',269052,10,3,NULL,0),(9,34,'Race',359365,10,4,NULL,0),(9,34,'Race',448713,10,5,NULL,0),(9,34,'Race',538122,10,6,NULL,0),(9,34,'Race',627619,10,7,NULL,0),(9,34,'Race',716853,11,8,NULL,0),(9,34,'Race',806201,11,9,NULL,0),(9,34,'Race',895537,11,10,NULL,0),(9,34,'Race',984809,11,11,NULL,0),(9,34,'Race',1074166,11,12,NULL,0),(9,34,'Race',1163418,12,13,NULL,0),(9,34,'Race',1252865,12,14,NULL,0),(9,34,'Race',1342242,13,15,NULL,0),(9,34,'Race',1431669,13,16,NULL,0),(9,34,'Race',1521096,13,17,NULL,0),(9,34,'Race',1610590,11,18,NULL,0),(9,34,'Race',1700017,10,19,NULL,0),(9,34,'Race',1789243,9,20,NULL,0),(9,34,'Race',1878530,9,21,NULL,0),(9,34,'Race',1967890,8,22,NULL,0),(9,34,'Race',2057404,8,23,NULL,0),(9,34,'Race',2146641,9,24,NULL,0),(9,34,'Race',2236129,9,25,NULL,0),(9,34,'Race',2325524,NULL,26,NULL,0),(9,34,'Race',2414858,9,27,NULL,0),(9,34,'Sprint',800,4,0,NULL,0),(9,34,'Sprint',90040,6,1,NULL,0),(9,34,'Sprint',179432,6,2,NULL,0),(9,34,'Sprint',268865,6,3,NULL,0),(9,34,'Sprint',358161,6,4,NULL,0),(9,34,'Sprint',447416,7,5,NULL,0),(9,34,'Sprint',536790,7,6,NULL,0),(9,34,'Sprint',626211,8,7,NULL,0),(9,34,'Sprint',715483,8,8,NULL,0),(9,34,'Sprint',804805,8,9,NULL,0),(9,34,'Sprint',894281,8,10,NULL,0),(9,34,'Sprint',983769,9,11,NULL,0),(9,34,'Sprint',1073170,9,12,NULL,0),(9,34,'Sprint',1162492,NULL,13,NULL,0),(9,34,'Sprint',1251966,9,14,NULL,0),(10,34,'Race',2000,11,0,NULL,0),(10,34,'Race',91494,11,1,NULL,0),(10,34,'Race',180880,11,2,NULL,0),(10,34,'Race',270180,12,3,NULL,0),(10,34,'Race',359731,13,4,NULL,0),(10,34,'Race',449153,14,5,NULL,0),(10,34,'Race',538754,15,6,NULL,0),(10,34,'Race',628298,14,7,NULL,0),(10,34,'Race',717684,14,8,NULL,0),(10,34,'Race',807217,NULL,9,NULL,0),(10,34,'Race',807217,NULL,10,NULL,1),(10,34,'Sprint',2000,12,0,NULL,0),(10,34,'Sprint',91422,12,1,NULL,0),(10,34,'Sprint',180937,12,2,NULL,0),(10,34,'Sprint',270452,13,3,NULL,0),(10,34,'Sprint',359741,14,4,NULL,0),(10,34,'Sprint',449252,15,5,NULL,0),(10,34,'Sprint',538735,NULL,6,NULL,0),(10,34,'Sprint',538735,NULL,7,NULL,1),(11,34,'Race',3000,16,0,NULL,0),(11,34,'Race',92379,16,1,NULL,0),(11,34,'Race',181695,15,2,NULL,0),(11,34,'Race',270896,15,3,NULL,0),(11,34,'Race',360262,15,4,NULL,0),(11,34,'Race',449448,15,5,NULL,0),(11,34,'Race',538767,14,6,NULL,0),(11,34,'Race',628098,13,7,NULL,0),(11,34,'Race',717529,13,8,NULL,0),(11,34,'Race',806720,13,9,NULL,0),(11,34,'Race',895924,13,10,NULL,0),(11,34,'Race',985228,13,11,NULL,0),(11,34,'Race',1074457,13,12,NULL,0),(11,34,'Race',1163753,13,13,NULL,0),(11,34,'Race',1253172,13,14,NULL,0),(11,34,'Race',1342363,12,15,NULL,0),(11,34,'Race',1431632,12,16,NULL,0),(11,34,'Race',1521026,12,17,NULL,0),(11,34,'Race',1610397,10,18,NULL,0),(11,34,'Race',1699683,9,19,NULL,0),(11,34,'Race',1788964,8,20,NULL,0),(11,34,'Race',1878315,8,21,NULL,0),(11,34,'Race',1967634,7,22,NULL,0),(11,34,'Race',2057050,7,23,NULL,0),(11,34,'Race',2146266,7,24,NULL,0),(11,34,'Race',2235542,7,25,NULL,0),(11,34,'Race',2324791,NULL,26,NULL,0),(11,34,'Race',2414120,6,27,NULL,0),(11,34,'Sprint',3000,16,0,NULL,0),(11,34,'Sprint',92211,16,1,NULL,0),(11,34,'Sprint',181497,15,2,NULL,0),(11,34,'Sprint',270783,15,3,NULL,0),(11,34,'Sprint',360094,15,4,NULL,0),(11,34,'Sprint',449380,14,5,NULL,0),(11,34,'Sprint',538664,13,6,NULL,0),(11,34,'Sprint',628023,13,7,NULL,0),(11,34,'Sprint',717234,13,8,NULL,0),(11,34,'Sprint',806535,12,9,NULL,0),(11,34,'Sprint',895764,12,10,NULL,0),(11,34,'Sprint',985158,12,11,NULL,0),(11,34,'Sprint',1074439,12,12,NULL,0),(11,34,'Sprint',1163858,NULL,13,NULL,0),(11,34,'Sprint',1253202,12,14,NULL,0),(12,34,'Race',4000,21,0,NULL,0),(12,34,'Race',93427,20,1,NULL,0),(12,34,'Race',182653,20,2,NULL,0),(12,34,'Race',272138,18,3,NULL,0),(12,34,'Race',361647,19,4,NULL,0),(12,34,'Race',451065,19,5,NULL,0),(12,34,'Race',540539,18,6,NULL,0),(12,34,'Race',629884,17,7,NULL,0),(12,34,'Race',719145,17,8,NULL,0),(12,34,'Race',808616,16,9,NULL,0),(12,34,'Race',897920,16,10,NULL,0),(12,34,'Race',987160,16,11,NULL,0),(12,34,'Race',1076447,16,12,NULL,0),(12,34,'Race',1165848,16,13,NULL,0),(12,34,'Race',1255199,16,14,NULL,0),(12,34,'Race',1344489,15,15,NULL,0),(12,34,'Race',1433755,15,16,NULL,0),(12,34,'Race',1523199,15,17,NULL,0),(12,34,'Race',1612477,13,18,NULL,0),(12,34,'Race',1701767,12,19,NULL,0),(12,34,'Race',1791057,12,20,NULL,0),(12,34,'Race',1880522,12,21,NULL,0),(12,34,'Race',1969891,11,22,NULL,0),(12,34,'Race',2059330,11,23,NULL,0),(12,34,'Race',2148643,11,24,NULL,0),(12,34,'Race',2238032,11,25,NULL,0),(12,34,'Race',2327380,NULL,26,NULL,0),(12,34,'Race',2416824,11,27,NULL,0),(12,34,'Sprint',4000,19,0,NULL,0),(12,34,'Sprint',93275,18,1,NULL,0),(12,34,'Sprint',182547,18,2,NULL,0),(12,34,'Sprint',271889,18,3,NULL,0),(12,34,'Sprint',361150,18,4,NULL,0),(12,34,'Sprint',450533,18,5,NULL,0),(12,34,'Sprint',539942,16,6,NULL,0),(12,34,'Sprint',629182,16,7,NULL,0),(12,34,'Sprint',718492,16,8,NULL,0),(12,34,'Sprint',808003,16,9,NULL,0),(12,34,'Sprint',897453,16,10,NULL,0),(12,34,'Sprint',986830,16,11,NULL,0),(12,34,'Sprint',1076199,16,12,NULL,0),(12,34,'Sprint',1165620,NULL,13,NULL,0),(12,34,'Sprint',1254936,15,14,NULL,0),(13,34,'Race',1400,7,0,NULL,0),(13,34,'Race',90531,6,1,NULL,0),(13,34,'Race',179829,5,2,NULL,0),(13,34,'Race',269040,5,3,NULL,0),(13,34,'Race',358178,5,4,NULL,0),(13,34,'Race',447435,5,5,NULL,0),(13,34,'Race',536568,5,6,NULL,0),(13,34,'Race',625737,5,7,NULL,0),(13,34,'Race',714921,5,8,NULL,0),(13,34,'Race',804206,5,9,NULL,0),(13,34,'Race',893500,5,10,NULL,0),(13,34,'Race',982620,5,11,NULL,0),(13,34,'Race',1071877,5,12,NULL,0),(13,34,'Race',1161094,5,13,NULL,0),(13,34,'Race',1250258,5,14,NULL,0),(13,34,'Race',1339416,5,15,NULL,0),(13,34,'Race',1428660,5,16,NULL,0),(13,34,'Race',1517950,5,17,NULL,0),(13,34,'Race',1607161,5,18,NULL,0),(13,34,'Race',1696444,5,19,NULL,0),(13,34,'Race',1785641,10,20,NULL,0),(13,34,'Race',1879305,10,21,NULL,0),(13,34,'Race',1968452,9,22,NULL,0),(13,34,'Race',2057720,9,23,NULL,0),(13,34,'Race',2146880,8,24,NULL,0),(13,34,'Race',2236025,8,25,NULL,0),(13,34,'Race',2325227,NULL,26,NULL,0),(13,34,'Race',2414508,7,27,NULL,0),(13,34,'Sprint',1400,8,0,NULL,0),(13,34,'Sprint',90619,7,1,NULL,0),(13,34,'Sprint',179913,7,2,NULL,0),(13,34,'Sprint',269101,7,3,NULL,0),(13,34,'Sprint',358345,7,4,NULL,0),(13,34,'Sprint',447514,6,5,NULL,0),(13,34,'Sprint',536703,6,6,NULL,0),(13,34,'Sprint',625902,6,7,NULL,0),(13,34,'Sprint',715168,6,8,NULL,0),(13,34,'Sprint',804301,6,9,NULL,0),(13,34,'Sprint',893489,6,10,NULL,0),(13,34,'Sprint',982688,6,11,NULL,0),(13,34,'Sprint',1071984,6,12,NULL,0),(13,34,'Sprint',1161142,NULL,13,NULL,0),(13,34,'Sprint',1250412,6,14,NULL,0),(14,34,'Race',1000,4,0,NULL,0),(14,34,'Race',90071,3,1,NULL,0),(14,34,'Race',179243,3,2,NULL,0),(14,34,'Race',268340,3,3,NULL,0),(14,34,'Race',357405,4,4,NULL,0),(14,34,'Race',446579,4,5,NULL,0),(14,34,'Race',535711,4,6,NULL,0),(14,34,'Race',624860,4,7,NULL,0),(14,34,'Race',713959,4,8,NULL,0),(14,34,'Race',803040,4,9,NULL,0),(14,34,'Race',892144,4,10,NULL,0),(14,34,'Race',981243,4,11,NULL,0),(14,34,'Race',1070327,4,12,NULL,0),(14,34,'Race',1159383,4,13,NULL,0),(14,34,'Race',1248462,4,14,NULL,0),(14,34,'Race',1337589,4,15,NULL,0),(14,34,'Race',1426736,4,16,NULL,0),(14,34,'Race',1515873,4,17,NULL,0),(14,34,'Race',1604957,4,18,NULL,0),(14,34,'Race',1694036,4,19,NULL,0),(14,34,'Race',1783100,4,20,NULL,0),(14,34,'Race',1872239,4,21,NULL,0),(14,34,'Race',1961343,NULL,22,NULL,0),(14,34,'Race',1961343,NULL,23,NULL,1),(14,34,'Sprint',1000,5,0,NULL,0),(14,34,'Sprint',90160,4,1,NULL,0),(14,34,'Sprint',179341,5,2,NULL,0),(14,34,'Sprint',268462,5,3,NULL,0),(14,34,'Sprint',357539,5,4,NULL,0),(14,34,'Sprint',446710,5,5,NULL,0),(14,34,'Sprint',535766,5,6,NULL,0),(14,34,'Sprint',624916,5,7,NULL,0),(14,34,'Sprint',714097,5,8,NULL,0),(14,34,'Sprint',803229,4,9,NULL,0),(14,34,'Sprint',892298,4,10,NULL,0),(14,34,'Sprint',981375,4,11,NULL,0),(14,34,'Sprint',1070449,4,12,NULL,0),(14,34,'Sprint',1159518,NULL,13,NULL,0),(14,34,'Sprint',1248698,4,14,NULL,0),(15,34,'Race',3200,17,0,NULL,0),(15,34,'Race',92518,17,1,NULL,0),(15,34,'Race',182005,17,2,NULL,0),(15,34,'Race',271463,17,3,NULL,0),(15,34,'Race',361041,17,4,NULL,0),(15,34,'Race',450336,17,5,NULL,0),(15,34,'Race',539683,17,6,NULL,0),(15,34,'Race',629248,16,7,NULL,0),(15,34,'Race',718605,16,8,NULL,0),(15,34,'Race',807965,15,9,NULL,0),(15,34,'Race',897384,15,10,NULL,0),(15,34,'Race',986783,15,11,NULL,0),(15,34,'Race',1076104,15,12,NULL,0),(15,34,'Race',1165523,15,13,NULL,0),(15,34,'Race',1254977,15,14,NULL,0),(15,34,'Race',1344357,16,15,NULL,0),(15,34,'Race',1433922,16,16,NULL,0),(15,34,'Race',1523386,16,17,NULL,0),(15,34,'Race',1612727,14,18,NULL,0),(15,34,'Race',1702025,13,19,NULL,0),(15,34,'Race',1791518,13,20,NULL,0),(15,34,'Race',1880849,13,21,NULL,0),(15,34,'Race',1970229,12,22,NULL,0),(15,34,'Race',2059739,12,23,NULL,0),(15,34,'Race',2149171,12,24,NULL,0),(15,34,'Race',2238505,13,25,NULL,0),(15,34,'Race',2327989,NULL,26,NULL,0),(15,34,'Race',2417450,13,27,NULL,0),(15,34,'Sprint',3200,17,0,NULL,0),(15,34,'Sprint',92495,17,1,NULL,0),(15,34,'Sprint',181832,17,2,NULL,0),(15,34,'Sprint',271387,17,3,NULL,0),(15,34,'Sprint',360871,17,4,NULL,0),(15,34,'Sprint',450293,17,5,NULL,0),(15,34,'Sprint',539715,17,6,NULL,0),(15,34,'Sprint',629192,17,7,NULL,0),(15,34,'Sprint',718741,17,8,NULL,0),(15,34,'Sprint',808238,17,9,NULL,0),(15,34,'Sprint',897686,17,10,NULL,0),(15,34,'Sprint',987238,17,11,NULL,0),(15,34,'Sprint',1076767,17,12,NULL,0),(15,34,'Sprint',1166192,NULL,13,NULL,0),(15,34,'Sprint',1255500,17,14,NULL,0),(16,34,'Race',2400,13,0,NULL,0),(16,34,'Race',91920,14,1,NULL,0),(16,34,'Race',181403,16,2,NULL,0),(16,34,'Race',270938,16,3,NULL,0),(16,34,'Race',360412,16,4,NULL,0),(16,34,'Race',449895,16,5,NULL,0),(16,34,'Race',539332,16,6,NULL,0),(16,34,'Race',628574,15,7,NULL,0),(16,34,'Race',717878,15,8,NULL,0),(16,34,'Race',807225,14,9,NULL,0),(16,34,'Race',896507,14,10,NULL,0),(16,34,'Race',985848,14,11,NULL,0),(16,34,'Race',1075352,14,12,NULL,0),(16,34,'Race',1164647,14,13,NULL,0),(16,34,'Race',1253902,14,14,NULL,0),(16,34,'Race',1343336,14,15,NULL,0),(16,34,'Race',1432720,14,16,NULL,0),(16,34,'Race',1522237,14,17,NULL,0),(16,34,'Race',1611544,12,18,NULL,0),(16,34,'Race',1700913,11,19,NULL,0),(16,34,'Race',1790442,11,20,NULL,0),(16,34,'Race',1879694,11,21,NULL,0),(16,34,'Race',1969177,10,22,NULL,0),(16,34,'Race',2058654,10,23,NULL,0),(16,34,'Race',2147899,10,24,NULL,0),(16,34,'Race',2237360,10,25,NULL,0),(16,34,'Race',2326797,NULL,26,NULL,0),(16,34,'Race',2416070,10,27,NULL,0),(16,34,'Sprint',2400,13,0,NULL,0),(16,34,'Sprint',91932,15,1,NULL,0),(16,34,'Sprint',181409,16,2,NULL,0),(16,34,'Sprint',270873,16,3,NULL,0),(16,34,'Sprint',360214,16,4,NULL,0),(16,34,'Sprint',449648,16,5,NULL,0),(16,34,'Sprint',538893,15,6,NULL,0),(16,34,'Sprint',628394,15,7,NULL,0),(16,34,'Sprint',717769,15,8,NULL,0),(16,34,'Sprint',807292,14,9,NULL,0),(16,34,'Sprint',896605,14,10,NULL,0),(16,34,'Sprint',986045,14,11,NULL,0),(16,34,'Sprint',1075411,14,12,NULL,0),(16,34,'Sprint',1164690,NULL,13,NULL,0),(16,34,'Sprint',1253988,14,14,NULL,0),(17,34,'Race',600,6,0,NULL,0),(17,34,'Race',90269,7,1,NULL,0),(17,34,'Race',179836,7,2,NULL,0),(17,34,'Race',269226,8,3,NULL,0),(17,34,'Race',358846,9,4,NULL,0),(17,34,'Race',448422,11,5,NULL,0),(17,34,'Race',538223,12,6,NULL,0),(17,34,'Race',627839,NULL,7,NULL,0),(17,34,'Race',627839,NULL,8,NULL,1),(17,34,'Sprint',600,6,0,NULL,0),(17,34,'Sprint',90277,8,1,NULL,0),(17,34,'Sprint',179937,9,2,NULL,0),(17,34,'Sprint',269314,10,3,NULL,0),(17,34,'Sprint',359053,11,4,NULL,0),(17,34,'Sprint',448863,12,5,NULL,0),(17,34,'Sprint',538390,14,6,NULL,0),(17,34,'Sprint',628059,14,7,NULL,0),(17,34,'Sprint',717538,14,8,NULL,0),(17,34,'Sprint',807149,15,9,NULL,0),(17,34,'Sprint',896641,15,10,NULL,0),(17,34,'Sprint',986292,15,11,NULL,0),(17,34,'Sprint',1076106,15,12,NULL,0),(17,34,'Sprint',1165558,NULL,13,NULL,0),(17,34,'Sprint',1255258,16,14,NULL,0),(18,34,'Race',4200,22,0,NULL,0),(18,34,'Race',93617,22,1,NULL,0),(18,34,'Race',183151,21,2,NULL,0),(18,34,'Race',272874,21,3,NULL,0),(18,34,'Race',362579,21,4,NULL,0),(18,34,'Race',452158,21,5,NULL,0),(18,34,'Race',541656,21,6,NULL,0),(18,34,'Race',631321,20,7,NULL,0),(18,34,'Race',720819,19,8,NULL,0),(18,34,'Race',810430,18,9,NULL,0),(18,34,'Race',900176,18,10,NULL,0),(18,34,'Race',989949,18,11,NULL,0),(18,34,'Race',1079731,18,12,NULL,0),(18,34,'Race',1169265,18,13,NULL,0),(18,34,'Race',1258997,18,14,NULL,0),(18,34,'Race',1348536,18,15,NULL,0),(18,34,'Race',1438165,18,16,NULL,0),(18,34,'Race',1527618,18,17,NULL,0),(18,34,'Race',1617332,17,18,NULL,0),(18,34,'Race',1706749,17,19,NULL,0),(18,34,'Race',1801190,17,20,NULL,0),(18,34,'Race',1891021,17,21,NULL,0),(18,34,'Race',1980812,16,22,NULL,0),(18,34,'Race',2070594,16,23,NULL,0),(18,34,'Race',2160398,16,24,NULL,0),(18,34,'Race',2254858,16,25,NULL,0),(18,34,'Race',2344631,NULL,26,NULL,0),(18,34,'Race',2434431,16,27,NULL,0),(18,34,'Sprint',4200,21,0,NULL,0),(18,34,'Sprint',93833,21,1,NULL,0),(18,34,'Sprint',183592,21,2,NULL,0),(18,34,'Sprint',273329,21,3,NULL,0),(18,34,'Sprint',363106,21,4,NULL,0),(18,34,'Sprint',452798,21,5,NULL,0),(18,34,'Sprint',542418,20,6,NULL,0),(18,34,'Sprint',631849,20,7,NULL,0),(18,34,'Sprint',721230,20,8,NULL,0),(18,34,'Sprint',810971,20,9,NULL,0),(18,34,'Sprint',900586,NULL,10,NULL,0),(18,34,'Sprint',900586,NULL,11,NULL,1),(19,34,'Race',2600,12,0,NULL,0),(19,34,'Race',91827,12,1,NULL,0),(19,34,'Race',181061,12,2,NULL,0),(19,34,'Race',270354,11,3,NULL,0),(19,34,'Race',359539,11,4,NULL,0),(19,34,'Race',448741,9,5,NULL,0),(19,34,'Race',538113,9,6,NULL,0),(19,34,'Race',627436,9,7,NULL,0),(19,34,'Race',716675,9,8,NULL,0),(19,34,'Race',806073,10,9,NULL,0),(19,34,'Race',895464,10,10,NULL,0),(19,34,'Race',984759,10,11,NULL,0),(19,34,'Race',1074038,10,12,NULL,0),(19,34,'Race',1163303,10,13,NULL,0),(19,34,'Race',1252495,10,14,NULL,0),(19,34,'Race',1341853,10,15,NULL,0),(19,34,'Race',1431218,10,16,NULL,0),(19,34,'Race',1520574,10,17,NULL,0),(19,34,'Race',1609794,9,18,NULL,0),(19,34,'Race',1699129,8,19,NULL,0),(19,34,'Race',1788347,7,20,NULL,0),(19,34,'Race',1877705,7,21,NULL,0),(19,34,'Race',1967051,6,22,NULL,0),(19,34,'Race',2056220,6,23,NULL,0),(19,34,'Race',2145604,6,24,NULL,0),(19,34,'Race',2234913,6,25,NULL,0),(19,34,'Race',2324290,NULL,26,NULL,0),(19,34,'Race',2413639,5,27,NULL,0),(19,34,'Sprint',2600,14,0,NULL,0),(19,34,'Sprint',91974,13,1,NULL,0),(19,34,'Sprint',181225,14,2,NULL,0),(19,34,'Sprint',270515,14,3,NULL,0),(19,34,'Sprint',359819,13,4,NULL,0),(19,34,'Sprint',449161,13,5,NULL,0),(19,34,'Sprint',538393,12,6,NULL,0),(19,34,'Sprint',627618,12,7,NULL,0),(19,34,'Sprint',716971,12,8,NULL,0),(19,34,'Sprint',806322,11,9,NULL,0),(19,34,'Sprint',895619,11,10,NULL,0),(19,34,'Sprint',984991,11,11,NULL,0),(19,34,'Sprint',1074202,11,12,NULL,0),(19,34,'Sprint',1163483,NULL,13,NULL,0),(19,34,'Sprint',1252846,11,14,NULL,0),(20,34,'Race',3800,20,0,NULL,0),(20,34,'Race',93238,19,1,NULL,0),(20,34,'Race',182599,19,2,NULL,0),(20,34,'Race',272130,19,3,NULL,0),(20,34,'Race',361658,18,4,NULL,0),(20,34,'Race',450922,18,5,NULL,0),(20,34,'Race',540466,19,6,NULL,0),(20,34,'Race',630034,18,7,NULL,0),(20,34,'Race',719475,20,8,NULL,0),(20,34,'Race',812664,19,9,NULL,0),(20,34,'Race',902202,19,10,NULL,0),(20,34,'Race',991733,19,11,NULL,0),(20,34,'Race',1081321,19,12,NULL,0),(20,34,'Race',1170665,19,13,NULL,0),(20,34,'Race',1260089,19,14,NULL,0),(20,34,'Race',1349640,19,15,NULL,0),(20,34,'Race',1440069,19,16,NULL,0),(20,34,'Race',1529590,19,17,NULL,0),(20,34,'Race',1619181,18,18,NULL,0),(20,34,'Race',1708609,16,19,NULL,0),(20,34,'Race',1797893,16,20,NULL,0),(20,34,'Race',1887467,16,21,NULL,0),(20,34,'Race',1976905,15,22,NULL,0),(20,34,'Race',2066429,15,23,NULL,0),(20,34,'Race',2155800,15,24,NULL,0),(20,34,'Race',2245258,15,25,NULL,0),(20,34,'Race',2334812,NULL,26,NULL,0),(20,34,'Race',2424403,15,27,NULL,0),(20,34,'Sprint',3800,20,0,NULL,0),(20,34,'Sprint',93304,20,1,NULL,0),(20,34,'Sprint',182778,19,2,NULL,0),(20,34,'Sprint',272272,19,3,NULL,0),(20,34,'Sprint',361700,19,4,NULL,0),(20,34,'Sprint',451028,19,5,NULL,0),(20,34,'Sprint',540499,18,6,NULL,0),(20,34,'Sprint',629880,18,7,NULL,0),(20,34,'Sprint',719324,18,8,NULL,0),(20,34,'Sprint',808808,18,9,NULL,0),(20,34,'Sprint',898242,18,10,NULL,0),(20,34,'Sprint',987680,18,11,NULL,0),(20,34,'Sprint',1077244,18,12,NULL,0),(20,34,'Sprint',1166812,NULL,13,NULL,0),(20,34,'Sprint',1256240,18,14,NULL,0),(21,34,'Race',1800,9,0,NULL,0),(21,34,'Race',90924,8,1,NULL,0),(21,34,'Race',180146,8,2,NULL,0),(21,34,'Race',269357,6,3,NULL,0),(21,34,'Race',358577,6,4,NULL,0),(21,34,'Race',447795,6,5,NULL,0),(21,34,'Race',536969,6,6,NULL,0),(21,34,'Race',626241,6,7,NULL,0),(21,34,'Race',715487,6,8,NULL,0),(21,34,'Race',804684,6,9,NULL,0),(21,34,'Race',893937,6,10,NULL,0),(21,34,'Race',983045,6,11,NULL,0),(21,34,'Race',1072289,6,12,NULL,0),(21,34,'Race',1161449,6,13,NULL,0),(21,34,'Race',1250618,6,14,NULL,0),(21,34,'Race',1339806,6,15,NULL,0),(21,34,'Race',1429075,6,16,NULL,0),(21,34,'Race',1518319,6,17,NULL,0),(21,34,'Race',1607436,6,18,NULL,0),(21,34,'Race',1696626,6,19,NULL,0),(21,34,'Race',1785744,5,20,NULL,0),(21,34,'Race',1874969,5,21,NULL,0),(21,34,'Race',1964203,4,22,NULL,0),(21,34,'Race',2053376,4,23,NULL,0),(21,34,'Race',2142626,4,24,NULL,0),(21,34,'Race',2231870,4,25,NULL,0),(21,34,'Race',2321027,NULL,26,NULL,0),(21,34,'Race',2410152,4,27,NULL,0),(21,34,'Sprint',1800,10,0,NULL,0),(21,34,'Sprint',90917,10,1,NULL,0),(21,34,'Sprint',180147,10,2,NULL,0),(21,34,'Sprint',269397,9,3,NULL,0),(21,34,'Sprint',358594,8,4,NULL,0),(21,34,'Sprint',447842,8,5,NULL,0),(21,34,'Sprint',537011,8,6,NULL,0),(21,34,'Sprint',626252,7,7,NULL,0),(21,34,'Sprint',715481,7,8,NULL,0),(21,34,'Sprint',804694,7,9,NULL,0),(21,34,'Sprint',893816,7,10,NULL,0),(21,34,'Sprint',982989,7,11,NULL,0),(21,34,'Sprint',1072107,7,12,NULL,0),(21,34,'Sprint',1161379,NULL,13,NULL,0),(21,34,'Sprint',1250636,7,14,NULL,0),(22,34,'Race',1600,8,0,NULL,0),(22,34,'Race',90815,9,1,NULL,0),(22,34,'Race',180160,9,2,NULL,0),(22,34,'Race',269359,7,3,NULL,0),(22,34,'Race',358610,7,4,NULL,0),(22,34,'Race',447897,7,5,NULL,0),(22,34,'Race',537089,7,6,NULL,0),(22,34,'Race',626412,7,7,NULL,0),(22,34,'Race',715705,7,8,NULL,0),(22,34,'Race',804933,7,9,NULL,0),(22,34,'Race',894123,7,10,NULL,0),(22,34,'Race',983450,7,11,NULL,0),(22,34,'Race',1072707,7,12,NULL,0),(22,34,'Race',1161926,7,13,NULL,0),(22,34,'Race',1251084,7,14,NULL,0),(22,34,'Race',1340283,7,15,NULL,0),(22,34,'Race',1429459,7,16,NULL,0),(22,34,'Race',1518788,7,17,NULL,0),(22,34,'Race',1608156,NULL,18,NULL,0),(22,34,'Race',1608156,NULL,19,NULL,1),(22,34,'Sprint',1600,9,0,NULL,0),(22,34,'Sprint',90812,9,1,NULL,0),(22,34,'Sprint',180051,8,2,NULL,0),(22,34,'Sprint',269241,8,3,NULL,0),(22,34,'Sprint',358584,9,4,NULL,0),(22,34,'Sprint',447961,9,5,NULL,0),(22,34,'Sprint',537117,9,6,NULL,0),(22,34,'Sprint',626291,9,7,NULL,0),(22,34,'Sprint',715668,9,8,NULL,0),(22,34,'Sprint',804946,13,9,NULL,0),(22,34,'Sprint',896015,13,10,NULL,0),(22,34,'Sprint',985387,13,11,NULL,0),(22,34,'Sprint',1074689,13,12,NULL,0),(22,34,'Sprint',1164045,NULL,13,NULL,0),(22,34,'Sprint',1253410,13,14,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rider`
--

LOCK TABLES `rider` WRITE;
/*!40000 ALTER TABLE `rider` DISABLE KEYS */;
INSERT INTO `rider` VALUES (1,'Francesco','Bagnaia',63,'Italy',1.66667,2.33333,1.8,6,2.63333,2),(2,'Enea','Bastianini',23,'Italy',2.33333,3.66667,4.33333,1.5,2.97222,2),(3,'Jorge','Martin',89,'Spain',1.33333,1.33333,5.33333,10.5,3.52778,7),(4,'Franco','Morbidelli',21,'Italy',7,7.9,7,21,9.63333,10),(5,'Alex','Marquez',73,'Spain',4.2,5.3,6.78,27,8.79667,40),(6,'Marc','Marquez',93,'Spain',2.66667,2,2.66667,18,5,3),(7,'Luca','Marini',10,'Italy',7,6.33333,5.66667,4,6.05555,10),(8,'Joan','Mir',36,'Spain',8.33333,7,8.33333,33,12,40),(9,'Fabio','Quartararo',20,'France',3.1,2.2,6,19.5,6.01667,5),(10,'Alex','Rins',42,'Spain',6.8,8.1,4,22.5,9.38333,5),(11,'Marco','Bezzecchi',72,'Italy',4,4,3,15,5.66667,7),(12,'Fabio','Di Giannantonio',49,'Italy',5.66667,4.33333,5,9,5.66667,6),(13,'Aleix','Espargaro',41,'Spain',4.33333,2.66667,2.33333,7.5,3.97222,1),(14,'Maverick','Vinales',12,'Spain',2.3,1.9,4.9,14.5,4.63333,1),(15,'Raul','Fernandez',25,'Spain',6.9,6.85,8,25,10.0833,11),(16,'Miguel','Oliveira',88,'Portugal',5,5,1.7,9,5.11667,11),(17,'Johann','Zarco',5,'France',7.1,6.1,4,25.5,9.31667,4),(18,'Takaaki','Nakagami',30,'Japan',8,8,7.33333,31.5,11.8056,40),(19,'Pedro','Acosta',37,'Spain',2.5,2.4,6.5,3,3.21667,9),(20,'Augusto','Fernandez',89,'Spain',7.8,8.7,9,30,12,8),(21,'Brad','Binder',33,'South Africa',2.7,4.4,1.1,14,4.88333,9),(22,'Jack','Miller',43,'Australia',5,4.66667,3.33333,28.5,8.52778,40),(23,'David','Munoz',64,'Spain',17.6667,20.6667,22.6667,30,21.5556,12),(24,'Joel','Kelso',66,'Australia',12.9,12.3333,9,3,10.4111,30),(25,'Joel','Esteban',78,'Spain',19.6,20,23,19,20.2,21),(26,'David','Alonso',80,'Spain',12.6667,11,1,7,9.22223,27),(27,'Riccardo','Rossi',54,'Italy',18.6667,17,17,35,20.5556,19),(28,'Noah','Dettwiler',55,'Switzerland',24.2,24.2,21.5,26,24.05,14),(29,'Tatchakorn','Buasri',5,'Thailand',24.5,23.3333,21,13.5,21.6944,15),(30,'Taiyo','Furusato',72,'Japan',21.4,21.5,15,16,19.4667,23),(31,'Adrian','Fernandez',31,'Spain',21.3333,22.6667,17,37.5,23.75,16),(32,'Angel','Piqueras',36,'Spain',17,19,21.6667,17,18.4445,13),(33,'Tatsuki','Suzuki',24,'Japan',24.7,24.9,19,19,22.8667,17),(34,'Collin','Veijer',96,'Netherlands',14,13.3333,11.6667,28.5,15.8055,31),(35,'Scott','Ogden',19,'United Kingdom',21.8,23,19,30,23.1,18),(36,'Joshua','Whatley',70,'United Kingdom',23.3333,24,22,24,23.4444,40),(37,'Ryusei','Yamanaka',6,'Japan',20.6667,18,23.6667,6,17.8333,19),(38,'Ivan','Ortola',48,'Spain',15,15.3333,19.3333,13,15.5,39),(39,'Nicola','Carraro',10,'Italy',23.2,22.7,17,24,22.1333,20),(40,'Stefano','Nepa',82,'Italy',18.3333,18.3,17,3,15.5444,12),(41,'Jacob','Roulstone',12,'United Kingdom',18,19,19.3333,6,16.5555,13),(42,'Daniel','Holgado',96,'Spain',11.2,12,17,14,12.9,36),(43,'Xabi','Zurutuza',85,'Spain',21.5,19,23,15,19.8333,22),(44,'Jose Antonio','Rueda',99,'Spain',13.3333,14.3333,16,31.5,17.1389,25),(45,'Matteo','Bertelle',18,'Italy',18.7,18.2,16,9,16.4667,17),(46,'David','Almansa',22,'Spain',18.6667,21.3333,20.6667,21,20.2778,23),(47,'Filippo','Farioli',7,'Italy',2,18.6,22,30,15.5333,20),(48,'Luca','Lunetta',58,'Italy',22.4,19.4,22.7,33,23.2167,24),(49,'Sergio','Garcia',3,'Spain',8.66667,9,13,4.5,8.80556,32),(50,'Jaume','Masia',5,'Spain',17,17.3333,18,33,19.9444,34),(51,'Barry','Baltus',7,'Belgium',14.3333,13.3333,14.3333,28.5,16.3611,37),(52,'Diogo','Moreira',10,'Brasil',13.3,13.3,14.3,17,14.0833,30),(53,'Filip','Salač',12,'Cech Republic',12.8,12.7,13.9,3,11.3167,26),(54,'Celestino','Vietti',13,'Italy',7.44,8,12,6,8.14667,6),(55,'Tony','Arbolino',14,'Italy',11.3333,12.3333,6.33333,1.5,9.19442,38),(56,'Darryn','Binder',15,'South Africa',15,16.6667,15,36,19.0556,40),(57,'Joe','Roberts',16,'USA',9.66667,10,9.66667,21,11.6667,33),(58,'Alex','Escrig',17,'Spain',16.3333,16.7,15.3,13.2,15.7611,28),(59,'Manuel','Gonzalez',18,'Spain',10.6667,12.6667,11.3333,25.5,13.9167,35),(60,'Xavi','Cardelus',20,'Andorra',17.6667,18,16.3333,40.5,21.3611,27),(61,'Alonso','Lopez',21,'Spain',9,9.66667,12.6667,19.5,11.5833,38),(62,'Ayumu','Sasaki',22,'Japan',16.6667,15.6667,17.6667,42,20.7222,39),(63,'Marcos','Ramírez',24,'Spain',10.5,10.66,9,9,10.0533,33),(64,'Izan','Guevara',28,'Spain',14,14,11,36,17.1667,25),(65,'Mario','Aji',34,'Indonesia',18,17.6667,16,45,22.0556,29),(66,'Somkiat','Chantra',35,'Thailand',14.6667,13,10.3333,37.5,17.1944,29),(67,'Xavier','Artigas',43,'Spain',17.3333,15.3333,17.3333,34.5,19.5278,28),(68,'Aron','Canet',44,'Spain',6.99,7.33333,10,9,7.94111,8),(69,'Jeremy','Alcoba',52,'Spain',12.1,13.3333,8.5,27,14.3944,26),(70,'Deniz','Oncu',53,'Turkey',15.2,14.6,15,15,14.9333,36),(71,'Fermin','Aldeguer',54,'Spain',5.33333,5.66667,6,8,6,3),(72,'Bo','Bendsneyder',64,'Netherlands',13.7,14.2,10.3,27,15.5167,34),(73,'Dennis','Foggia',71,'Italy',11,9.9,11.88,11,10.78,32),(74,'Albert','Arenas',75,'Spain',11.6667,9.33333,11.6667,24,12.9444,35),(75,'Ai','Ogura',79,'Japan',8.3333,9,13.77,15,10.5728,4),(76,'Senna','Agius',81,'Australia',15,16,16,24,17,31),(77,'Zonta','V d Goorbergh',84,'Netherlands',12.8,13.7,15.8,15.5,14.05,37),(78,'Jake','Dixon',96,'United Kingdom',13,11.6667,14,43.5,17.8056,40),(83,'Alvaro','Carpe',83,'Spain',19.6,20.8,25,26,NULL,22),(84,'Ric','Salmela',27,'Finalnd',20,21.9,24,20,NULL,21),(85,'Guido','Pini',94,'Italy',23,22,29,15,NULL,24),(86,'Marco','Morelli',97,'Argentina',21,22,17,13,NULL,18),(87,'Giulio','Pugliese',31,'Italy',19.9,23,19.2,17,20.3333,16),(88,'David','Gonzalez',11,'Spain',25,25.4,29.8,29,NULL,14),(89,'Zen','Mitani',2,'Japan',24,24.7,17,35,NULL,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,2024),(2,2025),(4,2025);
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
INSERT INTO `standings` VALUES (1,1,709,1),(2,1,546,1),(3,1,490,1),(4,1,123,1),(5,1,88,1),(6,1,236,1),(7,1,37,1),(8,1,2,1),(9,1,93,1),(10,1,17,1),(11,1,176,1),(12,1,112,1),(13,1,328,1),(14,1,277,1),(15,1,33,1),(16,1,143,1),(17,1,13,1),(18,1,2,1),(19,1,185,1),(20,1,19,1),(21,1,258,1),(22,1,82,1),(23,1,90,3),(24,1,300,3),(25,1,119,3),(26,1,382,3),(27,1,8,3),(28,1,1,3),(29,1,6,3),(30,1,57,3),(31,1,81,3),(32,1,147,3),(33,1,86,3),(34,1,207,3),(35,1,2,3),(36,1,1,3),(37,1,102,3),(38,1,133,3),(39,1,12,3),(40,1,131,3),(41,1,205,3),(42,1,406,3),(43,1,120,3),(44,1,213,3),(45,1,62,3),(46,1,39,3),(47,1,19,3),(48,1,11,3),(49,1,345,2),(50,1,0,2),(51,1,11,2),(52,1,49,2),(53,1,70,2),(54,1,220,2),(55,1,155,2),(56,1,3,2),(57,1,207,2),(58,1,8,2),(59,1,123,2),(60,1,3,2),(61,1,228,2),(62,1,2,2),(63,1,239,2),(64,1,7,2),(65,1,0,2),(66,1,4,2),(67,1,0,2),(68,1,279,2),(69,1,30,2),(70,1,86,2),(71,1,388,2),(72,1,13,2),(73,1,96,2),(74,1,125,2),(75,1,221,2),(76,1,5,2),(77,1,23,2),(78,1,0,2);
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
  `performance` bigint(20) DEFAULT NULL,
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
INSERT INTO `team` VALUES (1,'Aprilia Racing','Italy','5cb33a',2,1),(2,'Ducati Lenovo Team','Italy','cc0000',1,1),(3,'Gresini Racing','Italy','9db4d9',5,1),(4,'LCR Honda','Japan','ffffff',11,1),(5,'Monster Energy Yamaha','Japan','0c368c',8,1),(6,'Pertamina Enduro VR46 Racing Team','Italy','dbff03',6,1),(7,'Prima Pramac Racing','Italy','8234c2',3,1),(8,'Red Bull GASGAS Tech3','Austria','990726',9,1),(9,'Red Bull KTM Factory Racing','Austria','ff6600',4,1),(10,'Repsol Honda Team','Japan','ffa00f',10,1),(11,'Trackhouse Racing','USA','0066cc',7,1),(12,'BOE Motorsports','Spain','d1ff18',5,3),(13,'CFMOTO Aspar Team','Spain','007984',2,3),(14,'CIP Green Power','France','77d25c',12,3),(15,'Honda Team Asia','Japan','ffffff',9,3),(16,'Leopard Racing','Luxembourg','75cbd1',4,3),(17,'Liqui Moly Husqvarna Intact GP','Germany','344966',7,3),(18,'MLav Racing','United Kingdom','00a19c',13,3),(19,'MT Helmets MSI','Spain','eb9354',6,3),(20,'MTA Team','Italy','fe1a8b',8,3),(21,'Red Bull GASGAS Tech3','Austria','990726',3,3),(22,'Red Bull KTM Ajo','Austria','ff6600',1,3),(23,'Rivacold Snipers Team','Italy','ffe000',11,3),(24,'SIC58 Squadra Corse','Italy','e42327',10,3),(25,'CFMOTO Aspar Team','Spain','007984',11,2),(26,'ELF Marc VDS Racing Team','Belgium','682a38',5,2),(27,'Fantic Racing','Italy','e4032c',9,2),(28,'Forward Team','Italy','7bdcb5',15,2),(29,'IDEMITSU Honda Team Asia','Japan','a39a65',13,2),(30,'Italtrans Racing Team','Italy','106ba9',6,2),(31,'Liqui Moly Husqvarna Intact GP','Germany','344966',14,2),(32,'MT Helmets MSI','Spain','eb9354',2,2),(33,'OnlyFans American Racing Team','USA','0a28a3',3,2),(34,'Pertamina Mandalika GAS UP Team','Indonesia','d83a3b',12,2),(35,'QJMOTOR Gresini Moto2','Italy','9db4d9',7,2),(36,'Red Bull KTM Ajo','Austria','ff6600',4,2),(37,'RW Racing GP','Netherlands','ffffff',8,2),(38,'SpeedUp Racing','Italy','f08019',1,2),(39,'Yamaha VR46 Master Camp Team','Japan','e0ff00',10,2),(40,'No Team','None','888888',0,4);
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

-- Dump completed on 2024-04-23  0:02:40

-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: gsb_frais_03
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comptable`
--

DROP TABLE IF EXISTS `comptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comptable` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateembauche` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comptable`
--

LOCK TABLES `comptable` WRITE;
/*!40000 ALTER TABLE `comptable` DISABLE KEYS */;
INSERT INTO `comptable` VALUES ('1','Dupont','Jean','adminC','$2y$10$VGsqPuNhY13IDPY.sp5Ow.RpMZLwJSY8GbARjk.r64ebi0mbOq0mS','7 rue de la Paix','57000','Metz','2009-09-09');
/*!40000 ALTER TABLE `comptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etat`
--

DROP TABLE IF EXISTS `etat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat`
--

LOCK TABLES `etat` WRITE;
/*!40000 ALTER TABLE `etat` DISABLE KEYS */;
INSERT INTO `etat` VALUES ('CL','Saisie clôturée'),('CR','Fiche créée, saisie en cours'),('MP','Mise en paiement'),('RB','Remboursée'),('VA','Validée');
/*!40000 ALTER TABLE `etat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichefrais`
--

DROP TABLE IF EXISTS `fichefrais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichefrais` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbjustificatifs` int DEFAULT NULL,
  `montantvalide` decimal(10,2) DEFAULT NULL,
  `datemodif` date DEFAULT NULL,
  `idetat` char(2) DEFAULT 'CR',
  `idvehicule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idvisiteur`,`mois`),
  KEY `idetat` (`idetat`),
  KEY `idvehicule` (`idvehicule`),
  CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idetat`) REFERENCES `etat` (`id`),
  CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idvisiteur`) REFERENCES `visiteur` (`id`),
  CONSTRAINT `idvehicule` FOREIGN KEY (`idvehicule`) REFERENCES `vehicule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichefrais`
--

LOCK TABLES `fichefrais` WRITE;
/*!40000 ALTER TABLE `fichefrais` DISABLE KEYS */;
INSERT INTO `fichefrais` VALUES ('1','201811',5,3146.60,'2019-01-05','RB','5/6CVD'),('1','201812',2,3630.40,'2019-02-08','RB','5/6CVD'),('1','201901',10,3022.24,'2019-03-07','RB','5/6CVD'),('1','201902',10,3016.48,'2019-04-06','RB','5/6CVD'),('1','201903',8,4324.46,'2019-04-01','VA','5/6CVD'),('1','201904',6,0.00,'2019-05-19','CL','5/6CVD'),('1','201905',0,0.00,'2019-05-19','CR','5/6CVD'),('a131','201811',7,3523.10,'2019-01-08','RB','5/6CVD'),('a131','201812',9,3231.24,'2019-02-07','RB','5/6CVD'),('a131','201901',9,2016.00,'2019-03-08','RB','5/6CVD'),('a131','201902',11,4079.50,'2019-04-06','RB','5/6CVD'),('a131','201903',3,4546.52,'2019-04-08','VA','5/6CVD'),('a131','201904',0,0.00,'2019-04-02','CR','5/6CVD'),('a17','201811',2,1621.93,'2019-01-06','RB','5/6CVE'),('a17','201812',4,3449.80,'2019-02-02','RB','5/6CVE'),('a17','201901',7,2286.54,'2019-03-01','RB','5/6CVE'),('a17','201902',9,2142.24,'2019-04-02','RB','5/6CVE'),('a17','201903',11,3548.37,'2019-04-07','VA','5/6CVE'),('a17','201904',0,3723.32,'2019-04-08','VA','5/6CVE'),('a55','201811',9,3924.09,'2019-01-03','RB','5/6CVE'),('a55','201812',10,4042.91,'2019-02-02','RB','5/6CVE'),('a55','201901',9,3777.58,'2019-03-06','RB','5/6CVE'),('a55','201902',2,1472.98,'2019-04-06','RB','5/6CVE'),('a55','201903',5,3186.49,'2019-04-07','VA','5/6CVE'),('a55','201904',7,0.00,'2019-05-19','CL','5/6CVE'),('a55','201905',0,0.00,'2019-05-19','CR','5/6CVE'),('a93','201811',6,3673.78,'2019-01-01','RB','4CVE'),('a93','201812',4,1950.16,'2019-02-05','RB','4CVE'),('a93','201901',8,3100.94,'2019-03-07','RB','4CVE'),('a93','201902',3,3274.48,'2019-04-08','RB','4CVE'),('a93','201903',1,2264.30,'2019-04-08','VA','4CVE'),('a93','201904',0,0.00,'2019-05-19','CR','4CVE'),('a93','201905',0,0.00,'2019-05-19','CR','4CVE'),('b13','201811',12,3255.68,'2019-01-08','RB','4CVE'),('b13','201812',5,3735.32,'2019-02-01','RB','4CVE'),('b13','201901',1,2048.90,'2019-03-06','RB','4CVE'),('b13','201902',3,2682.24,'2019-04-01','RB','4CVE'),('b13','201903',3,5022.70,'2019-04-08','VA','4CVE'),('b13','201904',12,0.00,'2019-04-02','CR','4CVE'),('b16','201811',7,3049.62,'2019-01-08','RB','5/6CVD'),('b16','201812',10,2744.62,'2019-02-05','RB','5/6CVD'),('b16','201901',8,1637.46,'2019-03-07','RB','5/6CVD'),('b16','201902',2,3607.60,'2019-04-07','RB','5/6CVD'),('b16','201903',5,3848.76,'2019-04-04','VA','5/6CVD'),('b16','201904',4,0.00,'2019-04-03','CR','5/6CVD'),('b19','201811',6,2270.08,'2019-01-03','RB','4CVD'),('b19','201812',9,1824.40,'2019-02-08','RB','4CVD'),('b19','201901',5,3078.48,'2019-03-03','RB','4CVD'),('b19','201902',12,3048.04,'2019-04-04','RB','4CVD'),('b19','201903',5,2225.44,'2019-04-01','VA','4CVD'),('b19','201904',1,0.00,'2019-04-01','CR','4CVD'),('b25','201811',12,2822.37,'2019-01-07','RB','5/6CVE'),('b25','201812',3,3946.30,'2019-02-08','RB','5/6CVE'),('b25','201901',5,3215.56,'2019-03-05','RB','5/6CVE'),('b25','201902',5,3277.59,'2019-04-07','RB','5/6CVE'),('b25','201903',4,1873.17,'2019-04-03','VA','5/6CVE'),('b25','201904',8,0.00,'2019-04-03','CR','5/6CVE'),('b28','201811',9,1683.26,'2019-01-08','RB','5/6CVD'),('b28','201812',7,4083.80,'2019-02-08','RB','5/6CVD'),('b28','201901',12,2829.02,'2019-03-07','RB','5/6CVD'),('b28','201902',10,4558.92,'2019-04-08','RB','5/6CVD'),('b28','201903',2,2967.28,'2019-04-03','VA','5/6CVD'),('b28','201904',3,2902.44,'2019-04-08','VA','5/6CVD'),('b4','201811',7,3707.94,'2019-01-01','RB','4CVE'),('b4','201812',9,3028.08,'2019-02-02','RB','4CVE'),('b4','201901',0,1802.24,'2019-03-07','RB','4CVE'),('b4','201902',11,2819.84,'2019-04-08','RB','4CVE'),('b4','201903',8,3835.22,'2019-04-08','VA','4CVE'),('b4','201904',6,1496.36,'2019-04-08','VA','4CVE'),('b50','201811',3,3476.04,'2019-01-02','RB','4CVD'),('b50','201812',7,3360.60,'2019-02-08','RB','4CVD'),('b50','201901',10,2904.08,'2019-03-02','RB','4CVD'),('b50','201902',8,3066.44,'2019-04-02','RB','4CVD'),('b50','201903',5,4068.28,'2019-04-01','VA','4CVD'),('b50','201904',11,2235.80,'2019-04-08','VA','4CVD'),('b59','201811',0,4565.54,'2019-01-07','RB','4CVE'),('b59','201812',9,1993.50,'2019-02-08','RB','4CVE'),('b59','201901',2,3830.48,'2019-03-04','RB','4CVE'),('b59','201902',9,3867.02,'2019-04-08','RB','4CVE'),('b59','201903',10,2640.16,'2019-04-03','VA','4CVE'),('b59','201904',9,1961.42,'2019-04-08','VA','4CVE'),('c14','201811',1,1896.72,'2019-01-05','RB','5/6CVD'),('c14','201812',9,2983.76,'2019-02-08','RB','5/6CVD'),('c14','201901',2,2868.26,'2019-03-07','RB','5/6CVD'),('c14','201902',0,2850.74,'2019-04-07','RB','5/6CVD'),('c14','201903',12,3018.88,'2019-04-04','VA','5/6CVD'),('c14','201904',3,1668.64,'2019-04-08','VA','5/6CVD'),('c3','201811',11,4943.68,'2019-01-04','RB','4CVD'),('c3','201812',7,3835.64,'2019-02-08','RB','4CVD'),('c3','201901',5,3836.16,'2019-03-08','RB','4CVD'),('c3','201902',10,3695.44,'2019-04-03','RB','4CVD'),('c3','201903',4,1941.48,'2019-04-01','VA','4CVD'),('c3','201904',7,2099.80,'2019-04-08','VA','4CVD'),('c54','201811',12,3233.74,'2019-01-08','RB','5/6CVD'),('c54','201812',9,4087.00,'2019-02-05','RB','5/6CVD'),('c54','201901',11,3139.96,'2019-03-05','RB','5/6CVD'),('c54','201902',2,3032.00,'2019-04-02','RB','5/6CVD'),('c54','201903',12,3132.82,'2019-04-04','VA','5/6CVD'),('c54','201904',8,946.38,'2019-04-08','VA','5/6CVD');
/*!40000 ALTER TABLE `fichefrais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fraisforfait`
--

DROP TABLE IF EXISTS `fraisforfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fraisforfait`
--

LOCK TABLES `fraisforfait` WRITE;
/*!40000 ALTER TABLE `fraisforfait` DISABLE KEYS */;
INSERT INTO `fraisforfait` VALUES ('ETP','Forfait Etape',110.00),('KM','Frais Kilométrique',0.62),('NUI','Nuitée Hôtel',80.00),('REP','Repas Restaurant',25.00);
/*!40000 ALTER TABLE `fraisforfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignefraisforfait`
--

DROP TABLE IF EXISTS `lignefraisforfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lignefraisforfait` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idfraisforfait` char(3) NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`idvisiteur`,`mois`,`idfraisforfait`),
  KEY `idfraisforfait` (`idfraisforfait`),
  CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idvisiteur`, `mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`),
  CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idfraisforfait`) REFERENCES `fraisforfait` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignefraisforfait`
--

LOCK TABLES `lignefraisforfait` WRITE;
/*!40000 ALTER TABLE `lignefraisforfait` DISABLE KEYS */;
INSERT INTO `lignefraisforfait` VALUES ('1','201811','ETP',6),('1','201811','KM',670),('1','201811','NUI',9),('1','201811','REP',9),('1','201812','ETP',20),('1','201812','KM',330),('1','201812','NUI',3),('1','201812','REP',3),('1','201901','ETP',5),('1','201901','KM',828),('1','201901','NUI',16),('1','201901','REP',14),('1','201902','ETP',9),('1','201902','KM',606),('1','201902','NUI',15),('1','201902','REP',14),('1','201903','ETP',14),('1','201903','KM',987),('1','201903','NUI',5),('1','201903','REP',3),('1','201904','ETP',19),('1','201904','KM',960),('1','201904','NUI',20),('1','201904','REP',5),('1','201905','ETP',10),('1','201905','KM',20),('1','201905','NUI',40),('1','201905','REP',20),('a131','201811','ETP',19),('a131','201811','KM',695),('a131','201811','NUI',11),('a131','201811','REP',5),('a131','201812','ETP',17),('a131','201812','KM',778),('a131','201812','NUI',7),('a131','201812','REP',13),('a131','201901','ETP',8),('a131','201901','KM',950),('a131','201901','NUI',4),('a131','201901','REP',5),('a131','201902','ETP',13),('a131','201902','KM',725),('a131','201902','NUI',18),('a131','201902','REP',16),('a131','201903','ETP',17),('a131','201903','KM',694),('a131','201903','NUI',14),('a131','201903','REP',19),('a131','201904','ETP',4),('a131','201904','KM',442),('a131','201904','NUI',3),('a131','201904','REP',8),('a17','201811','ETP',2),('a17','201811','KM',379),('a17','201811','NUI',13),('a17','201811','REP',3),('a17','201812','ETP',18),('a17','201812','KM',340),('a17','201812','NUI',6),('a17','201812','REP',8),('a17','201901','ETP',4),('a17','201901','KM',562),('a17','201901','NUI',5),('a17','201901','REP',7),('a17','201902','ETP',4),('a17','201902','KM',772),('a17','201902','NUI',6),('a17','201902','REP',14),('a17','201903','ETP',14),('a17','201903','KM',511),('a17','201903','NUI',9),('a17','201903','REP',16),('a17','201904','ETP',14),('a17','201904','KM',796),('a17','201904','NUI',15),('a17','201904','REP',18),('a55','201811','ETP',19),('a55','201811','KM',727),('a55','201811','NUI',11),('a55','201811','REP',17),('a55','201812','ETP',14),('a55','201812','KM',473),('a55','201812','NUI',16),('a55','201812','REP',4),('a55','201901','ETP',9),('a55','201901','KM',774),('a55','201901','NUI',15),('a55','201901','REP',8),('a55','201902','ETP',4),('a55','201902','KM',594),('a55','201902','NUI',7),('a55','201902','REP',3),('a55','201903','ETP',14),('a55','201903','KM',347),('a55','201903','NUI',10),('a55','201903','REP',2),('a55','201904','ETP',4),('a55','201904','KM',999),('a55','201904','NUI',3),('a55','201904','REP',7),('a55','201905','ETP',0),('a55','201905','KM',0),('a55','201905','NUI',0),('a55','201905','REP',0),('a93','201811','ETP',20),('a93','201811','KM',619),('a93','201811','NUI',8),('a93','201811','REP',18),('a93','201812','ETP',4),('a93','201812','KM',968),('a93','201812','NUI',7),('a93','201812','REP',14),('a93','201901','ETP',10),('a93','201901','KM',737),('a93','201901','NUI',5),('a93','201901','REP',8),('a93','201902','ETP',11),('a93','201902','KM',704),('a93','201902','NUI',12),('a93','201902','REP',12),('a93','201903','ETP',12),('a93','201903','KM',315),('a93','201903','NUI',5),('a93','201903','REP',11),('a93','201904','ETP',19),('a93','201904','KM',635),('a93','201904','NUI',12),('a93','201904','REP',12),('a93','201905','ETP',0),('a93','201905','KM',0),('a93','201905','NUI',0),('a93','201905','REP',0),('b13','201811','ETP',18),('b13','201811','KM',364),('b13','201811','NUI',10),('b13','201811','REP',10),('b13','201812','ETP',11),('b13','201812','KM',436),('b13','201812','NUI',17),('b13','201812','REP',13),('b13','201901','ETP',5),('b13','201901','KM',945),('b13','201901','NUI',3),('b13','201901','REP',2),('b13','201902','ETP',6),('b13','201902','KM',952),('b13','201902','NUI',11),('b13','201902','REP',12),('b13','201903','ETP',13),('b13','201903','KM',985),('b13','201903','NUI',11),('b13','201903','REP',17),('b13','201904','ETP',6),('b13','201904','KM',928),('b13','201904','NUI',7),('b13','201904','REP',6),('b16','201811','ETP',16),('b16','201811','KM',689),('b16','201811','NUI',6),('b16','201811','REP',15),('b16','201812','ETP',10),('b16','201812','KM',689),('b16','201812','NUI',6),('b16','201812','REP',10),('b16','201901','ETP',3),('b16','201901','KM',537),('b16','201901','NUI',10),('b16','201901','REP',5),('b16','201902','ETP',16),('b16','201902','KM',820),('b16','201902','NUI',16),('b16','201902','REP',2),('b16','201903','ETP',18),('b16','201903','KM',972),('b16','201903','NUI',4),('b16','201903','REP',16),('b16','201904','ETP',4),('b16','201904','KM',760),('b16','201904','NUI',20),('b16','201904','REP',7),('b19','201811','ETP',12),('b19','201811','KM',404),('b19','201811','NUI',7),('b19','201811','REP',6),('b19','201812','ETP',12),('b19','201812','KM',445),('b19','201812','NUI',2),('b19','201812','REP',3),('b19','201901','ETP',7),('b19','201901','KM',724),('b19','201901','NUI',13),('b19','201901','REP',5),('b19','201902','ETP',4),('b19','201902','KM',602),('b19','201902','NUI',18),('b19','201902','REP',6),('b19','201903','ETP',6),('b19','201903','KM',772),('b19','201903','NUI',5),('b19','201903','REP',17),('b19','201904','ETP',2),('b19','201904','KM',907),('b19','201904','NUI',8),('b19','201904','REP',19),('b25','201811','ETP',9),('b25','201811','KM',911),('b25','201811','NUI',8),('b25','201811','REP',5),('b25','201812','ETP',17),('b25','201812','KM',890),('b25','201812','NUI',16),('b25','201812','REP',8),('b25','201901','ETP',8),('b25','201901','KM',468),('b25','201901','NUI',16),('b25','201901','REP',12),('b25','201902','ETP',20),('b25','201902','KM',377),('b25','201902','NUI',5),('b25','201902','REP',17),('b25','201903','ETP',2),('b25','201903','KM',351),('b25','201903','NUI',13),('b25','201903','REP',10),('b25','201904','ETP',7),('b25','201904','KM',390),('b25','201904','NUI',14),('b25','201904','REP',20),('b28','201811','ETP',7),('b28','201811','KM',497),('b28','201811','NUI',5),('b28','201811','REP',9),('b28','201812','ETP',9),('b28','201812','KM',910),('b28','201812','NUI',15),('b28','201812','REP',4),('b28','201901','ETP',17),('b28','201901','KM',369),('b28','201901','NUI',4),('b28','201901','REP',17),('b28','201902','ETP',16),('b28','201902','KM',974),('b28','201902','NUI',20),('b28','201902','REP',14),('b28','201903','ETP',8),('b28','201903','KM',566),('b28','201903','NUI',4),('b28','201903','REP',18),('b28','201904','ETP',8),('b28','201904','KM',418),('b28','201904','NUI',9),('b28','201904','REP',7),('b4','201811','ETP',14),('b4','201811','KM',487),('b4','201811','NUI',16),('b4','201811','REP',18),('b4','201812','ETP',8),('b4','201812','KM',734),('b4','201812','NUI',10),('b4','201812','REP',7),('b4','201901','ETP',6),('b4','201901','KM',552),('b4','201901','NUI',5),('b4','201901','REP',16),('b4','201902','ETP',7),('b4','201902','KM',732),('b4','201902','NUI',6),('b4','201902','REP',16),('b4','201903','ETP',18),('b4','201903','KM',831),('b4','201903','NUI',13),('b4','201903','REP',12),('b4','201904','ETP',3),('b4','201904','KM',728),('b4','201904','NUI',3),('b4','201904','REP',19),('b50','201811','ETP',19),('b50','201811','KM',327),('b50','201811','NUI',13),('b50','201811','REP',5),('b50','201812','ETP',19),('b50','201812','KM',580),('b50','201812','NUI',7),('b50','201812','REP',3),('b50','201901','ETP',9),('b50','201901','KM',929),('b50','201901','NUI',13),('b50','201901','REP',14),('b50','201902','ETP',14),('b50','201902','KM',897),('b50','201902','NUI',11),('b50','201902','REP',5),('b50','201903','ETP',7),('b50','201903','KM',364),('b50','201903','NUI',20),('b50','201903','REP',12),('b50','201904','ETP',13),('b50','201904','KM',540),('b50','201904','NUI',5),('b50','201904','REP',5),('b59','201811','ETP',13),('b59','201811','KM',967),('b59','201811','NUI',14),('b59','201811','REP',18),('b59','201812','ETP',4),('b59','201812','KM',675),('b59','201812','NUI',12),('b59','201812','REP',7),('b59','201901','ETP',13),('b59','201901','KM',904),('b59','201901','NUI',18),('b59','201901','REP',16),('b59','201902','ETP',12),('b59','201902','KM',621),('b59','201902','NUI',20),('b59','201902','REP',14),('b59','201903','ETP',9),('b59','201903','KM',468),('b59','201903','NUI',3),('b59','201903','REP',16),('b59','201904','ETP',2),('b59','201904','KM',841),('b59','201904','NUI',9),('b59','201904','REP',20),('c14','201811','ETP',7),('c14','201811','KM',684),('c14','201811','NUI',6),('c14','201811','REP',10),('c14','201812','ETP',16),('c14','201812','KM',372),('c14','201812','NUI',6),('c14','201812','REP',20),('c14','201901','ETP',4),('c14','201901','KM',947),('c14','201901','NUI',14),('c14','201901','REP',14),('c14','201902','ETP',9),('c14','201902','KM',553),('c14','201902','NUI',9),('c14','201902','REP',18),('c14','201903','ETP',11),('c14','201903','KM',736),('c14','201903','NUI',2),('c14','201903','REP',17),('c14','201904','ETP',4),('c14','201904','KM',558),('c14','201904','NUI',6),('c14','201904','REP',17),('c3','201811','ETP',20),('c3','201811','KM',959),('c3','201811','NUI',14),('c3','201811','REP',4),('c3','201812','ETP',18),('c3','201812','KM',757),('c3','201812','NUI',14),('c3','201812','REP',5),('c3','201901','ETP',10),('c3','201901','KM',508),('c3','201901','NUI',9),('c3','201901','REP',12),('c3','201902','ETP',19),('c3','201902','KM',497),('c3','201902','NUI',6),('c3','201902','REP',13),('c3','201903','ETP',10),('c3','201903','KM',499),('c3','201903','NUI',2),('c3','201903','REP',15),('c3','201904','ETP',7),('c3','201904','KM',415),('c3','201904','NUI',4),('c3','201904','REP',18),('c54','201811','ETP',12),('c54','201811','KM',503),('c54','201811','NUI',10),('c54','201811','REP',17),('c54','201812','ETP',11),('c54','201812','KM',900),('c54','201812','NUI',12),('c54','201812','REP',7),('c54','201901','ETP',18),('c54','201901','KM',612),('c54','201901','NUI',6),('c54','201901','REP',13),('c54','201902','ETP',10),('c54','201902','KM',450),('c54','201902','NUI',19),('c54','201902','REP',3),('c54','201903','ETP',4),('c54','201903','KM',429),('c54','201903','NUI',16),('c54','201903','REP',14),('c54','201904','ETP',2),('c54','201904','KM',761),('c54','201904','NUI',2),('c54','201904','REP',5);
/*!40000 ALTER TABLE `lignefraisforfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignefraishorsforfait`
--

DROP TABLE IF EXISTS `lignefraishorsforfait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lignefraishorsforfait` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `refus` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idvisiteur` (`idvisiteur`,`mois`),
  CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idvisiteur`, `mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`)
) ENGINE=InnoDB AUTO_INCREMENT=13155 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignefraishorsforfait`
--

LOCK TABLES `lignefraishorsforfait` WRITE;
/*!40000 ALTER TABLE `lignefraishorsforfait` DISABLE KEYS */;
INSERT INTO `lignefraishorsforfait` VALUES (12870,'1','201811','Rémunération intervenant/spécialiste','2018-11-01',1153.00,0),(12871,'1','201811','REFUSE : Voyage SNCF','2018-11-23',91.00,1),(12872,'1','201812','REFUSE : Frais vestimentaire/représentation','2018-12-10',445.00,1),(12873,'1','201812','REFUSE : Taxi','2018-12-03',39.00,1),(12874,'1','201812','Location salle conférence','2018-12-19',146.00,0),(12875,'1','201812','Rémunération intervenant/spécialiste','2018-12-26',778.00,0),(12876,'1','201901','REFUSE : Location salle conférence','2019-01-04',632.00,1),(12877,'1','201901','Frais vestimentaire/représentation','2019-01-17',362.00,0),(12878,'1','201901','REFUSE : Rémunération intervenant/spécialiste','2019-01-26',840.00,1),(12879,'1','201902','REFUSE : Rémunération intervenant/spécialiste','2019-02-01',817.00,1),(12880,'1','201902','REFUSE : Achat de matériel de papèterie','2019-02-13',49.00,1),(12881,'1','201902','Taxi','2019-02-06',59.00,0),(12882,'1','201902','Voyage SNCF','2019-02-19',66.00,0),(12883,'1','201903','REFUSE : Location véhicule','2019-03-12',113.00,1),(12884,'1','201903','Taxi','2019-03-21',78.00,0),(12885,'1','201903','Location équipement vidéo/sonore','2019-03-16',512.00,0),(12886,'1','201903','Rémunération intervenant/spécialiste','2019-03-08',1147.00,0),(12887,'1','201904','REFUSE : Location équipement vidéo/sonore','2019-04-26',253.00,1),(12888,'1','201904','REFUSE : Location salle conférence','2019-04-08',306.00,1),(12889,'1','201904','Location véhicule','2019-04-21',372.00,0),(12890,'1','201904','REFUSE : Location salle conférence','2019-04-13',186.00,1),(12891,'a131','201811','REFUSE : Repas avec praticien','2018-11-06',34.00,1),(12892,'a131','201811','Achat de matériel de papèterie','2018-11-15',25.00,0),(12893,'a131','201811','REFUSE : Traiteur, alimentation, boisson','2018-11-11',321.00,1),(12894,'a131','201812','REFUSE : Achat de matériel de papèterie','2018-12-28',20.00,1),(12895,'a131','201812','Achat de matériel de papèterie','2018-12-17',25.00,0),(12896,'a131','201901','Voyage SNCF','2019-01-08',140.00,0),(12897,'a131','201902','REFUSE : Achat de matériel de papèterie','2019-02-02',47.00,1),(12898,'a131','201902','Traiteur, alimentation, boisson','2019-02-23',389.00,0),(12899,'a131','201903','REFUSE : Taxi','2019-03-19',25.00,1),(12900,'a131','201903','Location équipement vidéo/sonore','2019-03-01',679.00,0),(12901,'a131','201903','REFUSE : Location équipement vidéo/sonore','2019-03-02',133.00,1),(12902,'a131','201904','REFUSE : Taxi','2019-04-20',73.00,1),(12903,'a131','201904','REFUSE : Location salle conférence','2019-04-19',502.00,1),(12904,'a131','201904','Location salle conférence','2019-04-14',486.00,0),(12905,'a131','201904','Repas avec praticien','2019-04-17',40.00,0),(12906,'a131','201904','REFUSE : Location équipement vidéo/sonore','2019-04-10',689.00,1),(12907,'a131','201904','REFUSE : Location équipement vidéo/sonore','2019-04-03',658.00,1),(12908,'a17','201811','Taxi','2018-11-13',33.00,0),(12909,'a17','201812','REFUSE : Location véhicule','2018-12-21',273.00,1),(12910,'a17','201812','REFUSE : Rémunération intervenant/spécialiste','2018-12-21',253.00,1),(12911,'a17','201812','Frais vestimentaire/représentation','2018-12-06',337.00,0),(12912,'a17','201812','REFUSE : Taxi','2018-12-01',58.00,1),(12913,'a17','201812','Location équipement vidéo/sonore','2018-12-02',225.00,0),(12914,'a17','201812','REFUSE : Location salle conférence','2018-12-03',596.00,1),(12915,'a17','201901','Traiteur, alimentation, boisson','2019-01-11',102.00,0),(12916,'a17','201901','Taxi','2019-01-03',54.00,0),(12917,'a17','201901','Location équipement vidéo/sonore','2019-01-07',739.00,0),(12918,'a17','201902','REFUSE : Rémunération intervenant/spécialiste','2019-02-12',1198.00,1),(12919,'a17','201902','Achat de matériel de papèterie','2019-02-04',15.00,0),(12920,'a17','201902','Location véhicule','2019-02-18',340.00,0),(12921,'a17','201902','REFUSE : Traiteur, alimentation, boisson','2019-02-17',116.00,1),(12922,'a17','201903','Voyage SNCF','2019-03-15',90.00,0),(12923,'a17','201903','Frais vestimentaire/représentation','2019-03-24',49.00,0),(12924,'a17','201903','Location véhicule','2019-03-14',263.00,0),(12925,'a17','201903','Traiteur, alimentation, boisson','2019-03-10',95.00,0),(12926,'a17','201903','Repas avec praticien','2019-03-16',49.00,0),(12927,'a17','201903','REFUSE : Traiteur, alimentation, boisson','2019-03-12',227.00,1),(12928,'a17','201904','REFUSE : Repas avec praticien','2019-04-08',31.00,1),(12929,'a55','201811','Repas avec praticien','2018-11-23',42.00,0),(12930,'a55','201812','Location véhicule','2018-12-05',351.00,0),(12931,'a55','201812','REFUSE : Voyage SNCF','2018-12-27',124.00,1),(12932,'a55','201812','Location équipement vidéo/sonore','2018-12-11',455.00,0),(12933,'a55','201901','REFUSE : Traiteur, alimentation, boisson','2019-01-01',148.00,1),(12934,'a55','201901','REFUSE : Location équipement vidéo/sonore','2019-01-22',548.00,1),(12935,'a55','201901','Rémunération intervenant/spécialiste','2019-01-20',486.00,0),(12936,'a55','201901','Voyage SNCF','2019-01-01',137.00,0),(12937,'a55','201901','Location véhicule','2019-01-12',246.00,0),(12938,'a55','201902','REFUSE : Rémunération intervenant/spécialiste','2019-02-19',735.00,1),(12939,'a55','201903','Traiteur, alimentation, boisson','2019-03-14',137.00,0),(12940,'a55','201903','Location véhicule','2019-03-05',427.00,0),(12941,'a55','201904','REFUSE : Frais vestimentaire/représentation','2019-04-20',344.00,1),(12942,'a55','201904','Location véhicule','2019-04-16',92.00,0),(12943,'a55','201904','Location salle conférence','2019-04-07',547.00,0),(12944,'a93','201811','REFUSE : Voyage SNCF','2018-11-24',104.00,1),(12945,'a93','201811','REFUSE : Rémunération intervenant/spécialiste','2018-11-26',274.00,1),(12946,'a93','201811','REFUSE : Achat de matériel de papèterie','2018-11-06',20.00,1),(12947,'a93','201811','REFUSE : Achat de matériel de papèterie','2018-11-13',20.00,1),(12948,'a93','201812','REFUSE : Repas avec praticien','2018-12-26',34.00,1),(12949,'a93','201901','Taxi','2019-01-09',72.00,0),(12950,'a93','201901','REFUSE : Voyage SNCF','2019-01-21',129.00,1),(12951,'a93','201901','Location salle conférence','2019-01-13',633.00,0),(12952,'a93','201901','REFUSE : Location salle conférence','2019-01-05',503.00,1),(12953,'a93','201901','Location équipement vidéo/sonore','2019-01-24',239.00,0),(12954,'a93','201902','Location véhicule','2019-02-09',368.00,0),(12955,'a93','201902','REFUSE : Voyage SNCF','2019-02-24',114.00,1),(12956,'a93','201903','REFUSE : Achat de matériel de papèterie','2019-03-04',40.00,1),(12957,'a93','201903','Traiteur, alimentation, boisson','2019-03-02',49.00,0),(12958,'a93','201903','Taxi','2019-03-28',25.00,0),(12959,'a93','201904','REFUSE : Location salle conférence','2019-04-26',299.00,1),(12960,'a93','201904','Frais vestimentaire/représentation','2019-04-08',166.00,0),(12961,'a93','201904','REFUSE : Location véhicule','2019-04-28',68.00,1),(12962,'a93','201904','REFUSE : Achat de matériel de papèterie','2019-04-10',24.00,1),(12964,'b13','201811','REFUSE : Traiteur, alimentation, boisson','2018-11-15',380.00,1),(12965,'b13','201811','REFUSE : Frais vestimentaire/représentation','2018-11-12',297.00,1),(12966,'b13','201812','Location salle conférence','2018-12-08',570.00,0),(12967,'b13','201901','REFUSE : Frais vestimentaire/représentation','2019-01-24',49.00,1),(12968,'b13','201901','Location équipement vidéo/sonore','2019-01-11',623.00,0),(12969,'b13','201902','Frais vestimentaire/représentation','2019-02-20',252.00,0),(12970,'b13','201902','REFUSE : Location équipement vidéo/sonore','2019-02-25',794.00,1),(12971,'b13','201902','REFUSE : Traiteur, alimentation, boisson','2019-02-13',178.00,1),(12972,'b13','201903','REFUSE : Repas avec praticien','2019-03-14',44.00,1),(12973,'b13','201903','Location équipement vidéo/sonore','2019-03-27',310.00,0),(12974,'b13','201903','Location équipement vidéo/sonore','2019-03-12',801.00,0),(12975,'b13','201903','REFUSE : Rémunération intervenant/spécialiste','2019-03-08',358.00,1),(12976,'b13','201903','Voyage SNCF','2019-03-25',126.00,0),(12977,'b13','201903','Location salle conférence','2019-03-26',440.00,0),(12978,'b13','201904','Location véhicule','2019-04-23',366.00,0),(12979,'b16','201811','REFUSE : Frais vestimentaire/représentation','2018-11-18',438.00,1),(12980,'b16','201811','Achat de matériel de papèterie','2018-11-28',35.00,0),(12981,'b16','201812','Voyage SNCF','2018-12-10',30.00,0),(12982,'b16','201812','Rémunération intervenant/spécialiste','2018-12-01',485.00,0),(12983,'b16','201901','REFUSE : Location véhicule','2019-01-02',234.00,1),(12984,'b16','201901','REFUSE : Achat de matériel de papèterie','2019-01-08',46.00,1),(12985,'b16','201901','Taxi','2019-01-09',71.00,0),(12986,'b16','201902','Achat de matériel de papèterie','2019-02-26',32.00,0),(12987,'b16','201902','Achat de matériel de papèterie','2019-02-16',10.00,0),(12988,'b16','201902','REFUSE : Traiteur, alimentation, boisson','2019-02-08',246.00,1),(12989,'b16','201902','REFUSE : Location équipement vidéo/sonore','2019-02-16',139.00,1),(12990,'b16','201902','REFUSE : Traiteur, alimentation, boisson','2019-02-18',235.00,1),(12991,'b16','201903','Traiteur, alimentation, boisson','2019-03-12',417.00,0),(12992,'b16','201903','Achat de matériel de papèterie','2019-03-05',29.00,0),(12993,'b16','201903','Frais vestimentaire/représentation','2019-03-28',139.00,0),(12994,'b16','201903','REFUSE : Repas avec praticien','2019-03-23',50.00,1),(12995,'b16','201904','Voyage SNCF','2019-04-07',35.00,0),(12996,'b16','201904','REFUSE : Frais vestimentaire/représenta','2019-04-28',321.00,1),(12997,'b16','201904','REFUSE : Frais vestimentaire/représentation','2019-04-28',104.00,1),(12998,'b16','201904','REFUSE : Location véhicule','2019-04-10',316.00,1),(12999,'b16','201904','REFUSE : Voyage SNCF','2019-04-13',60.00,1),(13000,'b19','201811','REFUSE : Traiteur, alimentation, boisson','2018-11-06',367.00,1),(13001,'b19','201811','Taxi','2018-11-04',30.00,0),(13002,'b19','201811','REFUSE : Location salle conférence','2018-11-26',273.00,1),(13003,'b19','201812','Achat de matériel de papèterie','2018-12-03',38.00,0),(13004,'b19','201901','Location équipement vidéo/sonore','2019-01-19',487.00,0),(13005,'b19','201901','REFUSE : Location équipement vidéo/sonore','2019-01-27',116.00,1),(13006,'b19','201901','REFUSE : Voyage SNCF','2019-01-10',131.00,1),(13007,'b19','201901','Location salle conférence','2019-01-10',280.00,0),(13008,'b19','201902','Frais vestimentaire/représentation','2019-02-28',229.00,0),(13009,'b19','201902','Location salle conférence','2019-02-03',476.00,0),(13010,'b19','201902','REFUSE : Frais vestimentaire/représentation','2019-02-04',87.00,1),(13011,'b19','201902','REFUSE : Location équipement vidéo/sonore','2019-02-12',463.00,1),(13012,'b19','201903','Taxi','2019-03-13',23.00,0),(13013,'b19','201903','Rémunération intervenant/spécialiste','2019-03-25',316.00,0),(13014,'b19','201903','REFUSE : Achat de matériel de papèterie','2019-03-04',28.00,1),(13015,'b19','201904','REFUSE : Taxi','2019-04-18',65.00,1),(13016,'b19','201904','REFUSE : Repas avec praticien','2019-04-15',43.00,1),(13017,'b19','201904','Achat de matériel de papèterie','2019-04-14',15.00,0),(13018,'b19','201904','REFUSE : Taxi','2019-04-20',50.00,1),(13019,'b25','201811','Frais vestimentaire/représentation','2018-11-23',433.00,0),(13020,'b25','201811','Achat de matériel de papèterie','2018-11-26',24.00,0),(13021,'b25','201812','REFUSE : Location véhicule','2018-12-16',188.00,1),(13022,'b25','201901','Voyage SNCF','2019-01-20',91.00,0),(13023,'b25','201901','Location salle conférence','2019-01-20',310.00,0),(13024,'b25','201901','Achat de matériel de papèterie','2019-01-11',41.00,0),(13025,'b25','201903','REFUSE : Voyage SNCF','2019-03-25',63.00,1),(13026,'b25','201903','Voyage SNCF','2019-03-12',128.00,0),(13027,'b25','201904','REFUSE : Rémunération intervenant/spécialiste','2019-04-25',1068.00,1),(13028,'b25','201904','REFUSE : Frais vestimentaire/représentation','2019-04-20',167.00,1),(13029,'b25','201904','REFUSE : Repas avec praticien','2019-04-07',50.00,1),(13030,'b25','201904','Voyage SNCF','2019-04-03',141.00,0),(13031,'b25','201904','Voyage SNCF','2019-04-08',141.00,0),(13032,'b28','201811','REFUSE : Voyage SNCF','2018-11-20',110.00,1),(13033,'b28','201812','REFUSE : Location équipement vidéo/sonore','2018-12-13',209.00,1),(13034,'b28','201812','Frais vestimentaire/représentation','2018-12-11',274.00,0),(13035,'b28','201812','REFUSE : Voyage SNCF','2018-12-14',74.00,1),(13036,'b28','201812','Repas avec praticien','2018-12-04',47.00,0),(13037,'b28','201812','Rémunération intervenant/spécialiste','2018-12-17',945.00,0),(13038,'b28','201901','REFUSE : Frais vestimentaire/représentation','2019-01-11',144.00,1),(13039,'b28','201901','REFUSE : Taxi','2019-01-04',77.00,1),(13040,'b28','201902','REFUSE : Location véhicule','2019-02-14',291.00,1),(13041,'b28','201902','REFUSE : Repas avec praticien','2019-02-28',40.00,1),(13042,'b28','201902','REFUSE : Location véhicule','2019-02-26',270.00,1),(13043,'b28','201902','Frais vestimentaire/représentation','2019-02-06',41.00,0),(13044,'b28','201902','Traiteur, alimentation, boisson','2019-02-19',243.00,0),(13045,'b28','201902','REFUSE : Achat de matériel de papèterie','2019-02-05',34.00,1),(13046,'b28','201903','Location véhicule','2019-03-03',39.00,0),(13047,'b28','201903','REFUSE : Traiteur, alimentation, boisson','2019-03-10',394.00,1),(13048,'b28','201903','REFUSE : Taxi','2019-03-11',78.00,1),(13049,'b28','201903','REFUSE : Rémunération intervenant/spécialiste','2019-03-14',534.00,1),(13050,'b28','201903','Location équipement vidéo/sonore','2019-03-24',811.00,0),(13051,'b28','201903','Voyage SNCF','2019-03-11',139.00,0),(13052,'b28','201904','Achat de matériel de papèterie','2019-04-12',36.00,0),(13053,'b28','201904','REFUSE : Voyage SNCF','2019-04-12',39.00,1),(13054,'b28','201904','Location salle conférence','2019-04-22',147.00,0),(13055,'b28','201904','Rémunération intervenant/spécialiste','2019-04-08',702.00,0),(13056,'b4','201811','REFUSE : Rémunération intervenant/spécialiste','2018-11-19',495.00,1),(13057,'b4','201811','Voyage SNCF','2018-11-24',136.00,0),(13058,'b4','201811','REFUSE : Rémunération intervenant/spécialiste','2018-11-11',397.00,1),(13059,'b4','201812','REFUSE : Location véhicule','2018-12-01',133.00,1),(13060,'b4','201812','REFUSE : Rémunération intervenant/spécialiste','2018-12-10',1045.00,1),(13061,'b4','201812','Rémunération intervenant/spécialiste','2018-12-11',511.00,0),(13062,'b4','201812','Location salle conférence','2018-12-14',207.00,0),(13063,'b4','201901','REFUSE : Frais vestimentaire/représentation','2019-01-27',201.00,1),(13064,'b4','201902','Frais vestimentaire/représentation','2019-02-25',185.00,0),(13065,'b4','201902','REFUSE : Achat de matériel de papèterie','2019-02-15',23.00,1),(13066,'b4','201902','Location salle conférence','2019-02-27',531.00,0),(13067,'b4','201903','REFUSE : Voyage SNCF','2019-03-26',97.00,1),(13068,'b4','201903','REFUSE : Frais vestimentaire/représentation','2019-03-09',234.00,1),(13069,'b4','201903','REFUSE : Traiteur, alimentation, boisson','2019-03-16',274.00,1),(13070,'b4','201903','REFUSE : Rémunération intervenant/spécialiste','2019-03-18',892.00,1),(13071,'b4','201904','REFUSE : Rémunération intervenant/spécialiste','2019-04-22',539.00,1),(13072,'b50','201811','Repas avec praticien','2018-11-20',31.00,0),(13073,'b50','201811','REFUSE : Traiteur, alimentation, boisson','2018-11-09',434.00,1),(13074,'b50','201811','Achat de matériel de papèterie','2018-11-05',20.00,0),(13075,'b50','201812','Location salle conférence','2018-12-01',296.00,0),(13076,'b50','201812','Repas avec praticien','2018-12-18',38.00,0),(13077,'b50','201901','REFUSE : Achat de matériel de papèterie','2019-01-02',18.00,1),(13078,'b50','201901','Repas avec praticien','2019-01-14',41.00,0),(13079,'b50','201902','Taxi','2019-02-19',55.00,0),(13080,'b50','201903','Rémunération intervenant/spécialiste','2019-03-18',1101.00,0),(13081,'b50','201903','REFUSE : Achat de matériel de papèterie','2019-03-21',12.00,1),(13082,'b50','201903','Achat de matériel de papèterie','2019-03-16',29.00,0),(13083,'b50','201903','Voyage SNCF','2019-03-16',79.00,0),(13084,'b50','201903','REFUSE : Taxi','2019-03-03',38.00,1),(13085,'b50','201904','REFUSE : Repas avec praticien','2019-04-06',41.00,1),(13086,'b59','201811','Location salle conférence','2018-11-13',519.00,0),(13087,'b59','201811','REFUSE : Achat de matériel de papèterie','2018-11-15',23.00,1),(13088,'b59','201811','REFUSE : Frais vestimentaire/représentation','2018-11-14',61.00,1),(13089,'b59','201811','Rémunération intervenant/spécialiste','2018-11-15',447.00,0),(13090,'b59','201812','REFUSE : Achat de matériel de papèterie','2018-12-22',37.00,1),(13091,'b59','201901','REFUSE : Achat de matériel de papèterie','2019-01-14',28.00,1),(13092,'b59','201902','Achat de matériel de papèterie','2019-02-13',27.00,0),(13093,'b59','201902','Frais vestimentaire/représentation','2019-02-06',33.00,0),(13094,'b59','201902','REFUSE : Rémunération intervenant/spécialiste','2019-02-02',558.00,1),(13095,'b59','201902','REFUSE : Traiteur, alimentation, boisson','2019-02-23',74.00,1),(13096,'b59','201902','Frais vestimentaire/représentation','2019-02-24',152.00,0),(13097,'b59','201903','REFUSE : Traiteur, alimentation, boisson','2019-03-18',47.00,1),(13098,'b59','201903','REFUSE : Repas avec praticien','2019-03-09',40.00,1),(13099,'b59','201903','Location équipement vidéo/sonore','2019-03-07',720.00,0),(13100,'b59','201904','REFUSE : Location équipement vidéo/sonore','2019-04-07',149.00,1),(13101,'c14','201811','REFUSE : Achat de matériel de papèterie','2018-11-16',13.00,1),(13102,'c14','201812','Achat de matériel de papèterie','2018-12-11',28.00,0),(13103,'c14','201901','Location salle conférence','2019-01-28',409.00,0),(13104,'c14','201902','Frais vestimentaire/représentation','2019-02-01',370.00,0),(13105,'c14','201903','Location salle conférence','2019-03-09',451.00,0),(13106,'c14','201903','Traiteur, alimentation, boisson','2019-03-04',346.00,0),(13107,'c14','201904','REFUSE : Traiteur, alimentation, boisson','2019-04-26',229.00,1),(13108,'c14','201904','REFUSE : Location équipement vidéo/sonore','2019-04-01',670.00,1),(13109,'c3','201811','Rémunération intervenant/spécialiste','2018-11-28',429.00,0),(13110,'c3','201811','REFUSE : Frais vestimentaire/représentation','2018-11-13',363.00,1),(13111,'c3','201811','REFUSE : Rémunération intervenant/spécialiste','2018-11-06',788.00,1),(13112,'c3','201811','REFUSE : Rémunération intervenant/spécialiste','2018-11-07',309.00,1),(13113,'c3','201811','REFUSE : Location équipement vidéo/sonore','2018-11-11',511.00,1),(13114,'c3','201811','Rémunération intervenant/spécialiste','2018-11-17',596.00,0),(13115,'c3','201812','REFUSE : Taxi','2018-12-08',78.00,1),(13116,'c3','201812','Location équipement vidéo/sonore','2018-12-17',109.00,0),(13117,'c3','201812','Repas avec praticien','2018-12-04',38.00,0),(13118,'c3','201812','Taxi','2018-12-09',70.00,0),(13119,'c3','201901','Location salle conférence','2019-01-01',162.00,0),(13120,'c3','201901','REFUSE : Traiteur, alimentation, boisson','2019-01-23',420.00,1),(13121,'c3','201901','Rémunération intervenant/spécialiste','2019-01-04',535.00,0),(13122,'c3','201901','Location équipement vidéo/sonore','2019-01-25',731.00,0),(13123,'c3','201901','Achat de matériel de papèterie','2019-01-02',24.00,0),(13124,'c3','201902','Voyage SNCF','2019-02-09',148.00,0),(13125,'c3','201902','Traiteur, alimentation, boisson','2019-02-16',229.00,0),(13126,'c3','201902','Traiteur, alimentation, boisson','2019-02-02',165.00,0),(13127,'c3','201903','Taxi','2019-03-19',47.00,0),(13128,'c3','201904','Frais vestimentaire/représentation','2019-04-25',35.00,0),(13129,'c3','201904','Repas avec praticien','2019-04-01',43.00,0),(13130,'c3','201904','Taxi','2019-04-12',53.00,0),(13131,'c3','201904','REFUSE : Frais vestimentaire/représentation','2019-04-11',133.00,1),(13132,'c3','201904','Repas avec praticien','2019-04-04',46.00,0),(13133,'c3','201904','Location salle conférence','2019-04-11',167.00,0),(13134,'c54','201811','Traiteur, alimentation, boisson','2018-11-08',367.00,0),(13135,'c54','201811','REFUSE : Traiteur, alimentation, boisson','2018-11-01',265.00,1),(13136,'c54','201811','Repas avec praticien','2018-11-18',30.00,0),(13137,'c54','201812','Rémunération intervenant/spécialiste','2018-12-18',909.00,0),(13138,'c54','201812','REFUSE : Frais vestimentaire/représentation','2018-12-04',249.00,1),(13139,'c54','201812','Taxi','2018-12-24',38.00,0),(13140,'c54','201812','Repas avec praticien','2018-12-08',44.00,0),(13141,'c54','201812','Location équipement vidéo/sonore','2018-12-09',229.00,0),(13142,'c54','201901','REFUSE : Taxi','2019-01-28',51.00,1),(13143,'c54','201901','REFUSE : Rémunération intervenant/spécialiste','2019-01-15',473.00,1),(13144,'c54','201902','REFUSE : Location équipement vidéo/sonore','2019-02-25',815.00,1),(13145,'c54','201902','Taxi','2019-02-22',76.00,0),(13146,'c54','201903','REFUSE : Taxi','2019-03-03',39.00,1),(13147,'c54','201903','Frais vestimentaire/représentation','2019-03-15',441.00,0),(13148,'c54','201903','REFUSE : Repas avec praticien','2019-03-25',30.00,1),(13149,'c54','201903','REFUSE : Repas avec praticien','2019-03-26',38.00,1),(13150,'c54','201903','REFUSE : Location véhicule','2019-03-15',265.00,1),(13151,'c54','201903','Traiteur, alimentation, boisson','2019-03-22',373.00,0),(13152,'c54','201904','REFUSE : Location équipement vidéo/sonore','2019-04-21',354.00,1),(13153,'a93','201905','Location équipement vidéo/sonore','2019-04-13',240.00,0),(13154,'1','201905','TOURISME','2019-05-21',200.00,0);
/*!40000 ALTER TABLE `lignefraishorsforfait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicule` (
  `id` varchar(255) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `montant` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicule`
--

LOCK TABLES `vehicule` WRITE;
/*!40000 ALTER TABLE `vehicule` DISABLE KEYS */;
INSERT INTO `vehicule` VALUES ('4CVD','4CV Diesel',0.52),('4CVE','4CV Essence',0.62),('5/6CVD','5/6CV Diesel',0.58),('5/6CVE','5/6CV Essence',0.67);
/*!40000 ALTER TABLE `vehicule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visiteur`
--

DROP TABLE IF EXISTS `visiteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` varchar(255) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateembauche` date DEFAULT NULL,
  `typevehicule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typevehicule` (`typevehicule`),
  CONSTRAINT `typevehicule` FOREIGN KEY (`typevehicule`) REFERENCES `vehicule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visiteur`
--

LOCK TABLES `visiteur` WRITE;
/*!40000 ALTER TABLE `visiteur` DISABLE KEYS */;
INSERT INTO `visiteur` VALUES ('1','adminV','admin','adminV','$2y$10$nShARmzUlGInDjfL2b4P6.GzqeMNPOOghXmg/GIjWhOeeJLle3vcK','23 rue du parapluie','46000','Cahors','2018-10-10','5/6CVD'),('a131','Villechalane','Louis','lvillachane','$2y$10$uddNWdomg51PMDZcaW7HkeCpJf67AxgsyOvyrUNePrlrKXU7HHUYi','8 rue des Charmes','46000','Cahors','2005-12-21','5/6CVD'),('a17','Andre','David','dandre','$2y$10$mjtTAWPkBlcABnD8kWmmfuxCDAxpCLRl3gr2NQQvbaoMikKXZxNXO','1 rue Petit','46200','Lalbenque','1998-11-23','5/6CVE'),('a55','Bedos','Christian','cbedos','$2y$10$wv9yPBZazpqsiboNqMuYSusIof.MopW827JzLEX.qgCB.VnPI7bEq','1 rue Peranud','46250','Montcuq','1995-01-12','5/6CVE'),('a93','Tusseau','Louis','ltusseau','$2y$10$/sV1UYgj3v2hf8yElJ0lZOvSF2JMBsIUkGc/22F.FxzxZEJQOY7Ky','22 rue des Ternes','46123','Gramat','2000-05-01','4CVE'),('b13','Bentot','Pascal','pbentot','$2y$10$I68VqBgzK6L3aODgY8hi/eXc/DSw/1RgRrLd3wf06shxKlWdX1D6y','11 allée des Cerises','46512','Bessines','1992-07-09','4CVE'),('b16','Bioret','Luc','lbioret','$2y$10$Rg11a77hwPP47He1S2jHduut89Hczdr3ReawOVYQeF/Y2f7DkJKFy','1 Avenue gambetta','46000','Cahors','1998-05-11','5/6CVD'),('b19','Bunisset','Francis','fbunisset','$2y$10$TqAzRsHcWVnv.3Eu.XKL2.lk.48X.6Ne3MkE5dAHn6b5E4z6qcwF2','10 rue des Perles','93100','Montreuil','1987-10-21','4CVD'),('b25','Bunisset','Denise','dbunisset','$2y$10$p0esBLz0TuRU3PifAQK8KeRUqJ3SUqptwuilZK8G83M.E1LErPYwW','23 rue Manin','75019','paris','2010-12-05','5/6CVE'),('b28','Cacheux','Bernard','bcacheux','$2y$10$EDmI1apDxs7lJv3uaNLP/uG1wXP.pw6u7Tt4Yp8CxsxY9sCZ5iRwG','114 rue Blanche','75017','Paris','2009-11-12','5/6CVD'),('b34','Cadic','Eric','ecadic','$2y$10$hlJE8W/Xc1Nsu7XbbQHRE.57xNqGKM9tlgQI6TT10SFLdlFZE0UMq','123 avenue de la République','75011','Paris','2008-09-23',NULL),('b4','Charoze','Catherine','ccharoze','$2y$10$IRQjKqG9DV8q2hK14E6JfuAzfFQE/GYfNdjDrSN5kBntpqioc2UpS','100 rue Petit','75019','Paris','2005-11-12','4CVE'),('b50','Clepkens','Christophe','cclepkens','$2y$10$W8Amtm1z/K5b6csCY8V7buxeDI2PCj5ife2G8aJlDaRRf2XZtLF4m','12 allée des Anges','93230','Romainville','2003-08-11','4CVD'),('b59','Cottin','Vincenne','vcottin','$2y$10$GASbZaILlBjvBfAmLbvNBef4Q0QTCzagxHeah7Z4OhrCaFzu/S3Z2','36 rue Des Roches','93100','Monteuil','2001-11-18','4CVE'),('c14','Daburon','François','fdaburon','$2y$10$UvBvKsQA2EPV5jlJm6ijXO2qLzd8wykiBkz2j9UWyc3nafhejfJlG','13 rue de Chanzy','94000','Créteil','2002-02-11','5/6CVD'),('c3','De','Philippe','pde','$2y$10$umqkM3bzNadKTacXvPH7t.ie1giVU9yDVItkbdT7.vuUERkpFTnnG','13 rue Barthes','94000','Créteil','2010-12-14','4CVD'),('c54','Debelle','Michel','mdebelle','$2y$10$dwVae0f6C3rzt4bgwfSy6OkktYemurb6DH5CFO0MgkU/.9U4Vzd8S','181 avenue Barbusse','93210','Rosny','2006-11-23','5/6CVD'),('d13','Debelle','Jeanne','jdebelle','$2y$10$ndY.n1HXgP/L3kM4ScXLM.rgZfCvaSTdG5mlbpTqj8tzNSItWJpFK','134 allée des Joncs','44000','Nantes','2000-05-11',NULL),('d51','Debroise','Michel','mdebroise','$2y$10$vlwfAdRWhq4FhX/DEUuyvO0O..rJbR1nDuQ7vu8zeFvwKizMHb5iO','2 Bld Jourdain','44000','Nantes','2001-04-17',NULL),('e22','Desmarquest','Nathalie','ndesmarquest','$2y$10$5RODlL1VDx4/b4l5Lh2xxejPmidRhYy/cSPgWiqUPpDdXD37EW.0G','14 Place d Arc','45000','Orléans','2005-11-12',NULL),('e24','Desnost','Pierre','pdesnost','$2y$10$lZRPa0Jh5VPKbwYgzx.t/uLb2HqNScNv.tZijh.8k3TUoXJENurEO','16 avenue des Cèdres','23200','Guéret','2001-02-05',NULL),('e39','Dudouit','Frédéric','fdudouit','$2y$10$wYUtE6eEnn1MdqltclHiX.Bdqa9FvFmjv27241J4zpQWX2hSIg/Hy','18 rue de l église','23120','GrandBourg','2000-08-01',NULL),('e49','Duncombe','Claude','cduncombe','$2y$10$IzEf4XLCUyo5cjWFFT0aBuKrcs5UP1wCcZzDvnY9ZoZU.an2RsF4i','19 rue de la tour','23100','La souteraine','1987-10-10',NULL),('e5','Enault-Pascreau','Céline','cenault','$2y$10$CIt5xIinrOulqg6xSlc8OeZdY1JcuRiwTbIi.NKo9Xx4GSFCa00uO','25 place de la gare','23200','Gueret','1995-09-01',NULL),('e52','Eynde','Valérie','veynde','$2y$10$gmpwENUA04dEx9wVntIBhO5NdFiGbDX2RNTMKsf4wUZe12IyJ4Z4.','3 Grand Place','13015','Marseille','1999-11-01',NULL),('f21','Finck','Jacques','jfinck','$2y$10$bEVFPAMSRnf91.jcQ0y8quJVwF8BjuBD939aJ38N.ZTDLuZCqcyFq','10 avenue du Prado','13002','Marseille','2001-11-10',NULL),('f39','Frémont','Fernande','ffremont','$2y$10$IqI99FN1oPWnh.lO8Hobz.fCjOkCbAsMqVI9iF6W81DSVV4s8mBtO','4 route de la mer','13012','Allauh','1998-10-01',NULL),('f4','Gest','Alain','agest','$2y$10$6t4XBPajUGM0TVbSGnZIOu/ngSv4uXMB.IwnKViVxl/F2gJibqaTW','30 avenue de la mer','13025','Berre','1985-11-01',NULL);
/*!40000 ALTER TABLE `visiteur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14 19:14:30

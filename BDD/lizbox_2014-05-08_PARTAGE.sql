# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 127.0.0.1 (MySQL 5.6.14)
# Base de données: lizbox
# Temps de génération: 2014-05-08 16:14:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `ID` varchar(200) NOT NULL,
  `nom` varchar(500) NOT NULL,
  `extension` varchar(200) NOT NULL,
  `user` int(11) NOT NULL,
  `dossierparent` varchar(200) NOT NULL,
  `typefichier` varchar(200) NOT NULL,
  `estfichier` tinyint(1) NOT NULL,
  `creation` datetime NOT NULL,
  `modification` datetime NOT NULL,
  `taille` int(20) NOT NULL,
  `partagePublic` tinyint(1) DEFAULT NULL,
  `partagePrivee` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;

INSERT INTO `document` (`ID`, `nom`, `extension`, `user`, `dossierparent`, `typefichier`, `estfichier`, `creation`, `modification`, `taille`, `partagePublic`, `partagePrivee`)
VALUES
	('c','fichier3','txt',3,'','texte',1,'2014-02-12 00:00:00','2014-02-15 00:00:00',400,NULL,NULL),
	('f896816b-62ef-48aa-a0e7-be374184f224','kontm','jpg',2,'','onsenfoupourlemoment',1,'2014-05-08 15:53:09','2014-05-08 15:53:09',137449,NULL,NULL),
	('d','etage2','',2,'e','dossier',0,'2014-02-15 00:00:00','2014-02-15 00:00:00',0,NULL,NULL),
	('bcb719e9-41a8-4498-82de-4bdd8044cff1','cinemamatrix_006','jpg',2,'e','onsenfoupourlemoment',1,'2014-05-08 15:53:28','2014-05-08 15:53:32',77767,NULL,NULL),
	('792c79a6-32c3-482b-9e07-1284b29faba1','templates','sql',2,'','application/octet-stream',1,'2014-05-08 18:06:45','2014-05-08 18:06:45',1122,NULL,NULL),
	('bbd111aa-e2dd-4563-a549-32db6f71446f','cinemamatrix_006','jpg',2,'','image/jpeg',1,'2014-05-08 16:53:34','2014-05-08 16:53:34',77767,NULL,NULL),
	('58873d2f-6727-4634-ab49-ccc0d6c243cc','ln','tiff',2,'','image/tiff',1,'2014-05-08 16:53:48','2014-05-08 16:53:48',109932,NULL,NULL),
	('e','etage1','',2,'','dossier',0,'2014-02-15 00:00:00','2014-02-15 00:00:00',0,NULL,NULL),
	('d343d245-0ae9-44a6-a874-7932d940190d','Julien Doré - Paris-Seychelles','mp3',5,'','onsenfoupourlemoment',1,'2014-04-02 08:55:42','2014-04-02 08:55:42',3172468,NULL,NULL),
	('e5c5e167-6b5d-448d-884c-d01d1bcca9b9','kontm','jpg',2,'','image/jpeg',1,'2014-05-08 16:53:16','2014-05-08 16:53:16',137449,NULL,NULL),
	('ee39b908-8ca0-4d72-80dd-712c681cc8c1','test','',2,'0','dossier',0,'2014-04-26 11:39:43','2014-04-26 11:39:43',0,NULL,NULL),
	('ebda530d-57c6-4bd7-a14b-cf5673576279','test','',2,'0','dossier',0,'2014-04-26 11:37:20','2014-04-26 11:37:20',0,NULL,NULL),
	('2f5a2b90-8c61-4ddc-8817-1a898bf90433','test','',2,'0','dossier',0,'2014-04-26 11:40:01','2014-04-26 11:40:01',0,NULL,NULL),
	('4566fb39-7d79-49ec-9ffe-bbe0273fd90c','test','',2,'0','dossier',0,'2014-04-26 11:52:50','2014-04-26 11:52:50',0,NULL,NULL),
	('9815920e-ee77-42b8-85b6-0b2fdfb4ab0d','test','',2,'0','',0,'2014-04-26 11:53:25','2014-04-26 11:53:25',0,NULL,NULL),
	('e81bf76d-35cd-4358-aed5-9e05191e5864','test','',2,'0','',0,'2014-04-26 11:53:31','2014-04-26 11:53:31',0,NULL,NULL),
	('1f2206b9-4210-4879-a2e8-0a1ddb84a20e','test','',2,'0','',0,'2014-04-26 11:55:06','2014-04-26 11:55:06',0,NULL,NULL),
	('d997b925-adf5-42df-803b-a345ce8d4e0b','coucou','',2,'','dossier',0,'2014-05-08 17:29:12','2014-05-08 17:29:12',0,NULL,NULL),
	('5f801aa5-d157-4931-aab6-b16213b829a5','pacito','',2,'','dossier',0,'2014-05-08 17:15:23','2014-05-08 17:15:23',0,NULL,NULL);

/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur` int(11) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `lecture` datetime NOT NULL,
  `document` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;

INSERT INTO `notification` (`ID`, `utilisateur`, `type`, `date`, `lecture`, `document`)
VALUES
	(1,2,'welcome','2014-03-18 00:00:00','2014-04-07 15:17:31',''),
	(2,17,'welcome','2014-03-04 00:00:00','2014-03-24 00:00:00',''),
	(6,2,'welcome','2013-03-12 00:00:00','2014-04-07 15:57:25',''),
	(5,2,'welcome','2013-03-12 00:00:00','2014-04-07 15:58:52','');

/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table partage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `partage`;

CREATE TABLE `partage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `document` varchar(200) NOT NULL,
  `emeteur` int(11) NOT NULL,
  `recepteur` int(11) NOT NULL,
  `debut` datetime NOT NULL,
  `ecriture` tinyint(1) NOT NULL,
  `accepte` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table plan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plan`;

CREATE TABLE `plan` (
  `espace` bigint(200) NOT NULL COMMENT 'espace en bytes (octets récupérable grâce à la méthode .length() en java)',
  `prix` float NOT NULL,
  `bandepassante` varchar(50) NOT NULL,
  `duree` bigint(30) NOT NULL COMMENT 'durée en secondes',
  `nom` varchar(200) NOT NULL,
  `label` varchar(30) NOT NULL,
  `android` tinyint(1) NOT NULL,
  `desktop` tinyint(1) NOT NULL,
  PRIMARY KEY (`nom`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;

INSERT INTO `plan` (`espace`, `prix`, `bandepassante`, `duree`, `nom`, `label`, `android`, `desktop`)
VALUES
	(2147483647,0,'limitée',31557600000,'ROLE_FREE','Free',1,0),
	(536870912000,0,'optimale',0,'ROLE_ADMIN','Admin',1,1),
	(53687091200,19.99,'excelente',31557600000,'ROLE_PREMIUM','Premium',1,1),
	(536870912000,99.99,'optimale',31557600000,'ROLE_PRO','Pro',1,1);

/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table souscription
# ------------------------------------------------------------

DROP TABLE IF EXISTS `souscription`;

CREATE TABLE `souscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `debut` datetime NOT NULL,
  `recepteur` int(11) NOT NULL,
  `plan` int(11) NOT NULL,
  `fin` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `souscription` WRITE;
/*!40000 ALTER TABLE `souscription` DISABLE KEYS */;

INSERT INTO `souscription` (`ID`, `debut`, `recepteur`, `plan`, `fin`)
VALUES
	(1,'2014-01-15 00:00:00',2,1,'2014-01-31 00:00:00');

/*!40000 ALTER TABLE `souscription` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table utilisateur
# ------------------------------------------------------------

DROP TABLE IF EXISTS `utilisateur`;

CREATE TABLE `utilisateur` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `male` tinyint(1) NOT NULL,
  `pseudo` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` varchar(200) NOT NULL,
  `inscription` datetime NOT NULL,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;

INSERT INTO `utilisateur` (`ID`, `nom`, `prenom`, `male`, `pseudo`, `email`, `password`, `role`, `inscription`, `actif`)
VALUES
	(2,'toto','toto',1,'toto','spywen@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_PREMIUM','2014-01-28 00:00:00',1),
	(5,'','',0,'user','','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-02-22 00:00:00',1),
	(17,'babin','laurent',0,'spywen','spywen@hotmail.frr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_PRO','1970-01-17 03:43:53',1),
	(18,'','',0,'admin','','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_ADMIN','2014-02-20 00:00:00',1),
	(19,'','lolo',0,'','','da39a3ee5e6b4b0d3255bfef95601890afd80709','ROLE_FREE','1970-01-01 01:00:00',0),
	(20,'','toto',0,'','','da39a3ee5e6b4b0d3255bfef95601890afd80709','ROLE_FREE','1970-01-01 01:00:00',0),
	(21,'','tim',0,'tim','cma.marshall@gmail.com','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_ADMIN','0000-00-00 00:00:00',1);

/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

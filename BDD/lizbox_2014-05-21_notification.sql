# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 127.0.0.1 (MySQL 5.6.14)
# Base de données: lizbox
# Temps de génération: 2014-05-21 08:27:11 +0000
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
  `partagepublic` tinyint(1) DEFAULT NULL,
  `partageprivee` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;

INSERT INTO `document` (`ID`, `nom`, `extension`, `user`, `dossierparent`, `typefichier`, `estfichier`, `creation`, `modification`, `taille`, `partagepublic`, `partageprivee`)
VALUES
	('c','fichier3','txt',3,'','texte',1,'2014-02-12 00:00:00','2014-02-15 00:00:00',400,NULL,NULL),
	('9da49397-4c1d-4aca-8f32-d4b85b1e5d58','mondossier','',2,'','dossier',0,'2014-05-10 09:49:18','2014-05-10 09:49:18',0,1,NULL),
	('d','etage2','',2,'e','dossier',0,'2014-02-15 00:00:00','2014-02-15 00:00:00',0,NULL,NULL),
	('bcb719e9-41a8-4498-82de-4bdd8044cff1','cinemamatrix_006','jpg',2,'0','onsenfoupourlemoment',1,'2014-05-08 15:53:28','2014-05-14 12:31:24',77767,NULL,NULL),
	('792c79a6-32c3-482b-9e07-1284b29faba1','templates','sql',2,'0','application/octet-stream',1,'2014-05-08 18:06:45','2014-05-14 12:31:48',1122,NULL,NULL),
	('bbd111aa-e2dd-4563-a549-32db6f71446f','cinemamatrix_006','jpg',2,'','image/jpeg',1,'2014-05-08 16:53:34','2014-05-08 16:53:34',77767,1,1),
	('58873d2f-6727-4634-ab49-ccc0d6c243cc','ln','tiff',2,'','image/tiff',1,'2014-05-08 16:53:48','2014-05-08 16:53:48',109932,1,0),
	('e','etage1','',2,'','dossier',0,'2014-02-15 00:00:00','2014-02-15 00:00:00',0,NULL,NULL),
	('d343d245-0ae9-44a6-a874-7932d940190d','Julien Doré - Paris-Seychelles','mp3',5,'','onsenfoupourlemoment',1,'2014-04-02 08:55:42','2014-04-02 08:55:42',3172468,NULL,NULL),
	('ee39b908-8ca0-4d72-80dd-712c681cc8c1','test','',2,'0','dossier',0,'2014-04-26 11:39:43','2014-04-26 11:39:43',0,NULL,NULL),
	('ebda530d-57c6-4bd7-a14b-cf5673576279','test','',2,'0','dossier',0,'2014-04-26 11:37:20','2014-04-26 11:37:20',0,NULL,NULL),
	('2f5a2b90-8c61-4ddc-8817-1a898bf90433','test','',2,'0','dossier',0,'2014-04-26 11:40:01','2014-04-26 11:40:01',0,NULL,NULL),
	('4566fb39-7d79-49ec-9ffe-bbe0273fd90c','test','',2,'0','dossier',0,'2014-04-26 11:52:50','2014-04-26 11:52:50',0,NULL,NULL),
	('9815920e-ee77-42b8-85b6-0b2fdfb4ab0d','test','',2,'0','',0,'2014-04-26 11:53:25','2014-04-26 11:53:25',0,NULL,NULL),
	('e81bf76d-35cd-4358-aed5-9e05191e5864','test','',2,'0','',0,'2014-04-26 11:53:31','2014-04-26 11:53:31',0,NULL,NULL),
	('1f2206b9-4210-4879-a2e8-0a1ddb84a20e','test','',2,'0','',0,'2014-04-26 11:55:06','2014-04-26 11:55:06',0,NULL,NULL),
	('d997b925-adf5-42df-803b-a345ce8d4e0b','coucou','',2,'','dossier',0,'2014-05-08 17:29:12','2014-05-08 17:29:12',0,0,0),
	('c1cd3fa1-957f-4682-b4e4-7ce3a1177af0','Mon premier dossier','',27,'','dossier',0,'2014-05-12 20:30:44','2014-05-12 20:30:44',0,0,0),
	('54dbec2e-a7bd-461b-89c1-ef84d52c361e','Mon premier dossier','',28,'','dossier',0,'2014-05-12 20:32:15','2014-05-12 20:32:15',0,0,0),
	('5b26006b-d636-4db0-a42d-de6664b5f83c','lizbox_web_svn','zip',2,'0','application/zip',1,'2014-05-14 12:32:37','2014-05-14 12:33:59',72996439,NULL,NULL),
	('4cbc6699-d014-4594-bfa9-0e338d2e0e1f','Mon premier dossier','',26,'','dossier',0,'2014-05-12 20:24:24','2014-05-12 20:24:24',0,0,0),
	('62747d64-07c2-4b03-bc27-29daba30ec97','isola','zip',2,'','application/zip',1,'2014-05-11 15:40:52','2014-05-17 17:29:18',1610662,1,1),
	('f3eea97c-19c3-40aa-b968-154da0b5b8a7','mmm','',2,'','dossier',0,'2014-05-17 17:05:26','2014-05-17 17:05:26',0,NULL,NULL);

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
  `lecture` datetime DEFAULT NULL,
  `document` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;

INSERT INTO `notification` (`ID`, `utilisateur`, `type`, `date`, `lecture`, `document`)
VALUES
	(1,2,'welcome','2014-03-18 00:00:00','2014-04-07 15:17:31',''),
	(2,17,'welcome','2014-03-04 00:00:00','2014-03-24 00:00:00',''),
	(6,2,'welcome','2013-03-12 00:00:00','2014-05-08 19:33:18',''),
	(5,2,'welcome','2013-03-12 00:00:00','2014-05-08 19:33:16',''),
	(7,23,'partage','2014-05-19 19:56:00','2014-05-19 19:56:42','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(8,23,'partage','2014-05-19 20:01:00','2014-05-20 17:21:32','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(9,23,'partage','2014-05-19 20:04:33','2014-05-20 17:21:32','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(10,23,'partage','2014-05-19 20:04:43','2014-05-20 17:21:32','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(11,22,'partage','2014-05-19 20:04:47',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(12,23,'partage','2014-05-19 20:07:16','2014-05-20 17:21:32','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(13,23,'partage','2014-05-19 20:07:17','2014-05-20 17:21:32','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(14,23,'partage','2014-05-19 20:07:42','2014-05-20 17:21:32','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(15,23,'partage','2014-05-19 20:08:30','2014-05-20 17:21:32','d997b925-adf5-42df-803b-a345ce8d4e0b'),
	(16,17,'partage','2014-05-19 20:17:08',NULL,'d997b925-adf5-42df-803b-a345ce8d4e0b'),
	(17,17,'partage','2014-05-19 20:17:24',NULL,'d997b925-adf5-42df-803b-a345ce8d4e0b'),
	(18,23,'partage','2014-05-19 20:17:25','2014-05-20 17:21:32','d997b925-adf5-42df-803b-a345ce8d4e0b'),
	(19,23,'partage','2014-05-19 20:20:48','2014-05-20 17:21:31','d997b925-adf5-42df-803b-a345ce8d4e0b'),
	(20,23,'partage','2014-05-19 20:20:54','2014-05-20 17:21:31','d997b925-adf5-42df-803b-a345ce8d4e0b'),
	(21,23,'partage','2014-05-19 20:21:05','2014-05-20 17:21:31','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(22,17,'partage','2014-05-19 20:21:06',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(23,23,'partage','2014-05-19 20:21:41','2014-05-20 17:21:31','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(24,23,'partage','2014-05-19 23:09:25','2014-05-20 17:21:31','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(25,22,'partage','2014-05-20 00:26:17',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(26,23,'partage','2014-05-20 00:26:24','2014-05-20 17:21:31','62747d64-07c2-4b03-bc27-29daba30ec97'),
	(27,17,'partage','2014-05-20 00:26:28',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(28,22,'partage','2014-05-20 00:30:38',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(29,22,'partage','2014-05-20 00:32:55',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(30,17,'partage','2014-05-20 00:33:04',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(31,17,'partage','2014-05-20 00:34:00',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(32,22,'partage','2014-05-20 00:34:14',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(33,22,'partage','2014-05-20 08:52:54',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(34,17,'partage','2014-05-20 08:52:55',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(35,22,'partage','2014-05-20 08:54:59',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(36,17,'partage','2014-05-20 08:55:00',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(37,17,'partage','2014-05-20 08:55:24',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(38,22,'partage','2014-05-20 08:55:51',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(39,22,'partage','2014-05-20 13:45:59',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(40,22,'partage','2014-05-20 13:46:43',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(41,22,'partage','2014-05-20 13:47:59',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(42,17,'partage','2014-05-20 13:50:00',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(43,17,'partage','2014-05-20 13:50:08',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(44,23,'partage','2014-05-20 17:44:18',NULL,'bbd111aa-e2dd-4563-a549-32db6f71446f'),
	(45,23,'partage','2014-05-20 17:44:51',NULL,'58873d2f-6727-4634-ab49-ccc0d6c243cc'),
	(46,17,'partage','2014-05-20 17:48:38',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(47,17,'partage','2014-05-20 17:48:52',NULL,'62747d64-07c2-4b03-bc27-29daba30ec97'),
	(48,23,'partage','2014-05-20 17:52:08',NULL,'58873d2f-6727-4634-ab49-ccc0d6c243cc'),
	(49,22,'partage','2014-05-21 10:16:06',NULL,'bbd111aa-e2dd-4563-a549-32db6f71446f');

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

LOCK TABLES `partage` WRITE;
/*!40000 ALTER TABLE `partage` DISABLE KEYS */;

INSERT INTO `partage` (`ID`, `document`, `emeteur`, `recepteur`, `debut`, `ecriture`, `accepte`)
VALUES
	(25,'62747d64-07c2-4b03-bc27-29daba30ec97',2,23,'2014-05-20 00:26:46',0,0),
	(44,'62747d64-07c2-4b03-bc27-29daba30ec97',2,17,'2014-05-20 17:48:52',0,0),
	(39,'62747d64-07c2-4b03-bc27-29daba30ec97',2,22,'2014-05-20 13:46:43',1,0),
	(42,'bbd111aa-e2dd-4563-a549-32db6f71446f',2,23,'2014-05-20 17:44:18',0,0),
	(45,'bbd111aa-e2dd-4563-a549-32db6f71446f',2,22,'2014-05-21 10:16:06',0,0);

/*!40000 ALTER TABLE `partage` ENABLE KEYS */;
UNLOCK TABLES;


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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

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
	(21,'','tim',0,'tim','cma.marshall@gmail.com','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_ADMIN','0000-00-00 00:00:00',1),
	(22,'bernard','bernard',1,'bernard','bernard@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-05-11 18:52:14',1),
	(23,'camille','camille',1,'camille','camille@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-05-11 18:55:20',1),
	(24,'tata','tata',1,'tata','tat@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-05-12 20:21:29',1),
	(25,'tata','tata',1,'tata','tat@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-05-12 20:21:46',1),
	(26,'tutu','tutu',1,'tutu','tutu@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-05-12 20:24:24',1),
	(27,'trtr','trtr',1,'trtr','trtr@supinfo.com','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-05-12 20:30:44',1),
	(28,'tete','tete',1,'tete','tete@supinfo.com','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-05-12 20:32:15',1);

/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

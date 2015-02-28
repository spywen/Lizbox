# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 127.0.0.1 (MySQL 5.6.14)
# Base de données: lizbox
# Temps de génération: 2014-06-01 15:58:05 +0000
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



# Affichage de la table notification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(400) NOT NULL,
  `utilisateur` int(11) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `lecture` datetime DEFAULT NULL,
  `titre` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



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
	(39,'lolo','lolo',1,'lolo','spywen@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-05-31 19:09:48',1);

/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

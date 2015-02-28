# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 127.0.0.1 (MySQL 5.6.14)
# Base de données: lizbox
# Temps de génération: 2014-03-17 10:31:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;

INSERT INTO `utilisateur` (`ID`, `nom`, `prenom`, `male`, `pseudo`, `email`, `password`, `role`, `inscription`, `actif`)
VALUES
	(2,'toto','toto',1,'toto','toto@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_PREMIUM','2014-01-28 00:00:00',1),
	(5,'','',0,'user','','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_FREE','2014-02-22 00:00:00',1),
	(17,'babin','laurent',0,'spywen','spywen@hotmail.fr','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_PRO','1970-01-17 03:43:53',1),
	(18,'','',0,'admin','','7af78c911d5b48bea1dc2449d9d89513abeb4be5','ROLE_ADMIN','2014-02-20 00:00:00',1),
	(19,'','lolo',0,'','','da39a3ee5e6b4b0d3255bfef95601890afd80709','ROLE_FREE','1970-01-01 01:00:00',0),
	(20,'','toto',0,'','','da39a3ee5e6b4b0d3255bfef95601890afd80709','ROLE_FREE','1970-01-01 01:00:00',0);

/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

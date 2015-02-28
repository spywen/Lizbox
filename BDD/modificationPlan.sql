-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 16 Février 2014 à 14:22
-- Version du serveur: 5.6.14
-- Version de PHP: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `lizbox`
--

-- --------------------------------------------------------

--
-- Structure de la table `plan`
--

DROP TABLE IF EXISTS `plan`;
CREATE TABLE IF NOT EXISTS `plan` (
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

--
-- Vider la table avant d'insérer `plan`
--

TRUNCATE TABLE `plan`;
--
-- Contenu de la table `plan`
--

INSERT INTO `plan` (`espace`, `prix`, `bandepassante`, `duree`, `nom`, `label`, `android`, `desktop`) VALUES
(2147483647, 0, 'Limité', 31557600000, 'ROLE_FREE', 'Free', 1, 0),
(536870912000, 0, 'Optimal', 0, 'ROLE_ADMIN', 'Admin', 1, 1),
(53687091200, 19.99, 'Excelent', 31557600000, 'ROLE_PREMIUM', 'Premium', 1, 1),
(536870912000, 99.99, 'Optimal', 31557600000, 'ROLE_PRO', 'Pro', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

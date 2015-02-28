-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 08 Février 2014 à 17:16
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
-- Structure de la table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
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
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `lecture` datetime NOT NULL,
  `document` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `partage`
--

CREATE TABLE IF NOT EXISTS `partage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `document` varchar(200) NOT NULL,
  `emeteur` int(11) NOT NULL,
  `recepteur` int(11) NOT NULL,
  `debut` datetime NOT NULL,
  `droit` int(11) NOT NULL,
  `accepte` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `plan`
--

CREATE TABLE IF NOT EXISTS `plan` (
  `espace` int(200) NOT NULL COMMENT 'espace en bytes (octets récupérable grâce à la méthode .length() en java)',
  `prix` int(11) NOT NULL,
  `bandepassante` int(11) DEFAULT NULL,
  `duree` int(15) NOT NULL COMMENT 'durée en secondes',
  `nom` varchar(200) NOT NULL,
  PRIMARY KEY (`nom`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `plan`
--

INSERT INTO `plan` (`espace`, `prix`, `bandepassante`, `duree`, `nom`) VALUES
(100000, 0, 100, 100000000, 'FREE'),
(0, 0, 0, 0, 'ADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `souscription`
--

CREATE TABLE IF NOT EXISTS `souscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `debut` datetime NOT NULL,
  `utilisateur` int(11) NOT NULL,
  `plan` int(11) NOT NULL,
  `fin` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `souscription`
--

INSERT INTO `souscription` (`ID`, `debut`, `utilisateur`, `plan`, `fin`) VALUES
(1, '2014-01-15 00:00:00', 2, 1, '2014-01-31 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL,
  `male` tinyint(1) NOT NULL,
  `pseudo` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `role` varchar(200) NOT NULL,
  `naissance` datetime NOT NULL,
  `inscription` datetime NOT NULL,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID`, `nom`, `prenom`, `male`, `pseudo`, `email`, `password`, `role`, `naissance`, `inscription`, `actif`) VALUES
(2, 'toto', 'toto', 1, 'toto', 'toto@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_PREMIUM', '2014-01-16 00:00:00', '2014-01-28 00:00:00', 1),
(5, '', '', 0, 'user', '', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-02-12 00:00:00', '2014-02-22 00:00:00', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

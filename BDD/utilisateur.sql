-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 26 Février 2014 à 13:02
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
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID`, `nom`, `prenom`, `male`, `pseudo`, `email`, `password`, `role`, `naissance`, `inscription`, `actif`) VALUES
(2, 'toto', 'toto', 1, 'toto', 'toto@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_PREMIUM', '2014-01-16 00:00:00', '2014-01-28 00:00:00', 1),
(5, '', '', 0, 'user', '', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-02-12 00:00:00', '2014-02-22 00:00:00', 1),
(17, 'babin', 'laurent', 0, 'spywen', 'spywen@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_PRO', '1970-01-12 10:07:08', '1970-01-17 03:43:53', 1),
(18, '', '', 0, 'admin', '', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_ADMIN', '2014-02-12 00:00:00', '2014-02-20 00:00:00', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

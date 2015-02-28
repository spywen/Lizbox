-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 31 Mai 2014 à 19:05
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `lizbox`
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
  `partagepublic` tinyint(1) DEFAULT NULL,
  `partageprivee` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `document`
--

INSERT INTO `document` (`ID`, `nom`, `extension`, `user`, `dossierparent`, `typefichier`, `estfichier`, `creation`, `modification`, `taille`, `partagepublic`, `partageprivee`) VALUES
('5058bafe-9637-4ac0-9da4-2940c65581c4', 'Mon premier dossier', '', 38, '0', 'dossier', 0, '2014-05-31 18:46:02', '2014-05-31 18:46:02', 0, 0, 0),
('56a5714a-2d2a-464f-b480-5f7311a2e009', 'utilisateur', 'sql', 25, '0', 'application/octet-stream', 1, '2014-05-31 18:38:14', '2014-05-31 18:38:14', 2150, 0, 1),
('dbdcfccb-0108-4079-a334-8eb6c6fcfdce', 'modificationNotifications', 'sql', 2, '0', 'application/octet-stream', 1, '2014-05-31 17:39:30', '2014-05-31 17:39:30', 83, NULL, 1),
('e9b1f4d8-76fd-4136-b9f1-98f9bbc95134', '20140523_144701', 'jpg', 25, '64bee04d-9fcf-4dae-9844-404904a97f6f', 'application/octet-stream', 1, '2014-05-31 15:36:31', '2014-05-31 15:36:42', 2607136, 0, 0),
('a85ecd0b-0651-4596-9bdf-965f4265b786', 'Mon premier dossier', '', 37, '0', 'dossier', 0, '2014-05-31 15:28:34', '2014-05-31 15:28:34', 0, 0, 0),
('4af52cd5-2953-4df4-b4d0-a2e19b3dc0f1', 'Mon premier dossier', '', 36, '0', 'dossier', 0, '2014-05-31 15:25:01', '2014-05-31 15:25:01', 0, 0, 0),
('e6d5c40c-c763-41c8-a2a5-57b42c0c0771', 'Mon premier dossier', '', 35, '0', 'dossier', 0, '2014-05-31 15:22:34', '2014-05-31 15:22:34', 0, 0, 0),
('4e0b71a4-d4c8-4b80-8f7e-8aa706619d63', 'Mon premier dossier', '', 33, '0', 'dossier', 0, '2014-05-31 15:19:33', '2014-05-31 15:19:33', 0, 0, 0),
('824e1757-3d51-49b3-880f-8ed5f442495d', 'Mon premier dossier', '', 34, '0', 'dossier', 0, '2014-05-31 15:20:17', '2014-05-31 15:20:17', 0, 0, 0),
('837a4cdc-d6d4-41d8-88b6-3c29f004a6ce', 'Mon premier dossier', '', 32, '0', 'dossier', 0, '2014-05-31 15:14:29', '2014-05-31 15:14:29', 0, 0, 0),
('64bee04d-9fcf-4dae-9844-404904a97f6f', 'dhg', '', 25, '0', 'dossier', 0, '2014-05-31 15:36:22', '2014-05-31 15:36:22', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(400) NOT NULL,
  `utilisateur` int(11) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `lecture` datetime DEFAULT NULL,
  `titre` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

--
-- Contenu de la table `notification`
--

INSERT INTO `notification` (`ID`, `message`, `utilisateur`, `type`, `date`, `lecture`, `titre`) VALUES
(88, 'Le document utilisateur.sql vous a été partagé.', 25, 'partage', '2014-05-31 16:41:21', '2014-05-31 16:41:45', 'toto a partagé un document avec vous'),
(89, 'Le document utilisateur.sql a été supprimé.', 25, 'supprimeDocument', '2014-05-31 16:41:49', '2014-05-31 16:45:04', 'tata a supprimé un document partagé'),
(90, 'Le document removeUserBirthday.sql vous a été partagé.', 25, 'partage', '2014-05-31 16:45:20', '2014-05-31 16:45:27', 'toto a partagé un document avec vous'),
(91, 'Le document removeUserBirthday.sql a été supprimé.', 2, 'supprimeDocument', '2014-05-31 16:45:32', '2014-05-31 16:46:06', 'tata a supprimé un document partagé'),
(92, 'Le document modificationNotifications.sql vous a été partagé.', 25, 'partage', '2014-05-31 17:58:11', '2014-05-31 18:39:57', 'toto a partagé un document avec vous'),
(93, 'Le document utilisateur.sql vous a été partagé.', 2, 'partage', '2014-05-31 18:38:35', '2014-05-31 18:39:23', 'tata a partagé un document avec vous'),
(94, 'Le partage du document utilisateur.sql a été supprimé', 2, 'supprimePartage', '2014-05-31 18:39:04', '2014-05-31 18:39:24', 'tata a supprimé un partage avec vous'),
(95, 'Le document utilisateur.sql vous a été partagé.', 2, 'partage', '2014-05-31 18:39:18', '2014-05-31 18:39:25', 'tata a partagé un document avec vous');

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
  `ecriture` tinyint(1) NOT NULL,
  `accepte` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Contenu de la table `partage`
--

INSERT INTO `partage` (`ID`, `document`, `emeteur`, `recepteur`, `debut`, `ecriture`, `accepte`) VALUES
(49, '66576671-0f91-4ec8-933b-27e32095d901', 2, 23, '2014-05-31 11:16:54', 0, 0),
(57, 'a18f082a-3e56-43d8-80b3-f010d000893b', 30, 31, '2014-05-31 13:00:27', 0, 0),
(58, '792c79a6-32c3-482b-9e07-1284b29faba1', 2, 23, '2014-05-31 14:47:53', 0, 0),
(71, 'dbdcfccb-0108-4079-a334-8eb6c6fcfdce', 2, 25, '2014-05-31 17:58:11', 0, 0),
(73, '56a5714a-2d2a-464f-b480-5f7311a2e009', 25, 2, '2014-05-31 18:39:18', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `plan`
--

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
-- Contenu de la table `plan`
--

INSERT INTO `plan` (`espace`, `prix`, `bandepassante`, `duree`, `nom`, `label`, `android`, `desktop`) VALUES
(2147483647, 0, 'limitée', 31557600000, 'ROLE_FREE', 'Free', 1, 0),
(536870912000, 0, 'optimale', 0, 'ROLE_ADMIN', 'Admin', 1, 1),
(53687091200, 19.99, 'excelente', 31557600000, 'ROLE_PREMIUM', 'Premium', 1, 1),
(536870912000, 99.99, 'optimale', 31557600000, 'ROLE_PRO', 'Pro', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `souscription`
--

CREATE TABLE IF NOT EXISTS `souscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `debut` datetime NOT NULL,
  `recepteur` int(11) NOT NULL,
  `plan` int(11) NOT NULL,
  `fin` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `souscription`
--

INSERT INTO `souscription` (`ID`, `debut`, `recepteur`, `plan`, `fin`) VALUES
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
  `inscription` datetime NOT NULL,
  `actif` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID`, `nom`, `prenom`, `male`, `pseudo`, `email`, `password`, `role`, `inscription`, `actif`) VALUES
(2, 'toto', 'toto', 1, 'toto', 'spywen@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_PREMIUM', '2014-01-28 00:00:00', 1),
(5, '', '', 0, 'user', '', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-02-22 00:00:00', 1),
(17, 'babin', 'laurent', 0, 'spywen', 'spywen@hotmail.frr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_PRO', '1970-01-17 03:43:53', 1),
(18, '', '', 0, 'admin', '', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_ADMIN', '2014-02-20 00:00:00', 1),
(19, '', 'lolo', 0, '', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'ROLE_FREE', '1970-01-01 01:00:00', 0),
(20, '', 'toto', 0, '', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'ROLE_FREE', '1970-01-01 01:00:00', 0),
(21, '', 'tim', 0, 'tim', 'cma.marshall@gmail.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_ADMIN', '0000-00-00 00:00:00', 1),
(22, 'bernard', 'bernard', 1, 'bernard', 'bernard@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-11 18:52:14', 1),
(23, 'camille', 'camille', 1, 'camille', 'camille@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-11 18:55:20', 1),
(25, 'tata', 'tata', 1, 'tata', 'tat@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-12 20:21:46', 1),
(26, 'tutu', 'tutu', 1, 'tutu', 'tutu@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-12 20:24:24', 1),
(27, 'trtr', 'trtr', 1, 'trtr', 'trtr@supinfo.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-12 20:30:44', 1),
(28, 'tete', 'tete', 1, 'tete', 'tete@supinfo.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-12 20:32:15', 1),
(29, 'anis', 'anis', 1, 'anis', 'anis@hotmail.fr', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-21 12:52:31', 1),
(30, 'partageun', 'partageun', 1, 'partageun', 'partageun@partageun.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-31 11:23:05', 1),
(31, 'partagedeux', 'partagedeux', 1, 'partagedeux', 'partagedeux@partagedeux.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-31 11:23:35', 1),
(32, 'jdjdj', 'jdjddj', 1, 'yyyy', 'yyy@hdhd.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-03-10 16:52:43', 1),
(33, 'gdhdh', 'fdsfsd', 1, 'gggg', 'ggg@gmail.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-31 15:19:32', 1),
(34, 'hdjd', 'hdhd', 1, 'gggs', 'hjd@hdj.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-03-10 16:52:43', 1),
(35, 'hddj', 'fdsfsd', 1, 'tttt', 'tttt@gmail.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-31 15:22:34', 1),
(36, 'tttt', 'tttt', 1, 'tttts', 'tttts@gmail.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-31 15:25:01', 1),
(37, 'dsdsqd', 'dsqdqs', 1, 'ssss', 'ssss@gmail.com', '7af78c911d5b48bea1dc2449d9d89513abeb4be5', 'ROLE_FREE', '2014-05-31 15:28:34', 1),
(38, 'jdj', 'kdkdk', 1, 'totod', 'jdjd@jdd.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'ROLE_FREE', '2014-03-10 16:52:43', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

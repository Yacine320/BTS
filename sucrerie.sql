-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 31 mars 2020 à 13:12
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sucrerie`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `code_c` int(11) NOT NULL,
  `nom` varchar(35) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` varchar(25) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`code_c`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`code_c`, `nom`, `adresse`, `cp`, `ville`, `telephone`) VALUES
(17, 'TARINAUX Lucien', '12 rue de la Justice', '51100', 'REIMS', '03.26.25.48.87'),
(46, 'MARTUSE', '103 avenue Lear', '51100', 'REIMS', '03.26.03.25.26'),
(47, 'RABIN Sandrine', '21 rue de la Méditerranée', '51100', 'REIMS', '03.26.14.15.25'),
(48, 'SILLARD Laurence', '15 rue Pasentiers', '51100', 'REIMS', '03.26.11.11.25'),
(49, 'COTOY Sylvie', '12 rue des écus', '51100', 'REIMS', '03.26.10.25.75'),
(50, 'HELLOU Bernard', '21 rue de la Méditerranée', '51100', 'REIMS', '03.26.12.25.42'),
(51, 'HENTION Martine', '50 allée des bons enfants', '51100', 'REIMS', '03.26.12.25.86'),
(52, 'SIBAT Evelyne', '14 rue de la Baltique', '51100', 'REIMS', '03.26.12.23.33'),
(53, 'MARIN Dominique', '24 rue de la Baltique', '51100', 'REIMS', '03.26.10.10.23'),
(54, 'DURDUX Monique', '15 allée des Béarnais', '51150', 'VITRY LE FRANCOIS', '03.26.42.42.33'),
(55, 'CANILLE Walter', '14 rue Lanterneau', '51100', 'REIMS', '03.26.12.12.87'),
(56, 'BOUQUET Antoinette', '1 rue de la Méditerranée', '51140', 'ROMAIN', '03.26.78.89.54'),
(57, 'GAUTON Nadine', '5 place des Oiseaux', '51200', 'FISMES', '03.26.53.56.55'),
(58, 'LEGROS Christian', '18 place des Oiseaux', '51200', 'FISMES', '03.26.44.55.66'),
(59, 'DUMOITIERS Lucille', '12 place Centrale', '02320', 'LONGUEVAL', '03.26.86.43.25'),
(60, 'BOUCHE Carole', '4,. rue Brulé', '51200', 'FISMES', '03.26.33.96.85');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `numero` int(11) NOT NULL,
  `code_v` int(11) NOT NULL,
  `code_c` int(11) NOT NULL,
  `date_livraison` date DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `total_ht` decimal(9,2) DEFAULT NULL,
  `total_tva` decimal(9,2) DEFAULT NULL,
  `etat` char(1) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`numero`, `code_v`, `code_c`, `date_livraison`, `date_commande`, `total_ht`, `total_tva`, `etat`) VALUES
(10178, 15, 47, '2008-09-05', '2008-09-05', '177.00', '9.75', '1'),
(10179, 15, 47, '2008-10-13', '2008-10-13', '192.00', '10.50', '1'),
(10180, 15, 48, '2008-10-10', '2008-10-10', '98.00', '5.40', '1'),
(10181, 15, 49, '2008-10-11', '2008-10-11', '175.00', '9.60', '1'),
(10182, 15, 50, '2008-10-11', '2008-10-11', '116.00', '6.40', '1'),
(10183, 15, 51, '2008-10-11', '2008-10-11', '118.00', '6.50', '1'),
(10184, 15, 52, '2008-10-12', '2008-10-12', '102.00', '5.60', '1'),
(10185, 15, 53, '2008-10-12', '2008-10-12', '19.00', '1.05', '1'),
(10186, 15, 54, '2008-10-10', '2008-10-10', '101.00', '5.55', '1'),
(10187, 15, 55, '2008-10-10', '2008-10-10', '65.00', '3.58', '1'),
(10188, 17, 56, '2008-10-12', '2008-10-12', '121.00', '6.66', '1'),
(10189, 17, 57, '2008-10-10', '2008-10-10', '110.00', '6.05', '1'),
(10190, 17, 58, '2008-10-13', '2008-10-13', '123.00', '6.76', '1'),
(10191, 17, 59, '2008-10-13', '2008-10-13', '107.50', '5.91', '1'),
(10192, 17, 60, '2008-11-10', '2008-11-10', '237.00', '13.04', '1');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

DROP TABLE IF EXISTS `ligne_commande`;
CREATE TABLE IF NOT EXISTS `ligne_commande` (
  `numero` int(11) NOT NULL,
  `numero_ligne` int(11) NOT NULL,
  `reference` char(4) NOT NULL,
  `quantite_demandee` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`,`numero_ligne`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`numero`, `numero_ligne`, `reference`, `quantite_demandee`) VALUES
(10188, 3, '1004', 1),
(10179, 7, '1007', 2),
(10191, 4, '1015', 1),
(10191, 1, '1016', 1),
(10188, 1, '1016', 2),
(10186, 1, '1016', 1),
(10189, 1, '1017', 1),
(10192, 3, '1017', 1),
(10186, 2, '3002', 2),
(10192, 9, '3004', 1),
(10192, 4, '3016', 1),
(10190, 1, '3010', 1),
(10180, 3, '3016', 1),
(10192, 6, '3017', 1),
(10179, 4, '4002', 1),
(10185, 1, '4002', 1),
(10181, 4, '4002', 2),
(10184, 3, '4004', 1),
(10178, 5, '4004', 1),
(10187, 2, '4010', 1),
(10187, 3, '4011', 1),
(10182, 2, '4012', 1),
(10181, 5, '4012', 2),
(10183, 5, '4013', 1),
(10191, 3, '4013', 1),
(10178, 1, '4015', 1),
(10187, 1, '4015', 1),
(10190, 2, '4015', 1),
(10189, 2, '4016', 1),
(10192, 10, '4019', 1),
(10181, 1, '4020', 1),
(10192, 7, '4022', 1),
(10183, 1, '4025', 1),
(10178, 2, '4025', 1),
(10192, 1, '4025', 1),
(10184, 1, '4025', 1),
(10181, 2, '4026', 1),
(10183, 2, '4027', 1),
(10183, 3, '4029', 1),
(10192, 2, '4030', 1),
(10179, 1, '4031', 1),
(10178, 3, '4031', 1),
(10189, 3, '4031', 1),
(10184, 2, '4031', 2),
(10192, 5, '4031', 1),
(10179, 2, '4032', 1),
(10190, 3, '4032', 1),
(10189, 4, '4033', 1),
(10182, 1, '4034', 1),
(10178, 4, '4036', 1),
(10179, 3, '4037', 1),
(10183, 4, '4039', 1),
(10178, 7, '4042', 1),
(10181, 3, '4045', 1),
(10191, 2, '4052', 1),
(10192, 8, '4052', 1),
(10188, 2, '4052', 1),
(10178, 6, '4053', 1),
(10180, 1, '4053', 1),
(10190, 4, '4053', 1),
(10179, 5, '4054', 1),
(10181, 6, '4054', 1),
(10182, 3, '4055', 1),
(10180, 2, '4055', 1),
(10179, 6, '4057', 1),
(10182, 4, '4057', 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `reference` char(4) NOT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `descriptif` varchar(100) DEFAULT NULL,
  `prix_unitaire_ht` decimal(9,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `poids_piece` int(11) DEFAULT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`reference`, `designation`, `quantite`, `descriptif`, `prix_unitaire_ht`, `stock`, `poids_piece`) VALUES
('1004', 'FEU DE JOIE LIQUEUR ASSORT.', 500, 'G', '23.00', 50, 0),
('1007', 'TENDRE FRUIT', 500, 'G', '18.00', 120, 0),
('1015', 'CARACAO', 500, 'G', '24.50', 50, 0),
('1016', 'COKTAIL', 500, 'G', '33.00', 40, 0),
('1017', 'ORFIN', 500, 'G', '32.00', 40, 0),
('3002', 'CARRE PECTO', 500, 'G', '29.00', 40, 0),
('3004', 'ZAN ALESAN', 25, 'P', '15.00', 50, 20),
('3010', 'PATES GRISES', 500, 'G', '35.00', 100, 0),
('3016', 'CARAMEL AU LAIT', 500, 'G', '20.00', 100, 0),
('3017', 'VIOLETTE TRADITION', 500, 'G', '25.00', 100, 0),
('4002', 'SUCETTE BOULE FRUIT', 25, 'P', '14.00', 100, 40),
('4004', 'SUCETTE BOULE POP', 25, 'P', '21.00', 50, 40),
('4010', 'CARAMBAR', 40, 'P', '18.00', 20, 15),
('4011', 'CARANOUGA', 40, 'P', '18.00', 100, 15),
('4012', 'CARAMBAR FRUIT', 40, 'P', '18.00', 100, 15),
('4013', 'CARAMBAR COLA', 40, 'P', '18.00', 50, 15),
('4015', 'SOURIS REGLISSE', 500, 'G', '24.00', 50, 0),
('4016', 'SOURIS CHOCO', 500, 'G', '24.00', 50, 0),
('4019', 'SCHTROUMPFS VERTS', 500, 'G', '24.00', 50, 0),
('4020', 'CROCODILE', 500, 'G', '21.00', 50, 0),
('4022', 'PERSICA', 500, 'G', '28.00', 20, 0),
('4025', 'COLA CITRIQUE', 500, 'G', '21.00', 50, 0),
('4026', 'COLA LISSE', 500, 'G', '25.00', 50, 0),
('4027', 'BANANE', 1000, 'G', '23.00', 20, 0),
('4029', 'OEUF SUR LE PLAT', 500, 'G', '25.00', 20, 0),
('4030', 'FRAISIBUS', 500, 'G', '25.00', 50, 0),
('4031', 'FRAISE TSOIN-TSOIN', 500, 'G', '25.00', 40, 0),
('4032', 'METRE REGLISSE ROULE', 500, 'G', '19.00', 50, 0),
('4033', 'MAXI COCOBAT', 1000, 'G', '19.00', 20, 0),
('4034', 'DENTS VAMPIRE', 500, 'G', '22.00', 50, 0),
('4036', 'LANGUE COLA CITRIQUE', 500, 'G', '21.00', 40, 0),
('4037', 'OURSON CANDI', 1000, 'G', '21.00', 50, 0),
('4039', 'SERPENT ACIDULE', 500, 'G', '21.00', 20, 0),
('4042', 'TETINE CANDI', 500, 'G', '20.00', 40, 0),
('4045', 'COLLIER PECCOS', 15, 'P', '21.00', 50, 50),
('4052', 'TWIST ASSORTIS', 500, 'G', '22.00', 50, 0),
('4053', 'OURSON GUIMAUVE', 500, 'G', '35.00', 10, 0),
('4054', 'BOULE COCO MULER', 500, 'G', '34.00', 10, 0),
('4055', 'COCOMALLOW', 500, 'G', '33.00', 10, 0),
('4057', 'CRIC-CRAC', 500, 'G', '33.00', 10, 0);

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

DROP TABLE IF EXISTS `vendeur`;
CREATE TABLE IF NOT EXISTS `vendeur` (
  `code_v` int(11) NOT NULL,
  `nom` varchar(35) DEFAULT NULL,
  `adresse` varchar(40) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` varchar(30) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`code_v`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vendeur`
--

INSERT INTO `vendeur` (`code_v`, `nom`, `adresse`, `cp`, `ville`, `telephone`) VALUES
(15, 'FILLARD Sylvain', '77 rue du l\'Adriatique', '51100', 'REIMS', '03.26.12.25.25'),
(17, 'BAUDOT Marc', '16 rue de Reims', '51000', 'CHALONS EN CHAMPAGNE', '03.26.10.58.59');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

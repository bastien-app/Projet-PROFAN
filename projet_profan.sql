-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 26 mai 2019 à 15:13
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_profan`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `nom` varchar(255) NOT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `num_commande` int(11) DEFAULT NULL,
  `ref_client` int(11) NOT NULL,
  PRIMARY KEY (`ref_client`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `num_commande` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `date_butoire` date NOT NULL,
  `type_finition` text NOT NULL,
  PRIMARY KEY (`num_commande`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`num_commande`, `date_commande`, `date_butoire`, `type_finition`) VALUES
(1, '2019-04-08', '2019-04-10', 'zbeub zbeub '),
(2, '2019-04-08', '2019-04-10', 'test'),
(3, '2019-04-08', '2019-05-10', 'wallah');

-- --------------------------------------------------------

--
-- Structure de la table `commande_de_papier`
--

DROP TABLE IF EXISTS `commande_de_papier`;
CREATE TABLE IF NOT EXISTS `commande_de_papier` (
  `quantite` int(11) NOT NULL,
  `unite_quantite` varchar(255) NOT NULL,
  `format` varchar(255) NOT NULL,
  `grammage` int(11) NOT NULL,
  `PEFC` tinyint(1) NOT NULL,
  `FSC` tinyint(1) NOT NULL,
  `num_commande` int(11) NOT NULL,
  PRIMARY KEY (`num_commande`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `composant`
--

DROP TABLE IF EXISTS `composant`;
CREATE TABLE IF NOT EXISTS `composant` (
  `nom_composant` varchar(255) NOT NULL,
  `id_composant` int(11) NOT NULL,
  PRIMARY KEY (`id_composant`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `conditionnement`
--

DROP TABLE IF EXISTS `conditionnement`;
CREATE TABLE IF NOT EXISTS `conditionnement` (
  `type_conditionnement` varchar(255) NOT NULL,
  `lieux` varchar(255) NOT NULL,
  `livré_par` varchar(255) NOT NULL,
  `num_commande` int(11) NOT NULL,
  PRIMARY KEY (`num_commande`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `encadre`
--

DROP TABLE IF EXISTS `encadre`;
CREATE TABLE IF NOT EXISTS `encadre` (
  `id_enseignant` int(11) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  PRIMARY KEY (`id_enseignant`,`id_eleve`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `est_constitue`
--

DROP TABLE IF EXISTS `est_constitue`;
CREATE TABLE IF NOT EXISTS `est_constitue` (
  `id_produit` int(11) NOT NULL,
  `num_commande` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`,`num_commande`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `est_impose`
--

DROP TABLE IF EXISTS `est_impose`;
CREATE TABLE IF NOT EXISTS `est_impose` (
  `id_composant` int(11) NOT NULL,
  `id_imposition` int(11) NOT NULL,
  PRIMARY KEY (`id_composant`,`id_imposition`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etapes`
--

DROP TABLE IF EXISTS `etapes`;
CREATE TABLE IF NOT EXISTS `etapes` (
  `nom_etape` varchar(255) NOT NULL,
  `id_etape` int(11) NOT NULL,
  PRIMARY KEY (`id_etape`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fabrication`
--

DROP TABLE IF EXISTS `fabrication`;
CREATE TABLE IF NOT EXISTS `fabrication` (
  `id_composant` int(11) NOT NULL,
  `id_etape` int(11) NOT NULL,
  `id_materiau` int(11) NOT NULL,
  `date_validation` date DEFAULT NULL,
  `infos` text,
  PRIMARY KEY (`id_composant`,`id_etape`,`id_materiau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `imposition`
--

DROP TABLE IF EXISTS `imposition`;
CREATE TABLE IF NOT EXISTS `imposition` (
  `infos_imposition` text NOT NULL,
  `type_de_retiration` varchar(255) NOT NULL,
  `nombre_plaques` int(11) NOT NULL,
  `type_de_brochage` varchar(255) DEFAULT NULL,
  `id_imposition` int(11) NOT NULL,
  PRIMARY KEY (`id_imposition`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

DROP TABLE IF EXISTS `machine`;
CREATE TABLE IF NOT EXISTS `machine` (
  `nom_machine` varchar(255) NOT NULL,
  `id_machine` int(11) NOT NULL,
  PRIMARY KEY (`id_machine`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `machine_utilise`
--

DROP TABLE IF EXISTS `machine_utilise`;
CREATE TABLE IF NOT EXISTS `machine_utilise` (
  `id_machine` int(11) NOT NULL,
  `id_etape` int(11) NOT NULL,
  PRIMARY KEY (`id_machine`,`id_etape`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `materiau`
--

DROP TABLE IF EXISTS `materiau`;
CREATE TABLE IF NOT EXISTS `materiau` (
  `nom_materiau` varchar(255) NOT NULL,
  `id_materiau` int(11) NOT NULL,
  PRIMARY KEY (`id_materiau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `nom_produit` varchar(255) NOT NULL,
  `id_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsable_projet_eleve`
--

DROP TABLE IF EXISTS `responsable_projet_eleve`;
CREATE TABLE IF NOT EXISTS `responsable_projet_eleve` (
  `nom_eleve` varchar(255) NOT NULL,
  `num_commande` int(11) NOT NULL,
  `classe` varchar(255) NOT NULL,
  `id_eleve` int(11) NOT NULL,
  PRIMARY KEY (`id_eleve`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsable_projet_enseignant`
--

DROP TABLE IF EXISTS `responsable_projet_enseignant`;
CREATE TABLE IF NOT EXISTS `responsable_projet_enseignant` (
  `nom_enseignant` varchar(255) DEFAULT NULL,
  `num_commande` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  PRIMARY KEY (`id_enseignant`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sous_traitance`
--

DROP TABLE IF EXISTS `sous_traitance`;
CREATE TABLE IF NOT EXISTS `sous_traitance` (
  `nom_prestataire` varchar(255) NOT NULL,
  `tirage_a_deposer_le` date NOT NULL,
  `operation_sous_traitance` text NOT NULL,
  `num_commande` int(11) NOT NULL,
  PRIMARY KEY (`nom_prestataire`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilise`
--

DROP TABLE IF EXISTS `utilise`;
CREATE TABLE IF NOT EXISTS `utilise` (
  `id_composant` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_composant`,`id_produit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `websiteuser`
--

DROP TABLE IF EXISTS `websiteuser`;
CREATE TABLE IF NOT EXISTS `websiteuser` (
  `id` varchar(50) NOT NULL,
  `MotDePasse` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `droits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `websiteuser`
--

INSERT INTO `websiteuser` (`id`, `MotDePasse`, `email`, `droits`) VALUES
('test', '$2y$10$30S5bD6t7YS/K26CTVaw9e8ufDpbZ9QobnqkRbR67e/WKGlsaq2vy', 'yolo', 1),
('je', '$2y$10$76C9iaAztetxRvUju1QOEuNacFurvjrhj1mhG253uUPgJWbtP6CWq', 'je@hotmail.fr', 0),
('lanuit', '$2y$10$PVON4/L6etS6NdkBpMbzEujFIil59RCQFCA8/vrmZl0um2s/jqFze', 'lala@lalou', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

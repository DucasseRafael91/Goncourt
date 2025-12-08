-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 08 déc. 2025 à 12:35
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `goncourt`
--

-- --------------------------------------------------------

--
-- Structure de la table `g_auteur`
--

DROP TABLE IF EXISTS `g_auteur`;
CREATE TABLE IF NOT EXISTS `g_auteur` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_prenom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_date_naissance` date NOT NULL,
  `a_biographie` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_editeur`
--

DROP TABLE IF EXISTS `g_editeur`;
CREATE TABLE IF NOT EXISTS `g_editeur` (
  `e_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_jury`
--

DROP TABLE IF EXISTS `g_jury`;
CREATE TABLE IF NOT EXISTS `g_jury` (
  `j_id` int NOT NULL AUTO_INCREMENT,
  `j_identifiant` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `j_mot_de_passe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `j_est_president` tinyint(1) NOT NULL,
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_livre`
--

DROP TABLE IF EXISTS `g_livre`;
CREATE TABLE IF NOT EXISTS `g_livre` (
  `l_isbn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_titre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_resume` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_date_parution` date NOT NULL,
  `l_nombre_pages` int NOT NULL,
  `l_prix_editeur` double NOT NULL,
  `l_fk_id_editeur` int NOT NULL,
  `l_fk_id_auteur` int NOT NULL,
  PRIMARY KEY (`l_isbn`),
  KEY `l_fk_id_editeur` (`l_fk_id_editeur`,`l_fk_id_auteur`),
  KEY `l_fk_id_auteur` (`l_fk_id_auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_personnages`
--

DROP TABLE IF EXISTS `g_personnages`;
CREATE TABLE IF NOT EXISTS `g_personnages` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_fk_livre_isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `p_fk_auteur_isbn` (`p_fk_livre_isbn`),
  KEY `p_fk_livre_isbn` (`p_fk_livre_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_selection`
--

DROP TABLE IF EXISTS `g_selection`;
CREATE TABLE IF NOT EXISTS `g_selection` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_nom` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_selection_livre`
--

DROP TABLE IF EXISTS `g_selection_livre`;
CREATE TABLE IF NOT EXISTS `g_selection_livre` (
  `s_fk_selection_id` int NOT NULL,
  `s_fk_livre_isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`s_fk_selection_id`,`s_fk_livre_isbn`),
  KEY `s_fk_selection_id` (`s_fk_selection_id`,`s_fk_livre_isbn`),
  KEY `s_fk_auteur_isbn` (`s_fk_livre_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_tour_vote`
--

DROP TABLE IF EXISTS `g_tour_vote`;
CREATE TABLE IF NOT EXISTS `g_tour_vote` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `t_nom` int NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `g_vote`
--

DROP TABLE IF EXISTS `g_vote`;
CREATE TABLE IF NOT EXISTS `g_vote` (
  `v_fk_jury_id` int NOT NULL,
  `v_fk_livre_isbn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v_fk_tour_vote_id` int NOT NULL,
  PRIMARY KEY (`v_fk_jury_id`,`v_fk_livre_isbn`,`v_fk_tour_vote_id`),
  KEY `v_fk_jury_id` (`v_fk_jury_id`,`v_fk_livre_isbn`,`v_fk_tour_vote_id`),
  KEY `v_fk_tour_vote_id` (`v_fk_tour_vote_id`),
  KEY `v_fk_livre_isbn` (`v_fk_livre_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `g_livre`
--
ALTER TABLE `g_livre`
  ADD CONSTRAINT `g_livre_ibfk_1` FOREIGN KEY (`l_fk_id_editeur`) REFERENCES `g_editeur` (`e_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `g_livre_ibfk_2` FOREIGN KEY (`l_fk_id_auteur`) REFERENCES `g_auteur` (`a_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `g_personnages`
--
ALTER TABLE `g_personnages`
  ADD CONSTRAINT `g_personnages_ibfk_1` FOREIGN KEY (`p_fk_livre_isbn`) REFERENCES `g_livre` (`l_isbn`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `g_selection_livre`
--
ALTER TABLE `g_selection_livre`
  ADD CONSTRAINT `g_selection_livre_ibfk_1` FOREIGN KEY (`s_fk_selection_id`) REFERENCES `g_selection` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `g_selection_livre_ibfk_2` FOREIGN KEY (`s_fk_livre_isbn`) REFERENCES `g_livre` (`l_isbn`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `g_vote`
--
ALTER TABLE `g_vote`
  ADD CONSTRAINT `g_vote_ibfk_1` FOREIGN KEY (`v_fk_jury_id`) REFERENCES `g_jury` (`j_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `g_vote_ibfk_2` FOREIGN KEY (`v_fk_tour_vote_id`) REFERENCES `g_tour_vote` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `g_vote_ibfk_3` FOREIGN KEY (`v_fk_livre_isbn`) REFERENCES `g_livre` (`l_isbn`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

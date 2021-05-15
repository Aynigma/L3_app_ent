-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 15 mai 2021 à 13:46
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
-- Base de données :  `l3_app_ent`
--

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tariff_child_available` bit(1) NOT NULL,
  `tariff_senior_available` bit(1) NOT NULL,
  `tariffvipavailable` bit(1) NOT NULL,
  `tariff_young_available` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id`, `date`, `description`, `location`, `name`, `price`, `subtitle`, `tags`, `tariff_child_available`, `tariff_senior_available`, `tariffvipavailable`, `tariff_young_available`) VALUES
(6, '2021-05-31 00:00:00.000000', 'The pandemic environment, personal problems and work pressure take a toll on our body and mind. The Art of Living brings you this free holistic and integrated workshop called the Health and Happiness which provide unique tools and techniques which help combat stress accumulated in our daily, modern life.\nThrough breathing techniques and meditation taught in this workshop one feels light, energetic and enthusiastic to take on life!', 'En ligne', 'Health and Happiness Workshop', 0, 'Experiencing Stress? Anxiety? Worries? Health issues?\nLearn effortless techniques to manage your stress and increase your energy levels', 'En ligne, Santé, Stress', b'0', b'0', b'0', b'0'),
(7, '2021-06-10 00:00:00.000000', 'This two-hour presentation will focus on understanding how stress affects you (the psychological, spiritual, interpersonal and physical impacts)\nlearning strategies to help you manage stress more effectively and to build resiliency\nvirtual practice of the different strategies to manage stress and practice self-care and wellness\nand available resources and how to connect.', 'En ligne', 'Self-Care and Wellness', 5, 'Presentation will focus on understanding how stress affects you (the psychological, spiritual, interpersonal and physical impacts).', 'En ligne, Santé, Stress, Bien-être', b'1', b'1', b'0', b'1'),
(8, '2021-07-02 00:00:00.000000', 'La Foire de Tours : un espace commercial, convivial et festif, le plus grand rendez-vous de la région pour rencontrer des professionnels dans de nombreux secteurs d’activités, découvrir de nouveaux produits ou services.\nPlus de 625 exposants sont présents pour vous pendant 10 jours.\nIls vous invitent à découvrir les innovations, tester, comparer de très nombreux produits, à profiter de leurs conseils de spécialistes et de leurs offres commerciales.\nLa Foire de Tours, le rendez-vous incontournable d\'octobre. C’est la plus grande “vitrine commerciale“ de la région, 10 jours d’échanges, de découvertes, de démonstrations, d’animations, de rencontres, de dégustations…\n45 500m² de bons plans et de nouveautés dans de nombreux secteurs.\n', 'Tours (37)', 'La Foire de Tours', 30, 'Succès confirmé pour la Foire de Tours 2019, avec 347 744 entrées. Des visiteurs séduits par la qualité de ce rendez-vous incontournable.\nChaque année, plus de 625 professionnels de tous les secteurs d\'activité sont présents au Parc Expo de Tours.', 'Foire, Exposition', b'1', b'1', b'1', b'0');

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(12);

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `isvip` bit(1) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfytuhjopeamxbt1cpudy92x5n` (`event_id`),
  KEY `FKrgc76tjfg2reaxeuhtil2snr8` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`id`, `amount`, `isvip`, `type`, `event_id`, `owner_id`) VALUES
(9, 2, b'0', 'tarif-default', 8, 1),
(10, 3, b'0', 'tarif-child', 8, 1),
(11, 1, b'1', 'tarif-senior', 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL,
  `is_admin` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `is_admin`, `password`, `username`) VALUES
(1, b'0', 'user', 'user'),
(2, b'0', 'user1', 'user1'),
(3, b'0', 'user2', 'user2'),
(4, b'1', 'admin', 'admin'),
(5, b'1', 'admin1', 'admin1');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FKfytuhjopeamxbt1cpudy92x5n` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
  ADD CONSTRAINT `FKrgc76tjfg2reaxeuhtil2snr8` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

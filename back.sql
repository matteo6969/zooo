-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 06 déc. 2024 à 11:36
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `animals`
--

CREATE TABLE `animals` (
  `id` int(11) NOT NULL,
  `image` longblob NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `enclosure_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `animals`
--

INSERT INTO `animals` (`id`, `image`, `name`, `description`, `enclosure_id`) VALUES
(68, '', 'Oryx beisa', '', 11),
(69, '', 'Gazelle', '', 15),
(70, '', 'Autruche', '', 15),
(71, '', 'Gnou', '', 11),
(72, '', 'Tapir', '', 16),
(73, '', 'Coati', '', 14),
(74, '', 'Fennec', '', 13),
(75, '', 'Rhinocéros', '', 11),
(76, '', 'Suricate', '', 12),
(77, '', 'Crocodile nain', '', 19),
(78, '', 'Casoar', '', 18),
(79, '', 'Guépard', '', 17),
(80, '', 'Saïmiri', '', 14),
(81, '', 'Lion', '', 31),
(82, '', 'Hippopotame', '', 30),
(83, '', 'Hyène', '', 27),
(84, '', 'Éléphant', '', 26),
(85, '', 'Girafe', '', 25),
(86, '', 'Varan de Komodo', '', 24),
(87, '', 'Zèbre', '', 29),
(88, '', 'Grivet', '', 23),
(89, '', 'Cercopithèque', '', 23),
(90, '', 'Loup à crinière', '', 28),
(91, '', 'Tamarin', '', 20),
(92, '', 'Capucin', '', 21),
(93, '', 'Gibbon', '', 22),
(94, '', 'Ouistiti', '', 22),
(95, '', 'Marabout', '', 32),
(96, '', 'Watusi', '', 33),
(97, '', 'Émeu', '', 42),
(98, '', 'Bison', '', 45),
(99, '', 'Dromadaire', '', 46),
(100, '', 'Flamant rose', '', 39),
(101, '', 'cigogne', '', 32),
(102, '', 'Oryx algazelle', '', 33),
(103, '', 'Âne de Somalie', '', 33),
(104, '', 'Yack', '', 38),
(105, '', 'Mouton noir', '', 38),
(106, '', 'Ibis', '', 34),
(107, '', 'Tortue', '', 34),
(108, '', 'Pécari', '', 37),
(109, '', 'Tamanoir', '', 39),
(110, '', 'Nandou', '', 39),
(111, '', 'Wallaby', '', 42),
(112, '', 'Porc-épic', '', 44),
(113, '', 'Âne de Provence', '', 46),
(114, '', 'Tigre', '', 41),
(115, '', 'Chien des buissons', '', 40),
(116, '', 'Serval', '', 36),
(117, '', 'Lynx', '', 35),
(118, '', 'Antilope', '', 50),
(119, '', 'Daim', '', 50),
(120, '', 'Nilgaut', '', 50),
(121, '', 'Macaque ', '', 47),
(122, '', 'Crabier', '', 47),
(123, '', 'Vautour', '', 49),
(124, '', 'Loup d\'Europe', '', 51),
(125, '', 'Cerf', '', 48),
(126, '', 'Python', '', 1),
(127, '', 'Tortue', '', 1),
(128, '', 'Iguane', '', 1),
(129, '', 'Panthère', '', 4),
(130, '', 'Ara Parroquet', '', 2),
(131, '', 'Grand Hocco', '', 3),
(132, '', 'Panda roux', '', 5),
(133, '', 'Lémurien', '', 7),
(134, '', 'Chèvre naine', '', 6),
(135, '', 'Loutre', '', 10),
(136, '', 'Mouflon', '', 9),
(137, '', 'Binturong', '', 10);

-- --------------------------------------------------------

--
-- Structure de la table `enclosures`
--

CREATE TABLE `enclosures` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `biome` varchar(255) DEFAULT NULL,
  `status` enum('open','closed') DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enclosures`
--

INSERT INTO `enclosures` (`id`, `name`, `description`, `biome`, `status`) VALUES
(1, 'A', 'Python, Tortue, Iguane', 'La Bergerie des reptiles', 'open'),
(2, 'V1', 'Ara Perroquet', 'Le Vallon des cascades', 'open'),
(3, 'V2', 'Grand Hocco', 'Le Vallon des cascades', 'open'),
(4, 'V3', 'Panthère', 'Le Vallon des cascades', 'open'),
(5, 'V4', 'Panda roux', 'Le Vallon des cascades', 'open'),
(6, 'V5', 'Chèvre naine', 'Le Vallon des cascades', 'open'),
(7, 'V6', 'Lémurien', 'Le Vallon des cascades', 'open'),
(8, 'V7', 'Tortue', 'Le Vallon des cascades', 'open'),
(9, 'V8', 'Mouflon', 'Le Vallon des cascades', 'open'),
(10, 'V9', 'Binturong, Loutre', 'Le Vallon des cascades', 'open'),
(11, 'B1', 'Rhinocéros, Oryx beisa, Gnou', 'Le Belvédère', 'open'),
(12, 'B2', 'Suricate', 'Le Belvédère', 'open'),
(13, 'B3', 'Fennec', 'Le Belvédère', 'open'),
(14, 'B4', 'Coati, Saïmiri', 'Le Belvédère', 'open'),
(15, 'B5', 'Gazelle, Autruche', 'Le Belvédère', 'open'),
(16, 'B6', 'Tapir', 'Le Belvédère', 'open'),
(17, 'B7', 'Guépard', 'Le Belvédère', 'open'),
(18, 'B8', 'Casoar', 'Le Belvédère', 'open'),
(19, 'B9', 'Crocodile nain', 'Le Belvédère', 'open'),
(20, 'P1', 'Tamarin', 'Le Plateau', 'open'),
(21, 'P2', 'Capucin', 'Le Plateau', 'open'),
(22, 'P3', 'Ouistiti, Gibbon', 'Le Plateau', 'open'),
(23, 'P4', 'Grivet, Cercopithèque', 'Le Plateau', 'open'),
(24, 'P5', 'Varan de Komodo', 'Le Plateau', 'open'),
(25, 'P6', 'Girafe', 'Le Plateau', 'open'),
(26, 'P7', 'Elephant', 'Le Plateau', 'open'),
(27, 'P8', 'Hyène', 'Le Plateau', 'open'),
(28, 'P9', 'Loup à crinière', 'Le Plateau', 'open'),
(29, 'P10', 'Zèbre', 'Le Plateau', 'open'),
(30, 'P11', 'Hippopotame', 'Le Plateau', 'open'),
(31, 'P12', 'Lion', 'Le Plateau', 'open'),
(32, 'C1', 'Cigogne, Marabout', 'Les Clairières', 'open'),
(33, 'C2', 'Oryx algazelle, Watsui, Âne de Somalie', 'Les Clairières', 'open'),
(34, 'C3', 'Ibis, Tortue', 'Les Clairières', 'open'),
(35, 'C4', 'Lynx', 'Les Clairières', 'open'),
(36, 'C5', 'Serval', 'Les Clairières', 'open'),
(37, 'C6', 'Pécari', 'Les Clairières', 'open'),
(38, 'C7', 'Yack, Mouton noir', 'Les Clairières', 'open'),
(39, 'C8', 'Flamant rose, Tamanoir, Nandou', 'Les Clairières', 'open'),
(40, 'C9', 'Chien des buissons', 'Les Clairières', 'open'),
(41, 'C10', 'Tigre', 'Les Clairières', 'open'),
(42, 'C11', 'Emeu, Wallaby', 'Les Clairières', 'open'),
(43, 'C12', 'Future plaine d\'afrique', 'Les Clairières', 'open'),
(44, 'C13', 'Porc-épic', 'Les Clairières', 'open'),
(45, 'C14', 'Bison', 'Les Clairières', 'open'),
(46, 'C15', 'Âne de Provence, Dromadaire', 'Les Clairières', 'open'),
(47, 'B1', 'Macaque, Crabier', 'Le bois des pins', 'open'),
(48, 'B2', 'Cerf', 'Le bois des pins', 'open'),
(49, 'B3', 'Vautour', 'Le bois des pins', 'open'),
(50, 'B4', 'Daim, Antilope, Nilgaut', 'Le bois des pins', 'open'),
(51, 'B5', 'Loup d\'Europe', 'Le bois des pins', 'open');

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `enclosure_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `name`) VALUES
(1, 'Boutique'),
(2, 'Café Nomad'),
(3, 'Petit Café'),
(4, 'Aires de Pique-Nique'),
(5, 'Toilettes'),
(6, 'Point d\'eau'),
(7, 'Gare'),
(8, 'Trajet Train'),
(9, 'Lodge'),
(10, 'Tente pédagogique'),
(11, 'Paillote'),
(12, 'Plateau des Jeux'),
(13, 'Espace Pique-nique'),
(14, 'Point de vue');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enclosure_id` (`enclosure_id`);

--
-- Index pour la table `enclosures`
--
ALTER TABLE `enclosures`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `enclosure_id` (`enclosure_id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT pour la table `enclosures`
--
ALTER TABLE `enclosures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`enclosure_id`) REFERENCES `enclosures` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`enclosure_id`) REFERENCES `enclosures` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

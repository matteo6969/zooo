SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` longblob NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `enclosure_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enclosure_id` (`enclosure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `animals` (`id`, `image`, `name`, `description`, `enclosure_id`) VALUES
(68, 'Public/les-clairieres/oryx.jpg', 'Oryx beisa', '', 11),
(69, 'Public/les-clairieres/gazelle.jpg', 'Gazelle', '', 15),
(70, 'Public/Le-belvedere/autruche.jpg', 'Autruche', '', 15),
(71, 'Public/les-clairieres/gnou.jpg', 'Gnou', '', 11),
(72, 'Public/Le-belvedere/tapir.jpg', 'Tapir', '', 16),
(73, 'Public/Le-belvedere/coati.jpg', 'Coati', '', 14),
(74, 'Public/Le-belvedere/fennec.jpg', 'Fennec', '', 13),
(75, 'Public/Le-belvedere/rhinoceros.jpg', 'Rhinocéros', '', 11),
(76, 'Public/Le-belvedere/suricate.jpg', 'Suricate', '', 12),
(77, 'Public/Le-belvedere/crocodile.jpg', 'Crocodile nain', '', 19),
(78, 'Public/Le-belvedere/casoar.jpg', 'Casoar', '', 18),
(79, 'Public/Le-belvedere/guepard.jpg', 'Guépard', '', 17),
(80, 'Public/Le-belvedere/saimiri.jpg', 'Saïmiri', '', 14),
(81, 'Public/Le-plateau/lionne.jpg', 'Lion', '', 31),
(82, 'Public/Le-plateau/Hippopotame.jpg', 'Hippopotame', '', 30),
(83, 'Public/Le-plateau/hyène.jpg', 'Hyène', '', 27),
(84, 'Public/Le-plateau/elephant.jpg', 'Éléphant', '', 26),
(85, 'Public/Le-plateau/plateau.jpg', 'Girafe', '', 25),
(86, 'Public/Le-plateau/varankomodo.jpg', 'Varan de Komodo', '', 24),
(87, 'Public/Le-plateau/zebre.jpg', 'Zèbre', '', 29),
(88, 'Public/Le-plateau/grivet.png', 'Grivet', '', 23),
(89, 'Public/Le-plateau/', 'Cercopithèque', '', 23),
(90, 'Public/Le-plateau/loupcriniere.png', 'Loup à crinière', '', 28),
(91, 'Public/Le-plateau/tamarin.jpg', 'Tamarin', '', 20),
(92, 'Public/Le-plateau/', 'Capucin', '', 21),
(93, 'Public/Le-plateau/', 'Gibbon', '', 22),
(94, 'Public/Le-plateau/ouistiti.jpg', 'Ouistiti', '', 22),
(95, 'Public/les-clairieres/', 'Marabout', '', 32),
(96, 'Public/les-clairieres/watusi.jpg', 'Watusi', '', 33),
(97, 'Public/les-clairieres/', 'Émeu', '', 42),
(98, 'Public/les-clairieres/bison.jpg', 'Bison', '', 45),
(99, 'Public/les-clairieres/dromadaire.jpg', 'Dromadaire', '', 46),
(100, 'Public/les-clairieres/', 'Flamant rose', '', 39),
(101, 'Public/les-clairieres/cigogne.jpg', 'Cigogne', '', 32),
(102, 'Public/les-clairieres/', 'Oryx algazelle', '', 33),
(103, 'Public/les-clairieres/', 'Âne de Somalie', '', 33),
(104, 'Public/les-clairieres/yack.jpg', 'Yack', '', 38),
(105, 'Public/les-clairieres/', 'Mouton noir', '', 38),
(106, 'Public/les-clairieres/', 'Ibis', '', 34),
(107, 'Public/les-clairieres/', 'Tortue', '', 34),
(108, 'Public/les-clairieres/pecari.jpg', 'Pécari', '', 37),
(109, 'Public/les-clairieres/tortue.jpg', 'Tortue', 'Tamanoir', '', 39),
(110, 'Public/les-clairieres/nandou.jpg', 'Nandou', '', 39),
(111, 'Public/les-clairieres/wallaby.jpg', 'Wallaby', '', 42),
(112, 'Public/les-clairieres/porcepic.jpg', 'Porc-épic', '', 44),
(113, 'Public/les-clairieres/', 'Âne de Provence', '', 46),
(114, 'Public/tiger.jpg', 'Tigre', '', 41),
(115, 'Public/les-clairieres/chiensbuissons.png', 'Chien des buissons', '', 40),
(116, 'Public/les-clairieres/serval.jpg', 'Serval', '', 36),
(117, 'Public/les-clairieres/lynx.jpg', 'Lynx', '', 35),
(118, 'Public/bois-pins-photo/antilope.jpeg', 'Antilope', '', 50),
(119, 'Public/bois-pins-photo/daim.jpg', 'Daim', '', 50),
(120, 'Public/bois-pins-photo/nilgaut.jpg', 'Nilgaut', '', 50),
(121, 'Public/bois-pins-photo/macaque-crabier.jpg', 'Crabier', '', 47),
(122, 'Public/bois-pins-photo/vautour.jpg', 'Vautour', '', 49),
(123, 'Public/bois-pins-photo/loup-europeen.jpg', 'Loup d\'Europe', '', 51),
(124, 'Public/bois-pins-photo/cerf.jpg', 'Cerf', '', 48),
(125, 'Public/Bergerie-des-reptiles/python.jpg', 'Python', '', 1),
(126, 'Public/vallon-cascades-photo/tortue.jpg', '', 1),
(127, 'Public/Bergerie-des-reptiles/iguane.jpg', 'Iguane', '', 1),
(128, 'Public/vallon-cascades-photo/', 'Panthère', '', 4),
(129, 'Public/vallon-cascades-photo/', 'Ara Parroquet', '', 2),
(130, 'Public/vallon-cascades-photo/', 'Grand Hocco', '', 3),
(131, 'Public/vallon-cascades-photo/panda-roux.jpg', 'Panda roux', '', 5),
(132, 'Public/vallon-cascades-photo/lemurien.jpg', 'Lémurien', '', 7),
(133, 'Public/vallon-cascades-photo/chevre-naine.jpg', 'Chèvre naine', '', 6),
(134, 'Public/vallon-cascades-photo/loutre.jpg', 'Loutre', '', 10),
(135, 'Public/vallon-cascades-photo/', 'Mouflon', '', 9),
(136, 'Public/vallon-cascades-photo/binturong.jpg', 'Binturong', '', 10);

-- Structure de la table `enclosures`
CREATE TABLE `enclosures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `biome` varchar(255) DEFAULT NULL,
  `status` enum('open','closed') DEFAULT 'open',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Données de la table `enclosures`
INSERT INTO `enclosures` (`id`, `name`, `description`, `biome`, `status`) VALUES
(1, 'A', 'Python, Tortue, Iguane', 'La Bergerie des reptiles', 'open'),
(2, 'V1', 'Ara Parroquet', 'Le Vallon des cascades', 'open'),
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
(43, 'C12', 'Future plaine d\'Afrique', 'Les Clairières', 'open'),
(44, 'C13', 'Porc-épic', 'Les Clairières', 'open'),
(45, 'C14', 'Bison', 'Les Clairières', 'open'),
(46, 'C15', 'Âne de Provence, Dromadaire', 'Les Clairières', 'open'),
(47, 'B1', 'Macaque, Crabier', 'Le bois des pins', 'open'),
(48, 'B2', 'Cerf', 'Le bois des pins', 'open'),
(49, 'B3', 'Vautour', 'Le bois des pins', 'open'),
(50, 'B4', 'Daim, Antilope, Nilgaut', 'Le bois des pins', 'open'),
(51, 'B5', 'Loup d\'Europe', 'Le bois des pins', 'open');


CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `enclosure_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `enclosure_id` (`enclosure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`enclosure_id`) REFERENCES `enclosures` (`id`) ON DELETE SET NULL;

ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`enclosure_id`) REFERENCES `enclosures` (`id`) ON DELETE CASCADE;

COMMIT;


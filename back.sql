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
(68, 'Public/Le-belvedere/oryx.jpg', 'Oryx beisa', '', 11),
(69, 'Public/le-belvedere/gazelle.jpg', 'Gazelle', '', 15),
(70, 'Public/Le-belvedere/autruche.jpg', 'Autruche', '', 15),
(71, 'Public/le-belvedere/gnou.jpg', 'Gnou', '', 11),
(72, 'Public/Le-belvedere/tapir.jpg', 'Tapir', '', 16),
(73, 'Public/Le-belvedere/coati.jpg', 'Coati', '', 14),
(74, 'Public/Le-belvedere/fennec.jpg', 'Fennec', '', 13),
(75, 'Public/Le-belvedere/rhinoceros.jpg', 'Rhinocéros', '', 11),
(76, 'Public/Le-belvedere/suricate.jpg', 'Suricate', '', 12),
(77, 'Public/Le-belvedere/crocodile.jpg', 'Crocodile nain', '', 19),
(78, 'Public/Le-belvedere/casoar.jpg', 'Casoar', '', 18),
(79, 'Public/Le-belvedere/guepard.jpg', 'Guépard', '', 17),
(80, 'Public/Le-belvedere/saimiri.jpg', 'Saïmiri', '', 14),
(81, 'Public/Le-plateau/lionne.jpg', 'Lion', 'Le lion ( Panthera leo), un mammifère carnivore de la famille des félidés, vit principalement dans les savanes, les prairies et les zones forestières d Afrique subsaharienne, avec une petite population en Inde (le lion d Asie). Il mesure entre 1,2 et 1,5 m au garrot, et de 1,7 à 2,5 m de longueur, pesant entre 120 et 190 kg pour les femelles et 150 à 250 kg pour les mâles. Sa durée de vie varie de 10 à 14 ans en milieu sauvage, et peut atteindre jusqu à 20 ans en captivité. La gestation dure 110 jours, avec 1 à 4 petits par portée. Le lion est un carnivore qui chasse des proies de taille moyenne à grande. Classé vulnérable (VU) par l UICN, l espèce est menacée principalement par la perte d habitat et le braconnage.', 31),
(82, 'Public/Le-plateau/Hippopotame.jpg', 'Hippopotame', '', 30),
(83, 'Public/Le-plateau/hyène.jpg', 'Hyène', '', 27),
(84, 'Public/Le-plateau/elephant.jpg', 'Éléphant', '', 26),
(85, 'Public/Le-plateau/plateau.jpg', 'Girafe', '', 25),
(86, 'Public/Le-plateau/varankomodo.jpg', 'Varan de Komodo', '', 24),
(87, 'Public/Le-plateau/zebre.jpg', 'Zèbre', '', 29),
(88, 'Public/Le-plateau/grivet.png', 'Grivet', '', 23),
(89, 'Public/Le-plateau/cerco.jpg', 'Cercopithèque', '', 23),
(90, 'Public/Le-plateau/loupcriniere.png', 'Loup à crinière', '', 28),
(91, 'Public/Le-plateau/tamarin.jpg', 'Tamarin', '', 20),
(92, 'Public/Le-plateau/capucin.jpg', 'Capucin', '', 21),
(93, 'Public/Le-plateau/gibbon.jpg', 'Gibbon', '', 22),
(94, 'Public/Le-plateau/ouistiti.jpg', 'Ouistiti', 'Louistiti commun ( Callithrix jacchus), un primate de la famille des callitrichidés, vit principalement dans les forêts tropicales et sèches du Brésil. Il mesure entre 18 et 25 cm sans la queue et pèse de 300 à 500 g. Sa durée de vie varie de 10 à 12 ans en milieu sauvage, mais peut atteindre jusqu à 18 ans en captivité. La gestation dure environ 5 mois, donnant naissance à 2 petits par portée. Omnivore, il se nourrit de fruits, d insectes et de petits vertébrés. Classé *préoccupation mineure* (LC) par l UICN, il n est pas actuellement en danger.', 22),
(95, 'Public/les-clairieres/marabout.jpg', 'Marabout', '', 32),
(96, 'Public/les-clairieres/watusi.jpg', 'Watusi', '', 33),
(97, 'Public/les-clairieres/emeu.jpg', 'Émeu', '', 42),
(98, 'Public/les-clairieres/bison.jpg', 'Bison', '', 45),
(99, 'Public/les-clairieres/dromadaire.jpg', 'Dromadaire', '', 46),
(100, 'Public/les-clairieres/flamant.jpg', 'Flamant rose', '', 39),
(101, 'Public/les-clairieres/cigogne.jpg', 'Cigogne', '', 32),
(102, 'Public/les-clairieres/oryx.jpg', 'Oryx algazelle', '', 33),
(103, 'Public/les-clairieres/ane.jpg', 'Âne de Somalie', '', 33),
(104, 'Public/les-clairieres/yack.jpg', 'Yack', '', 38),
(105, 'Public/les-clairieres/mouton.jpg', 'Mouton noir', '', 38),
(106, 'Public/les-clairieres/ibis.jpg', 'Ibis', '', 34),
(107, 'Public/les-clairieres/tortue.jpg', 'Tortue', 'La tortue d’Hermann (Testudo hermanni), un reptile de l’ordre des testudinates et de la famille des testudinidés, est une espèce terrestre originaire des régions méditerranéennes, du sud-est de l’Europe et d’Afrique du Nord. Avec une taille de 20 à 30 cm et un poids de 1 à 3 kg, cette tortue herbivore se nourrit principalement de plantes, feuilles et fleurs. Elle vit généralement entre 50 et 100 ans, pond 3 à 6 œufs par portée après une gestation de 60 à 90 jours, et habite les prairies, forêts ouvertes et zones arides. Son statut UICN est quasi menacé (NT).', 34),
(108, 'Public/les-clairieres/pecari.jpg', 'Pécari', '', 37),
(109, 'Public/les-clairieres/tamanoir.jpg', 'Tamanoir', '', 39),
(110, 'Public/les-clairieres/nandou.jpg', 'Nandou', '', 39),
(111, 'Public/les-clairieres/wallaby.jpg', 'Wallaby', '', 42),
(112, 'Public/les-clairieres/porcepic.jpg', 'Porc-épic', '', 44),
(113, 'Public/les-clairieres/anne.jpg', 'Âne de Provence', '', 46),
(114, 'Public/tiger.jpg', 'Tigre', '', 41),
(115, 'Public/les-clairieres/chiensbuissons.png', 'Chien des buissons', '', 40),
(116, 'Public/les-clairieres/serval.jpg', 'Serval', '', 36),
(117, 'Public/les-clairieres/lynx.jpg', 'Lynx', '', 35),
(118, 'Public/bois-pins-photo/antilope.jpeg', 'Antilope', 'Les antilopes, appartenant à la classe des mammifères, à l’ordre des artiodactyles et à la famille des bovidés, regroupent des espèces variées comme l antilope saïga et l antilope d Afrique. Ces herbivores se nourrissent principalement d’herbes, feuilles et pâturages. Originaires des savanes, plaines et zones semi-arides d’Afrique, d’Asie et de certaines régions d’Europe, elles mesurent entre 0,6 et 1,5 m au garrot et pèsent de 20 à 300 kg selon les espèces. Leur durée de vie est de 10 à 20 ans en milieu sauvage, et les femelles donnent naissance à 1 ou 2 petits après environ 180 jours de gestation. Le statut UICN varie selon les espèces, allant de vulnérable à en danger.', 50),
(119, 'Public/bois-pins-photo/daim.jpg', 'Daim', 'Le daim (Dama dama), un mammifère de l’ordre des artiodactyles et de la famille des cervidés, est un herbivore originaire dEurope et d Asie mineure. Il vit dans les forêts mixtes, prairies et parcs, où il se nourrit principalement d herbes, feuilles, fruits et écorces. Mesurant entre 0,8 et 1,0 m au garrot et pesant de 30 à 100 kg, il a une durée de vie de 12 à 16 ans en milieu sauvage. La gestation dure environ 230 jours et donne naissance à 1 ou 2 petits par portée. Classé comme de préoccupation mineure par l UICN, l espèce est cependant sensible à la dégradation de son habitat.', 50),
(120, 'Public/bois-pins-photo/nilgaut.jpg', 'Nilgaut', 'Le nilgaut (Boselaphus tragocamelus), également connu sous le nom d antilope bleue, est un mammifère de l’ordre des artiodactyles et de la famille des bovidés. Originaire du sous-continent indien, il habite les plaines ouvertes, prairies et forêts claires. Cet herbivore, qui se nourrit principalement d’herbes, feuilles et jeunes pousses, mesure entre 1,2 et 1,5 m au garrot pour un poids de 100 à 300 kg. Sa durée de vie en milieu sauvage est de 12 à 15 ans, et les femelles mettent bas 1 à 2 petits après une gestation d’environ 240 jours. Actuellement, le nilgaut est classé comme étant de préoccupation mineure par l’UICN.', 50),
(121, 'Public/bois-pins-photo/macaque-crabier.jpg', 'Crabier', 'Le macaque à longue queue (Macaca fascicularis), un mammifère de l’ordre des primates et de la famille des cercopithécidés, est une espèce omnivore se nourrissant de fruits, insectes et petits crustacés. Originaire des forêts tropicales, mangroves et zones humides d’Asie du Sud-Est (Philippines, Indonésie, Malaisie), il mesure entre 40 et 60 cm de longueur pour un poids de 3 à 9 kg selon le sexe. Avec une durée de vie de 20 à 30 ans en milieu sauvage, les femelles donnent naissance à un petit après une gestation de 160 à 170 jours. Actuellement, cette espèce est classée comme étant de préoccupation mineure (LC) par l’UICN.', 47),
(122, 'Public/bois-pins-photo/vautour.jpg', 'Vautour', 'Les vautours, appartenant à l ordre des accipitriformes et à la famille des accipitridés, sont des oiseaux nécrophages qui se nourrissent principalement de carcasses d animaux. Originaires d Europe, d Asie et d Afrique, ces rapaces mesurent entre 2 et 3 mètres d envergure pour un poids de 5 à 12 kg. Leur durée de vie en milieu sauvage est de 20 à 30 ans, et la période de nidification dure environ 50 jours, avec généralement un jeune par ponte. Ils habitent les montagnes, falaises et régions arides. Le statut UICN des vautours varie selon l espèce, allant de quasi menacé à en danger critique.', 49),
(123, 'Public/bois-pins-photo/loup-europeen.jpg', 'Loup d Europe', 'Le loup européen (Canis lupus lupus), un mammifère de l’ordre des carnivores et de la famille des canidés, est une sous-espèce du loup gris. Mesurant entre 0,6 et 0,8 m au garrot pour un poids de 25 à 40 kg, il vit de 6 à 8 ans en milieu sauvage et jusqu’à 16 ans en captivité. Carnivore, il se nourrit principalement d’ongulés, de petits mammifères et, occasionnellement, de fruits. Originaire des forêts, montagnes, plaines et toundras d’Europe et d’Eurasie, la femelle met bas 4 à 6 petits après une gestation d’environ 63 jours. Classé de préoccupation mineure par l’UICN, il reste néanmoins vulnérable dans certaines régions en raison de la chasse et de la fragmentation de son habitat.', 51),
(124, 'Public/bois-pins-photo/cerf.jpg', 'Cerf', 'Le cerf élaphe (Cervus elaphus), un mammifère de l’ordre des artiodactyles et de la famille des cervidés, est une espèce herbivore se nourrissant de feuilles, herbes et rameaux. Originaire des forêts tempérées, prairies et zones montagneuses d’Europe, d’Asie et d’Amérique du Nord, il mesure entre 1,2 et 1,5 m au garrot et pèse de 100 à 300 kg selon les régions. Sa durée de vie en milieu sauvage est de 10 à 15 ans, et les femelles mettent bas un seul faon après une gestation de 230 jours. Le cerf élaphe est actuellement classé comme étant de préoccupation mineure (LC) par l’UICN.', 48),
(125, 'Public/Bergerie-des-reptiles/python.jpg', 'Python', 'Le python sebae, un reptile appartenant à l ordre des squamates et à la famille des boidés, est l un des plus grands serpents d Afrique, mesurant entre 4 et 6 mètres pour un poids de 50 à 70 kg. Originaire des forêts tropicales humides d Afrique centrale et occidentale, ce carnivore se nourrit principalement de mammifères et d oiseaux. Il a une espérance de vie de 20 à 30 ans en captivité, une période de gestation de 90 à 100 jours, et pond 20 à 40 œufs par portée. Actuellement, l espèce est classée comme non menacée (LC) par l UICN.', 1),
(126, 'Public/vallon-cascades-photo/tortue2.jpg', 'Tortue', 'La tortue d’Hermann (Testudo hermanni), un reptile de l’ordre des testudinates et de la famille des testudinidés, est une espèce terrestre originaire des régions méditerranéennes, du sud-est de l’Europe et d’Afrique du Nord. Avec une taille de 20 à 30 cm et un poids de 1 à 3 kg, cette tortue herbivore se nourrit principalement de plantes, feuilles et fleurs. Elle vit généralement entre 50 et 100 ans, pond 3 à 6 œufs par portée après une gestation de 60 à 90 jours, et habite les prairies, forêts ouvertes et zones arides. Son statut UICN est quasi menacé (NT).', 1),
(127, 'Public/Bergerie-des-reptiles/iguane.jpg', 'Iguane', 'L iguane vert (Iguana iguana), un reptile de l’ordre des squamates et de la famille des iguanidés, est une espèce herbivore originaire des forêts tropicales humides d’Amérique centrale et du Sud. Mesurant entre 1,5 et 2 mètres de longueur pour un poids de 4 à 5 kg, il se nourrit principalement de feuilles, fleurs et fruits. En captivité, il vit généralement entre 20 et 30 ans, avec une gestation de 2 à 3 mois et des portées de 20 à 40 œufs. Actuellement, cette espèce est classée comme non menacée (LC) par l’UICN.', 1),
(128, 'Public/vallon-cascades-photo/panthere.jpg', 'Panthère', '', 4),
(129, 'Public/vallon-cascades-photo/ara.jpg', 'Ara Perroquet', '', 2),
(130, 'Public/vallon-cascades-photo/grandhocco.jpg', 'Grand Hocco', '', 3),
(131, 'Public/vallon-cascades-photo/panda-roux.jpg', 'Panda roux', 'Le panda roux (Ailurus fulgens), un mammifère de l ordre des carnivores et de la famille des ailuridés, est un omnivore originaire des forêts d haute montagne et des zones forestières de l Himalaya, de la Chine, du Népal et du Bhoutan. Mesurant entre 50 et 64 cm de long pour un poids de 3 à 6 kg, il vit généralement de 8 à 10 ans en milieu sauvage. Il se nourrit principalement de bambou, mais aussi de fruits et d insectes. Sa gestation dure entre 120 et 150 jours, avec une portée de 1 à 4 petits. Actuellement, l espèce est classée en danger par l UICN.', 5),
(132, 'Public/vallon-cascades-photo/lemurien.jpg', 'Lémurien', 'Le lémurien (Lemur spp.), un primate de la famille des lémuriidés, est une espèce omnivore originaire des forêts de Madagascar. Mesurant entre 40 et 60 cm de long pour un poids de 2 à 4 kg, il vit de 20 à 30 ans en milieu sauvage. Son régime alimentaire est varié, composé de fruits, feuilles et insectes. La gestation dure entre 60 et 70 jours, donnant naissance à 1 ou 2 petits par portée. Le lémurien est une espèce emblématique de Madagascar, où il occupe les forêts tropicales de l île.', 7),
(133, 'Public/vallon-cascades-photo/chevre-naine.jpg', 'Chèvre naine', 'La chèvre (Capra hircus), un mammifère de l ordre des artiodactyles et de la famille des bovidés, est un herbivore originaire d Afrique, d Asie et d Europe. Elle vit dans les prairies et les collines, où elle se nourrit principalement d herbes et de feuilles. Mesurant entre 40 et 50 cm de hauteur et pesant de 15 à 30 kg, elle a une durée de vie de 10 à 15 ans. La gestation dure environ 150 jours, et les femelles mettent bas de 1 à 3 chevreaux par portée. La chèvre est classée comme quasi menacée (NT) par l UICN, en raison des menaces liées à la perte d habitat et à la pression de la domestication.', 6),
(134, 'Public/vallon-cascades-photo/loutre.jpg', 'Loutre', 'La loutre européenne (Lutra lutra), un mammifère carnivore de la famille des mustélidés, vit principalement dans les rivières, lacs et littoraux d Europe et d Asie. Elle mesure entre 90 et 130 cm de longueur et pèse entre 7 et 12 kg. Son régime alimentaire est composé principalement de poissons et de crustacés. La loutre européenne a une durée de vie de 10 à 15 ans, et la gestation dure entre 60 et 65 jours, donnant naissance à 1 à 5 petits par portée. Classée *moins préoccupante* (LC) par l UICN, elle n est pas actuellement menacée, bien que ses populations soient parfois fragilisées par la pollution et la dégradation de son habitat.', 10),
(135, 'Public/vallon-cascades-photo/mouflon.jpeg', 'Mouflon', '', 9),
(136, 'Public/vallon-cascades-photo/binturong.jpg', 'Binturong', 'Le binturong (Arctictis binturong), un mammifère carnivore de la famille des viverridés, est un omnivore originaire des forêts humides d Asie du Sud-Est. Il mesure entre 60 et 95 cm de longueur et pèse de 9 à 20 kg. Sa durée de vie en milieu sauvage est de 20 à 25 ans. La gestation dure entre 90 et 100 jours, avec 1 à 3 petits par portée. Son régime alimentaire est varié, comprenant des fruits, des insectes et des œufs. L espèce est classée *vulnérable* (VU) par l UICN, en raison de la déforestation et de la chasse illégale qui menacent ses populations.', 10);

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


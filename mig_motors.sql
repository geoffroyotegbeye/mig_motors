-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 25 mars 2026 à 23:05
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mig_motors`
--

-- --------------------------------------------------------

--
-- Structure de la table `Admin`
--

CREATE TABLE `Admin` (
  `id` int(11) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Admin`
--

INSERT INTO `Admin` (`id`, `username`, `password`, `createdAt`) VALUES
(1, 'admin', '$2b$10$jEPdNA2sUvHgkxC8iFWsOe5EGsFAQpid5gdm4nQip8a05TdM/F8F6', '2026-03-25 05:21:34.843');

-- --------------------------------------------------------

--
-- Structure de la table `Marque`
--

CREATE TABLE `Marque` (
  `id` int(11) NOT NULL,
  `nom` varchar(191) NOT NULL,
  `logo` text DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Marque`
--

INSERT INTO `Marque` (`id`, `nom`, `logo`, `type`, `description`, `createdAt`) VALUES
(1, 'KIA', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774419056/mig-motors/marques/kia.png', 'Berlines & SUV', 'Leader mondial de l\'innovation automobile.', '2026-03-25 05:21:34.863'),
(2, 'MERCEDES', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774419058/mig-motors/marques/mercedes.png', 'Luxe & Premium', 'L\'incarnation du luxe automobile allemand.', '2026-03-25 05:21:34.865'),
(3, 'FIAT', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774419059/mig-motors/marques/fiat.png', 'Citadines', 'Le charme et l\'ingéniosité italienne.', '2026-03-25 05:21:34.868'),
(4, 'FUSO', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774473424/mig-motors/marques/fuso.svg', 'Camions & Utilitaires', 'Camions robustes pour conditions exigeantes.', '2026-03-25 05:21:34.875'),
(5, 'PIAGGIO', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774473426/mig-motors/marques/piaggio.svg', 'Deux-roues', 'Mobilité urbaine élégante à l\'italienne.', '2026-03-25 05:21:34.876'),
(6, 'KAIYI', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774473584/mig-motors/marques/kaiyi.svg', 'Berlines & SUV', 'L\'avenir de l\'automobile chinoise.', '2026-03-25 05:21:34.877'),
(7, 'ASHOK LEYLAND', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774473587/mig-motors/marques/ashok-leyland.svg', 'Poids lourds & Bus', 'Solutions de transport fiables.', '2026-03-25 05:21:34.878'),
(8, 'JEEP', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774419062/mig-motors/marques/jeep.png', 'SUV', 'Transport confortable tout-terrain.', '2026-03-25 05:21:34.879');

-- --------------------------------------------------------

--
-- Structure de la table `Message`
--

CREATE TABLE `Message` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `subject` varchar(191) NOT NULL,
  `brand` varchar(191) DEFAULT NULL,
  `message` text NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Message`
--

INSERT INTO `Message` (`id`, `name`, `email`, `phone`, `subject`, `brand`, `message`, `read`, `createdAt`) VALUES
(1, 'Isabelle Savage', 'dinedoka@mailinator.com', '+1 (595) 935-7248', 'Mollit quae unde sun', 'ASHOK LEYLAND', 'Alias quisquam repud', 1, '2026-03-25 21:38:40.509');

-- --------------------------------------------------------

--
-- Structure de la table `Vehicule`
--

CREATE TABLE `Vehicule` (
  `id` int(11) NOT NULL,
  `marqueId` int(11) NOT NULL,
  `nom` varchar(191) NOT NULL,
  `prix` varchar(191) NOT NULL,
  `annee` varchar(191) NOT NULL,
  `carburant` varchar(191) NOT NULL,
  `transmission` varchar(191) NOT NULL,
  `couleur` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `statut` enum('disponible','vendu','reserve') NOT NULL DEFAULT 'disponible',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `Vehicule`
--

INSERT INTO `Vehicule` (`id`, `marqueId`, `nom`, `prix`, `annee`, `carburant`, `transmission`, `couleur`, `description`, `image`, `statut`, `createdAt`) VALUES
(1, 1, 'KIA Sportage', '18 500 000', '2024', 'Essence', 'Automatique', 'Blanc', 'SUV compact moderne avec technologie avancée.', 'https://images.unsplash.com/photo-1617531653332-bd46c24f2068?w=800&q=80', 'disponible', '2026-03-25 05:21:34.883'),
(2, 1, 'KIA Picanto', '9 200 000', '2024', 'Essence', 'Manuelle', 'Rouge', 'Citadine économique et agile.', 'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=800&q=80', 'disponible', '2026-03-25 05:21:34.884'),
(3, 2, 'Mercedes Classe C', '45 000 000', '2023', 'Diesel', 'Automatique', 'Noir', 'Berline de luxe par excellence.', 'https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=800&q=80', 'disponible', '2026-03-25 05:21:34.885'),
(4, 3, 'Fiat 500', '8 900 000', '2023', 'Essence', 'Automatique', 'Bleu', 'Icône du style italien.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774472535/mig-motors/hyaxthocyqidawsah9yp.jpg', 'disponible', '2026-03-25 05:21:34.886'),
(5, 1, 'KIA Sorento', '22 500 000', '2024', 'Essence', 'Automatique', 'Blanc', 'SUV familial 7 places, spacieux et confortable.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474025/mig-motors/vehicules/kia-sorento.jpg', 'disponible', '2026-03-25 21:27:05.610'),
(6, 1, 'KIA Seltos', '16 800 000', '2024', 'Essence', 'Automatique', 'Gris', 'SUV compact moderne avec technologie avancée.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474026/mig-motors/vehicules/kia-seltos.jpg', 'disponible', '2026-03-25 21:27:06.894'),
(7, 1, 'KIA Stinger', '28 000 000', '2023', 'Essence', 'Automatique', 'Noir', 'Berline sportive haute performance.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474027/mig-motors/vehicules/kia-stinger.jpg', 'disponible', '2026-03-25 21:27:07.736'),
(8, 2, 'Mercedes GLE', '65 000 000', '2024', 'Diesel', 'Automatique', 'Noir', 'SUV de luxe alliant puissance et raffinement.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474028/mig-motors/vehicules/mercedes-gle.jpg', 'disponible', '2026-03-25 21:27:08.361'),
(9, 2, 'Mercedes Classe E', '55 000 000', '2024', 'Essence', 'Automatique', 'Argent', 'Berline executive au summum du luxe.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474028/mig-motors/vehicules/mercedes-classe-e.jpg', 'disponible', '2026-03-25 21:27:09.138'),
(10, 2, 'Mercedes GLC', '48 000 000', '2023', 'Hybride', 'Automatique', 'Blanc', 'SUV compact premium avec motorisation hybride.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474029/mig-motors/vehicules/mercedes-glc.jpg', 'disponible', '2026-03-25 21:27:09.892'),
(11, 2, 'Mercedes Classe A', '32 000 000', '2023', 'Essence', 'Automatique', 'Rouge', 'Compacte premium sportive et connectée.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474030/mig-motors/vehicules/mercedes-classe-a.jpg', 'disponible', '2026-03-25 21:27:10.976'),
(12, 3, 'Fiat Tipo', '12 500 000', '2023', 'Essence', 'Manuelle', 'Blanc', 'Berline pratique et économique au quotidien.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474031/mig-motors/vehicules/fiat-tipo.jpg', 'disponible', '2026-03-25 21:27:11.690'),
(13, 3, 'Fiat Doblo', '14 000 000', '2023', 'Diesel', 'Manuelle', 'Gris', 'Monospace polyvalent idéal pour la famille.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474032/mig-motors/vehicules/fiat-doblo.jpg', 'disponible', '2026-03-25 21:27:12.918'),
(14, 3, 'Fiat Ducato', '18 000 000', '2024', 'Diesel', 'Manuelle', 'Blanc', 'Fourgon utilitaire robuste grande capacité.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474033/mig-motors/vehicules/fiat-ducato.jpg', 'disponible', '2026-03-25 21:27:14.049'),
(15, 4, 'Fuso Canter', '35 000 000', '2024', 'Diesel', 'Manuelle', 'Blanc', 'Camion léger fiable pour la livraison urbaine.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474034/mig-motors/vehicules/fuso-canter.jpg', 'disponible', '2026-03-25 21:27:14.921'),
(16, 4, 'Fuso Fighter', '55 000 000', '2023', 'Diesel', 'Manuelle', 'Blanc', 'Camion moyen tonnage pour transport de marchandises.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474035/mig-motors/vehicules/fuso-fighter.jpg', 'disponible', '2026-03-25 21:27:15.688'),
(17, 4, 'Fuso Super Great', '95 000 000', '2024', 'Diesel', 'Automatique', 'Blanc', 'Poids lourd haute performance pour longue distance.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474036/mig-motors/vehicules/fuso-super-great.jpg', 'disponible', '2026-03-25 21:27:16.419'),
(18, 5, 'Piaggio Vespa GTS', '4 500 000', '2024', 'Essence', 'Automatique', 'Rouge', 'Scooter iconique alliant style et performance.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474037/mig-motors/vehicules/piaggio-vespa-gts.jpg', 'disponible', '2026-03-25 21:27:17.508'),
(19, 5, 'Piaggio MP3', '6 800 000', '2023', 'Essence', 'Automatique', 'Gris', 'Trois-roues unique pour une stabilité maximale.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474038/mig-motors/vehicules/piaggio-mp3.jpg', 'disponible', '2026-03-25 21:27:18.209'),
(20, 5, 'Piaggio Ape', '3 200 000', '2024', 'Essence', 'Manuelle', 'Jaune', 'Tricycle utilitaire parfait pour le commerce.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474038/mig-motors/vehicules/piaggio-ape.jpg', 'disponible', '2026-03-25 21:27:18.947'),
(21, 6, 'Kaiyi X3', '13 500 000', '2024', 'Essence', 'Automatique', 'Blanc', 'SUV compact moderne au rapport qualité-prix imbattable.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474039/mig-motors/vehicules/kaiyi-x3.jpg', 'disponible', '2026-03-25 21:27:19.585'),
(22, 6, 'Kaiyi E5', '11 000 000', '2024', 'Essence', 'Automatique', 'Gris', 'Berline familiale spacieuse et économique.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474040/mig-motors/vehicules/kaiyi-e5.png', 'disponible', '2026-03-25 21:27:20.619'),
(23, 6, 'Kaiyi X7', '17 000 000', '2024', 'Essence', 'Automatique', 'Noir', 'Grand SUV 7 places pour toute la famille.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474041/mig-motors/vehicules/kaiyi-x7.jpg', 'disponible', '2026-03-25 21:27:21.391'),
(24, 7, 'Ashok Leyland Dost', '28 000 000', '2024', 'Diesel', 'Manuelle', 'Blanc', 'Camionnette légère robuste pour transport de marchandises.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474042/mig-motors/vehicules/ashok-leyland-dost.jpg', 'disponible', '2026-03-25 21:27:22.448'),
(25, 7, 'Ashok Leyland Bus 12m', '85 000 000', '2023', 'Diesel', 'Manuelle', 'Blanc', 'Bus 50 places idéal pour le transport urbain.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474043/mig-motors/vehicules/ashok-leyland-bus-12m.jpg', 'disponible', '2026-03-25 21:27:23.281'),
(26, 7, 'Ashok Leyland Ecomet', '42 000 000', '2024', 'Diesel', 'Manuelle', 'Blanc', 'Camion moyen tonnage économique et fiable.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474043/mig-motors/vehicules/ashok-leyland-ecomet.jpg', 'disponible', '2026-03-25 21:27:23.977'),
(27, 8, 'Jeep Wrangler', '45 000 000', '2024', 'Essence', 'Automatique', 'Vert', 'Le 4x4 légendaire, imbattable en tout-terrain.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474044/mig-motors/vehicules/jeep-wrangler.jpg', 'disponible', '2026-03-25 21:27:24.996'),
(28, 8, 'Jeep Grand Cherokee', '58 000 000', '2024', 'Diesel', 'Automatique', 'Noir', 'SUV premium alliant luxe et capacités off-road.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474045/mig-motors/vehicules/jeep-grand-cherokee.jpg', 'disponible', '2026-03-25 21:27:25.805'),
(29, 8, 'Jeep Compass', '32 000 000', '2024', 'Essence', 'Automatique', 'Blanc', 'SUV compact aventurier pour la ville et la nature.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474046/mig-motors/vehicules/jeep-compass.jpg', 'disponible', '2026-03-25 21:27:26.558'),
(30, 8, 'Jeep Renegade', '24 000 000', '2023', 'Essence', 'Automatique', 'Orange', 'Petit SUV au caractère affirmé et au style unique.', 'https://res.cloudinary.com/drtfctuw7/image/upload/v1774474047/mig-motors/vehicules/jeep-renegade.jpg', 'disponible', '2026-03-25 21:27:27.251');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Admin_username_key` (`username`);

--
-- Index pour la table `Marque`
--
ALTER TABLE `Marque`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Marque_nom_key` (`nom`);

--
-- Index pour la table `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Vehicule`
--
ALTER TABLE `Vehicule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Vehicule_marqueId_fkey` (`marqueId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Marque`
--
ALTER TABLE `Marque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `Message`
--
ALTER TABLE `Message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Vehicule`
--
ALTER TABLE `Vehicule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Vehicule`
--
ALTER TABLE `Vehicule`
  ADD CONSTRAINT `Vehicule_marqueId_fkey` FOREIGN KEY (`marqueId`) REFERENCES `Marque` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

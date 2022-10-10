-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 23 avr. 2022 à 03:39
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `azoki`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `recolte` varchar(255) NOT NULL,
  `itemrecolte` varchar(255) NOT NULL,
  `traitement` varchar(255) NOT NULL,
  `itemtraitement` varchar(255) NOT NULL,
  `vente` varchar(255) NOT NULL,
  `PrixVente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('property_dirtycash', 'Argent Sale Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_armenien', 'Les Arménien', 1),
('society_armeniens', 'Armeniens', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_ballas', 'Ballas', 1),
('society_blancos', 'Los Blancos', 1),
('society_bloods', 'Bloods', 1),
('society_cali', 'Cartel de Cali', 1),
('society_carshop', 'Concessionnaire Voitures', 1),
('society_cartelcali', 'Cartel De Cali', 1),
('society_carteldecali', 'Cartel De Cali', 1),
('society_cayo', 'Cartel de Cayo', 1),
('society_cosanostra', 'Costra Nostra', 1),
('society_crips', 'Crips', 1),
('society_families', 'Families', 1),
('society_famillies', 'Famillies', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_journalist', 'Journaliste', 1),
('society_lost', 'Lost MC', 1),
('society_lscustom', 'Mechanic', 1),
('society_madrazo', 'Madrazo', 1),
('society_marabunta', 'Marabunta', 1),
('society_marseillais', 'Les Marseillais', 1),
('society_mecano', 'Mécano', 1),
('society_motoshop', 'Concessionnaire Motos', 1),
('society_planeshop', 'Concessionnaire Avions', 1),
('society_police', 'Police', 1),
('society_punisher2', 'Punisher2', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_rockford', 'Rockfords studio', 1),
('society_sheriff', 'Sheriff', 1),
('society_soa', 'SOA', 1),
('society_swhite', 'Swhite', 1),
('society_tabac', 'Tabac', 1),
('society_taxi', 'Taxi', 1),
('society_testtest', 'testtest', 1),
('society_unicorn', 'Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1),
('trunk_dirtycash', 'Argent Sale Coffre Véhicule', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(103, 'society_carshop', 2173225, NULL),
(128, 'society_mecano', 665761.0500000007, NULL),
(132, 'society_police', 8602299, NULL),
(479, 'society_motoshop', 448284, NULL),
(483, 'society_tabac', 406929, NULL),
(516, 'society_taxi', 464760.60000000166, NULL),
(675, 'society_gouvernement', 1202848, NULL),
(2854, 'society_cosanostra', 1, NULL),
(4741, 'society_planeshop', 5239200, NULL),
(5001, 'society_cartelcali', 50000, NULL),
(5135, 'society_armenien', 11499, NULL),
(5158, 'society_carteldecali', 14595500, NULL),
(7201, 'society_bahamas', 340, NULL),
(15135, 'society_vigne', 5, NULL),
(15555, 'society_unicorn', 150132, NULL),
(17904, 'society_ambulance', 78000, NULL),
(19115, 'society_lscustom', 2000, NULL),
(19836, 'society_famillies', 0, NULL),
(19837, 'society_lost', 0, NULL),
(19838, 'society_blancos', 0, NULL),
(19839, 'society_journalist', 0, NULL),
(19840, 'society_madrazo', 0, NULL),
(19841, 'society_crips', 0, NULL),
(19842, 'society_marabunta', 0, NULL),
(19843, 'society_families', 0, NULL),
(19844, 'society_marseillais', 0, NULL),
(19845, 'society_cayo', 0, NULL),
(19846, 'society_ballas', 0, NULL),
(19847, 'society_cali', 0, NULL),
(19848, 'society_bloods', 0, NULL),
(19849, 'society_soa', 0, NULL),
(19850, 'society_swhite', 0, NULL),
(19851, 'society_punisher2', 0, NULL),
(19852, 'society_realestateagent', 0, NULL),
(19853, 'society_rockford', 0, NULL),
(19854, 'society_sheriff', 0, NULL),
(19855, 'society_testtest', 0, NULL),
(19856, 'society_vagos', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_armenien', 'Les Arménien', 1),
('society_armeniens', 'Armeniens', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_bahamas_fridge', 'Bahamas (frigo)', 1),
('society_ballas', 'Ballas', 1),
('society_blancos', 'Los Blancos', 1),
('society_bloods', 'Bloods', 1),
('society_cali', 'Cartel de Cali', 1),
('society_carshop', 'Concessionnaire Voitures', 1),
('society_cartelcali', 'Cartel De Cali', 1),
('society_carteldecali', 'Cartel De Cali', 1),
('society_cayo', 'Cartel de Cayo', 1),
('society_cosanostra', 'Costra Nostra', 1),
('society_crips', 'Crips', 1),
('society_families', 'Families', 1),
('society_famillies', 'Famillies', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_journalist', 'Journaliste', 1),
('society_lost', 'Lost MC', 1),
('society_lscustom', 'LS Custom', 1),
('society_madrazo', 'Madrazo', 1),
('society_marabunta', 'Marabunta', 1),
('society_marseillais', 'Les Marseillais', 1),
('society_mecano', 'Mécano', 1),
('society_motoshop', 'Concessionnaire Motos', 1),
('society_planeshop', 'Concessionnaire Avions', 1),
('society_police', 'Police', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_rockford', 'Rockfords studio', 1),
('society_sheriff', 'Sheriff', 1),
('society_soa', 'SOA', 1),
('society_swhite', 'Swhite', 1),
('society_tabac', 'Tabac', 1),
('society_taxi', 'Taxi', 1),
('society_testtest', 'testtest', 1),
('society_unicorn', 'Unicorn', 1),
('society_unicorn_fridge', 'Unicorn (frigo)', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1),
('trunk', 'Coffre Véhicule', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(1, 'society_police', 'police_cuff', 8, NULL),
(2, 'society_police', 'police_key', 7, NULL),
(7, 'trunk', 'weed_pooch', 100, ' TBC699 '),
(8, 'trunk', 'eewenlpb', 1, '85VRJ182'),
(9, 'trunk', 'vittvin', 49, '85VRJ182'),
(15, 'trunk', 'bandage', 10, 'LSMC6064'),
(27, 'trunk', 'raisin', 100, 'VIGN1132'),
(29, 'trunk', 'grand_cru', 144, 'XYBQ0083'),
(37, 'trunk', 'grand_cru', 15, 'QNOR9858'),
(38, 'trunk', 'raisin', 378, 'QNOR9858'),
(39, 'trunk', 'armor', 20, 'FJOG0742'),
(41, 'society_police', 'weed', 48, NULL),
(42, 'society_police', 'phone', 30, NULL),
(43, 'society_police', 'radio', 42, NULL),
(44, 'society_police', 'bread', 29, NULL),
(55, 'trunk', 'tabacblond', 390, ' TBC881 '),
(57, 'society_vagos', 'coke', 106, NULL),
(59, 'trunk', 'vine', 463, '63DYR448'),
(60, 'trunk', 'grand_cru', 16, '63DYR448'),
(66, 'society_cosanostra', 'weed', 15, NULL),
(67, 'society_cosanostra', 'opium', 4, NULL),
(68, 'society_cosanostra', 'weed_pooch', 7, NULL),
(72, 'trunk', 'weed', 240, '84NYG568'),
(73, 'trunk', 'tabacblond', 80, 'TITEUFF '),
(74, 'trunk', 'tabacblond', 160, '62NGJ119'),
(75, 'trunk', 'raisin', 337, 'TITEUFF '),
(78, 'trunk', 'grand_cru', 1008, 'HVLV9687'),
(93, 'society_cartelcali', 'bandage', 4, NULL),
(95, 'trunk', 'grand_cru', 369, 'SOXO5043'),
(100, 'trunk', 'raisin', 500, 'HVLV9687'),
(101, 'trunk', 'vine', 40, 'HVLV9687'),
(102, 'trunk', 'raisin', 1900, '06IYP385'),
(103, 'trunk', 'raisin', 597, '40SHU721'),
(104, 'trunk', 'fixkit', 4, '40SHU721'),
(107, 'society_carteldecali', 'grand_cru', 400, NULL),
(111, 'trunk', 'vine', 259, 'SOXO5043'),
(112, 'trunk', 'vine', 1660, 'HPUC5998'),
(115, 'trunk', 'grand_cru', 141, '  NOAT  '),
(117, 'trunk', 'vine', 1976, '  NOAT  '),
(120, 'trunk', 'jus_raisin', 2318, 'HVLV9687'),
(122, 'trunk', 'coke', 15, 'SOXO5043'),
(123, 'trunk', 'raisin', 3, 'COQN0477'),
(125, 'trunk', 'coke', 29, '1999999 '),
(126, 'society_police', 'opium_pooch', 33, NULL),
(127, 'society_police', 'weed_pooch', 6, NULL),
(132, 'trunk', 'opium_pooch', 3, 'HVLV9687'),
(134, 'trunk', 'weed', 1, 'HVLV9687'),
(138, 'trunk', 'jus_raisin', 2524, '83VXO682'),
(139, 'trunk', 'grand_cru', 515, '83VXO682'),
(143, 'society_carteldecali', 'bandage', 10, NULL),
(147, 'society_carteldecali', 'raisin', 4, NULL),
(149, 'society_carteldecali', 'jus_raisin', 51, NULL),
(150, 'trunk', 'coke_pooch', 2, '  LIL   '),
(151, 'trunk', 'weed_pooch', 1, '  LIL   '),
(152, 'trunk', 'vine', 1, '  LIL   '),
(153, 'society_carteldecali', 'fixkit', 90, NULL),
(154, 'society_carteldecali', 'medikit', 1, NULL),
(156, 'society_families', 'coke_pooch', 403, NULL),
(158, 'society_families', 'armor', 1, NULL),
(159, 'society_families', 'weed', 100, NULL),
(160, 'society_families', 'mojito', 15, NULL),
(161, 'society_families', 'coke', 65, NULL),
(162, 'society_families', 'cigarette', 15, NULL),
(163, 'society_families', 'bandage', 5, NULL),
(164, 'society_families', 'burger', 10, NULL),
(165, 'society_families', 'whisky', 10, NULL),
(166, 'society_families', 'vodkaenergy', 1, NULL),
(167, 'society_families', 'meat', 1, NULL),
(168, 'society_families', 'medikit', 10, NULL),
(169, 'society_families', 'limonade', 8, NULL),
(171, 'society_families', 'carokit', 1, NULL),
(181, 'society_cosanostra', 'opium_pooch', 7, NULL),
(182, 'society_cosanostra', 'coke_pooch', 6, NULL),
(183, 'society_ballas', 'coke', 746, NULL),
(187, 'trunk', 'beer', 1, '66WLV417'),
(189, 'trunk', 'meth_pooch', 100, 'QPIO875 '),
(191, 'society_soa', 'burger', 1, NULL),
(192, 'society_soa', 'meth_pooch', 160, NULL),
(198, 'society_police', 'bandage', 1, NULL),
(202, 'society_lost', 'bandage', 4, NULL),
(203, 'trunk', 'coke', 217, 'EEWD0074'),
(204, 'trunk', 'tabac', 70, 'BENNY S4'),
(206, 'trunk', 'aciertraitement', 7, 'LDUR5687'),
(211, 'society_police', 'medikit', 6, NULL),
(212, 'society_police', 'vine', 9, NULL),
(216, 'trunk', 'jewels', 161, '08UVY737'),
(217, 'trunk', 'armor', 40, 'EKOH185 '),
(225, 'trunk', 'opium', 210, 'EZUH448 '),
(226, 'trunk', 'opium_pooch', 55, 'EZUH448 '),
(229, 'trunk', 'clip', 9, 'ZDRV7416'),
(230, 'trunk', 'jewels', 628, 'RCFY0132'),
(231, 'trunk', 'weed', 71, 'GAKQ5741'),
(234, 'trunk', 'weed', 46, 'CQLW2010'),
(238, 'trunk', 'weed', 734, 'BYPU4967'),
(243, 'society_police', 'opium', 73, NULL),
(244, 'trunk', 'opium', 242, 'GZQV596 '),
(245, 'trunk', 'weed', 3, 'GZQV596 '),
(246, 'trunk', 'medikit', 6, 'GZQV596 '),
(248, 'trunk', 'weed', 10, 'RJBV1710'),
(249, 'trunk', 'opium_pooch', 112, 'GZQV596 '),
(250, 'society_crips', 'piluleoubli', 1, NULL),
(254, 'trunk', 'weed', 1759, 'RBIO5987'),
(258, 'trunk', 'opium', 82, 'KPFQ6416'),
(259, 'society_blancos', 'weed', 450, NULL),
(260, 'society_blancos', 'opium_pooch', 9, NULL),
(263, 'society_blancos', 'burger', 9, NULL),
(264, 'society_blancos', 'phone', 1, NULL),
(267, 'trunk', 'weed_pooch', 200, 'ZSML5439'),
(273, 'trunk', 'acierrecolte', 84, 'SIOO4096'),
(284, 'trunk', 'jewels', 225, 'STQB8977'),
(288, 'trunk', 'opium', 91, 'APVM2469'),
(289, 'trunk', 'phone', 1, 'CKON154 '),
(291, 'trunk', 'fixkit', 40, 'NGWG3465'),
(292, 'society_cayo', 'weed', 254, NULL),
(293, 'society_cayo', 'opium', 100, NULL),
(294, 'trunk', 'fixkit', 21, 'RDWY7486'),
(295, 'trunk', 'opium_pooch', 3, 'RDWY7486'),
(296, 'trunk', 'fdp', 12, 'RDWY7486'),
(297, 'trunk', 'opium_pooch', 99, 'BFMI8752'),
(299, 'society_marabunta', 'police_cuff', 10, NULL),
(300, 'society_marabunta', 'police_key', 10, NULL),
(302, 'society_bahamas', 'opium', 79, NULL),
(307, 'trunk', 'raisin', 100, '87WBD601'),
(308, 'trunk', 'grand_cru', 10, '45UAE508'),
(309, 'trunk', 'jus_raisin', 50, '45UAE508'),
(310, 'trunk', 'jus_raisin', 72, '49WYV449'),
(311, 'trunk', 'grand_cru', 20, '49WYV449'),
(315, 'trunk', 'weed', 4, 'KPFQ6416'),
(321, 'trunk', 'raisin', 3250, 'VIGNE714'),
(323, 'trunk', 'acierrecolte', 70, 'IOIW2752'),
(324, 'trunk', 'aciertraitement', 70, 'BQAR8369'),
(328, 'trunk', 'jus_raisin', 200, 'VIGNE714'),
(329, 'trunk', 'grand_cru', 40, 'VIGNE714'),
(332, 'trunk', 'weed', 100, 'TSZL223 '),
(334, 'trunk', 'phone', 1, 'YYFB6599'),
(336, 'trunk', 'medikit', 12, 'ZZPU852 '),
(337, 'trunk', 'bandage', 16, 'ZZPU852 '),
(338, 'trunk', 'aciertraitement', 60, 'ZZPU852 '),
(340, 'society_madrazo', 'weed', 188, NULL),
(348, 'trunk', 'weed', 744, 'SGPW2513'),
(349, 'society_madrazo', 'raisin', 100, NULL),
(351, 'trunk', 'aciertraitement', 284, 'URUR1899'),
(352, 'trunk', 'weed_pooch', 109, 'ZZPU852 '),
(353, 'trunk', 'weed', 813, 'ZZPU852 '),
(354, 'trunk', 'vodka', 3, 'ZZPU852 '),
(355, 'trunk', 'coke', 138, 'ZZPU852 '),
(356, 'trunk', 'acierrecolte', 48, 'IPYA3971'),
(360, 'trunk', 'opium', 1, 'OHLH9444'),
(365, 'trunk', 'coke', 4, 'NNLJ4190'),
(369, 'trunk', 'cagoule', 1, 'RDWY7486'),
(370, 'trunk', 'clip', 10, 'RDWY7486'),
(371, 'trunk', 'ca', 3, 'RDWY7486'),
(372, 'trunk', 'bankcard', 1, 'RDWY7486'),
(373, 'trunk', 'phone', 1, 'RDWY7486'),
(386, 'society_marabunta', 'clip', 26, NULL),
(387, 'society_marabunta', 'coke', 5, NULL),
(388, 'society_police', 'coke_pooch', 131, NULL),
(389, 'society_police', 'basic_cuff', 1, NULL),
(390, 'society_police', 'cagoule', 1, NULL),
(391, 'trunk', 'medikit', 8, 'RDWY7486'),
(392, 'trunk', 'rhum', 1, 'RDWY7486'),
(394, 'society_crips', 'weed', 5, NULL),
(396, 'society_crips', 'coke_pooch', 6, NULL),
(397, 'society_madrazo', 'opium', 534, NULL),
(398, 'trunk', 'coke_pooch', 197, 'YGEU2012'),
(401, 'trunk', 'raisin', 2450, 'SXYO134 '),
(404, 'trunk', 'acierrecolte', 50, 'LSPD7516'),
(405, 'trunk', 'pepperspray', 1, 'OQIG934 '),
(407, 'society_ballas', 'jewels', 93, NULL),
(409, 'trunk', 'coke', 170, '66DGN801'),
(410, 'trunk', 'acierrecolte', 45, 'BVLK571 '),
(411, 'trunk', 'coke', 761, 'BVLK571 '),
(414, 'trunk', 'clip', 2, 'BVLK571 '),
(415, 'trunk', 'police_cuff', 10, 'BVLK571 '),
(416, 'trunk', 'police_key', 10, 'BVLK571 '),
(417, 'trunk', 'jus_raisin', 50, 'LSPD7392'),
(418, 'trunk', 'opium', 1, 'ZEWG7051'),
(420, 'trunk', 'aciertraitement', 25, 'ZEWG7051'),
(423, 'trunk', 'bandage', 24, 'FCUD8759'),
(424, 'society_police', 'coke', 30, NULL),
(425, 'society_police', 'clip', 2, NULL),
(430, 'trunk', 'weed_pooch', 67, 'BVLK571 '),
(431, 'trunk', 'aciertraitement', 111, 'BVLK571 '),
(432, 'trunk', 'opium', 1, 'BVLK571 '),
(439, 'trunk', 'weed', 50, '84BKG911'),
(440, 'society_lscustom', 'carokit', 1, NULL),
(441, 'society_lscustom', 'fixkit', 1, NULL),
(442, 'trunk', 'burger', 9, '47GSF380'),
(443, 'trunk', 'water', 8, '47GSF380'),
(444, 'trunk', 'opium', 9, '47GSF380'),
(445, 'trunk', 'coke_pooch', 120, '47GSF380'),
(446, 'trunk', 'coca', 8, '47GSF380'),
(447, 'trunk', 'water', 12, 'IQUH4111'),
(448, 'trunk', 'burger', 20, 'IQUH4111');

-- --------------------------------------------------------

--
-- Structure de la table `bbanque`
--

CREATE TABLE `bbanque` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `naissance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `nivcompte` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `motdepasse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `statemdp` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `society` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `cardealer_vehicles`
--

INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `price`, `society`) VALUES
(6892, 'mt09', 55000, 'motoshop');

-- --------------------------------------------------------

--
-- Structure de la table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `clothes_player`
--

CREATE TABLE `clothes_player` (
  `id` int(11) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `equip` varchar(50) DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_armenien', 'Les Arménien', 1),
('society_armeniens', 'Armeniens', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_ballas', 'Ballas', 1),
('society_blancos', 'Los Blancos', 1),
('society_bloods', 'Bloods', 1),
('society_cali', 'Cartel de Cali', 1),
('society_carshop', 'Concessionnaire Voitures', 1),
('society_cartelcali', 'Cartel De Cali', 1),
('society_carteldecali', 'Cartel De Cali', 1),
('society_cayo', 'Cartel de Cayo', 1),
('society_cosanostra', 'Costra Nostra', 1),
('society_crips', 'Crips', 1),
('society_families', 'Families', 1),
('society_famillies', 'Famillies', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_journalist', 'Journaliste', 1),
('society_lost', 'Lost MC', 1),
('society_madrazo', 'Madrazo', 1),
('society_marabunta', 'Marabunta', 1),
('society_marseillais', 'Les Marseillais', 1),
('society_mecano', 'Mécano', 1),
('society_motoshop', 'Concessionnaire Motos', 1),
('society_planeshop', 'Concessionnaire Avions', 1),
('society_police', 'Police', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_rockford', 'Rockfords studio', 1),
('society_sheriff', 'Sheriff', 1),
('society_soa', 'SOA', 1),
('society_swhite', 'Swhite', 1),
('society_tabac', 'Tabac', 1),
('society_taxi', 'Taxi', 1),
('society_testtest', 'testtest', 1),
('society_unicorn', 'Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1),
('trunk', 'Coffre Véhicule', 0),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `data`, `owner`) VALUES
(19322, 'society_armenien', '{}', NULL),
(19323, 'society_ambulance', '{}', NULL),
(19324, 'society_armeniens', '{}', NULL),
(19325, 'society_carshop', '{}', NULL),
(19326, 'society_bahamas', '{}', NULL),
(19327, 'society_avocat', '{}', NULL),
(19328, 'society_carteldecali', '{}', NULL),
(19329, 'society_cali', '{}', NULL),
(19330, 'society_cartelcali', '{}', NULL),
(19331, 'society_cayo', '{}', NULL),
(19332, 'society_blancos', '{}', NULL),
(19333, 'society_ballas', '{}', NULL),
(19334, 'society_crips', '{}', NULL),
(19335, 'society_famillies', '{}', NULL),
(19336, 'society_bloods', '{}', NULL),
(19337, 'society_families', '{}', NULL),
(19338, 'society_cosanostra', '{}', NULL),
(19339, 'society_gouvernement', '{}', NULL),
(19340, 'society_journalist', '{}', NULL),
(19341, 'society_lost', '{}', NULL),
(19342, 'society_marabunta', '{}', NULL),
(19343, 'society_madrazo', '{}', NULL),
(19344, 'society_marseillais', '{}', NULL),
(19345, 'society_mecano', '{}', NULL),
(19346, 'society_motoshop', '{}', NULL),
(19347, 'society_planeshop', '{}', NULL),
(19348, 'society_police', '{}', NULL),
(19349, 'society_realestateagent', '{}', NULL),
(19350, 'society_rockford', '{}', NULL),
(19351, 'society_sheriff', '{}', NULL),
(19352, 'society_soa', '{}', NULL),
(19353, 'society_swhite', '{}', NULL),
(19354, 'society_tabac', '{}', NULL),
(19355, 'society_vagos', '{}', NULL),
(19356, 'society_taxi', '{}', NULL),
(19357, 'society_testtest', '{}', NULL),
(19358, 'society_unicorn', '{}', NULL),
(19359, 'society_vigne', '{}', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `PosVestiaire` varchar(255) DEFAULT NULL,
  `PosCustom` varchar(255) DEFAULT NULL,
  `PosCustom2` varchar(255) DEFAULT NULL,
  `PosCustom3` varchar(255) DEFAULT NULL,
  `PosBoss` varchar(255) DEFAULT NULL,
  `namerecolteitem` varchar(255) DEFAULT NULL,
  `PosRecolte` varchar(255) DEFAULT NULL,
  `nametraitementitem` varchar(255) DEFAULT NULL,
  `PosTraitement` varchar(255) DEFAULT NULL,
  `PosVente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`type`, `name`, `label`, `PosVestiaire`, `PosCustom`, `PosCustom2`, `PosCustom3`, `PosBoss`, `namerecolteitem`, `PosRecolte`, `nametraitementitem`, `PosTraitement`, `PosVente`) VALUES
('Farm', 'abateur', 'Abateur', NULL, NULL, NULL, NULL, '{\"x\":-102.87655639648438,\"y\":6193.5439453125,\"z\":31.02501678466797}', 'poulet', '{\"x\":-66.0046615600586,\"y\":6245.2802734375,\"z\":31.08635520935058}', 'cuisse', '{\"x\":-85.11286163330078,\"y\":6231.24267578125,\"z\":31.09076309204101}', '{\"x\":-99.98977661132813,\"y\":6210.3232421875,\"z\":31.02501106262207}'),
('Farm', 'ble', 'Blés', NULL, NULL, NULL, NULL, '{\"x\":1218.96533203125,\"y\":1848.068603515625,\"z\":78.94783020019531}', 'ble', '{\"x\":1948.4398193359376,\"y\":4845.626953125,\"z\":45.46005630493164}', 'cerial', '{\"x\":1241.1864013671876,\"y\":1883.8338623046876,\"z\":78.87825012207031}', '{\"x\":1262.4071044921876,\"y\":1894.725341796875,\"z\":78.92153930664063}'),
('Farm', 'brasseur', 'Brasseur', NULL, NULL, NULL, NULL, '{\"x\":473.86090087890627,\"y\":-1951.5692138671876,\"z\":24.61928749084472}', 'malt', '{\"x\":2257.777099609375,\"y\":5051.2978515625,\"z\":44.59254837036133}', 'biere', '{\"x\":2243.45703125,\"y\":5153.9580078125,\"z\":57.88714599609375}', '{\"x\":855.37451171875,\"y\":-1831.5789794921876,\"z\":29.10895538330078}'),
('Farm', 'rafineur', 'Rafineur', NULL, NULL, NULL, NULL, '{\"x\":2818.8720703125,\"y\":1463.4954833984376,\"z\":24.73581314086914}', 'petrol', '{\"x\":1665.929443359375,\"y\":-1524.7491455078126,\"z\":112.7555160522461}', 'essence', '{\"x\":2747.150146484375,\"y\":1518.4271240234376,\"z\":24.50072288513183}', '{\"x\":2664.639892578125,\"y\":1382.0611572265626,\"z\":24.05242919921875}'),
('Farm', 'tabac', 'Tabac', NULL, NULL, NULL, NULL, '{\"x\":2340.620849609375,\"y\":3125.69091796875,\"z\":48.20868301391601}', 'tabac', '{\"x\":1807.6865234375,\"y\":5018.32666015625,\"z\":56.92789077758789}', 'malbora', '{\"x\":2346.723388671875,\"y\":3142.72607421875,\"z\":48.20868301391601}', '{\"x\":822.3974609375,\"y\":-2252.7734375,\"z\":30.03054428100586}');

-- --------------------------------------------------------

--
-- Structure de la table `gangs`
--

CREATE TABLE `gangs` (
  `gangname` varchar(255) NOT NULL,
  `posCoffre` varchar(255) DEFAULT NULL,
  `KitArme` int(255) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `gangs`
--

INSERT INTO `gangs` (`gangname`, `posCoffre`, `KitArme`) VALUES
('ballas', '{\"x\":106.64439392089844,\"y\":-1981.0726318359376,\"z\":20.9626293182373}', 0),
('blancos', '{\"x\":-3233.549560546875,\"y\":814.1139526367188,\"z\":14.0782470703125}', 0),
('bloods', '{\"x\":-1557.138427734375,\"y\":-375.8033752441406,\"z\":48.04824829101562}', 0),
('cali', '{\"x\":-78.79208374023438,\"y\":1001.9090576171875,\"z\":230.60923767089845}', 0),
('cayo', '{\"x\":5005.47265625,\"y\":-5754.4833984375,\"z\":28.84528541564941}', 1),
('cosanostra', '{\"x\":-1518.881591796875,\"y\":112.1891860961914,\"z\":50.03602600097656}', 0),
('crips', '{\"x\":385.0594482421875,\"y\":-1793.4368896484376,\"z\":29.2281265258789}', 0),
('families', '{\"x\":-137.25717163085938,\"y\":-1610.2188720703126,\"z\":35.03022003173828}', 0),
('independence', '{\"x\":706.4249267578125,\"y\":-960.897705078125,\"z\":30.39531707763672}', 0),
('lost', '{\"x\":976.8660278320313,\"y\":-103.82515716552735,\"z\":74.84505462646485}', 0),
('madrazo', '{\"x\":1403.9288330078126,\"y\":1137.3648681640626,\"z\":109.74728393554688}', 0),
('marabunta', '{\"x\":1436.740478515625,\"y\":-1489.544677734375,\"z\":66.61927032470703}', 0),
('marseillais', '{\"x\":-2558.01416015625,\"y\":3732.861328125,\"z\":13.41573524475097}', 0),
('ms13', '{\"x\":-2677.852783203125,\"y\":1334.5738525390626,\"z\":140.88143920898438}', 0),
('soa', '{\"x\":-568.4435424804688,\"y\":291.66021728515627,\"z\":79.17659759521485}', 0),
('swhite', '{\"x\":-1732.0059814453126,\"y\":359.20965576171877,\"z\":89.41908264160156}', 0),
('vagos', '{\"x\":363.56219482421877,\"y\":-2040.8203125,\"z\":22.39484405517578}', 0);

-- --------------------------------------------------------

--
-- Structure de la table `garage`
--

CREATE TABLE `garage` (
  `name` varchar(255) NOT NULL,
  `blip` tinyint(1) NOT NULL DEFAULT 0,
  `pos` varchar(255) NOT NULL,
  `SpawnPoint` varchar(255) NOT NULL,
  `DeletePoint` varchar(255) NOT NULL,
  `Heading` varchar(255) DEFAULT '150.0',
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `garage`
--

INSERT INTO `garage` (`name`, `blip`, `pos`, `SpawnPoint`, `DeletePoint`, `Heading`, `type`) VALUES
('Publique', 1, '{\"x\":-1085.937744140625,\"y\":-2960.134521484375,\"z\":13.97393321990966}', '{\"x\":-1074.4617919921876,\"y\":-2960.578369140625,\"z\":13.94506740570068}', '{\"x\":-1077.1876220703126,\"y\":-2974.656982421875,\"z\":13.94538784027099}', '100.0', 'aircraft'),
('Garage Publique', 1, '{\"x\":-1135.7603759765626,\"y\":2682.075927734375,\"z\":18.31646728515625}', '{\"x\":-1145.40478515625,\"y\":2664.95068359375,\"z\":18.09389305114746}', '{\"x\":-1152.7615966796876,\"y\":2676.35498046875,\"z\":18.09389305114746}', '216.97344970703125', 'car'),
('Cali', 0, '{\"x\":-130.6696014404297,\"y\":1007.6240844726563,\"z\":235.73196411132813}', '{\"x\":-125.25582122802735,\"y\":1000.0921020507813,\"z\":235.73348999023438}', '{\"x\":-114.40357971191406,\"y\":1004.719482421875,\"z\":235.76553344726563}', '162.16395568847656', 'car'),
('Publique', 1, '{\"x\":-139.64768981933595,\"y\":6315.994140625,\"z\":31.374267578125}', '{\"x\":-138.16207885742188,\"y\":6314.837890625,\"z\":31.35720062255859}', '{\"x\":-135.56105041503907,\"y\":6309.82080078125,\"z\":31.48172187805175}', '100.0', 'car'),
('Publique', 0, '{\"x\":-14.30629444122314,\"y\":-624.0406494140625,\"z\":35.72415542602539}', '{\"x\":-18.94047927856445,\"y\":-626.4931640625,\"z\":35.72518539428711}', '{\"x\":-19.00265884399414,\"y\":-626.501708984375,\"z\":35.72523498535156}', '254.1322479248047', 'car'),
('Cosa', 0, '{\"x\":-1528.465087890625,\"y\":79.70974731445313,\"z\":56.71517181396484}', '{\"x\":-1526.491943359375,\"y\":85.4797134399414,\"z\":56.56673431396484}', '{\"x\":-1528.4649658203126,\"y\":88.25432586669922,\"z\":56.62092971801758}', '269.47161865234375', 'car'),
('Bloods', 0, '{\"x\":-1567.5697021484376,\"y\":-388.6427917480469,\"z\":41.98134613037109}', '{\"x\":-1563.4959716796876,\"y\":-394.0887756347656,\"z\":41.98134613037109}', '{\"x\":-1563.9620361328126,\"y\":-387.1329040527344,\"z\":41.98134613037109}', '227.1092529296875', 'car'),
('Publique', 1, '{\"x\":-1702.275390625,\"y\":63.38345336914062,\"z\":65.29515838623047}', '{\"x\":-1706.6854248046876,\"y\":59.29095840454101,\"z\":65.71300506591797}', '{\"x\":-1712.329345703125,\"y\":57.25455474853515,\"z\":66.26611328125}', '38.01088333129883', 'car'),
('Publique', 0, '{\"x\":-172.7772216796875,\"y\":-1307.216552734375,\"z\":31.24967193603515}', '{\"x\":-166.3739776611328,\"y\":-1305.260986328125,\"z\":31.32953834533691}', '{\"x\":-161.47921752929688,\"y\":-1304.7894287109376,\"z\":31.31187057495117}', '357.8946533203125', 'car'),
('white', 0, '{\"x\":-1738.401611328125,\"y\":372.99468994140627,\"z\":89.72392272949219}', '{\"x\":-1741.1484375,\"y\":370.8484191894531,\"z\":89.72392272949219}', '{\"x\":-1751.567138671875,\"y\":365.5455017089844,\"z\":89.67897033691406}', '206.31968688965', 'car'),
('swhite', 0, '{\"x\":-1738.4874267578126,\"y\":373.1091003417969,\"z\":89.72393798828125}', '{\"x\":-1740.81005859375,\"y\":371.1589050292969,\"z\":89.72393798828125}', '{\"x\":-1751.66064453125,\"y\":365.60797119140627,\"z\":89.67786407470703}', '206.31968688965', 'car'),
('VillaB', 0, '{\"x\":-1860.653076171875,\"y\":323.6907043457031,\"z\":88.70845031738281}', '{\"x\":-1858.1949462890626,\"y\":328.928955078125,\"z\":88.64469146728516}', '{\"x\":-1858.2012939453126,\"y\":329.0625,\"z\":88.64314270019531}', '4.153156280517578', 'car'),
('Families', 0, '{\"x\":-189.68853759765626,\"y\":-1585.0567626953126,\"z\":34.77092361450195}', '{\"x\":-182.13771057128907,\"y\":-1589.26318359375,\"z\":34.66521453857422}', '{\"x\":-175.09422302246095,\"y\":-1579.021240234375,\"z\":35.20468521118164}', '278.9406433105469', 'car'),
('Publique', 1, '{\"x\":-251.5725555419922,\"y\":-315.4530334472656,\"z\":30.17339324951172}', '{\"x\":-261.2003479003906,\"y\":-313.7845764160156,\"z\":30.14310073852539}', '{\"x\":-268.1453552246094,\"y\":-316.5836486816406,\"z\":30.19263458251953}', '100.0', 'car'),
('marseillais', 0, '{\"x\":-2533.2216796875,\"y\":3757.85302734375,\"z\":13.10136985778808}', '{\"x\":-2531.943359375,\"y\":3740.119140625,\"z\":13.10119724273681}', '{\"x\":-2524.7412109375,\"y\":3750.6220703125,\"z\":13.10128498077392}', '206.31968688965', 'car'),
('Arméniens', 0, '{\"x\":-2670.234375,\"y\":1310.0,\"z\":147.118408203125}', '{\"x\":-2661.6337890625,\"y\":1307.8035888671876,\"z\":147.118408203125}', '{\"x\":-2667.19140625,\"y\":1305.195556640625,\"z\":147.118408203125}', '270.07159423828125', 'car'),
('Publique', 1, '{\"x\":-286.2185974121094,\"y\":-888.1900634765625,\"z\":31.08062744140625}', '{\"x\":-300.0462341308594,\"y\":-892.3636474609375,\"z\":30.60844993591308}', '{\"x\":-295.4961242675781,\"y\":-886.49169921875,\"z\":31.08063888549804}', '79.09886932373047', 'car'),
('Publique', 1, '{\"x\":-3142.822998046875,\"y\":1063.7686767578126,\"z\":20.51234245300293}', '{\"x\":-3145.9990234375,\"y\":1074.3148193359376,\"z\":20.65127372741699}', '{\"x\":-3141.290771484375,\"y\":1079.5494384765626,\"z\":20.64495086669922}', '100.0', 'car'),
('Blancos', 0, '{\"x\":-3214.86767578125,\"y\":833.9472045898438,\"z\":8.93090629577636}', '{\"x\":-3211.25927734375,\"y\":828.2776489257813,\"z\":8.930908203125}', '{\"x\":-3208.13818359375,\"y\":833.458740234375,\"z\":8.93091678619384}', '211.70809936523438', 'car'),
('Publique', 1, '{\"x\":-324.48309326171877,\"y\":-1531.0142822265626,\"z\":27.58699798583984}', '{\"x\":-317.27410888671877,\"y\":-1525.6873779296876,\"z\":27.55734062194824}', '{\"x\":-316.8323974609375,\"y\":-1532.6744384765626,\"z\":27.59610748291015}', '100.0', 'car'),
('Publique', 0, '{\"x\":-530.198974609375,\"y\":-267.04840087890627,\"z\":35.39913177490234}', '{\"x\":-517.4266967773438,\"y\":-266.7621154785156,\"z\":35.32497024536133}', '{\"x\":-517.4013671875,\"y\":-266.7692565917969,\"z\":35.32833099365234}', '113.95829772949219', 'car'),
('Publique', 1, '{\"x\":-553.8917846679688,\"y\":310.79998779296877,\"z\":83.177001953125}', '{\"x\":-551.2066040039063,\"y\":304.9624938964844,\"z\":83.20353698730469}', '{\"x\":-548.5555419921875,\"y\":307.5212097167969,\"z\":83.1105728149414}', '260.40179443359375', 'car'),
('Abateur', 0, '{\"x\":-66.0855941772461,\"y\":6271.701171875,\"z\":31.32715225219726}', '{\"x\":-72.7325668334961,\"y\":6274.826171875,\"z\":31.37635231018066}', '{\"x\":-59.6205940246582,\"y\":6277.2158203125,\"z\":31.30797004699707}', '62.948646545410156', 'car'),
('Publique', 1, '{\"x\":-735.09716796875,\"y\":-1313.6939697265626,\"z\":5.00036144256591}', '{\"x\":-723.1688842773438,\"y\":-1328.103515625,\"z\":1.43767821788787}', '{\"x\":-729.2232055664063,\"y\":-1333.73828125,\"z\":1.59542262554168}', '100.0', 'boat'),
('Publique', 1, '{\"x\":-756.7083740234375,\"y\":-806.9389038085938,\"z\":23.23968315124511}', '{\"x\":-748.302001953125,\"y\":-812.2930297851563,\"z\":22.98050498962402}', '{\"x\":-763.8430786132813,\"y\":-812.49951171875,\"z\":22.49257469177246}', '100.0', 'car'),
('Publique', 1, '{\"x\":1138.7801513671876,\"y\":-1475.3477783203126,\"z\":34.80468368530273}', '{\"x\":1149.9158935546876,\"y\":-1485.677001953125,\"z\":34.69258499145508}', '{\"x\":1156.6241455078126,\"y\":-1470.638916015625,\"z\":34.69258117675781}', '360.0', 'car'),
('Blé', 0, '{\"x\":1216.454345703125,\"y\":1846.26611328125,\"z\":78.90983581542969}', '{\"x\":1217.611572265625,\"y\":1841.5767822265626,\"z\":79.03668212890625}', '{\"x\":1212.2613525390626,\"y\":1838.5465087890626,\"z\":78.97137451171875}', '138.74661254882812', 'car'),
('madrazo', 0, '{\"x\":1398.6025390625,\"y\":1116.0098876953126,\"z\":114.8365707397461}', '{\"x\":1390.992919921875,\"y\":1117.385009765625,\"z\":114.82124328613281}', '{\"x\":1406.68017578125,\"y\":1118.259521484375,\"z\":114.83657836914063}', '86.02587127685547', 'car'),
('Publique', 1, '{\"x\":14.56137371063232,\"y\":-1096.2197265625,\"z\":38.15213775634765}', '{\"x\":7.09128475189209,\"y\":-1098.0079345703126,\"z\":38.15398406982422}', '{\"x\":17.66411972045898,\"y\":-1085.827880859375,\"z\":38.37428665161133}', '66.26089477539063', 'car'),
('Marabunta', 0, '{\"x\":1423.0048828125,\"y\":-1503.673095703125,\"z\":60.91851806640625}', '{\"x\":1423.598388671875,\"y\":-1511.56982421875,\"z\":60.86135482788086}', '{\"x\":1414.854248046875,\"y\":-1504.1624755859376,\"z\":60.07293319702148}', '91.48240661621094', 'car'),
('madrazo2', 0, '{\"x\":1442.783935546875,\"y\":1108.6610107421876,\"z\":114.3414077758789}', '{\"x\":1452.2548828125,\"y\":1112.4144287109376,\"z\":114.33393096923828}', '{\"x\":1461.828125,\"y\":1112.480224609375,\"z\":114.33393096923828}', '267.2876892089844', 'aircraft'),
('Publique', 1, '{\"x\":1710.4476318359376,\"y\":6395.37744140625,\"z\":33.26231384277344}', '{\"x\":1702.0047607421876,\"y\":6397.98583984375,\"z\":32.74243927001953}', '{\"x\":1687.256591796875,\"y\":6413.009765625,\"z\":32.27307891845703}', '100.0', 'car'),
('Publique', 1, '{\"x\":1849.6995849609376,\"y\":2586.606201171875,\"z\":45.67205047607422}', '{\"x\":1859.8485107421876,\"y\":2580.78564453125,\"z\":45.67208099365234}', '{\"x\":1856.5838623046876,\"y\":2573.51025390625,\"z\":45.67208099365234}', '100.0', 'car'),
('Publique', 1, '{\"x\":218.31312561035157,\"y\":-810.2802734375,\"z\":30.67979431152343}', '{\"x\":230.41650390625,\"y\":-793.6564331054688,\"z\":30.60744285583496}', '{\"x\":230.32943725585938,\"y\":-741.4286499023438,\"z\":30.82157707214355}', '100.0', 'car'),
('Tabac', 0, '{\"x\":2338.859619140625,\"y\":3140.670654296875,\"z\":48.20288848876953}', '{\"x\":2333.12548828125,\"y\":3142.2724609375,\"z\":48.17715454101562}', '{\"x\":2340.206298828125,\"y\":3152.462158203125,\"z\":48.1626968383789}', '106.96446990966797', 'car'),
('Publique', 1, '{\"x\":250.23318481445313,\"y\":-1793.330810546875,\"z\":27.11352348327636}', '{\"x\":254.9473114013672,\"y\":-1796.33056640625,\"z\":27.11301040649414}', '{\"x\":260.2061767578125,\"y\":-1793.6785888671876,\"z\":27.11301040649414}', '131.36245727539062', 'car'),
('Rafineur', 0, '{\"x\":2698.94775390625,\"y\":1390.5811767578126,\"z\":24.53535270690918}', '{\"x\":2699.8564453125,\"y\":1382.8826904296876,\"z\":24.51975440979004}', '{\"x\":2706.650146484375,\"y\":1389.8701171875,\"z\":24.51102447509765}', '123.51485443115234', 'car'),
('Publique ', 1, '{\"x\":281.16619873046877,\"y\":-339.44927978515627,\"z\":45.04780960083008}', '{\"x\":274.49200439453127,\"y\":-328.7698669433594,\"z\":44.92010498046875}', '{\"x\":291.981201171875,\"y\":-334.0784606933594,\"z\":44.92010116577148}', '151.1200408935547', 'car '),
('Vagos', 0, '{\"x\":313.8995361328125,\"y\":-2040.1591796875,\"z\":20.93598365783691}', '{\"x\":319.3062438964844,\"y\":-2035.474853515625,\"z\":20.59438133239746}', '{\"x\":326.7835998535156,\"y\":-2028.5296630859376,\"z\":20.97792625427246}', '317.9423828125', 'car'),
('Crips', 0, '{\"x\":393.37384033203127,\"y\":-1800.0396728515626,\"z\":29.22809410095215}', '{\"x\":401.5472412109375,\"y\":-1809.9058837890626,\"z\":28.98900604248047}', '{\"x\":394.28729248046877,\"y\":-1804.363037109375,\"z\":29.22809219360351}', '174.1380615234375', 'car'),
('Publique', 1, '{\"x\":4443.36474609375,\"y\":-4482.42138671875,\"z\":4.27916193008422}', '{\"x\":4454.89990234375,\"y\":-4504.5703125,\"z\":4.18589496612548}', '{\"x\":4467.3701171875,\"y\":-4500.837890625,\"z\":4.18794298171997}', '107.54987335205078', 'aircraft'),
('Police', 0, '{\"x\":449.7087097167969,\"y\":-976.3132934570313,\"z\":25.6998176574707}', '{\"x\":449.4909362792969,\"y\":-980.3712768554688,\"z\":25.6998176574707}', '{\"x\":435.6808776855469,\"y\":-975.9804077148438,\"z\":25.6998176574707}', '90.86654663085938', 'car'),
('Publique', 1, '{\"x\":4519.53564453125,\"y\":-4513.92822265625,\"z\":4.5181565284729}', '{\"x\":4513.48291015625,\"y\":-4505.158203125,\"z\":4.13732194900512}', '{\"x\":4517.89013671875,\"y\":-4498.3115234375,\"z\":4.18394374847412}', '324.9219055175781', 'car'),
('Publique', 1, '{\"x\":471.9840087890625,\"y\":-1284.7943115234376,\"z\":29.55570030212402}', '{\"x\":475.5673828125,\"y\":-1280.8590087890626,\"z\":29.53935432434082}', '{\"x\":475.5675354003906,\"y\":-1280.8624267578126,\"z\":29.53935432434082}', '340.4337463378906', 'car'),
('Braseur', 0, '{\"x\":473.86669921875,\"y\":-1943.6697998046876,\"z\":24.95118522644043}', '{\"x\":466.0289001464844,\"y\":-1950.4962158203126,\"z\":24.65712165832519}', '{\"x\":475.33599853515627,\"y\":-1962.010498046875,\"z\":24.53724670410156}', '30.281129837036133', 'car'),
('Publique', 1, '{\"x\":4929.994140625,\"y\":-5145.31298828125,\"z\":2.44834899902343}', '{\"x\":4916.83447265625,\"y\":-5142.41162109375,\"z\":-0.39991840720176}', '{\"x\":4934.08935546875,\"y\":-5154.7587890625,\"z\":-0.39992746710777}', '94.52375030517578', 'boat'),
('Cayo', 0, '{\"x\":4969.6357421875,\"y\":-5738.3515625,\"z\":19.88018035888672}', '{\"x\":4974.5283203125,\"y\":-5740.763671875,\"z\":19.88018035888672}', '{\"x\":4969.73095703125,\"y\":-5747.5703125,\"z\":19.88018035888672}', '326.62139892578125', 'car'),
('Ballas', 0, '{\"x\":84.51411437988281,\"y\":-1967.1263427734376,\"z\":20.74746894836425}', '{\"x\":88.40389251708985,\"y\":-1968.259033203125,\"z\":20.74746894836425}', '{\"x\":85.95897674560547,\"y\":-1971.0721435546876,\"z\":20.74746894836425}', '305.7662353515625', 'car'),
('Publique', 1, '{\"x\":882.071533203125,\"y\":-77.80430603027344,\"z\":78.80852508544922}', '{\"x\":877.802001953125,\"y\":-72.0474624633789,\"z\":78.78321838378906}', '{\"x\":880.5283813476563,\"y\":-59.79414367675781,\"z\":78.7641372680664}', '100.0', 'car'),
('Lost', 0, '{\"x\":963.6705932617188,\"y\":-119.39775848388672,\"z\":74.35302734375}', '{\"x\":967.7109985351563,\"y\":-125.0157699584961,\"z\":74.35302734375}', '{\"x\":968.4821166992188,\"y\":-140.43170166015626,\"z\":74.41034698486328}', '144.65518188476562', 'car');

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_app_chat`
--

CREATE TABLE `gksphone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_bank_transfer`
--

CREATE TABLE `gksphone_bank_transfer` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `identifier` longtext DEFAULT NULL,
  `price` longtext NOT NULL,
  `name` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_blockednumber`
--

CREATE TABLE `gksphone_blockednumber` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `hex` longtext NOT NULL,
  `number` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_calls`
--

CREATE TABLE `gksphone_calls` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL COMMENT 'Num tel proprio',
  `num` longtext NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_gallery`
--

CREATE TABLE `gksphone_gallery` (
  `id` int(11) NOT NULL,
  `hex` longtext NOT NULL,
  `image` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `gksphone_gallery`
--


-- --------------------------------------------------------

--
-- Structure de la table `gksphone_gotur`
--

CREATE TABLE `gksphone_gotur` (
  `id` int(11) NOT NULL,
  `label` longtext NOT NULL,
  `price` int(11) DEFAULT 0,
  `count` int(11) NOT NULL,
  `item` longtext NOT NULL,
  `kapat` varchar(50) DEFAULT 'false',
  `adet` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_gps`
--

CREATE TABLE `gksphone_gps` (
  `id` int(11) NOT NULL,
  `hex` longtext NOT NULL,
  `nott` longtext DEFAULT NULL,
  `gps` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_group_message`
--

CREATE TABLE `gksphone_group_message` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `owner` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ownerphone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messages` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacts` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_insto_accounts`
--

CREATE TABLE `gksphone_insto_accounts` (
  `id` int(11) NOT NULL,
  `forename` longtext COLLATE utf8mb4_bin NOT NULL,
  `surname` longtext COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(250) CHARACTER SET utf8 NOT NULL,
  `password` longtext COLLATE utf8mb4_bin NOT NULL,
  `avatar_url` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `takip` longtext COLLATE utf8mb4_bin DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `gksphone_insto_accounts`
--

INSERT INTO `gksphone_insto_accounts` (`id`, `forename`, `surname`, `username`, `password`, `avatar_url`, `takip`) VALUES
(19, 'Zikkar ', 'Zoo', 'zikkar', 'zikkar93', 'https://media.discordapp.net/attachments/953410740683956226/967181914597392434/screenshot.jpeg', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_insto_instas`
--

CREATE TABLE `gksphone_insto_instas` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_insto_likes`
--

CREATE TABLE `gksphone_insto_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_insto_story`
--

CREATE TABLE `gksphone_insto_story` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stories` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isRead` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_job_message`
--

CREATE TABLE `gksphone_job_message` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `number` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `photo` longtext DEFAULT NULL,
  `gps` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `jobm` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_mails`
--

CREATE TABLE `gksphone_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL DEFAULT '0',
  `sender` varchar(255) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '0',
  `image` text NOT NULL,
  `message` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_messages`
--

CREATE TABLE `gksphone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gksphone_messages`
--

INSERT INTO `gksphone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
(434, 'Moha', '4290405', 'https://media.discordapp.net/attachments/953410740683956226/962694788853948496/screenshot.jpeg', '2022-04-10 12:45:25', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_messages_group`
--

CREATE TABLE `gksphone_messages_group` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL,
  `ownerphone` varchar(50) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `gimage` longtext NOT NULL,
  `contacts` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_news`
--

CREATE TABLE `gksphone_news` (
  `id` int(11) NOT NULL,
  `hex` longtext DEFAULT NULL,
  `haber` longtext DEFAULT NULL,
  `baslik` longtext DEFAULT NULL,
  `resim` longtext DEFAULT NULL,
  `video` longtext DEFAULT NULL,
  `zaman` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_settings`
--

CREATE TABLE `gksphone_settings` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `crypto` longtext NOT NULL DEFAULT '{}',
  `phone_number` varchar(50) DEFAULT NULL,
  `avatar_url` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `gksphone_settings`
--


-- --------------------------------------------------------

--
-- Structure de la table `gksphone_tinderacc`
--

CREATE TABLE `gksphone_tinderacc` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `passaword` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gksphone_tinderacc`
--

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_tindermatch`
--

CREATE TABLE `gksphone_tindermatch` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `friend_id` int(11) NOT NULL DEFAULT 0,
  `is_match` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_tindermessage`
--

CREATE TABLE `gksphone_tindermessage` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `tinderes` text NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_twitter_accounts`
--

CREATE TABLE `gksphone_twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `profilavatar` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_twitter_likes`
--

CREATE TABLE `gksphone_twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_twitter_tweets`
--

CREATE TABLE `gksphone_twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_users_contacts`
--

CREATE TABLE `gksphone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` longtext CHARACTER SET utf8mb4 DEFAULT '-1',
  `avatar` longtext NOT NULL DEFAULT 'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_vehicle_sales`
--

CREATE TABLE `gksphone_vehicle_sales` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL,
  `ownerphone` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `gksphone_yellow`
--

CREATE TABLE `gksphone_yellow` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('N4H', 'Drogue Traiter', 0, 0, 1),
('NH4', 'Drogue Brut ', 0, 0, 1),
('acierrecolte', 'Acier Brut', 1, 0, 1),
('aciertraitement', 'Acier Traiter', 0.5, 0, 1),
('armor', 'Kevlar', 3, 0, 1),
('bandage', 'Bandage', 0.2, 0, 1),
('bankcard', 'Carte d\'accès Banque', 1, 0, 1),
('basic_cuff', 'Menottes Basique', 0.3, 0, 1),
('basic_key', 'Clefs de Menottes Basique', 0.1, 0, 1),
('beer', 'Bière', 0.1, 0, 1),
('biere', 'Bière', 0, 0, 1),
('ble', 'Blé', 1, 0, 1),
('blowpipe', 'Chalumeaux', 1.5, 0, 1),
('bread', 'Pain', 0.1, 0, 1),
('burger', 'Burger', 0.3, 0, 1),
('ca', 'caca', 0, 0, 1),
('caca', 'caca', 0, 0, 1),
('cagoule', 'Cagoule', 1, 0, 1),
('canneapeche', 'Canne a peche', 1, 0, 1),
('carokit', 'Kit carosserie', 3, 0, 1),
('carotool', 'Outils carosserie', 4, 0, 1),
('cb', 'Carte Bleu', 1, 0, 1),
('cerial', 'Cérial', 1, 0, 1),
('chip', 'Jeton', 0, 0, 1),
('cigarette', 'Cigarette', 0.1, 0, 1),
('ciseaux', 'Ciseaux', 1, 0, 1),
('clip', 'Chargeur', 0.3, 0, 1),
('coca', 'Coca', 0.1, 0, 1),
('coke', 'Coke', 1, 0, 1),
('coke_pooch', 'Pochon de coke', 0.25, 0, 1),
('cola', 'Cola', 0.2, 0, 1),
('cuisse', 'Cuisse', 0, 0, 1),
('defibrillateur', 'Défibrillateur', 2, 0, 1),
('eewenlpb', 'ewen ets bg', 0, 0, 1),
('essence', 'Essence', 1, 0, 1),
('ewenestsft', 'jeclate dylan', 0, 0, 1),
('fdp', 'Fils de pute', 0, 0, 1),
('fdppepe', 'fils de puterie', 0, 0, 1),
('feuille_coca', 'Feuille de coca', 1, 0, 1),
('firstaidkit', 'Trousse premier secours', 1, 0, 1),
('fixkit', 'Kit réparation', 1.5, 0, 1),
('fixtool', 'Outils réparation', 2, 0, 1),
('gazbottle', 'Bouteille de gaz', 2, 0, 1),
('gitanes', 'Gitanes', 0.1, 0, 1),
('goldNecklace', 'Gold Necklace', -1, 0, 1),
('grand_cru', 'Grand cru', 0.2, 0, 1),
('grapperaisin', 'Grappe de raisin', 0.3, 0, 1),
('handcuff', 'Serre câble ', 0.3, 0, 1),
('ice', 'Glaçon', 0.1, 0, 1),
('jager', 'Jägermeister', 0.5, 0, 1),
('jagerbomb', 'Jägermeister', 0.5, 0, 1),
('jagercerbere', 'Jäger Cerbère', 0.5, 0, 1),
('jewels', 'Bijouts', 1, 0, 1),
('jumelles', 'Jumelles', 0.25, 0, 1),
('jus_coca', 'Jus de coca', 0.5, 0, 1),
('jus_raisin', 'Jus de raisin', 0.5, 0, 1),
('jusfruit', 'Jus de fruits', 0.5, 0, 1),
('laptop', 'Laptop', -1, 0, 1),
('limonade', 'Limonade', 0.5, 0, 1),
('lockpick', 'Pied de Biche', 1, 0, 1),
('malbora', 'Malboro', 0.1, 0, 1),
('malt', 'Malt', 0, 0, 1),
('martini', 'Martini blanc', 1, 0, 1),
('meat', 'Viande', 0.3, 0, 1),
('medikit', 'Medikit', 2, 0, 1),
('menthe', 'Feuille de menthe', 1, 0, 1),
('meth', 'Meth', 1, 0, 1),
('meth_pooch', 'Pochon de meth', 0.25, 0, 1),
('metreshooter', 'Mètre de shooter', 0.1, 0, 1),
('mixapero', 'Mix Apéritif', 0.1, 0, 1),
('mojito', 'Mojito', 0.1, 0, 1),
('opium', 'Opium', 1, 0, 1),
('opium_pooch', 'Pochon d\'opium', 0.25, 0, 1),
('orange', 'Orange', 0.1, 0, 1),
('orange_juice', 'Jus d\'orange', 0.3, 0, 1),
('oxygen_mask', 'Masque à Oxygène', 0.6, 0, 1),
('pepperspray', 'Gazeuse', 1, 0, -1),
('permisconduire', 'Permis de Conduire', -1, 0, 1),
('petrol', 'Pétrol', 1, 0, 1),
('phone', 'Téléphone', 0.3, 0, 1),
('piluleoubli', 'GHB', 1, 0, 1),
('police_cuff', 'Menottes LSPD', 0.3, 0, 1),
('police_key', 'Clefs de Menottes LSPD', 0.1, 0, 1),
('pomme', 'Pomme', 0.1, 0, 1),
('poulet', 'Poulet', 0, 0, 1),
('ra', 'ra', 1, 0, 1),
('radio', 'Radio', 0.5, 0, 1),
('raisin', 'Raisin', 0.3, 0, 1),
('re', 're', 1, 0, 1),
('redbull', 'Redbull', 0.3, 0, 1),
('repairkit', 'Repairkit', 2, 0, 1),
('rhum', 'Rhum', 0.4, 0, 1),
('rhumcoca', 'Rhum-Coca', 0.5, 0, 1),
('rhumfruit', 'Rhum-Jus de fruits', 0.5, 0, 1),
('ring', 'Ring', -1, 0, 1),
('tabac', 'Tabac', 0.5, 0, 1),
('tabacblond', 'Tabac Blond', 0.5, 0, 1),
('tabacblondsec', 'Tabac Blond Séché', 0.5, 0, 1),
('tabacbrun', 'Tabac Brun', 0.5, 0, 1),
('tabacbrunsec', 'Tabac Brun Séché', 0.5, 0, 1),
('tarte_pomme', 'Tarte aux Pommes', 0.3, 0, 1),
('teqpaf', 'Teq\'paf', 0.5, 0, 1),
('tequila', 'Tequila', 0.5, 0, 1),
('vine', 'Vin', 0.5, 0, 1),
('vittvin', 'Vin Blanc', 0.5, 0, 1),
('vodka', 'Vodka', 0.3, 0, 1),
('vodkaenergy', 'Vodka-Energy', 0.4, 0, 1),
('vodkafruit', 'Vodka-Jus de fruits', 0.3, 0, 1),
('vodkaredbull', 'Vodka-Redbull', 0.3, 0, 1),
('water', 'Bouteille d\'eau', 0.1, 0, 1),
('weed', 'Weed', 1, 0, 1),
('weed_pooch', 'Pochon de weed', 0.25, 0, 1),
('whisky', 'Whisky', 0.4, 0, 1),
('whiskycoca', 'Whisky-coca', 0.5, 0, 1),
('zetony', 'Jetons', -1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('Seventy White', 'swhite', 1),
('Seventy-White', 'swhite', 1),
('White', 'white', 1),
('abateur', 'Abateur', 1),
('ambulance', 'Ambulance', 1),
('armenien', 'Les Arménien', 1),
('armeniens', 'Armeniens', 1),
('avocat', 'Avocat', 1),
('bahamas', 'bahamas', 1),
('ballas', 'Ballas', 1),
('blancos', 'Los Blancos', 1),
('ble', 'Blés', 1),
('bloods', 'Bloods', 1),
('brasseur', 'Brasseur', 1),
('cali', 'Cartel de Cali', 1),
('carshop', 'Concessionnaire Voitures', 1),
('cartelcali', 'Cartel De Cali', 1),
('carteldecali', 'Cartel De Cali', 1),
('cayo', 'Cartel de Cayo', 1),
('cosanostra', 'Cosa Nostra', 1),
('crips', 'Crips', 1),
('families', 'Families', 1),
('famillies', 'Famillies', 1),
('gouvernement', 'Gouvernement', 1),
('independence', 'independence', 1),
('journalist', 'Journaliste', 1),
('lost', 'Lost MC', 1),
('lscustom', 'LS Custom', 0),
('madrazo', 'Madrazo', 1),
('marabunta', 'Marabunta', 1),
('marseillais', 'Les Marseillais', 1),
('mecano', 'Mecano', 1),
('motoshop', 'Concessionnaire Motos', 1),
('ms13', 'MS-13', 1),
('planeshop', 'Concessionnaire Avions', 1),
('police', 'L.S.P.D', 1),
('rafineur', 'Rafineur', 1),
('realestateagent', 'Agent immobilier', 1),
('rockford', 'Rockfords studio', 0),
('sheriff', 'Sheriff', 0),
('soa', 'SOA', 1),
('swhite', 'Seventy White', 1),
('tabac', 'Marlboro', 1),
('taxi', 'Taxi', 1),
('testtest', 'testtest', 1),
('unemployed', 'Chomeur', 0),
('unemployed2', 'Citoyens', 1),
('unicorn', 'Unicorn', 1),
('vagos', 'Vagos', 1),
('vigne', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'ambulance', 0, 'ambulance', 'Ambulancier', 100, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":11,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":446,\"pants_1\":61,\"blush_3\":0,\"torso_2\":6,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":55,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":10,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":174,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":93,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":87,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":23,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":1,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":4,\"decals_1\":65,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":105,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":0,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":257,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(2, 'ambulance', 1, 'doctor', 'Medecin', 150, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":11,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":446,\"pants_1\":61,\"blush_3\":0,\"torso_2\":6,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":55,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":10,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":174,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":93,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":87,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":51,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":7,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":1,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":106,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":2,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":9,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(3, 'ambulance', 2, 'chief_doctor', 'Médecin-Chef', 200, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":11,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":446,\"pants_1\":61,\"blush_3\":0,\"torso_2\":6,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":55,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":10,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":174,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":93,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":87,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":50,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":2,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":4,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":96,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":0,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":258,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(4, 'ambulance', 3, 'boss', 'Directeur', 200, '{\"beard_1\":0,\"eye_color\":0,\"makeup_3\":0,\"blemishes_1\":0,\"mask_1\":11,\"glasses_1\":0,\"bproof_2\":0,\"lipstick_3\":0,\"beard_2\":0,\"torso_1\":446,\"pants_1\":61,\"blush_3\":0,\"torso_2\":6,\"blush_2\":0,\"complexion_1\":0,\"lipstick_2\":0,\"makeup_2\":0,\"bproof_1\":55,\"sun_2\":0,\"complexion_2\":0,\"chain_2\":0,\"sun_1\":0,\"eyebrows_3\":0,\"tshirt_1\":15,\"hair_color_1\":0,\"eyebrows_2\":0,\"mask_2\":0,\"helmet_2\":0,\"hair_2\":0,\"beard_3\":0,\"moles_2\":0,\"bags_1\":0,\"arms_2\":0,\"decals_2\":0,\"age_1\":0,\"ears_1\":-1,\"moles_1\":0,\"bracelets_2\":0,\"watches_1\":-1,\"face\":0,\"bags_2\":0,\"pants_2\":10,\"chest_3\":0,\"blemishes_2\":0,\"chest_1\":0,\"hair_color_2\":0,\"blush_1\":0,\"tshirt_2\":0,\"helmet_1\":174,\"hair_1\":0,\"shoes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"ears_2\":0,\"watches_2\":0,\"bodyb_2\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"decals_1\":93,\"makeup_4\":0,\"glasses_2\":0,\"age_2\":0,\"shoes_1\":8,\"arms\":87,\"chain_1\":0,\"bracelets_1\":-1,\"chest_2\":0,\"beard_4\":0,\"makeup_1\":0,\"lipstick_1\":0,\"skin\":0,\"sex\":0}', '{\"age_1\":0,\"blush_3\":0,\"complexion_2\":0,\"bracelets_2\":0,\"chain_2\":0,\"bodyb_1\":0,\"pants_1\":51,\"hair_1\":4,\"lipstick_4\":0,\"bproof_2\":0,\"bodyb_2\":0,\"shoes_2\":2,\"sun_2\":0,\"blush_1\":0,\"shoes_1\":81,\"decals_1\":66,\"eyebrows_2\":10,\"makeup_1\":6,\"glasses\":0,\"chest_3\":0,\"bags_2\":0,\"arms\":96,\"watches_1\":2,\"arms_2\":0,\"hair_color_1\":28,\"beard_3\":0,\"chain_1\":96,\"chest_1\":0,\"mask_1\":0,\"sex\":1,\"decals_2\":0,\"bproof_1\":0,\"hair_color_2\":28,\"eyebrows_3\":61,\"makeup_2\":8,\"helmet_1\":-1,\"bags_1\":0,\"lipstick_3\":23,\"face\":45,\"bracelets_1\":-1,\"tshirt_1\":29,\"beard_4\":0,\"moles_2\":10,\"mask_2\":0,\"helmet_2\":0,\"makeup_3\":25,\"skin\":10,\"beard_2\":0,\"shoes\":1,\"blemishes_2\":0,\"moles_1\":0,\"pants_2\":0,\"complexion_1\":0,\"glasses_2\":1,\"age_2\":0,\"ears_1\":12,\"watches_2\":0,\"eyebrows_4\":0,\"eye_color\":3,\"lipstick_2\":4,\"glasses_1\":11,\"eyebrows_1\":1,\"ears_2\":0,\"makeup_4\":18,\"sun_1\":0,\"blush_2\":0,\"torso_2\":2,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"torso_1\":14,\"lipstick_1\":1,\"blemishes_1\":0,\"beard_1\":0}'),
(7, 'avocat', 0, 'recruit', 'Recrue', 1000, '{\"tshirt_1\":57,\"torso_1\":55,\"arms\":0,\"pants_1\":35,\"glasses\":0,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":5,\"face\":19,\"glasses_2\":1,\"torso_2\":0,\"shoes\":24,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":8}', '{\"tshirt_1\":34,\"torso_1\":48,\"shoes\":24,\"pants_1\":34,\"torso_2\":0,\"decals_2\":0,\"hair_color_2\":0,\"glasses\":0,\"helmet_2\":0,\"hair_2\":3,\"face\":21,\"decals_1\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"arms\":14,\"hair_color_1\":10,\"tshirt_2\":0,\"helmet_1\":57}'),
(8, 'avocat', 1, 'boss', 'Patron', 2000, '{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":41,\"torso_2\":0,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"decals_1\":8,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}', '{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":21,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"hair_color_1\":10,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"shoes\":24,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
(66, 'taxi', 0, 'recrue', 'Recrue', 500, '{}', '{}'),
(67, 'taxi', 1, 'novice', 'Novice', 600, '{}', '{}'),
(68, 'taxi', 2, 'experimente', 'Experimente', 800, '{}', '{}'),
(69, 'taxi', 3, 'uber', 'Uber', 1000, '{}', '{}'),
(70, 'taxi', 4, 'boss', 'Patron', 1000, '{}', '{}'),
(74, 'unemployed', 0, 'unemployed', 'R.S.A', 200, '{}', '{}'),
(79, 'vigne', 0, 'recrue', 'Recrue', 150, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(80, 'vigne', 1, 'novice', 'Novice', 300, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(81, 'vigne', 2, 'cdisenior', 'Chef de Chai', 500, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(82, 'vigne', 3, 'boss', 'Patron', 1000, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(148, 'realestateagent', 0, 'location', 'Location', 1000, '{}', '{}'),
(149, 'realestateagent', 1, 'vendeur', 'Vendeur', 1500, '{}', '{}'),
(150, 'realestateagent', 2, 'gestion', 'Gestion', 2000, '{}', '{}'),
(151, 'realestateagent', 3, 'boss', 'Patron', 2500, '{}', '{}'),
(157, 'unemployed2', 0, 'unemployed2', 'Citoyen', 0, '{}', '{}'),
(182, 'journalist', 0, 'stagiaire', 'Stagiaire', 1, '{}', '{}'),
(183, 'journalist', 1, 'reporter', 'Reporter', 1, '{}', '{}'),
(184, 'journalist', 2, 'investigator', 'Investigateur', 1, '{}', '{}'),
(185, 'journalist', 3, 'boss', 'Directeur', 5, '{}', '{}'),
(462, 'carshop', 0, 'novice', 'Novice', 2000, '{}', '{}'),
(463, 'carshop', 1, 'sergeant', 'Intermediaire', 2500, '{}', '{}'),
(464, 'carshop', 2, 'experienced', 'Experimente', 2600, '{}', '{}'),
(465, 'carshop', 3, 'boss', 'Patron', 4800, '{}', '{}'),
(466, 'planeshop', 3, 'boss', 'Patron', 2000, '{}', '{}'),
(467, 'planeshop', 2, 'experienced', 'Experimente', 200, '{}', '{}'),
(468, 'planeshop', 1, 'sergeant', 'Intermediaire', 200, '{}', '{}'),
(469, 'planeshop', 0, 'novice', 'Novice', 200, '{}', '{}'),
(470, 'motoshop', 3, 'boss', 'Patron', 1000, '{}', '{}'),
(471, 'motoshop', 2, 'experienced', 'Experimente', 0, '{}', '{}'),
(472, 'motoshop', 1, 'sergeant', 'Intermediaire', 0, '{}', '{}'),
(473, 'motoshop', 0, 'novice', 'Novice', 0, '{}', '{}'),
(692, 'unicorn', 0, 'barman', 'Barman', 300, '{}', '{}'),
(693, 'unicorn', 1, 'ambianceur', 'Ambianceur', 500, '{}', '{}'),
(694, 'unicorn', 2, 'secu', 'Securiter', 800, '{}', '{}'),
(695, 'unicorn', 3, 'chefsecu', 'Chef-Securiter', 900, '{}', '{}'),
(696, 'unicorn', 4, 'viceboss', 'Co-Gérant', 1000, '{}', '{}'),
(697, 'unicorn', 5, 'boss', 'Gérant', 1200, '{}', '{}'),
(78418289, 'police', 0, 'recruit', 'Recrue', 1800, '{}', '{}'),
(78418290, 'police', 1, 'officer', 'Officier', 2500, '{}', '{}'),
(78418291, 'police', 2, 'officerii', 'Officier II', 3200, '{}', '{}'),
(78418292, 'police', 3, 'officeriii', 'Officier III', 3800, '{}', '{}'),
(78418293, 'police', 4, 'slo', 'S.L.O', 4200, '{}', '{}'),
(78418294, 'police', 5, 'sergeant', 'Sergent', 4800, '{}', '{}'),
(78418295, 'police', 6, 'sergeantii', 'Sergent II', 5200, '{}', '{}'),
(78418296, 'police', 7, 'lieutenant', 'Lieutenant', 6500, '{}', '{}'),
(78418297, 'police', 8, 'chef', 'Capitaine', 7500, '{}', '{}'),
(78418298, 'police', 9, 'cmd', 'Commandant', 8500, '{}', '{}'),
(78418299, 'police', 10, 'boss', 'Deputy Chief', 0, '{}', '{}'),
(78418300, 'police', 11, 'boss', 'Assistant Chief', 0, '{}', '{}'),
(78418301, 'police', 12, 'boss', 'Chief', 0, '{}', '{}'),
(78418302, 'bahamas', 0, 'barman', 'Barman', 1003, '{}', '{}'),
(78418303, 'bahamas', 1, 'dancer', 'Danseur', 300, '{}', '{}'),
(78418304, 'bahamas', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
(78418305, 'bahamas', 3, 'boss', 'Gérant', 0, '{}', '{}'),
(78418306, 'gouvernement', 0, 'secu', 'SR 3ème CLASSE', 1500, '{}', '{}'),
(78418307, 'gouvernement', 1, 'secuii', 'SR 2ème CLASSE', 2000, '{}', '{}'),
(78418308, 'gouvernement', 2, 'secuchef', 'SR 1er CLASSE', 3000, '{}', '{}'),
(78418309, 'gouvernement', 4, 'proc', 'Procureur', 500, '{}', '{}'),
(78418310, 'gouvernement', 5, 'juge', 'Juge', 500, '{}', '{}'),
(78418311, 'gouvernement', 6, 'secretaire', 'Secrétaire d état', 500, '{}', '{}'),
(78418312, 'gouvernement', 7, 'viceboss', 'Représentant', 500, '{}', '{}'),
(78418313, 'gouvernement', 8, 'boss', 'Gouverneur', 500, '{}', '{}'),
(78418314, 'tabac', 0, 'recrue', 'Tabagiste Marlboro', 400, '{}', '{}'),
(78418315, 'tabac', 1, 'gerant', 'Gérant Marlboro', 650, '{}', '{}'),
(78418316, 'tabac', 2, 'boss', 'Patron Marlboro', 800, '{}', '{}'),
(78418317, 'ballas', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418318, 'ballas', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418319, 'ballas', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418320, 'ballas', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418321, 'ballas', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418322, 'ballas', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418323, 'vagos', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418324, 'vagos', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418325, 'vagos', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418326, 'vagos', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418327, 'vagos', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418328, 'vagos', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418329, 'madrazo', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418330, 'madrazo', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418331, 'madrazo', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418332, 'madrazo', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418333, 'madrazo', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418334, 'madrazo', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418335, 'cosanostra', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418336, 'cosanostra', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418337, 'cosanostra', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418338, 'cosanostra', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418339, 'cosanostra', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418340, 'cosanostra', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418341, 'famillies', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418342, 'famillies', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418343, 'famillies', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418344, 'famillies', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418345, 'famillies', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418346, 'famillies', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418347, 'mecano', 2, 'boss', 'PDG', 2000, '{}', '{}'),
(78418348, 'mecano', 0, 'employer', 'Employer', 800, '{}', '{}'),
(78418349, 'mecano', 1, 'responsable', 'Responsable', 1000, '{}', '{}'),
(78418350, 'bloods', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418351, 'bloods', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418352, 'bloods', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418353, 'bloods', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418354, 'bloods', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418355, 'bloods', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418359, 'marabunta', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418360, 'marabunta', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418361, 'marabunta', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418362, 'marabunta', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418363, 'marabunta', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418364, 'marabunta', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418365, 'rockford', 0, 'stagaire', 'Stagaire', 100, 'null', 'null'),
(78418366, 'rockford', 1, 'employe', 'employe', 200, 'null', 'null'),
(78418367, 'rockford', 2, 'responsable', 'Responsable', 300, 'null', 'null'),
(78418368, 'rockford', 3, 'boss', 'Patron', 400, 'null', 'null'),
(78418369, 'brasseur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418370, 'brasseur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418371, 'brasseur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418375, 'abateur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418376, 'abateur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418377, 'abateur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418378, 'abateur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418379, 'abateur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418380, 'abateur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418381, 'abateur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418382, 'abateur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418383, 'abateur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418384, 'cartelcali', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418385, 'cartelcali', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418386, 'cartelcali', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418387, 'cartelcali', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418388, 'cartelcali', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418389, 'cartelcali', 5, 'boss', 'Parrain', 0, '{}', '{}'),
(78418390, 'armenien', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418391, 'armenien', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418392, 'armenien', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418393, 'armenien', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418394, 'armenien', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418395, 'armenien', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418396, 'carteldecali', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418397, 'carteldecali', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418398, 'carteldecali', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418399, 'carteldecali', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418400, 'carteldecali', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418401, 'carteldecali', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418402, 'testtest', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418403, 'testtest', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418404, 'testtest', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418405, 'testtest', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418406, 'testtest', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418407, 'testtest', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418414, 'ble', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418415, 'ble', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418416, 'ble', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418417, 'ble', 2, 'boss', 'PDG', 5000, '{}', '{}'),
(78418418, 'ble', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
(78418419, 'ble', 0, 'employer', 'Employer', 2500, '{}', '{}'),
(78418420, 'tabac', 2, 'boss', 'PDG', 1000, '{}', '{}'),
(78418421, 'tabac', 1, 'responsable', 'Responsable', 500, '{}', '{}'),
(78418422, 'tabac', 0, 'employer', 'Employer', 200, '{}', '{}'),
(78418423, 'rafineur', 0, 'employer', 'Employer', 200, '{}', '{}'),
(78418424, 'rafineur', 1, 'responsable', 'Responsable', 500, '{}', '{}'),
(78418425, 'rafineur', 2, 'boss', 'PDG', 1000, '{}', '{}'),
(78418426, 'cayo', 0, 'rookie', 'Associé', 0, '{}', '{}'),
(78418427, 'cayo', 1, 'member', 'Soldat', 0, '{}', '{}'),
(78418428, 'cayo', 2, 'elite', 'Elite', 0, '{}', '{}'),
(78418429, 'cayo', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
(78418430, 'cayo', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
(78418431, 'cayo', 5, 'boss', 'Patron', 0, '{}', '{}'),
(78418432, 'gouvernement', 3, 'avocat', 'Avocat', 500, '{}', '{}'),
(78418433, 'sheriff', 0, 'recruit', 'Recrue', 1800, '{}', '{}'),
(78418434, 'sheriff', 1, 'deputy', 'Deputy', 2500, '{}', '{}'),
(78418435, 'sheriff', 2, 'deputyii', 'Senior-Deputy', 3200, '{}', '{}'),
(78418436, 'sheriff', 4, 'adjudant', 'Adjudant', 3800, '{}', '{}'),
(78418437, 'sheriff', 5, 'adjudantii', 'Adjudant-Chef', 4200, '{}', '{}'),
(78418438, 'sheriff', 6, 'caporal', 'Caporal', 4800, '{}', '{}'),
(78418439, 'sheriff', 7, 'major', 'Major', 5200, '{}', '{}'),
(78418440, 'sheriff', 8, 'lieutenant', 'Sous-lieutenant', 6500, '{}', '{}'),
(78418441, 'sheriff', 9, 'lieutenantii', 'lieutenant', 7500, '{}', '{}'),
(78418442, 'sheriff', 10, 'colonel', 'Sous-Colonel', 10000, '{}', '{}'),
(78418443, 'sheriff', 11, 'colonelii', 'Colonel', 12000, '{}', '{}'),
(78418444, 'sheriff', 12, 'commandant', 'Commandant', 15000, '{}', '{}'),
(78418445, 'sheriff', 13, 'chef', 'Shériff-Adjoint', 18000, '{}', '{}'),
(78418446, 'sheriff', 14, 'boss', 'Shériff', 20000, '{}', '{}'),
(78418447, 'cali', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418448, 'cali', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418449, 'cali', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418450, 'cali', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418451, 'vagos', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418452, 'vagos', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418453, 'vagos', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418454, 'vagos', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418455, 'armeniens', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418456, 'armeniens', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418457, 'armeniens', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418458, 'armeniens', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418459, 'ballas', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418460, 'ballas', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418461, 'ballas', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418462, 'ballas', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418463, 'families', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418464, 'families', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418465, 'families', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418466, 'families', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418467, 'cayo', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418468, 'cayo', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418469, 'cayo', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418470, 'cayo', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418471, 'marabunta', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418472, 'marabunta', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418473, 'marabunta', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418474, 'marabunta', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418475, 'lost', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418476, 'lost', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418477, 'lost', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418478, 'lost', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418479, 'bloods', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418480, 'bloods', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418481, 'bloods', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418482, 'bloods', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418483, 'cosanostra', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418484, 'cosanostra', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418485, 'cosanostra', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418486, 'cosanostra', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418487, 'soa', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418488, 'soa', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418489, 'soa', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418490, 'soa', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418491, 'blancos', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418492, 'blancos', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418493, 'blancos', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418494, 'blancos', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418501, 'crips', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418502, 'crips', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418503, 'crips', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418504, 'crips', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418505, 'crips', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418506, 'crips', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418507, 'crips', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418508, 'crips', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418509, 'marseillais', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418510, 'marseillais', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418511, 'marseillais', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418512, 'marseillais', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418513, 'ms13', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418514, 'ms13', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418515, 'ms13', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418516, 'ms13', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418517, 'marseillais', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418518, 'marseillais', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418519, 'marseillais', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418520, 'marseillais', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418521, 'madrazo', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418522, 'madrazo', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418523, 'madrazo', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418524, 'madrazo', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418525, 'independence', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418526, 'independence', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418527, 'independence', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418528, 'independence', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418529, 'Seventy White', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418530, 'Seventy White', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418531, 'Seventy White', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418532, 'Seventy White', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418533, 'swhite', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418534, 'swhite', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418535, 'swhite', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418536, 'swhite', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418537, 'Seventy-White', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418538, 'Seventy-White', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418539, 'Seventy-White', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418540, 'Seventy-White', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418541, 'White', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418542, 'White', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418543, 'White', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418544, 'White', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418545, 'White', 3, 'boss', 'Boss', 0, '{}', '{}'),
(78418546, 'White', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
(78418547, 'White', 1, 'membre', 'Membre', 0, '{}', '{}'),
(78418548, 'White', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
(78418549, 'lscustom', 0, 'recrue', 'Recruit', 150, '{}', '{}'),
(78418550, 'lscustom', 1, 'novice', 'Novice', 200, '{}', '{}'),
(78418551, 'lscustom', 2, 'experimente', 'Experienced', 250, '{}', '{}'),
(78418552, 'lscustom', 3, 'chief', 'Leader', 300, '{}', '{}'),
(78418553, 'lscustom', 4, 'boss', 'Boss', 350, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion'),
('weapon', 'PPA 1'),
('weapon2', 'PPA 2');

-- --------------------------------------------------------

--
-- Structure de la table `azoki_houses`
--

CREATE TABLE `azoki_houses` (
  `id` int(11) NOT NULL,
  `owner` varchar(80) NOT NULL,
  `ownerInfo` varchar(255) NOT NULL DEFAULT 'none',
  `infos` text NOT NULL,
  `inventory` text NOT NULL,
  `createdAt` text NOT NULL,
  `createdBy` varchar(80) NOT NULL,
  `street` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `azoki_housesinside`
--

CREATE TABLE `azoki_housesinside` (
  `license` varchar(80) NOT NULL,
  `houseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `azoki_isdead`
--

CREATE TABLE `azoki_isdead` (
  `id` int(25) NOT NULL,
  `license` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `azoki_luckwheel_paid`
--

CREATE TABLE `azoki_luckwheel_paid` (
  `license` varchar(80) NOT NULL,
  `ammount` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `azoki_luckywheel`
--

CREATE TABLE `azoki_luckywheel` (
  `license` varchar(80) NOT NULL,
  `time` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `open_car`
--

CREATE TABLE `open_car` (
  `owner` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `NB` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Votre voiture',
  `boutique` tinyint(1) NOT NULL DEFAULT 0,
  `carseller` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `owned_vehicles`
--


-- --------------------------------------------------------

--
-- Structure de la table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `playerstattoos`
--

CREATE TABLE `playerstattoos` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `society`
--

CREATE TABLE `society` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `money` varchar(255) NOT NULL,
  `moneysale` varchar(255) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `society`
--

INSERT INTO `society` (`id`, `name`, `money`, `moneysale`, `data`) VALUES
(20, 'brasseur', '1875', '0', '{\"water\":{\"label\":\"Bouteille d\'eau\",\"item\":\"water\",\"count\":0},\"clip\":{\"label\":\"Chargeur\",\"item\":\"clip\",\"count\":0},\"biere\":{\"label\":\"Bière\",\"item\":\"biere\",\"count\":75},\"malt\":{\"label\":\"Malt\",\"item\":\"malt\",\"count\":0},\"bandage\":{\"label\":\"Bandage\",\"item\":\"bandage\",\"count\":0},\"piluleoubli\":{\"label\":\"GHB\",\"item\":\"piluleoubli\",\"count\":0},\"cb\":{\"label\":\"Carte Bleu\",\"item\":\"cb\",\"count\":0}}'),
(22, 'abateur', '4660', '0', '[]'),
(27, 'ble', '4005', '0', '[]'),
(28, 'ble', '4005', '0', '[]'),
(29, 'tabac', '7795', '0', '{\"water\":{\"label\":\"Bouteille d\'eau\",\"item\":\"water\",\"count\":0.0}}'),
(30, 'rafineur', '0', '0', '[]');

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `tebex_boutique`
--

CREATE TABLE `tebex_boutique` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `name` text NOT NULL,
  `descriptions` text NOT NULL,
  `price` int(11) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `action` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tebex_boutique`
--

INSERT INTO `tebex_boutique` (`id`, `category`, `name`, `descriptions`, `price`, `is_enabled`, `action`, `created_at`, `updated_at`) VALUES
(3, 3, 'Caisse ~y~Gold', 'Contient : ', 1500, 1, ' {\"case\":[{\"type\":\"case_2\",\"name\":\"global_2\"}]}\n\n', '2021-04-21 11:38:05', '2021-04-21 11:38:05'),
(5, 2, 'Dodge Challenger', '16challenger', 2000, 1, ' {\"vehicles\":[{\"type\":\"16challanger\",\"name\":\"16challenger\"}]}\n\n', '2021-04-21 11:38:05', '2021-04-21 11:38:05'),
(15, 2, 'Yamaha Banshee', 'banshee87', 1000, 1, ' {\"vehicles\":[{\"type\":\"banshee87\",\"name\":\"banshee87\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(38, 2, 'Toyota Supra', 'a80', 1500, 1, ' {\"vehicles\":[{\"type\":\"a80\",\"name\":\"a80\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(41, 2, 'Nissan GTR', 'gtr', 2000, 1, ' {\"vehicles\":[{\"type\":\"gtr\",\"name\":\"gtr\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(42, 2, 'Ninja Nagazaki', 'ninjah2', 1500, 1, ' {\"vehicles\":[{\"type\":\"ninjah2\",\"name\":\"ninjah2\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(43, 2, 'Mclaren P1', 'p1', 3000, 1, ' {\"vehicles\":[{\"type\":\"p1\",\"name\":\"p1\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(44, 2, 'Mercedes GT63 AMG', 'rmodgt63', 2500, 1, ' {\"vehicles\":[{\"type\":\"rmodgt63\",\"name\":\"rmodgt63\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(45, 2, 'Nissan Skyline GTR', 'skyline', 1500, 1, ' {\"vehicles\":[{\"type\":\"skyline\",\"name\":\"skyline\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(46, 2, 'lamborghini aventador', 'ahksv', 2500, 1, ' {\"vehicles\":[{\"type\":\"ahksv\",\"name\":\"ahksv\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(48, 2, 'Ferrari Aperta', 'aperta', 3000, 1, ' {\"vehicles\":[{\"type\":\"aperta\",\"name\":\"aperta\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(51, 2, 'lamborghini huracan liberty walk', '610lb', 2500, 1, ' {\"vehicles\":[{\"type\":\"610lb\",\"name\":\"610lb\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(54, 2, 'Bmw M4 ', 'rmodm4gts', 2000, 1, ' {\"vehicles\":[{\"type\":\"rmodm4gts\",\"name\":\"rmodm4gts\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(57, 3, 'Caisse ~b~Diamond', 'Contient : ', 2500, 1, ' {\"case\":[{\"type\":\"case_3\",\"name\":\"global_3\"}]}\n\n', '2021-04-21 11:38:05', '2021-04-21 11:38:05'),
(58, 3, 'Caisse ~r~Ruby', 'Contient : ', 5000, 1, ' {\"case\":[{\"type\":\"case_4\",\"name\":\"global_4\"}]}\n\n', '2021-04-21 11:38:05', '2021-04-21 11:38:05'),
(59, 2, 'Lamborghini Venatus', 'venatus', 2500, 1, ' {\"vehicles\":[{\"type\":\"venatus\",\"name\":\"venatus\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(60, 2, 'Mercedes Brabus 500', 'brabus500', 2500, 1, ' {\"vehicles\":[{\"type\":\"brabus500\",\"name\":\"brabus500\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(61, 2, 'Audi Q8', 'q820', 2500, 1, ' {\"vehicles\":[{\"type\":\"q820\",\"name\":\"q820\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(63, 2, 'Tmax', 'tmaxdx', 1500, 1, ' {\"vehicles\":[{\"type\":\"tmaxdx\",\"name\":\"tmaxdx\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(64, 2, 'Audi RS3', 'rs318', 2500, 1, ' {\"vehicles\":[{\"type\":\"rs318\",\"name\":\"rs318\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(66, 4, 'Pack Entreprise ( Farm )', 'En achetant ce pack vous bénéficiez de  :                      - 1 Entreprise affiché sur la map                                    - 1 Gestion d\'entreprise                                                                         - 1 run entier ( Récolte, Traitement, Vente)', 3500, 1, 'nil', '2021-07-03 10:50:44', '2021-07-03 10:50:44'),
(67, 2, 'Audi SQ7', 'sq72016', 2500, 1, ' {\"vehicles\":[{\"type\":\"sq72016\",\"name\":\"sq72016\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(70, 2, 'Buggy 4 places', 'cfmotoz10', 1500, 1, ' {\"vehicles\":[{\"type\":\"cfmotoz10\",\"name\":\"cfmotoz10\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(77, 2, 'Bmw M5', '22m5', 1500, 1, ' {\"vehicles\":\r\n[{\"type\":\"22m5\",\"name\":\"22m5\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(79, 2, 'BENTAYGA', 'BENTAYGAST', 2500, 1, ' {\"vehicles\":\r\n[{\"type\":\"BENTAYGAST\",\"name\":\"BENTAYGAST\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(80, 2, 'G63AMG6x6', 'G63AMG6x6', 2500, 1, ' {\"vehicles\":\r\n[{\"type\":\"G63AMG6x6\",\"name\":\"G63AMG6x6\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(81, 2, 'Range Rover ', 'mansrr', 2500, 1, ' {\"vehicles\":[{\"type\":\"mansrr\",\"name\":\"mansrr\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(84, 2, 'Ford Bronco', 'wildtrak', 2000, 1, ' {\"vehicles\":[{\"type\":\"wildtrak\",\"name\":\"wildtrak\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(86, 2, 'Porsche Panamera ', 'Pturismo', 2500, 1, ' {\"vehicles\":[{\"type\":\"Pturismo\",\"name\":\"Pturismo\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(87, 2, 'Bugatti Divo', 'divo', 2500, 1, ' {\"vehicles\":[{\"type\":\"divo\",\"name\":\"divo\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(88, 2, 'Jeep', 'demonhawk', 2000, 1, ' {\"vehicles\":[{\"type\":\"demonhawk\",\"name\":\"demonhawk\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(89, 2, 'Porsche 911', '911turbos', 2500, 1, ' {\"vehicles\":[{\"type\":\"911turbos\",\"name\":\"911turbos\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(90, 2, 'Maclaren 720S', '720ss', 2500, 1, ' {\"vehicles\":[{\"type\":\"720ss\",\"name\":\"720ss\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(91, 2, 'Ferrari 812', 'F812', 2500, 1, ' {\"vehicles\":[{\"type\":\"F812\",\"name\":\"F812\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(92, 2, 'Lego Porsche ', 'legoporsche', 1500, 1, ' {\"vehicles\":[{\"type\":\"legoporsche\",\"name\":\"legoporsche\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(93, 2, 'Ford Raptor', '19raptor', 2500, 1, ' {\"vehicles\":[{\"type\":\"19raptor\",\"name\":\"19raptor\"}]}\r\n\r\n', '2021-04-21 11:38:05', '2021-04-21 11:38:05'),
(94, 2, 'Audi R8', 'r820', 1500, 1, ' {\"vehicles\":[{\"type\":\"r820\",\"name\":\"r820\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(95, 2, 'Mercedes C63', 'rmodc63amg', 2000, 1, ' {\"vehicles\":[{\"type\":\"rmodc63amg\",\"name\":\"rmodc63amg\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(96, 2, 'Bmw M8', 'rmodbmwm8', 2000, 1, ' {\"vehicles\":[{\"type\":\"rmodbmwm8\",\"name\":\"rmodbmwm8\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(97, 2, 'Audi Rs7', 'rs7r', 2500, 1, ' {\"vehicles\":[{\"type\":\"rs7r\",\"name\":\"rs7r\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(98, 2, 'RS6', 'rmodrs6', 2500, 1, ' {\"vehicles\":[{\"type\":\"rmodrs6\",\"name\":\"rmodrs6\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(99, 2, 'Mercedes a45', 'a45', 2000, 1, ' {\"vehicles\":[{\"type\":\"a45\",\"name\":\"a45\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(100, 1, 'Pistolet', 'Equipez vous afin de faire peur a vos ennemies', 1000, 0, 'weapon_pistol', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(101, 1, 'Pistolet Cal 50', 'Equipez vous afin de faire peur a vos ennemies', 1500, 0, 'weapon_pistol50', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(102, 1, 'Pistolet Lourd', 'Equipez vous afin de faire peur a vos ennemies', 1500, 0, 'weapon_heavypistol', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(103, 1, 'Micro SMG', 'Equipez vous afin de faire peur a vos ennemies', 2000, 0, 'weapon_microsmg', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(104, 1, 'SMG', 'Equipez vous afin de faire peur a vos ennemies', 2000, 0, 'weapon_smg', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(105, 1, 'PDW de Combat', 'Equipez vous afin de faire peur a vos ennemies', 2000, 0, 'weapon_combatpdw', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(106, 1, 'Pistolet Machine', 'Equipez vous afin de faire peur a vos ennemies', 2000, 0, 'weapon_machinepistol', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(107, 1, 'Mini SMG', 'Equipez vous afin de faire peur a vos ennemies', 2000, 0, 'weapon_minismg', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(108, 1, 'AK47', 'Equipez vous afin de faire peur a vos ennemies', 3000, 1, 'weapon_assaultrifle', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(110, 2, 'Honda Cr85', 'cr85', 1000, 1, ' {\"vehicles\":[{\"type\":\"cr85\",\"name\":\"cr85\"}]}', '2021-06-29 03:58:53', '2021-06-29 03:58:53'),
(111, 2, 'RAM 1500', '1500ram', 10000, 1, ' {\"vehicles\":[{\"type\":\"1500ram\",\"name\":\"1500ram\"}]}\r\n\r\n', '2021-04-21 11:38:05', '2021-04-21 11:38:05');

-- --------------------------------------------------------

--
-- Structure de la table `tebex_boutique_category`
--

CREATE TABLE `tebex_boutique_category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `descriptions` text NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tebex_boutique_category`
--

INSERT INTO `tebex_boutique_category` (`id`, `name`, `descriptions`, `is_enabled`, `created_at`, `updated_at`) VALUES
(1, 'Armes', 'Equipe toi en arme pour faire peur a tes ennemies !', 1, '2020-10-31 21:28:00', '2020-10-31 21:28:00'),
(2, 'Véhicules', 'Choisis ton véhicule préféré !', 1, '2020-10-31 21:28:00', '2020-10-31 21:28:00'),
(3, 'Caisses', 'Caisse ~y~GOLD~s~ contient : ~n~2 niveaux de raretés : ~n~ - Commun ~n~ - Épique ~n~Caisse ~b~DIAMOND~s~ contient : ~n~3 niveaux de raretés : ~n~ - Commun ~n~ - Épique ~n~ - Légendaire ~n~', 0, '2020-10-31 21:28:00', '2020-10-31 21:28:00'),
(4, 'Pack', 'Cette catégorie consiste à acheter des packs qui sont disponible sur notre boutique', 1, '2022-01-21 00:43:19', '2022-01-21 00:43:19'),
(5, 'Hélico/Avion/Bateau', 'Choisis ton véhicule préféré !', 0, '2022-02-04 10:10:16', '2022-02-04 10:10:16');

-- --------------------------------------------------------

--
-- Structure de la table `tebex_players_wallet`
--

CREATE TABLE `tebex_players_wallet` (
  `identifiers` text NOT NULL,
  `transaction` text DEFAULT NULL,
  `price` text NOT NULL,
  `currency` text DEFAULT NULL,
  `points` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `twitter_likes`
--

INSERT INTO `twitter_likes` (`id`, `authorId`, `tweetId`) VALUES
(3, 37, 1180),
(4, 48, 1190),
(5, 58, 1206);

-- --------------------------------------------------------

--
-- Structure de la table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `character_id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `permission_group` varchar(50) COLLATE utf8mb4_bin DEFAULT 'user',
  `permission_level` int(11) DEFAULT 0,
  `position` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `accounts` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `isDead` int(11) DEFAULT 0,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `animations` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) DEFAULT 1,
  `cloths` text COLLATE utf8mb4_bin DEFAULT NULL,
  `statuscompte` tinyint(1) DEFAULT 0,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `starterpack` varchar(255) COLLATE utf8mb4_bin DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_accessories`
--

CREATE TABLE `user_accessories` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `mask` varchar(255) DEFAULT NULL,
  `tshirt` varchar(255) DEFAULT NULL,
  `bras` varchar(255) DEFAULT NULL,
  `label` varchar(50) DEFAULT 'Masque',
  `type` varchar(50) DEFAULT NULL,
  `index` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_parkings`
--

CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `garage` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`model`, `name`, `price`, `category`) VALUES
(' elegy', 'Elegy', 250000, 'super'),
('CHIMERA', 'CHIMERA', 55000, 'motorcycles'),
('adder', 'Adder', 500000, 'super'),
('akuma', 'Akuma', 17500, 'motorcycles'),
('alpha', 'Alpha', 60000, 'sports'),
('asea', 'Asea', 15000, 'sedans'),
('autarch', 'Autarch', 900000, 'super'),
('avarus', 'Avarus', 42000, 'motorcycles'),
('bagger', 'Bagger', 14000, 'motorcycles'),
('baller2', 'Baller', 50000, 'suvs'),
('baller3', 'Baller Sport', 75000, 'suvs'),
('banshee', 'Banshee', 40000, 'sports'),
('banshee2', 'Banshee 900R', 125000, 'super'),
('bati', 'Bati 801', 38500, 'motorcycles'),
('bati2', 'Bati 801RR', 14000, 'motorcycles'),
('bestiagts', 'Bestia GTS', 55000, 'sports'),
('bf400', 'BF400', 13500, 'motorcycles'),
('bfinjection', 'Bf Injection', 16000, 'offroad'),
('bifta', 'Bifta', 12000, 'offroad'),
('bison', 'Bison', 45000, 'vans'),
('blade', 'Blade', 15000, 'muscle'),
('blazer', 'Blazer', 6950, 'offroad'),
('blazer4', 'Blazer Sport', 8500, 'offroad'),
('blista', 'Blista', 7250, 'compacts'),
('bmws19', 'Bmw', 50000, 'motorcycles'),
('bmx', 'BMX (velo)', 820, 'motorcycles'),
('bobcatxl', 'Bobcat XL', 32000, 'vans'),
('brawler', 'Brawler', 125000, 'offroad'),
('brioso', 'Brioso R/A', 7500, 'compacts'),
('brioso2', 'Brioso', 5000, 'compacts'),
('btype', 'Btype', 110000, 'sportsclassics'),
('btype2', 'Btype Hotroad', 155000, 'sportsclassics'),
('btype3', 'Btype Luxe', 120000, 'sportsclassics'),
('buccaneer', 'Buccaneer', 18000, 'muscle'),
('buccaneer2', 'Buccaneer Rider', 15000, 'muscle'),
('buffalo', 'Buffalo', 18000, 'sports'),
('buffalo2', 'Buffalo S', 28750, 'sports'),
('bullet', 'Bullet', 90000, 'super'),
('burrito3', 'Burrito', 19000, 'vans'),
('calico', 'Calico', 100000, 'sports'),
('camper', 'Camper', 35000, 'vans'),
('carbonizzare', 'Carbonizzare', 75000, 'sports'),
('carbonrs', 'Carbon RS', 14500, 'motorcycles'),
('casco', 'Casco', 30000, 'sportsclassics'),
('cavalcade2', 'Cavalcade', 40000, 'suvs'),
('cheetah', 'Cheetah', 22000, 'super'),
('chimera', 'Chimera', 12800, 'motorcycles'),
('chino', 'Chino', 18000, 'muscle'),
('chino2', 'Chino Luxe', 18000, 'muscle'),
('cliffhanger', 'cliffhanger', 30000, 'motorcycles'),
('cogcabrio', 'Cognoscenti Cabrio', 55000, 'coupes'),
('cognoscenti', 'Cognoscenti', 19000, 'sedans'),
('comet2', 'Comet', 75000, 'sports'),
('comet5', 'Comet 5', 400000, 'sports'),
('contender', 'Contender', 35000, 'suvs'),
('coquette', 'Coquette', 65000, 'sports'),
('coquette2', 'Coquette Classic', 40000, 'sportsclassics'),
('coquette3', 'Coquette BlackFin', 55000, 'muscle'),
('coquette4', 'Coquette 4', 300000, 'super'),
('cruiser', 'Cruiser (velo)', 875, 'motorcycles'),
('cyclone', 'Cyclone', 1890000, 'super'),
('cypher', 'Cypher', 150000, 'sports'),
('daemon', 'Daemon', 11500, 'motorcycles'),
('daemon2', 'Daemon High', 19000, 'motorcycles'),
('defiler', 'Defiler', 20000, 'motorcycles'),
('dinghy3', 'Dinghy', 2500000, 'superboat'),
('dominator', 'Dominator', 35000, 'muscle'),
('double', 'Double T', 15000, 'motorcycles'),
('dubsta', 'Dubsta', 45000, 'suvs'),
('dubsta2', 'Dubsta Luxuary', 60000, 'suvs'),
('dubsta3', 'Bubsta 6x6', 235000, 'offroad'),
('dukes', 'Dukes', 28000, 'muscle'),
('dune', 'Dune Buggy', 8000, 'offroad'),
('elegy2', 'Elegy', 38500, 'sports'),
('emperor', 'Emperor', 8500, 'sedans'),
('enduro', 'Enduro', 10500, 'motorcycles'),
('entityxf', 'Entity XF', 210000, 'super'),
('esskey', 'Esskey', 14000, 'motorcycles'),
('exemplar', 'Exemplar', 25500, 'coupes'),
('f620', 'F620', 22000, 'coupes'),
('faction', 'Faction', 20000, 'muscle'),
('faction2', 'Faction Rider', 30000, 'muscle'),
('faction3', 'Faction XL', 40000, 'muscle'),
('faggio', 'Faggio', 2500, 'motorcycles'),
('faggio2', 'Vespa', 5250, 'motorcycles'),
('felon', 'Felon', 42000, 'coupes'),
('felon2', 'Felon GT', 18000, 'coupes'),
('feltzer2', 'Feltzer', 62000, 'sports'),
('feltzer3', 'Stirling GT', 65000, 'sportsclassics'),
('fixter', 'Fixter (velo)', 500, 'motorcycles'),
('fmj', 'FMJ', 185000, 'super'),
('fq2', 'Fhantom', 12500, 'suvs'),
('frogger', 'Frogger', 3250000, 'avionfdp'),
('fugitive', 'Fugitive', 12000, 'sedans'),
('furoregt', 'Furore GT', 45000, 'sports'),
('fusilade', 'Fusilade', 40000, 'sports'),
('gargoyle', 'Gargoyle', 24000, 'motorcycles'),
('gauntlet', 'Gauntlet', 30000, 'muscle'),
('gb200', 'Gb200', 98000, 'sports'),
('gburrito', 'Gang Burrito', 45000, 'vans'),
('gburrito2', 'Burrito', 29000, 'vans'),
('glendale', 'Glendale', 12300, 'sedans'),
('granger', 'Grabger', 50000, 'suvs'),
('gresley', 'Gresley', 30000, 'suvs'),
('gt500', 'GT 500', 75000, 'sportsclassics'),
('guardian', 'Guardian', 45000, 'offroad'),
('hakuchou', 'Hakuchou', 41000, 'motorcycles'),
('hakuchou2', 'Hakuchou Sport', 47000, 'motorcycles'),
('hermes', 'Hermes', 535000, 'muscle'),
('hexer', 'Hexer', 7500, 'motorcycles'),
('hotknife', 'Hotknife', 125000, 'muscle'),
('huntley', 'Huntley S', 40000, 'suvs'),
('hustler', 'Hustler', 530000, 'muscle'),
('infernus', 'Infernus', 180000, 'super'),
('innovation', 'Innovation', 8000, 'motorcycles'),
('intruder', 'Intruder', 7500, 'sedans'),
('italigto', 'Italigto ', 450000, 'super'),
('italirsx', 'Italirsx', 250000, 'super'),
('jackal', 'Jackal', 42000, 'coupes'),
('jester', 'Jester', 65000, 'sports'),
('jester2', 'Jester(Racecar)', 135000, 'sports'),
('jetmax', 'Jetmax', 1500000, 'superboat'),
('journey', 'Journey', 6850, 'vans'),
('jugular', 'Jugular', 80000, 'sports'),
('kamacho', 'Kamacho', 345000, 'offroad'),
('khamelion', 'Khamelion', 75000, 'sports'),
('komoda', 'Komoda', 70000, 'sports'),
('kuruma', 'Kuruma', 50000, 'sports'),
('landstalker', 'Landstalker', 35000, 'suvs'),
('le7b', 'RE-7B', 325000, 'super'),
('luxor', 'Luxor', 5000000, 'avionfdp'),
('luxor2', 'Luxor Deluxe', 10000000, 'avionfdp'),
('lynx', 'Lynx', 40000, 'sports'),
('mamba', 'Mamba', 90000, 'sports'),
('mammatus', 'Mammatus', 2750000, 'avionfdp'),
('manana', 'Manana', 12800, 'sportsclassics'),
('manchez', 'Manchez', 19000, 'motorcycles'),
('manchez2', 'Manchez 2', 16500, 'motorcycles'),
('marquis', 'Marquis', 3500000, 'superboat'),
('massacro', 'Massacro', 65000, 'sports'),
('massacro2', 'Massacro(Racecar)', 130000, 'sports'),
('mesa', 'Mesa', 16000, 'suvs'),
('mesa3', 'Mesa Trail', 32500, 'suvs'),
('minivan', 'Minivan', 8000, 'vans'),
('monroe', 'Monroe', 55000, 'sportsclassics'),
('moonbeam', 'Moonbeam', 18000, 'vans'),
('moonbeam2', 'Moonbeam Rider', 35000, 'vans'),
('nemesis', 'Nemesis', 19000, 'motorcycles'),
('neon', 'Neon', 400000, 'sports'),
('nightblade', 'Nightblade', 45000, 'motorcycles'),
('nightshade', 'Nightshade', 110000, 'muscle'),
('ninef2', '9F Cabrio', 80000, 'sports'),
('novak ', 'Novak', 175000, 'suvs'),
('omnis', 'Omnis', 120000, 'sports'),
('oracle2', 'Oracle XS', 13000, 'coupes'),
('osiris', 'Osiris', 190000, 'super'),
('panto', 'Panto', 2750, 'compacts'),
('paradise', 'Paradise', 10000, 'vans'),
('paragon', 'Paragon', 475000, 'sports'),
('pariah', 'Pariah', 1420000, 'sports'),
('patriot', 'Patriot', 35000, 'suvs'),
('pcj', 'PCJ-600', 14000, 'motorcycles'),
('penumbra', 'Penumbra', 28000, 'sports'),
('pfister811', 'Pfister', 145000, 'super'),
('phoenix', 'Phoenix', 12500, 'muscle'),
('picador', 'Picador', 18000, 'muscle'),
('pigalle', 'Pigalle', 20000, 'sportsclassics'),
('prairie', 'Prairie', 6750, 'compacts'),
('premier', 'Premier', 8000, 'sedans'),
('primo2', 'Primo Custom', 14000, 'sedans'),
('prototipo', 'X80 Proto', 2500000, 'super'),
('radi', 'Radius', 29000, 'suvs'),
('raiden', 'raiden', 150000, 'sports'),
('rapidgt', 'Rapid GT', 55000, 'sports'),
('rapidgt2', 'Rapid GT Convertible', 75000, 'sports'),
('rapidgt3', 'Rapid GT3', 88500, 'sportsclassics'),
('reaper', 'Reaper', 150000, 'super'),
('rebel2', 'Rebel', 35000, 'offroad'),
('rebla', 'Rebla', 350000, 'suvs'),
('regina', 'Regina', 5500, 'sedans'),
('retinue', 'Retinue', 61500, 'sportsclassics'),
('revolter', 'Revolter', 80000, 'coupes'),
('riata', 'riata', 380000, 'offroad'),
('rocoto', 'Rocoto', 33000, 'suvs'),
('rogue', 'Rogue', 4500000, 'avionfdp'),
('rt3000', 'Rt3000', 50000, 'sports'),
('ruffian', 'Ruffian', 12000, 'motorcycles'),
('rumpo', 'Rumpo', 15000, 'vans'),
('rumpo3', 'Rumpo Trail', 19500, 'vans'),
('sabregt', 'Sabre Turbo', 20000, 'muscle'),
('sabregt2', 'Sabre GT', 25000, 'muscle'),
('sanchez', 'Sanchez', 13000, 'motorcycles'),
('sanchez2', 'Sanchez Sport', 19000, 'motorcycles'),
('sanctus', 'Sanctus', 55000, 'motorcycles'),
('sandking', 'Sandking', 55000, 'offroad'),
('savestra', 'Savestra', 75000, 'sportsclassics'),
('sc1', 'SC 1', 800000, 'super'),
('schafter2', 'Schafter', 80000, 'sedans'),
('schafter3', 'Schafter V12', 100000, 'sports'),
('scorcher', 'Scorcher (velo)', 650, 'motorcycles'),
('seashark', 'SeaShark', 375000, 'superboat'),
('seashark2', 'Seashark2', 450000, 'superboat'),
('seminole', 'Seminole', 150000, 'suvs'),
('sentinel', 'Sentinel', 32000, 'coupes'),
('sentinel2', 'Sentinel XS', 15500, 'coupes'),
('sentinel3', 'Sentinel3', 11500, 'sports'),
('seven70', 'Seven 70', 39500, 'sports'),
('sheava', 'ETR1', 220000, 'super'),
('slamvan3', 'Slam Van', 11500, 'muscle'),
('sovereign', 'Sovereign', 20000, 'motorcycles'),
('speeder', 'Speeder', 2500000, 'superboat'),
('squalo', 'Squalo', 1350000, 'superboat'),
('stinger', 'Stinger', 80000, 'sportsclassics'),
('stingergt', 'Stinger GT', 75000, 'sportsclassics'),
('streiter', 'Streiter', 250000, 'sports'),
('stretch', 'Stretch', 90000, 'sedans'),
('sultan', 'Sultan', 40000, 'sports'),
('sultan2', 'Sultan 2', 850000, 'sports'),
('sultan3', 'Sultan 3', 65000, 'sports'),
('sultanrs', 'Sultan RS', 250000, 'super'),
('suntrap', 'Stuntrap', 1250000, 'superboat'),
('superd', 'Super Diamond', 130000, 'sedans'),
('supervolito', 'SuperVolito', 8500000, 'avionfdp'),
('surano', 'Surano', 50000, 'sports'),
('surfer', 'Surfer', 12000, 'vans'),
('swift', 'Swift', 6500000, 'avionfdp'),
('swift2', 'Swift Deluxe', 7500000, 'avionfdp'),
('t20', 'T20', 500000, 'super'),
('tampa', 'Tampa', 16000, 'muscle'),
('tampa2', 'Drift Tampa', 80000, 'sports'),
('thrax ', 'Thrax', 350000, 'super'),
('thrust', 'Thrust', 22000, 'motorcycles'),
('toro', 'Toro', 1750000, 'superboat'),
('tribike3', 'Tri bike (velo)', 850, 'motorcycles'),
('trophytruck', 'Trophy Truck', 60000, 'offroad'),
('trophytruck2', 'Trophy Truck Limited', 80000, 'offroad'),
('tropic', 'Tropic', 1000000, 'superboat'),
('tropos', 'Tropos', 175000, 'sports'),
('turismor', 'Turismo R', 340000, 'super'),
('tyrus', 'Tyrus', 600000, 'super'),
('vacca', 'Vacca', 120000, 'super'),
('vader', 'Vader', 9000, 'motorcycles'),
('vagrant', 'vagrant', 55000, 'offroad'),
('velum', 'Velum', 2250000, 'avionfdp'),
('verlierer2', 'Verlierer', 70000, 'sports'),
('verus ', 'Verus', 15000, 'offroad'),
('vestra', 'Vestra', 4250000, 'avionfdp'),
('vigero', 'Vigero', 12500, 'muscle'),
('virgo', 'Virgo', 14000, 'muscle'),
('viseris', 'Viseris', 90000, 'sportsclassics'),
('visione', 'Visione', 2250000, 'super'),
('voltic', 'Voltic', 900000, 'super'),
('voodoo', 'Voodoo', 7200, 'muscle'),
('vortex', 'Vortex', 15000, 'motorcycles'),
('warrener', 'Warrener', 5000, 'sedans'),
('washington', 'Washington', 9000, 'sedans'),
('weevil', 'Weevil', 7500, 'compacts'),
('windsor', 'Windsor', 95000, 'coupes'),
('windsor2', 'Windsor Drop', 42000, 'coupes'),
('wolfsbane', 'Woflsbane', 18000, 'motorcycles'),
('xls', 'XLS', 21000, 'suvs'),
('yosemite', 'Yosemite', 120000, 'muscle'),
('youga', 'Youga', 10800, 'vans'),
('youga2', 'Youga Luxuary', 6500, 'vans'),
('yzf250sm', 'Yamaha yz', 70000, 'motorcycles'),
('z190', 'Z190', 90000, 'sportsclassics'),
('zentorno', 'Zentorno', 700000, 'super'),
('zion', 'Zion', 36000, 'coupes'),
('zion2', 'Zion Cabrio', 12500, 'coupes'),
('zombiea', 'Zombie', 9500, 'motorcycles'),
('zombieb', 'Zombie Luxuary', 10000, 'motorcycles'),
('zr350', 'Zr350', 60000, 'sports'),
('ztype', 'Z-Type', 80000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`, `society`) VALUES
('compacts', 'Compacts', 'carshop'),
('coupes', 'Coupes', 'carshop'),
('imports', 'Imports', 'carshop'),
('motorcycles', 'Motos', 'carshop'),
('muscle', 'Muscle', 'carshop'),
('offroad', 'Off Road', 'carshop'),
('sedans', 'Sedans', 'carshop'),
('sports', 'Sports', 'carshop'),
('sportsclassics', 'Sports Classics', 'carshop'),
('super', 'Super', 'carshop'),
('suvs', 'SUVs', 'carshop'),
('vans', 'Vans', 'carshop');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'carshop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `vip_player`
--

CREATE TABLE `vip_player` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `vips` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `vip` int(11) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_addon_account_data_account_name` (`account_name`(191)) USING BTREE,
  ADD KEY `index_addon_account_data_account_name_owner` (`account_name`(191),`owner`) USING BTREE;

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`) USING BTREE,
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`) USING BTREE,
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`) USING BTREE;

--
-- Index pour la table `bbanque`
--
ALTER TABLE `bbanque`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_billing_identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_characters_identifier` (`identifier`) USING BTREE;

--
-- Index pour la table `clothes_player`
--
ALTER TABLE `clothes_player`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_datastore_data_name` (`name`) USING BTREE,
  ADD KEY `index_datastore_data_name_owner` (`name`,`owner`) USING BTREE;

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `gangs`
--
ALTER TABLE `gangs`
  ADD PRIMARY KEY (`gangname`);

--
-- Index pour la table `garage`
--
ALTER TABLE `garage`
  ADD PRIMARY KEY (`pos`);

--
-- Index pour la table `gksphone_app_chat`
--
ALTER TABLE `gksphone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_bank_transfer`
--
ALTER TABLE `gksphone_bank_transfer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_blockednumber`
--
ALTER TABLE `gksphone_blockednumber`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_calls`
--
ALTER TABLE `gksphone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_gallery`
--
ALTER TABLE `gksphone_gallery`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_gotur`
--
ALTER TABLE `gksphone_gotur`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_gps`
--
ALTER TABLE `gksphone_gps`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `groupid` (`groupid`) USING BTREE;

--
-- Index pour la table `gksphone_insto_accounts`
--
ALTER TABLE `gksphone_insto_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Index pour la table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_insto_instas_gksphone_insto_accounts` (`authorId`);

--
-- Index pour la table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_insto_likes_gksphone_insto_accounts` (`authorId`),
  ADD KEY `FK_gksphone_insto_likes_gksphone_insto_instas` (`inapId`);

--
-- Index pour la table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_gksphone_insto_story_gksphone_insto_accounts` (`authorId`) USING BTREE;

--
-- Index pour la table `gksphone_job_message`
--
ALTER TABLE `gksphone_job_message`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_mails`
--
ALTER TABLE `gksphone_mails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_messages`
--
ALTER TABLE `gksphone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_messages_group`
--
ALTER TABLE `gksphone_messages_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_news`
--
ALTER TABLE `gksphone_news`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_settings`
--
ALTER TABLE `gksphone_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_tinderacc`
--
ALTER TABLE `gksphone_tinderacc`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_tindermatch`
--
ALTER TABLE `gksphone_tindermatch`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_tindermessage`
--
ALTER TABLE `gksphone_tindermessage`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_twitter_accounts`
--
ALTER TABLE `gksphone_twitter_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Index pour la table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_twitter_likes_gksphone_twitter_accounts` (`authorId`),
  ADD KEY `FK_gksphone_twitter_likes_gksphone_twitter_tweets` (`tweetId`);

--
-- Index pour la table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_twitter_tweets_gksphone_twitter_accounts` (`authorId`);

--
-- Index pour la table `gksphone_users_contacts`
--
ALTER TABLE `gksphone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gksphone_vehicle_sales`
--
ALTER TABLE `gksphone_vehicle_sales`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `gksphone_yellow`
--
ALTER TABLE `gksphone_yellow`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`) USING BTREE;

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`) USING BTREE;

--
-- Index pour la table `azoki_houses`
--
ALTER TABLE `azoki_houses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `azoki_housesinside`
--
ALTER TABLE `azoki_housesinside`
  ADD PRIMARY KEY (`license`);

--
-- Index pour la table `azoki_isdead`
--
ALTER TABLE `azoki_isdead`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `azoki_luckwheel_paid`
--
ALTER TABLE `azoki_luckwheel_paid`
  ADD PRIMARY KEY (`license`);

--
-- Index pour la table `azoki_luckywheel`
--
ALTER TABLE `azoki_luckywheel`
  ADD PRIMARY KEY (`license`);

--
-- Index pour la table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playerstattoos`
--
ALTER TABLE `playerstattoos`
  ADD PRIMARY KEY (`identifier`) USING BTREE;

--
-- Index pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `society`
--
ALTER TABLE `society`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `tebex_boutique`
--
ALTER TABLE `tebex_boutique`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tebex_boutique_category`
--
ALTER TABLE `tebex_boutique_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Index pour la table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`) USING BTREE,
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`) USING BTREE;

--
-- Index pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`) USING BTREE;

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`character_id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Index pour la table `user_accessories`
--
ALTER TABLE `user_accessories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `user_parkings`
--
ALTER TABLE `user_parkings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`) USING BTREE;

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`) USING BTREE;

--
-- Index pour la table `vip_player`
--
ALTER TABLE `vip_player`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19857;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1208;

--
-- AUTO_INCREMENT pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6902;

--
-- AUTO_INCREMENT pour la table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clothes_player`
--
ALTER TABLE `clothes_player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14368;

--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19360;

--
-- AUTO_INCREMENT pour la table `gksphone_app_chat`
--
ALTER TABLE `gksphone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT pour la table `gksphone_bank_transfer`
--
ALTER TABLE `gksphone_bank_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `gksphone_blockednumber`
--
ALTER TABLE `gksphone_blockednumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_calls`
--
ALTER TABLE `gksphone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT pour la table `gksphone_gallery`
--
ALTER TABLE `gksphone_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `gksphone_gotur`
--
ALTER TABLE `gksphone_gotur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_gps`
--
ALTER TABLE `gksphone_gps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_insto_accounts`
--
ALTER TABLE `gksphone_insto_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `gksphone_job_message`
--
ALTER TABLE `gksphone_job_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `gksphone_mails`
--
ALTER TABLE `gksphone_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_messages`
--
ALTER TABLE `gksphone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT pour la table `gksphone_messages_group`
--
ALTER TABLE `gksphone_messages_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `gksphone_news`
--
ALTER TABLE `gksphone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_settings`
--
ALTER TABLE `gksphone_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT pour la table `gksphone_tinderacc`
--
ALTER TABLE `gksphone_tinderacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `gksphone_tindermatch`
--
ALTER TABLE `gksphone_tindermatch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT pour la table `gksphone_tindermessage`
--
ALTER TABLE `gksphone_tindermessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `gksphone_twitter_accounts`
--
ALTER TABLE `gksphone_twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `gksphone_users_contacts`
--
ALTER TABLE `gksphone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pour la table `gksphone_vehicle_sales`
--
ALTER TABLE `gksphone_vehicle_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gksphone_yellow`
--
ALTER TABLE `gksphone_yellow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78418554;

--
-- AUTO_INCREMENT pour la table `azoki_houses`
--
ALTER TABLE `azoki_houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT pour la table `azoki_isdead`
--
ALTER TABLE `azoki_isdead`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5092;

--
-- AUTO_INCREMENT pour la table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT pour la table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5574;

--
-- AUTO_INCREMENT pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24172;

--
-- AUTO_INCREMENT pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8324;

--
-- AUTO_INCREMENT pour la table `society`
--
ALTER TABLE `society`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1207;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2142;

--
-- AUTO_INCREMENT pour la table `user_accessories`
--
ALTER TABLE `user_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2768;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1962;

--
-- AUTO_INCREMENT pour la table `user_parkings`
--
ALTER TABLE `user_parkings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vip_player`
--
ALTER TABLE `vip_player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  ADD CONSTRAINT `FK_phonegroupmessage` FOREIGN KEY (`groupid`) REFERENCES `gksphone_messages_group` (`id`);

--
-- Contraintes pour la table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  ADD CONSTRAINT `FK_gksphone_insto_instas_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`);

--
-- Contraintes pour la table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  ADD CONSTRAINT `FK_gksphone_insto_likes_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`),
  ADD CONSTRAINT `FK_gksphone_insto_likes_gksphone_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `gksphone_insto_instas` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  ADD CONSTRAINT `FK_gksphone_insto_story_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`);

--
-- Contraintes pour la table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  ADD CONSTRAINT `FK_gksphone_twitter_likes_gksphone_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_gksphone_twitter_likes_gksphone_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `gksphone_twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  ADD CONSTRAINT `FK_gksphone_twitter_tweets_gksphone_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_twitter_accounts` (`id`);
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 14, 2021 kell 10:48 EL
-- Serveri versioon: 10.4.11-MariaDB
-- PHP versioon: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `webform`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `blog_content_order_by`
--

CREATE TABLE `blog_content_order_by` (
  `id` bigint(20) NOT NULL,
  `order_by` int(11) NOT NULL,
  `blog_post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `blog_content_order_by`
--

INSERT INTO `blog_content_order_by` (`id`, `order_by`, `blog_post_id`) VALUES
(1, 1, 2),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `blog_post`
--

CREATE TABLE `blog_post` (
  `id` bigint(20) NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `text` text COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `blog_post`
--

INSERT INTO `blog_post` (`id`, `author`, `created_at`, `text`, `title`) VALUES
(1, NULL, '2021-02-07 10:49:08', 'Igatahes on nüüd olemas ühendus andmebaasiga. Loodamie parimat. Täna oli väga viljakas koolipäev', 'Kas nüüd on rohkem blogi moodi'),
(2, 'Jaanus Nurmoja', '2021-02-14 03:12:46', 'Mitu head tundi koodikirjutamist on selja taga. Nüüd tuleb tõehetk - kas sellest kõigest ka midagi kasu oli? Alustame lihtsalt lisalõikudest. ', 'Esimene proovipostitus teel täiuslikuma blogi poole');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `blog_post_paragraph`
--

CREATE TABLE `blog_post_paragraph` (
  `id` bigint(20) NOT NULL,
  `order_by` int(11) DEFAULT NULL,
  `text` text COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `blog_post_sub_part_id` bigint(20) DEFAULT NULL,
  `blog_post_id` bigint(20) DEFAULT NULL,
  `blog_content_order_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `blog_post_paragraph`
--

INSERT INTO `blog_post_paragraph` (`id`, `order_by`, `text`, `blog_post_sub_part_id`, `blog_post_id`, `blog_content_order_by_id`) VALUES
(1, NULL, 'This is a simple paragraph of the blog post. It\'s actually in other table, related to the intermediate table which bring the texts together and allows to sort its parts', NULL, 2, 1),
(2, NULL, 'And here you see the second paragraph to this blog post. Actually here are even more features as multiparagraph content parts. ', NULL, 2, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `blog_post_sub_part`
--

CREATE TABLE `blog_post_sub_part` (
  `id` bigint(20) NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_estonian_ci NOT NULL,
  `description` text COLLATE utf8mb4_estonian_ci NOT NULL,
  `blog_post_id` bigint(20) DEFAULT NULL,
  `blog_content_order_by_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `main_id` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `collection`
--

INSERT INTO `collection` (`id`, `main_id`, `heading`) VALUES
(1, 1, 'This is the first level of repeated group - table name: collection, parent: main'),
(12, NULL, 'Table collection'),
(16, 17, 'kipp'),
(17, 18, 'Table main has'),
(18, 18, 'Table collection has'),
(22, NULL, 'Let\'s add'),
(37, NULL, 'proovime nÃ¼Ã¼d veel'),
(39, NULL, 'Senised bugid, esimese rea bugikontroll, tahab end vist kÃµikjale alla kopeerida. Aga kui muudan mitut? On asi omamoodi huvitav. kontrollin vÃµimalikku lahendust'),
(51, 38, 'Andmete sisestamine'),
(52, 38, 'Andmete kustutamine'),
(53, 39, 'Uute andmete sisestamine'),
(54, 39, 'Andmete redigeerimine'),
(56, NULL, 'Proovime posti'),
(57, 40, 'Kustutamise koht: tabelivaade'),
(58, 40, 'Kustutamine Ã¼ksikasjade vaates'),
(59, 40, 'Kustutamine redigeerimisvormis'),
(60, 1, 'Siiin on pÃµimitud andmete esimene tasand, tabeli nimi: collection, Ã¼lemtabel: main'),
(120, 57, 'Praxis'),
(121, 57, 'Arvamusfest'),
(122, 58, 'Daughter is going to sleep'),
(123, 59, 'Homme Narva'),
(126, 59, 'ja nÃ¤dalavahetusel jÃ¤lle'),
(127, NULL, 'Lets collect'),
(128, 80, 'Mina tegelen laulupidude ajalooga'),
(129, 97, 'Kontrollin lihtsat sisestamist'),
(130, 98, 'Kollektsioon number Ã¼ks'),
(131, 98, 'Lihtsalt Ã¼ks kollektsioon number kaks juurde'),
(132, 99, 'good'),
(133, 100, 'tereterre'),
(134, 101, 'tereterre veel kord'),
(135, 102, 'tereterre veel kord'),
(136, 103, 'tereterre veel kord'),
(137, 104, 'tereterre veel kord'),
(138, 105, 'tereterre veel kord'),
(139, 106, 'tereterre veel kord'),
(140, 107, 'tereterre veel kord'),
(141, 108, 'tereterre veel kord'),
(142, 109, 'tereterre veel kord'),
(143, 110, 'tereterre veel kord'),
(144, 111, 'tereterre veel kord'),
(145, 112, 'tereterre veel kord'),
(146, 113, 'pärast pausi veel midagi'),
(147, 114, 'pärast pausi veel midagi'),
(148, 115, 'pärast pausi veel midagi'),
(149, 116, 'pärast pausi veel midagi'),
(150, 117, 'pärast pausi veel midagi'),
(151, 118, 'pärast pausi veel midagi'),
(152, 119, 'pärast pausi veel midagi'),
(153, 120, 'pärast pausi veel midagi'),
(154, 121, 'pärast pausi veel midagi'),
(155, 122, 'pärast pausi veel midagi'),
(156, 123, 'pärast pausi veel midagi'),
(157, 124, 'pärast pausi veel midagi'),
(158, 125, 'pärast pausi veel midagi'),
(159, 126, 'pärast pausi veel midagi'),
(160, 127, 'pärast pausi veel midagi'),
(161, 128, 'pärast pausi veel midagi'),
(162, 129, 'pärast pausi veel midagi'),
(163, 130, 'pärast pausi veel midagi'),
(164, 131, 'pärast pausi veel midagi'),
(165, 132, 'pärast pausi veel midagi'),
(166, 133, 'pärast pausi veel midagi'),
(167, 134, 'pärast pausi veel midagi'),
(168, 135, 'pärast pausi veel midagi'),
(169, 136, 'pärast pausi veel midagi'),
(170, 137, 'pärast pausi veel midagi'),
(171, 138, 'pärast pausi veel midagi'),
(172, 139, 'pärast pausi veel midagi'),
(173, 140, 'Lola ja pärdikud on televiisoris teemaks'),
(174, 141, 'Lola ja pärdikud on televiisoris teemaks'),
(175, 142, 'Lola ja pärdikud on televiisoris teemaks'),
(176, 143, 'Lola ja pärdikud on televiisoris teemaks'),
(177, 144, 'Spordikomplektid'),
(178, 145, 'Valgete ööde algus'),
(179, 146, 'Ma ei saa aru, miks ei  funka'),
(180, 147, 'Ma ei saa aru, miks ei  funka'),
(181, 148, 'Ma ei saa aru, miks ei  funka'),
(182, 149, 'Ma ei saa aru, miks ei  funka'),
(183, 150, 'Ma ei saa aru, miks ei  funka'),
(184, 151, 'Ma ei saa aru, miks ei  funka'),
(185, 152, 'Ma ei saa aru, miks ei  funka'),
(186, 153, 'Ma ei saa aru, miks ei  funka'),
(187, 154, 'Ma ei saa aru, miks ei  funka'),
(188, 155, 'Ma ei saa aru, miks ei  funka'),
(189, 156, 'Ma ei saa aru, miks ei  funka'),
(190, 157, 'Ma ei saa aru, miks ei  funka'),
(191, 158, 'Ma ei saa aru, miks ei  funka'),
(192, 159, 'Ma ei saa aru, miks ei  funka'),
(193, 160, 'Ma ei saa aru, miks ei  funka'),
(194, 161, 'Ma ei saa aru, miks ei  funka'),
(195, 162, 'Ma ei saa aru, miks ei  funka'),
(196, 163, 'Ma ei saa aru, miks ei  funka'),
(197, 164, 'Ma ei saa aru, miks ei  funka'),
(198, 165, 'Ma ei saa aru, miks ei  funka'),
(199, 166, 'Ma ei saa aru, miks ei  funka'),
(200, 167, 'Ma ei saa aru, miks ei  funka'),
(201, 168, 'Ma ei saa aru, miks ei  funka'),
(202, 169, 'Ma ei saa aru, miks ei  funka'),
(203, 170, 'Piisab sellest ehk'),
(204, 171, 'Piisab sellest ehk'),
(205, 172, 'Piisab sellest ehk'),
(206, 176, 'Proovin nüüd, kas töötab'),
(207, 177, 'Siinsamas'),
(208, NULL, 'Ehk läheb nüüd paremini'),
(209, NULL, 'Ehk läheb nüüd paremini'),
(210, 187, 'pealkiri selline'),
(211, 188, 'pealkiri selline'),
(212, 189, 'Nüüd kohe proovin mitmega'),
(213, 189, 'Ja see siin on teine'),
(214, 195, 'Nüüd kohe proovin mitmega'),
(215, 195, 'Ja see siin on teine'),
(216, 196, 'Nüüd kohe proovin mitmega uuesti'),
(217, 196, 'Ja see siin on teine teine'),
(218, 198, 'pilves ja rõske'),
(219, 199, 'Hirvost sai auliige'),
(220, 200, 'kajakad'),
(221, 200, 'varesed'),
(222, 201, 'öised linnud'),
(223, 201, 'mina'),
(224, 202, 'siin on collektsioon'),
(225, 202, 'siin jäle kollektsioon'),
(226, 203, 'Põimime'),
(227, 204, 'Mingi multikas'),
(228, 205, 'Mingi multikas'),
(229, 206, 'Panen pealkirja'),
(230, 206, 'Panen teisegi pealkirja'),
(231, 207, 'jooksen'),
(232, 207, 'Aitab sellest'),
(233, 209, 'Üks pealkiri'),
(234, 210, 'Nüüd'),
(235, 211, 'Nüüd tuleb'),
(236, 211, 'Me seisame kahe riigi väraval'),
(237, 212, 'Ilus ilm tuleb'),
(238, 216, 'On öö ja valge'),
(239, 217, 'Praegu see üks'),
(240, 218, 'Pärast oktoobrit on detsember'),
(241, 218, 'Juba ootab oma sünnat'),
(242, 227, 'Olen ikka kodus'),
(243, 227, 'siin proovin'),
(244, 234, 'Pealkiri'),
(245, 235, 'Täna paistab päike'),
(246, 236, 'Ikka kodu'),
(247, 237, 'Jaburaks muutuvad need mõtted tasapisi'),
(248, 242, 'HEadache'),
(249, 243, 'HEadache'),
(250, 243, 'Oh sa poiss, kas tõesti'),
(251, 244, 'Siia igaks juhuks heading kah'),
(252, 245, 'Siia igaks juhuks heading kah'),
(253, 251, 'Sada saia'),
(254, 252, 'Aias sadas sada saia'),
(255, 254, 'MIs võiks pealkirjaks panna');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `device_metadata`
--

CREATE TABLE `device_metadata` (
  `id` bigint(20) NOT NULL,
  `device_details` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `last_logged_in` datetime DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `experimental`
--

CREATE TABLE `experimental` (
  `id` int(15) UNSIGNED NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_estonian_ci DEFAULT 'draft',
  `sort` int(10) UNSIGNED DEFAULT NULL,
  `owner` int(10) UNSIGNED DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(10) UNSIGNED DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `eesnimi` varchar(200) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `perekonnanimi` varchar(200) COLLATE utf8mb4_estonian_ci NOT NULL,
  `syndinud` date NOT NULL,
  `surnud` date DEFAULT NULL,
  `elus` tinyint(4) DEFAULT NULL,
  `five_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `experimental`
--

INSERT INTO `experimental` (`id`, `status`, `sort`, `owner`, `created_on`, `modified_by`, `modified_on`, `eesnimi`, `perekonnanimi`, `syndinud`, `surnud`, `elus`, `five_id`) VALUES
(1, 'published', NULL, 1, '2020-01-15 09:40:35', 1, '2020-01-15 09:40:35', 'Jaanus', 'Nurmoja', '1967-06-23', NULL, 1, 107),
(2, 'published', NULL, 1, '2020-01-15 10:04:11', 1, '2020-01-15 10:05:00', 'Keegi', 'Inimene', '2000-01-01', NULL, 1, 107);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `tables_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_estonian_ci NOT NULL,
  `showInTable` tinyint(4) NOT NULL,
  `showInForm` tinyint(4) NOT NULL,
  `showInDetails` tinyint(4) NOT NULL,
  `lookupTable` varchar(100) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `lookupKey` varchar(100) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `lookupDisplay` text COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `formDisplay` enum('text','textarea','select','radio','checkbox','hidden') COLLATE utf8mb4_estonian_ci NOT NULL,
  `form_display` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL,
  `lookup_display` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `lookup_key` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `lookup_table` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `show_in_details` int(11) NOT NULL,
  `show_in_form` int(11) NOT NULL,
  `show_in_table` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `fields`
--

INSERT INTO `fields` (`id`, `tables_id`, `name`, `showInTable`, `showInForm`, `showInDetails`, `lookupTable`, `lookupKey`, `lookupDisplay`, `formDisplay`, `form_display`, `lookup_display`, `lookup_key`, `lookup_table`, `show_in_details`, `show_in_form`, `show_in_table`) VALUES
(1, 1, 'id', 0, 0, 0, '', '', '', 'hidden', '', NULL, NULL, NULL, 0, 0, 0),
(2, 1, 'name', 1, 1, 1, '', '', '', '', '', NULL, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `five`
--

CREATE TABLE `five` (
  `id` int(11) NOT NULL,
  `four_id` int(10) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `five`
--

INSERT INTO `five` (`id`, `four_id`, `title`, `created`, `modified`) VALUES
(103, 73, 'Huvi pÃ¤rast siia ka viis juurde', '2019-08-29 08:16:18', NULL),
(104, 73, 'Huvi pÃ¤rast veel Ã¼ks', '2019-08-29 08:17:36', NULL),
(105, 117, 'What if we add five?', '2019-08-29 08:25:01', NULL),
(106, 73, 'Ok, veel Ã¼ks', '2019-08-29 09:19:56', NULL),
(107, 119, 'Let\'s add another five', '2019-08-29 11:33:43', '2019-08-29 11:46:00'),
(108, 119, 'This five', '2019-08-29 11:37:09', NULL),
(109, 123, 'as it gets the lastid and echoes it... so there came my idea from', '2019-08-30 23:39:37', NULL),
(110, 125, 'Näiteks on häid leide hea muusikaga', '2019-11-07 10:56:12', '2020-01-15 12:46:30'),
(111, 127, 'First five', '2019-11-14 21:13:44', NULL),
(112, 127, '2nd five', '2019-11-14 21:13:44', NULL),
(113, 128, 'peaksin ju', '2019-11-26 01:30:46', NULL),
(114, 130, 'jah', '2020-01-06 12:31:04', NULL),
(115, 130, 'lisan siia ka', '2020-01-06 12:33:08', NULL),
(116, 139, NULL, '2020-06-15 21:13:44', NULL),
(117, 140, NULL, '2020-06-15 21:55:04', NULL),
(118, 141, NULL, '2020-06-15 21:57:01', NULL),
(119, 142, NULL, '2020-06-15 22:04:34', NULL),
(120, 143, NULL, '2020-06-15 22:09:04', NULL),
(121, 143, NULL, '2020-06-15 22:09:04', NULL),
(122, 144, NULL, '2020-06-15 22:18:45', NULL),
(123, 144, NULL, '2020-06-15 22:18:45', NULL),
(124, 145, NULL, '2020-06-15 22:39:37', NULL),
(125, 145, NULL, '2020-06-15 22:39:37', NULL),
(126, 146, NULL, '2020-06-15 22:49:39', NULL),
(127, 146, NULL, '2020-06-15 22:49:39', NULL),
(128, 146, NULL, '2020-06-15 22:49:39', NULL),
(129, 147, NULL, '2020-06-15 23:48:52', NULL),
(130, 147, NULL, '2020-06-15 23:48:52', NULL),
(131, 148, NULL, '2020-06-15 23:57:04', NULL),
(132, 148, NULL, '2020-06-15 23:57:04', NULL),
(133, 149, NULL, '2020-06-16 11:45:08', NULL),
(134, 150, NULL, '2020-06-16 11:51:31', NULL),
(135, 151, NULL, '2020-06-16 11:58:16', NULL),
(136, 153, NULL, '2020-06-16 15:05:31', NULL),
(137, 154, NULL, '2020-06-16 15:12:06', NULL),
(138, 155, NULL, '2020-06-16 15:23:57', NULL),
(139, 156, NULL, '2020-06-16 15:44:02', NULL),
(140, 157, NULL, '2020-06-16 16:05:15', NULL),
(141, 158, NULL, '2020-06-16 19:26:44', NULL),
(142, 160, NULL, '2020-06-16 19:38:25', NULL),
(143, 161, 'mingid linnupojad ainut piiksuvad', '2020-06-16 20:33:32', NULL),
(144, 162, 'linnupojad piiksuvad', '2020-06-16 20:46:55', NULL),
(145, 162, 'inimesedki magavad', '2020-06-16 20:46:55', NULL),
(146, 163, 'piiksuvad', '2020-06-16 23:35:24', NULL),
(147, 163, 'inimesedki magavad', '2020-06-16 23:35:24', NULL),
(148, 164, 'viis on viis', '2020-06-17 00:17:33', NULL),
(149, 165, 'ütleb värvumutt', '2020-06-18 20:59:44', NULL),
(150, 166, 'kõik on hästi', '2020-06-18 21:12:28', NULL),
(151, 167, 'ärge üldse põdege', '2020-06-19 16:45:05', NULL),
(152, 167, 'suvi on käes', '2020-06-19 16:45:05', NULL),
(153, 168, 'uskusin, et siin pole midagi põdeda', '2020-06-19 16:47:21', NULL),
(154, 168, 'suvi on pealegi meiega', '2020-06-19 16:47:21', NULL),
(155, 169, 'multikas', '2020-06-19 16:52:56', NULL),
(156, 169, 'õues soe', '2020-06-19 16:52:56', NULL),
(157, 170, 'koos nende kahega', '2020-06-19 16:52:56', NULL),
(158, 170, 'homme vist nii palav pole', '2020-06-19 16:52:56', NULL),
(159, 171, 'ärge üldse', '2020-06-19 17:49:36', NULL),
(160, 171, 'on käes', '2020-06-19 17:49:36', NULL),
(161, 172, 'Gaudi jutud', '2020-06-19 18:08:56', NULL),
(162, 172, 'Barcelona jutud', '2020-06-19 18:08:56', NULL),
(163, 173, 'jah on', '2020-06-19 18:08:56', NULL),
(164, 173, 'gratias on aitäh', '2020-06-19 18:08:56', NULL),
(165, NULL, 'see on neljanda laps', '2020-06-19 18:13:38', NULL),
(166, NULL, 'see on veel kord neljanda laps', '2020-06-19 18:15:14', NULL),
(167, NULL, 'see on nüüd kindlale neljandale määratud viies', '2020-06-19 18:56:30', NULL),
(168, NULL, 'kindlale neljandale määratud viies', '2020-06-19 19:03:31', NULL),
(169, NULL, 'veel kord kindlale neljandale määratud viies', '2020-06-19 19:31:32', NULL),
(170, NULL, 'veel kord kindlale neljandale määratud täiendav viies', '2020-06-19 19:33:18', NULL),
(171, NULL, 'uutmoodi kindlale neljandale poogitav viies', '2020-06-19 19:45:13', NULL),
(172, NULL, 'neljandale poogitav viies', '2020-06-19 19:58:47', NULL),
(173, 174, 'neljandale poogitav viies uuesti, tähelepanematuse probleem', '2020-06-19 20:03:43', NULL),
(174, 174, 'panen nüüd teise rea ka', '2020-06-19 20:07:33', NULL),
(175, 175, 'See viimane ka', '2020-06-25 00:36:50', NULL),
(176, 176, 'päike paistab', '2020-06-26 08:07:37', NULL),
(177, 177, 'esimene viies', '2020-06-26 08:12:39', NULL),
(178, 177, 'teine viies', '2020-06-26 08:12:39', NULL),
(179, 178, 'Oh kui väike ikka see viimane on', '2021-02-12 00:22:08', NULL),
(180, 180, 'kala', '2021-02-12 20:30:02', NULL),
(181, 181, 'Data 5', '2021-02-13 12:15:17', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `four`
--

CREATE TABLE `four` (
  `id` int(11) NOT NULL,
  `three_id` int(11) DEFAULT -1,
  `title` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `four`
--

INSERT INTO `four` (`id`, `three_id`, `title`, `created`, `modified`) VALUES
(73, 34, 'lihtsalt neli', '2019-08-23 11:47:22', '2019-08-29 07:21:08'),
(74, 35, 'neli', '2019-08-23 11:47:58', '2019-08-29 07:14:14'),
(117, 122, 'One four as well', '2019-08-29 00:07:12', '2019-08-29 11:54:42'),
(119, 123, 'Four with five', '2019-08-29 11:37:09', '2020-01-15 11:52:09'),
(120, 123, 'just one four more', '2019-08-29 11:37:09', NULL),
(121, 121, 'maybe something more', '2019-08-29 20:57:16', NULL),
(122, 121, 'And more. Actually I am double checking that everything works normally. Like always', '2019-08-29 20:58:30', NULL),
(123, 124, 'But finally I thought about what the dbSubmit() does', '2019-08-30 23:39:37', NULL),
(124, 1, 'Let it be here', '2019-08-31 21:22:31', NULL),
(125, 125, 'Kuigi iga film pole pÃ¤ris mÃµttetu', '2019-11-07 10:56:12', NULL),
(126, 125, 'Aga jah... hakkab Ã¤ra tÃ¼Ã¼tama', '2019-11-07 10:56:12', NULL),
(127, 126, 'Number four', '2019-11-14 21:13:44', NULL),
(128, 128, 'kas ma ikka saan andmeid sisse nii nagu ennemuiste', '2019-11-26 01:30:46', NULL),
(129, 128, 'mÃµnikord parandatakse asju liiga hÃ¤sti', '2019-11-26 01:30:46', NULL),
(130, 129, 'EL teene on tuumalepe', '2020-01-06 12:31:04', NULL),
(131, 129, 'siia Ã¼ks juurde', '2020-01-06 12:33:08', NULL),
(132, 131, 'Neljas', '2020-06-15 00:04:13', NULL),
(133, 132, 'Neljas tasand', '2020-06-15 00:10:41', NULL),
(134, 133, 'Neljas tasand uus', '2020-06-15 00:20:19', NULL),
(135, 134, 'Neljas tasand uus', '2020-06-15 00:24:28', NULL),
(136, 135, 'Neljas  uus', '2020-06-15 00:41:00', NULL),
(137, 136, 'neljas ka', '2020-06-15 19:53:19', NULL),
(138, 137, 'neljas ka', '2020-06-15 20:07:25', NULL),
(139, 140, 'Ei pea vist midagi tagastama', '2020-06-15 21:13:44', NULL),
(140, 141, 'Ei pea midagi tagastama', '2020-06-15 21:55:04', NULL),
(141, 142, 'Ei pea midagi tagastama, aga olgu korrektne', '2020-06-15 21:57:01', NULL),
(142, 143, 'jääb vaid oodata', '2020-06-15 22:04:34', NULL),
(143, 144, 'jääb vaid loota', '2020-06-15 22:09:04', NULL),
(144, 145, 'Õues on veel soe', '2020-06-15 22:18:45', NULL),
(145, 146, 'Õues on veel soe', '2020-06-15 22:39:37', NULL),
(146, 147, 'Õues on veel soe', '2020-06-15 22:49:39', NULL),
(147, 148, 'soe', '2020-06-15 23:48:52', NULL),
(148, 149, 'nüüd proovin, kas jälle', '2020-06-15 23:57:04', NULL),
(149, 150, 'neljas, päris kitsas tase', '2020-06-16 11:45:08', NULL),
(150, 151, 'neljas alamrühm', '2020-06-16 11:51:31', NULL),
(151, 152, 'vot molodets', '2020-06-16 11:58:16', NULL),
(152, 153, 'vot molodets', '2020-06-16 12:24:22', NULL),
(153, 154, 'Õhku tuleb', '2020-06-16 15:05:31', NULL),
(154, 155, 'Pole veel tagasi', '2020-06-16 15:12:06', NULL),
(155, 156, 'Keegi peab aknast tulema', '2020-06-16 15:23:57', NULL),
(156, 157, 'Pole veel kirja', '2020-06-16 15:44:02', NULL),
(157, 158, 'Palju kirju', '2020-06-16 16:05:15', NULL),
(158, 159, 'Väga kirju', '2020-06-16 19:26:44', NULL),
(159, 160, 'Linnud', '2020-06-16 19:33:53', NULL),
(160, 161, 'Linnud läksid tuttu', '2020-06-16 19:38:25', NULL),
(161, 162, 'Linnud läksid tuttu tõega', '2020-06-16 20:33:32', NULL),
(162, 163, 'Linnud läksid', '2020-06-16 20:46:55', NULL),
(163, 164, 'vaikus', '2020-06-16 23:35:24', NULL),
(164, 165, 'nelinali', '2020-06-17 00:17:33', NULL),
(165, 166, 'seda pole', '2020-06-18 20:59:44', NULL),
(166, 167, 'oli hea päev', '2020-06-18 21:12:28', NULL),
(167, 168, 'sina ole sina', '2020-06-19 16:45:05', NULL),
(168, 169, 'sina ole', '2020-06-19 16:47:21', NULL),
(169, 170, 'koos neljanda ja viiendaga', '2020-06-19 16:52:56', NULL),
(170, 170, 'Teeme veel ühe juurde', '2020-06-19 16:52:56', NULL),
(171, 173, 'ole sina', '2020-06-19 17:49:36', NULL),
(172, 174, 'koos kolmandaga', '2020-06-19 18:08:56', NULL),
(173, 174, 'Igal ajal õige aeg', '2020-06-19 18:08:56', NULL),
(174, NULL, 'Kas nüüd tuleb siis jälle norm tulemus', '2020-06-19 20:03:43', NULL),
(175, 176, 'Ei, igaks juhuks lõpuni', '2020-06-25 00:36:50', NULL),
(176, 191, 'emme on köögis', '2020-06-26 08:07:37', NULL),
(177, 192, 'neljanda nimetus', '2020-06-26 08:12:39', NULL),
(178, 194, 'Kas asi töötab või ei', '2021-02-12 00:22:08', NULL),
(179, 195, 'Neljas', '2021-02-12 12:36:32', NULL),
(180, 196, 'naudib', '2021-02-12 20:30:02', NULL),
(181, 197, 'Data 4', '2021-02-13 12:15:17', NULL);

-- --------------------------------------------------------

--
-- Sise-vaate struktuur `getids`
-- (Tegelik vaade on allpool)
--
CREATE TABLE `getids` (
`mainId` mediumtext
,`main` bigint(21)
,`locationId` mediumtext
,`location` bigint(21)
,`groupedId` mediumtext
,`grouped_entry` bigint(21)
,`collectionId` mediumtext
,`collection` bigint(21)
,`itemsId` mediumtext
,`items` bigint(21)
);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `grouped_entry`
--

CREATE TABLE `grouped_entry` (
  `id` int(11) NOT NULL,
  `main_id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `grouped_entry`
--

INSERT INTO `grouped_entry` (`id`, `main_id`, `url`, `title`, `image`) VALUES
(1, 1, 'https://www.rhyzz.com', 'Rhyzz - the origin of this frontend', 'https://www.rhyzz.com/images/rhyzz.png'),
(2, 1, 'https://www.rhyzz.com/repeatable-fields.html', 'Fields Framework - table name is grouped_entry', 'https://www.rhyzz.com/images/rhyzz.png'),
(23, 17, 'https://www.rhyzz.com', 'Rhyzz', 'https://www.rhyzz.com/images/rhyzz.png'),
(24, 17, 'https://www.rhyzz.com/repeatable-fields.html', 'Fields Framework', 'https://www.rhyzz.com/images/rhyzz.png'),
(25, 18, 'https://test.nurmoja.net.ee/repeat/list-html.php?maintable=main', 'List view with all 5 tables involved', 'https://www.rhyzz.com/images/rhyzz.png'),
(26, 18, 'https://www.rhyzz.com/repeatable-fields.html', 'The same thing - json view', 'https://www.rhyzz.com/images/rhyzz.png'),
(31, NULL, 'https://foto.nurmoja.net.ee', 'Let the picture remain the same', 'https://foto.nurmoja.net.ee/cache/Seychelles/IMGP3512_595.jpg'),
(32, NULL, 'https://test.nurmoja.net.ee/repeat', 'Ma ei saa ainult aru, mispÃ¤rast see _  ei taha lasta end tabeli nimest eemadada', ''),
(33, 99, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(34, 100, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(35, 101, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(36, 102, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(37, 103, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(38, 104, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(39, 105, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(40, 106, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(41, 107, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(42, 108, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(43, 109, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(44, 110, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(45, 111, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(46, 112, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(47, 113, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(48, 114, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(49, 115, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(50, 116, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(51, 117, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(52, 118, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(53, 119, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(54, 120, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(55, 121, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(56, 122, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(57, 123, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(58, 124, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(59, 125, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(60, 126, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(61, 127, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(62, 128, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(63, 129, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(64, 130, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(65, 131, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(66, 132, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(67, 133, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(68, 134, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(69, 135, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(70, 136, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(71, 137, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(72, 138, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(73, 139, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(74, 170, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(75, 171, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(76, 172, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(77, 173, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(78, 174, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(79, 174, 'http://www.rhyzz.com/repeatable-fields.html', 'Fields Framework', 'http://www.rhyzz.com/images/rhyzz.png'),
(80, 175, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(81, 175, 'http://www.rhyzz.com/repeatable-fields.html', 'Fields Framework', 'http://www.rhyzz.com/images/rhyzz.png'),
(82, 176, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(83, 177, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(84, 178, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(85, 179, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(86, 197, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(87, 197, 'http://www.rhyzz.com/repeatable-fields.html', 'Fields Framework', 'http://www.rhyzz.com/images/rhyzz.png'),
(88, 199, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(89, 200, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(90, 201, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(91, 202, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(92, 206, 'http://www.rhyzz.com/repeatable-fields.html', 'Fields Framework', 'http://www.rhyzz.com/images/rhyzz.png'),
(93, 208, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(94, 217, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(95, 218, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(96, 223, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(97, 227, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(98, 227, 'http://www.rhyzz.com/repeatable-fields.html', 'Fields Framework', 'http://www.rhyzz.com/images/rhyzz.png'),
(99, 229, 'http://www.rhyzz.com', 'Rhyzz', 'http://www.rhyzz.com/images/rhyzz.png'),
(100, 229, 'http://www.rhyzz.com/repeatable-fields.html', 'Fields Framework', 'http://www.rhyzz.com/images/rhyzz.png'),
(101, 235, '', 'Polegi eeltäidetud', ''),
(102, 254, '', 'Töises meeleolus', '');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(8),
(8),
(8),
(8),
(8),
(8),
(8),
(8);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL,
  `year` year(4) DEFAULT NULL,
  `description` text COLLATE utf8mb4_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `items`
--

INSERT INTO `items` (`id`, `collection_id`, `title`, `year`, `description`) VALUES
(1, 1, 'And here\'s the second level', 2019, 'table name: items, parent: collection'),
(2, 1, 'The second row of 2nd level', 2020, 'BTW: location names you see above (when main table is \"main\") are from another 1st level repeated group.\r\ntable name: location\r\nparent table: main\r\nIf you change your url as maintable=location, you will see only locations as this table has no child data. Other choices don\'t show location at all\r\n'),
(10, NULL, 'Items again', 2020, ''),
(18, 17, 'location', 2019, 'where I said where the work was done'),
(19, 17, 'grouped_entry', 2019, 'Actually HAD as I removed this table from the current scope.. You can see its data using maintable=grouped_entry \r\nIts rows are still pointing to the main table. '),
(20, 17, 'collection', 2019, 'where I wrote \"the main table has\"'),
(21, 18, 'items', 2019, 'This text is submitted to this table'),
(24, NULL, 'Beach', 2019, ''),
(29, NULL, 'Item three', 2035, ''),
(53, 39, 'Esimene muudatus kopeerib end kÃµikjale', NULL, 'Kui olen mitme esmatasandi korduvreaga vormis ja muudan midagi neis korduvridades NING SEE MUUDATUS EI TOIMU VIIMASES KIRJES, siis kopeerib muudatus end esimese hooga kÃµikjale. pean refreshiga kordama sisestust, et asjad Ãµigeks muutuksid. NÃ¼Ã¼d kontrollin vÃµimalikku lahendust'),
(54, 39, 'Ajatempel on nullaeg - nÃ¼Ã¼dki', NULL, 'Ma ei tea, kuidas see on vÃµimalik, aga ajatemplivÃ¤li, mis ometi peaks automaatselt lisamisaega nÃ¤itama, nÃ¤itab nulle. Mysql kamm. '),
(55, NULL, 'Ajatempel on nullaeg', NULL, 'Uue rea sisestamisel pakuti vÃ¤lisvÃµtme vÃ¤Ã¤rtuseks ikkagi last_insert_id vÃ¤Ã¤rtust, kuid tegelikult peaks see nÃ¼Ã¼d olema Ã¼lemtabeli primaarvÃµtme vÃ¤Ã¤rtus'),
(56, NULL, 'vÃ¤he imelik muutmine', NULL, ''),
(57, NULL, 'Panen uue. Huvitaval kombel lubas lisada', NULL, ''),
(58, NULL, 'Panen uue. Huvitaval kombel lubas lisada', NULL, ''),
(59, NULL, 'Milliseks kujuneb sellle rea sisestatav PK', 2019, ''),
(60, NULL, 'mis s, see uuesti', 2019, ''),
(61, NULL, 'Otse andmebaasi', NULL, 'Katseks, et kas vaikimisi väärtus töötab'),
(62, NULL, 'Eks lisame jÃ¤lle siia', NULL, ''),
(63, NULL, 'Kurat', NULL, ''),
(64, NULL, 'ElektritÃµuksid', 2020, 'Kas lubada tÃµukse sÃµiduteele'),
(65, NULL, 'Mis seal siis ikka', NULL, ''),
(70, NULL, 'Lisan siis itemi, vaatame, mis teeb', NULL, ''),
(72, 51, 'Andmeid vÃµib sisestada ka eraldi igasse tabelisse, millel ei ole alamtabeleid.', NULL, 'Kui suur ja mitmetasandiline on avanev vorm, sÃµltub sellest, kus sa vormi avad, st mis tabel on sinu vaates hetkel peatabel ja kas tal on alamtabeleid. '),
(73, 52, 'Sisestamisvormis', NULL, 'Kustutada saab ainult neid andmeid, mis on alamtabelites. Eemaldad vormivaatest korduvandmed, millest tahad lahti saada ja siis sisestad. '),
(74, 52, 'Detailivaates', NULL, 'Iga kirje juures on kustutamisnupp'),
(75, 52, 'Loeteluvaates (tabelis)', NULL, 'Kustutada saab peatabeli kirjeid ja / vÃµi peatabeli kirjega seotud alamtabelite kirjeid\r\nÃœhekorraga kustutamiseks saab valida andmed Ã¼hes vÃµi mitmes peatabeli reas vÃµi kÃµigis hetkel kuvatavates ridades korraga. \r\nVaikimisi on kustutamisnupud ja reavaliku mÃ¤rkeruudud peidetud. \r\nPiirang: alamtabelite andmete hulgas ei saa kustutamiseks valikut teha. Saab kustutada kÃµik korraga (kas siis koos peatabeliga vÃµi ilma) vÃµi siis kÃµik alles jÃ¤tta ja tegelda iga alamtabeliga eraldi loeteludes. '),
(76, 52, 'Piirang vormi ja detailivaate kohta: kustutada saab ainult tabelitest, millel on Ã¼lemandmed', NULL, 'Kuni teatud arendamisetapini puudus Ã¼lemtabeli andmete kustutamise vÃµimalus sootuks, kuid selle probleemi lahendas kustutamisvÃµimaluse loomine loeteluvaates'),
(77, 53, 'Sisestamisvorm loeteluvaatest', NULL, 'Vormi suurus ja mitmetasandilisus sÃµltub sellest, milline tabel on peatabel ning kas ja kui palju on sel tabelil alamtabeleid'),
(78, 54, 'Detailivaate kaudu', NULL, 'Andmeid saab redigeerida igal alamkirjel eraldi vÃµi siis minna kÃµigi andmete muutmise vormi.\r\nPiirang: kui redigeeritaval kirjel on alamkirjeid, siis avaneb vorm koos alamkirjega.'),
(79, 54, 'KÃµigi andmete redigeerimine', NULL, 'Redigeerida saab kÃµiki kuvatavaid andmeid korraga. MuutmispÃ¤ring hÃµlmab vaid neid tabeleid ja vÃ¤lju, mida tegelikult muudetakse. '),
(80, 54, 'Valikuline redigeerimine', NULL, 'Detailivaatest vÃµib ka valida kirje, mida soovitakse redigeerida. '),
(82, NULL, 'Ega miskit, veel Ã¼ks', NULL, ''),
(85, 37, 'Ã„sja kustutasin locationi', NULL, 'kas saan uue itemi lisada kohe'),
(86, 56, 'Kas vormivaates tÃ¶Ã¶tab vÃµi ei, selles on kÃ¼simus', NULL, 'Listivaates millegipÃ¤rast polnud mingit posti'),
(87, 57, 'KÃµigepealt aktiveerid kustutamise', NULL, 'Klikkad kustutamisnupule, mis avab tabeliveeru kustutamisnuppudega. Teine klÃµps paneb kinni tagasi. '),
(88, 57, 'Kui tahad kustutada kÃµiki ridu sel lehekÃ¼ljel, klikkad Ã¼hele vÃµi mÃµlemale nupule tabeli pÃ¤ises', NULL, 'Aktiveeritakse kÃµigi nÃ¤htavate ridade kustutamisnupud. Valik - kas ainult peatabeli kirjed vÃµi (ka) need, mis on peatabeli kirjetega seotud ning selles vaates nÃ¤htavad. '),
(89, 58, 'Ainult seotud andmed', NULL, 'Peatabeli kirjeid saab kustutada ainult tabelivaates. Ãœksikasjade juures saab aga Ã¼hekaupa kustutada kÃµik kirjed, mis on peamise kirje kÃ¼ljes. '),
(90, 58, 'Iga kirje juures on kustutamisnupp', NULL, ''),
(91, 59, 'Ainult peamise kirjega seotud alamtabelite andmed', NULL, 'Erinevus vÃµrreldes Ã¼ksikasjade vaatega seisneb aga  selles, et vormivaates kustutamiseks tuleb andmegrupid vormivaatest eemaldada ja siis vorm sisestada. Samal ajal vÃµib ka teisi andmeid muuta ning uusi sisestada. Sisestamisnupp kutsub esile kÃµik vajalikud pÃ¤ringud. '),
(92, 60, 'Ja siin on teine tasand', 2019, 'tabeli nimi: items\r\nÃ¼lemtabel: collection\r\n'),
(93, 60, 'Teise tasandi teine rida', 2020, 'Muide, kohanimed, mida nÃ¤ete (kui vaate peatabel on \"main\") asuvad omaette 1. tasandi korduvgrupis, kus\r\ntabeli nimi: location\r\nÃ¼lemtabel: main\r\nkui valid peatabeliks location (maintable=location), siis nÃ¤ed ainult kohanimesid, sest sel tabelil ei ole alamtabeleid. Muude valikute korral ei nÃ¤e location andmeid Ã¼ldse'),
(95, 54, 'Piirang', NULL, 'Hetkel puudub valik \"muutmiseks ava vorm vaid peatabeli kirjega\". Kui kirjel on alamkirjeid, siis tulevad ka need vormi avades kaasa. '),
(98, NULL, 'veel Ã¼ks juurde', NULL, ''),
(127, 16, 'Jaanus kommenteerib', NULL, 'Selle rea sisestas tegelikult JÃ¼ri R, aga tookord jÃ¤i tema poolt lisamata kirje tabelisse items, mille mina nÃ¼Ã¼d lisan. Kui ta viitsib, vÃµib nÃ¼Ã¼d edasi katsetada. '),
(155, 121, 'Olin kohal', NULL, ''),
(156, 122, 'she turned off TV', NULL, ''),
(157, 122, 'but decided to do something with paintbook', NULL, 'Going to sleep takes always lot of time'),
(158, 123, 'Ooperiproov', 2019, ''),
(163, 126, 'Siis lÃ¤heb juba etenduseks', NULL, ''),
(164, 127, 'One item too', NULL, ''),
(165, 128, 'TÃ¼tar vaatab mÃµttetuid filme', NULL, 'Barbie animatsioonid jne'),
(166, 128, 'MÃµni film ei ole mÃµttetu', NULL, 'NÃ¤iteks kus ponid midagi laulavad, see vÃµib olla isegi kvaliteetmuusika'),
(167, 129, 'Pealkirja asemel', 2019, 'Ei muud hetkel, pÃ¤rast proovin teist vormi ka.'),
(168, 129, 'Lisaselgitus', NULL, 'Visual Studio leidis vigu. Parandasin Ã¤ra. Loodan, et mitte liiga hÃ¤sti. Kui muutmine ka Ãµnnestub, siis on ok'),
(169, 130, 'RÃ¤Ã¤givad iraanist', 2020, 'loodavad, et Ã¤hvardus kultuuriobjektide suunal on siiski bluff'),
(170, 130, 'Trumpist ka muidugi', 2020, ''),
(171, 132, 'Linnud', NULL, 'Laulavad'),
(172, 132, 'päike', NULL, 'hakkas paistma'),
(173, 133, 'vana kere', NULL, 'Mõttetuse mõte on mõttetus'),
(174, 134, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(175, 135, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(176, 136, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(177, 137, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(178, 138, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(179, 139, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(180, 140, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(181, 141, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(182, 142, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(183, 143, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(184, 144, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(185, 145, 'vana kere veel kord', NULL, 'Mõttetuse mõte on mõttetus'),
(186, 146, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(187, 147, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(188, 148, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(189, 149, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(190, 150, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(191, 151, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(192, 152, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(193, 153, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(194, 154, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(195, 155, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(196, 156, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(197, 157, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(198, 158, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(199, 159, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(200, 160, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(201, 161, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(202, 162, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(203, 163, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(204, 164, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(205, 165, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(206, 166, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(207, 167, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(208, 168, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(209, 169, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(210, 170, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(211, 171, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(212, 172, 'uni oli hää', NULL, 'Mõttetuse mõte on mõttetu mõttetus'),
(213, 173, 'varastas maapähklikoti', NULL, ''),
(214, 173, 'ta võib igaveseks ahviks jääda', NULL, 'Tekst, mida kuulen telekast'),
(215, 174, 'varastas maapähklikoti', NULL, ''),
(216, 174, 'ta võib igaveseks ahviks jääda', NULL, 'Tekst, mida kuulen telekast'),
(217, 175, 'varastas maapähklikoti', NULL, ''),
(218, 175, 'ta võib igaveseks ahviks jääda', NULL, 'Tekst, mida kuulen telekast'),
(219, 176, 'varastas maapähklikoti', NULL, ''),
(220, 176, 'ta võib igaveseks ahviks jääda', NULL, 'Tekst, mida kuulen telekast'),
(221, 177, 'varastas maapähklikoti', NULL, 'midagi muud ka, miudu hakkab igav'),
(222, 177, 'ta võib igaveseks ahviks jääda', NULL, 'Tekst, mida kuulen telekast'),
(223, 178, 'tegelikult ka', NULL, 'aga külm on, kuradi külm'),
(224, 179, 'Olen väga väikese aruga karu', NULL, ''),
(225, 179, 'Kõik on voodis vintsuli', NULL, ''),
(226, 180, 'Olen väga väikese aruga karu', NULL, ''),
(227, 180, 'Kõik on voodis vintsuli', NULL, ''),
(228, 181, 'Olen väga väikese aruga karu', NULL, ''),
(229, 181, 'Kõik on voodis vintsuli', NULL, ''),
(230, 182, 'Olen väga väikese aruga karu', NULL, ''),
(231, 182, 'Kõik on voodis vintsuli', NULL, ''),
(232, 183, 'Olen väga väikese aruga karu', NULL, ''),
(233, 183, 'Kõik on voodis vintsuli', NULL, ''),
(234, 184, 'Olen väga väikese aruga karu', NULL, ''),
(235, 184, 'Kõik on voodis vintsuli', NULL, ''),
(236, 185, 'Olen väga väikese aruga karu', NULL, ''),
(237, 185, 'Kõik on voodis vintsuli', NULL, ''),
(238, 186, 'Olen väga väikese aruga karu', NULL, ''),
(239, 186, 'Kõik on voodis vintsuli', NULL, ''),
(240, 187, 'Olen väga väikese aruga karu', NULL, ''),
(241, 187, 'Kõik on voodis vintsuli', NULL, ''),
(242, 188, 'Olen väga väikese aruga karu', NULL, ''),
(243, 188, 'Kõik on voodis vintsuli', NULL, ''),
(244, 189, 'Olen väga väikese aruga karu', NULL, ''),
(245, 189, 'Kõik on voodis vintsuli', NULL, ''),
(246, 190, 'Olen väga väikese aruga karu', NULL, ''),
(247, 190, 'Kõik on voodis vintsuli', NULL, ''),
(248, 191, 'Olen väga väikese aruga karu', NULL, ''),
(249, 191, 'Kõik on voodis vintsuli', NULL, ''),
(250, 192, 'Olen väga väikese aruga karu', NULL, ''),
(251, 192, 'Kõik on voodis vintsuli', NULL, ''),
(252, 193, 'Olen väga väikese aruga karu', NULL, ''),
(253, 193, 'Kõik on voodis vintsuli', NULL, ''),
(254, 194, 'Olen väga väikese aruga karu', NULL, ''),
(255, 194, 'Kõik on voodis vintsuli', NULL, ''),
(256, 195, 'Olen väga väikese aruga karu', NULL, ''),
(257, 195, 'Kõik on voodis vintsuli', NULL, ''),
(258, 196, 'Olen väga väikese aruga karu', NULL, ''),
(259, 196, 'Kõik on voodis vintsuli', NULL, ''),
(260, 197, 'Olen väga väikese aruga karu', NULL, ''),
(261, 197, 'Kõik on voodis vintsuli', NULL, ''),
(262, 198, 'Olen väga väikese aruga karu', NULL, ''),
(263, 198, 'Kõik on voodis vintsuli', NULL, ''),
(264, 199, 'Olen väga väikese aruga karu', NULL, ''),
(265, 199, 'Kõik on voodis vintsuli', NULL, ''),
(266, 200, 'Olen väga väikese aruga karu', NULL, ''),
(267, 200, 'Kõik on voodis vintsuli', NULL, ''),
(268, 201, 'Olen väga väikese aruga karu', NULL, ''),
(269, 201, 'Kõik on voodis vintsuli', NULL, ''),
(270, 202, 'Olen väga väikese aruga karu', NULL, ''),
(271, 202, 'Kõik on voodis vintsuli', NULL, ''),
(272, 206, 'ja sellega ka', NULL, ''),
(273, 207, 'Üks rida', NULL, ''),
(274, 207, 'Teine reida', NULL, ''),
(275, 209, 'Kui veel lisamaterjale ka juurde saab', NULL, ''),
(276, 209, 'Siia ka', NULL, 'Ongi'),
(277, 211, 'alamkirje', NULL, 'on just selline'),
(278, 212, 'See on esimene', NULL, 'Aastat ma ei arvesta'),
(279, 212, 'See on teine', NULL, 'Kirjas kirjedamatu'),
(280, 214, 'See on esimene', NULL, 'Aastat ma ei arvesta'),
(281, 214, 'See on teine', NULL, 'Ikka kirjeldamatu'),
(282, 216, 'See on esimene', NULL, 'Aastat ma ei arvesta'),
(283, 216, 'See on teine valge öö', NULL, 'Ikka kirjeldamatu valge öö'),
(284, 218, 'on tänane ilm', NULL, 'mul hakkas seal koolitusruumis külm'),
(285, 218, 'uni tuli ka peale', NULL, ''),
(286, 219, 'Selleks on vaja füüsilist kontakti', NULL, 'aga temal praegu mingi proov'),
(287, 220, 'tahavad tuvi', NULL, ''),
(288, 220, 'tuvi', NULL, 'tahavad valget kajakat'),
(289, 221, 'ei taha midagi', NULL, ''),
(290, 222, 'kädistavad', NULL, ''),
(291, 222, 'pesakond', NULL, 'tahab süüa'),
(292, 223, 'ei taha midagi', NULL, ''),
(293, 224, 'siin on item', NULL, ''),
(294, 225, 'siin jälle item', NULL, ''),
(295, 225, 'ja veel üks asi ka', NULL, ''),
(296, 226, 'selle siin', NULL, ''),
(297, 227, 'Ei tea ainult, milline', NULL, 'Täiuslik ja teised tegelased'),
(298, 227, 'koristamine', NULL, 'Just käisin prügi välja viimas'),
(299, 228, 'Ei tea ainult, milline', NULL, 'Täiuslik ja teised tegelased'),
(300, 228, 'koristamine', NULL, 'Just käisin prügi välja viimas'),
(301, 229, 'lisan nimetuse', NULL, 'Pole midagi öelda'),
(302, 230, 'Nüüd lisa', NULL, ''),
(303, 230, 'Veel üks item', NULL, ''),
(304, 231, 'randa', NULL, ''),
(305, 231, 'juuniks', NULL, 'et saada pruuniks'),
(306, 233, 'Üks alaosa', NULL, 'Tänane päev on toonud ikka väga palju'),
(307, 233, 'Hea ja halb', NULL, 'Nagu ikka, kusagil veab ja kusagil veab viltu'),
(308, 234, 'Seekord', NULL, ''),
(309, 234, 'Veel kord', NULL, 'Tundus, nagu hakkaks hästi minema'),
(310, 235, 'Kas ei või jaa', NULL, ''),
(311, 235, 'Nüüd on kallastest tõusnud meri', NULL, 'Olge valmis! Olge valmis!'),
(312, 236, 'Neist üks on pimedus', NULL, ''),
(313, 236, 'Ja teine valgus', NULL, 'Me, noored, ootame pilgul säraval... Nüüd see ligineb, lõpp ja algus! '),
(314, 237, 'Seegi kord', NULL, ''),
(315, 237, 'Tänagi jah', NULL, 'Tundus, nagu lähekski hästi'),
(316, 238, 'oh ei', NULL, 'Olen unustanud endast teavitada baltoka rahvast'),
(317, 238, 'Loodan, et rong pole läinud', NULL, ''),
(318, 239, 'Jälle üks maadejagamine', NULL, 'Ja telefoniloomakese toitmine'),
(319, 241, 'Kakssada nelikümmend neli', NULL, 'ehh, teisel pool lauda tutvutakse kalendriga'),
(320, NULL, 'Kui ma kirjutan siia lihtsalt itemi', NULL, 'Siis mida ütleb süsteem'),
(321, 244, 'Proovin seda ka', NULL, 'Tundus olevat vale loogika seal koodis'),
(322, 245, 'Mina istun', NULL, ''),
(323, 245, 'Olen kodus', NULL, 'Ja kribin nõmedat teksti'),
(324, 246, 'Olen unine', NULL, ''),
(325, 247, 'Ikka siia levelisse ka ', NULL, ''),
(326, 248, 'Iitem', NULL, ''),
(327, 249, 'Asi mis iganes', NULL, 'kas tõesti õnnestus?'),
(328, 253, 'Äkki ongi', NULL, ''),
(329, 254, 'Nüri meeleolu', 2021, ''),
(330, 255, 'Mina ise', 2021, 'Ma ei teagi, kas homme on meil seesama õpetaja'),
(331, 255, 'Ega tea, kas saan blogi täiustada', NULL, '');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `main_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `location`
--

INSERT INTO `location` (`id`, `main_id`, `name`) VALUES
(1, 1, 'Tallinn'),
(2, 1, 'Rakvere'),
(9, NULL, 'Ã¼ks paik siin ilmas'),
(15, 17, 'tartu'),
(16, 17, 'kama'),
(17, 18, 'Rakvere and Tallinn'),
(20, NULL, 'Trying to add one more location'),
(34, NULL, 'Rakveres'),
(36, 38, 'Rakvere'),
(38, 39, 'Rakvere'),
(39, NULL, 'Oleme Rakveres'),
(40, 40, 'Rakvere, varsti VÃµsu'),
(41, 1, 'VÃµsu'),
(104, 57, 'RÃ¤pina'),
(105, 58, 'Rakvere'),
(106, 59, 'Rakvere'),
(108, NULL, 'Rakvere'),
(109, NULL, 'rakvere'),
(110, 80, 'Rakvere'),
(111, 80, 'Lembitu'),
(114, 80, 'but now'),
(115, 97, 'Rakvere ikka'),
(116, 98, 'Olen Rakveres'),
(117, 98, 'Olen kodus'),
(118, 99, 'Rakvere'),
(119, 100, 'kodus'),
(120, 101, 'kodus'),
(121, 102, 'kodus'),
(122, 103, 'kodus'),
(123, 104, 'kodus'),
(124, 105, 'kodus'),
(125, 106, 'kodus'),
(126, 107, 'kodus'),
(127, 108, 'kodus'),
(128, 109, 'kodus'),
(129, 110, 'kodus'),
(130, 111, 'kodus'),
(131, 112, 'kodus'),
(132, 113, 'pliidi juures'),
(133, 114, 'pliidi juures'),
(134, 115, 'pliidi juures'),
(135, 116, 'pliidi juures'),
(136, 117, 'pliidi juures'),
(137, 118, 'pliidi juures'),
(138, 119, 'pliidi juures'),
(139, 120, 'pliidi juures'),
(140, 121, 'pliidi juures'),
(141, 122, 'pliidi juures'),
(142, 123, 'pliidi juures'),
(143, 124, 'pliidi juures'),
(144, 125, 'pliidi juures'),
(145, 126, 'pliidi juures'),
(146, 127, 'pliidi juures'),
(147, 128, 'pliidi juures'),
(148, 129, 'pliidi juures'),
(149, 130, 'pliidi juures'),
(150, 131, 'pliidi juures'),
(151, 132, 'pliidi juures'),
(152, 133, 'pliidi juures'),
(153, 134, 'pliidi juures'),
(154, 135, 'pliidi juures'),
(155, 136, 'pliidi juures'),
(156, 137, 'pliidi juures'),
(157, 138, 'pliidi juures'),
(158, 139, 'pliidi juures'),
(159, 140, 'televiisor'),
(160, 141, 'televiisor'),
(161, 142, 'televiisor'),
(162, 143, 'televiisor'),
(163, 144, 'televiisor'),
(164, 145, 'kus kõik juba magavad'),
(165, 146, 'öö'),
(166, 147, 'öö'),
(167, 148, 'öö'),
(168, 149, 'öö'),
(169, 150, 'öö'),
(170, 151, 'öö'),
(171, 152, 'öö'),
(172, 153, 'öö'),
(173, 154, 'öö'),
(174, 155, 'öö'),
(175, 156, 'öö'),
(176, 157, 'öö'),
(177, 158, 'öö'),
(178, 159, 'öö'),
(179, 160, 'öö'),
(180, 161, 'öö'),
(181, 162, 'öö'),
(182, 163, 'öö'),
(183, 164, 'öö'),
(184, 165, 'öö'),
(185, 166, 'öö'),
(186, 167, 'öö'),
(187, 168, 'öö'),
(188, 169, 'öö'),
(189, 170, 'toas'),
(190, 171, 'toas'),
(191, 172, 'toas'),
(192, 173, 'hommikupäikeses'),
(193, 174, 'telekas'),
(194, 175, 'telekas'),
(195, 176, 'telekas'),
(196, 177, 'koht'),
(197, 178, 'ahaaah'),
(198, 179, 'ahaaah'),
(199, NULL, 'Rakvere'),
(200, 197, 'rakvere'),
(201, 198, 'rakvere'),
(202, 199, 'Zoom'),
(203, 200, 'magamistuba'),
(204, 200, 'kodu'),
(205, 201, 'elutuba'),
(206, 201, 'töölaud'),
(207, 202, 'üks paik'),
(208, 203, 'kodu'),
(209, 204, 'olen kodus'),
(210, 205, 'olen kodus'),
(211, 206, 'olen kodus'),
(212, 206, 'lähen kööki'),
(213, 207, 'kauges külas'),
(214, 207, 'vanaisa juures'),
(215, 208, 'koht ikka tarwanpää'),
(216, 209, 'üks paik'),
(217, 210, 'OMas kojas'),
(218, 211, 'Omas kojas kallimas'),
(219, 212, 'Vaatan aknast'),
(220, 213, 'Vaatan aknast välja ja kuulan vareseid'),
(221, 214, 'Siin'),
(222, 214, 'Kodus'),
(223, 215, 'Rakvere'),
(224, 216, 'Rakvere, homme Tallinn'),
(225, 216, 'vahepeal Salmistu'),
(226, 217, 'Rakvere'),
(227, 218, 'arvuti taga'),
(228, 219, 'Omas kojas'),
(229, 220, 'Ikka endises kohas'),
(230, 221, 'Kodus'),
(231, 221, 'Rakveres'),
(232, 221, 'Laua taga'),
(233, 222, 'Kodus'),
(234, 222, 'Prillid tleviisoris'),
(235, 223, 'läks ka'),
(236, 227, 'Rida siiagi'),
(237, 229, 'Kodus'),
(238, 234, 'Kodus'),
(239, 235, 'Prillid'),
(240, 236, 'arva'),
(241, 237, 'Laua taga metsa sees :D'),
(242, 238, 'Trepikoda'),
(243, 238, 'Kõik teevd tööd'),
(244, 239, 'Siin koduses veebis'),
(245, 240, 'kodu kodu'),
(246, 241, 'Lasteaed'),
(247, 241, 'Akna taga'),
(248, 242, 'Tarwanpää'),
(249, 243, 'Tarwanpää'),
(250, 243, 'Ja midagi muudki'),
(251, 244, 'Ohhohoho'),
(252, 244, '2035 mainitud'),
(253, 245, 'Kas sammu tagasi'),
(254, 245, '2035 mainitud vol 2'),
(255, 246, ''),
(256, 247, 'täitsa kodus'),
(257, 248, 'Home home'),
(258, 249, ''),
(259, 250, 'Ikka kodus'),
(260, 251, 'Telekas'),
(261, 252, 'Telekast tuleb jama'),
(262, 253, ''),
(263, 254, 'Öises kodus'),
(264, 255, 'Heia'),
(265, 257, 'Kodus');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `main`
--

CREATE TABLE `main` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `main_data`
--

CREATE TABLE `main_data` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `main_data`
--

INSERT INTO `main_data` (`id`, `name`, `created`) VALUES
(1, 'Kuidas andmed on põimitud. How the data here is nested. selle vaate peatabel / the main table of this view', '2019-08-12 08:50:33'),
(17, 'seep', '2019-06-19 10:03:30'),
(18, 'Nested html table is present', '2019-07-11 10:21:08'),
(38, 'Hetkeseis nÃ¤idisrakendusega', '2019-08-16 01:10:33'),
(39, 'Uus', '2019-08-16 01:05:34'),
(40, 'Uskumatu, aga sain kustutamise tÃ¶Ã¶le!', '2019-08-16 01:07:31'),
(57, 'Dirikalaager lÃµppes just', '2019-08-23 11:49:09'),
(58, 'Rainy evening', '2019-08-23 18:53:49'),
(59, 'Selle puhul, et nÃ¼Ã¼d on ka linkedin sisselogimine olemas, lisan siia Ã¼he kirje', '2019-08-26 01:15:06'),
(80, 'was without first', '2019-11-07 10:53:18'),
(97, 'TÃ¤na kÃ¤isin Visual Studioga Ã¼le', '2019-11-26 01:26:51'),
(98, 'Kindluse mÃµttes lisan uue ja siis muudan ka', '2020-01-06 12:25:55'),
(99, 'Uues kodus', '2020-05-31 02:19:07'),
(100, 'Lihtne väljaproov', '2020-05-31 09:58:27'),
(101, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:23:03'),
(102, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:27:21'),
(103, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:28:00'),
(104, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:30:37'),
(105, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:32:16'),
(106, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:33:36'),
(107, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:34:23'),
(108, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:35:36'),
(109, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:42:44'),
(110, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 10:58:27'),
(111, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 11:07:11'),
(112, 'Lihtne väljaproov veidi laiendatult', '2020-05-31 11:11:33'),
(113, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 12:42:45'),
(114, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 12:43:04'),
(115, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 12:45:46'),
(116, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 12:47:07'),
(117, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 12:55:59'),
(118, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 12:58:05'),
(119, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 13:00:52'),
(120, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 13:03:12'),
(121, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 13:23:33'),
(122, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 14:32:09'),
(123, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 14:51:36'),
(124, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 14:53:11'),
(125, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 14:58:50'),
(126, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 15:07:00'),
(127, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 15:22:04'),
(128, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 17:51:28'),
(129, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 17:53:48'),
(130, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 18:01:46'),
(131, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 18:05:31'),
(132, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 18:06:58'),
(133, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 18:11:40'),
(134, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 18:15:20'),
(135, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 18:24:45'),
(136, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 18:35:29'),
(137, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 19:38:11'),
(138, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 19:48:23'),
(139, 'Väljaprint veelgi rohkem laiendatult', '2020-05-31 19:51:55'),
(140, 'Ikka veel tulevad uued korduspostitused', '2020-06-01 16:49:03'),
(141, 'Ikka veel tulevad uued korduspostitused', '2020-06-01 16:52:02'),
(142, 'Ikka veel tulevad uued korduspostitused', '2020-06-01 17:06:16'),
(143, 'Ikka veel tulevad uued korduspostitused', '2020-06-01 17:14:32'),
(144, 'Kui vajutad nuppu, hakkavad jalad tööle', '2020-06-01 17:22:19'),
(145, 'Kuhu see keemia viib, ei tea', '2020-06-01 21:22:25'),
(146, 'Vahelduseks muudki jura', '2020-06-01 21:58:25'),
(147, 'Vahelduseks muudki jura', '2020-06-01 22:06:22'),
(148, 'Vahelduseks muudki jura', '2020-06-01 22:09:43'),
(149, 'Vahelduseks muudki jura', '2020-06-01 22:13:18'),
(150, 'Vahelduseks muudki jura', '2020-06-01 22:14:03'),
(151, 'Vahelduseks muudki jura', '2020-06-01 22:48:38'),
(152, 'Vahelduseks muudki jura', '2020-06-01 22:54:53'),
(153, 'Vahelduseks muudki jura', '2020-06-01 23:01:31'),
(154, 'Vahelduseks muudki jura', '2020-06-01 23:04:13'),
(155, 'Vahelduseks muudki jura', '2020-06-01 23:13:29'),
(156, 'Vahelduseks muudki jura', '2020-06-01 23:28:40'),
(157, 'Vahelduseks muudki jura', '2020-06-01 23:32:40'),
(158, 'Vahelduseks muudki jura', '2020-06-01 23:35:13'),
(159, 'Vahelduseks muudki jura', '2020-06-01 23:37:11'),
(160, 'Vahelduseks muudki jura', '2020-06-01 23:41:10'),
(161, 'Vahelduseks muudki jura', '2020-06-01 23:42:32'),
(162, 'Vahelduseks muudki jura', '2020-06-01 23:44:30'),
(163, 'Vahelduseks muudki jura', '2020-06-01 23:45:51'),
(164, 'Vahelduseks muudki jura', '2020-06-02 00:07:56'),
(165, 'Vahelduseks muudki jura', '2020-06-02 00:10:07'),
(166, 'Vahelduseks muudki jura', '2020-06-02 00:41:19'),
(167, 'Vahelduseks muudki jura', '2020-06-02 00:43:04'),
(168, 'Vahelduseks muudki jura', '2020-06-02 00:45:49'),
(169, 'Vahelduseks muudki jura', '2020-06-02 00:51:25'),
(170, 'Uuele ringile', '2020-06-02 21:28:24'),
(171, 'Uuele ringile', '2020-06-02 23:31:49'),
(172, 'Uuele ringile', '2020-06-03 00:34:07'),
(173, 'Kontrolliks', '2020-06-03 05:23:57'),
(174, 'Kingidraakon', '2020-06-07 16:57:53'),
(175, 'Kingidraakon', '2020-06-07 17:07:52'),
(176, 'Kingidraakon', '2020-06-07 17:08:45'),
(177, 'Lahendus', '2020-06-07 21:22:39'),
(178, 'Soh ja nüüd', '2020-06-07 22:05:33'),
(179, 'Soh ja nüüd', '2020-06-07 22:11:13'),
(180, 'Lihtsalt üks uus', '2020-06-09 21:16:00'),
(181, 'Jälle', '2020-06-09 23:11:39'),
(182, 'Jälle salvestab', '2020-06-09 23:12:26'),
(183, 'Jälle salvesta', '2020-06-10 00:13:15'),
(184, 'Jälle salvesta', '2020-06-10 00:20:11'),
(185, 'Huvitav', '2020-06-10 00:43:20'),
(186, 'Ei mäleta enam', '2020-06-10 18:40:13'),
(187, 'Ei mäleta enam', '2020-06-10 21:49:23'),
(188, 'Ei mäleta enam', '2020-06-10 21:57:30'),
(189, 'Jälle pidin vormi uuesti laadima', '2020-06-10 23:13:17'),
(190, 'Nüüd enam uut laadimist polnud', '2020-06-10 23:42:42'),
(191, 'Nüüd enam uut laadimist polnud', '2020-06-10 23:46:22'),
(192, 'Nüüd enam uut laadimist polnud', '2020-06-11 00:06:20'),
(193, 'Nüüd enam uut laadimist polnud', '2020-06-11 00:12:02'),
(194, 'Nüüd enam uut laadimist polnud', '2020-06-11 00:16:04'),
(195, 'Nüüd enam uut laadimist polnud', '2020-06-11 00:18:08'),
(196, 'Nüüd enam uut laadimist polnud, aga', '2020-06-11 00:26:45'),
(197, 'jah, jälle otsast peale', '2020-06-11 11:27:22'),
(198, 'jah, jälle otsast peale number kaks', '2020-06-11 11:30:28'),
(199, 'EMLS auliige Hirvo', '2020-06-11 16:00:20'),
(200, 'Magamistoas loetakse Emili raamatut', '2020-06-11 18:44:02'),
(201, 'Elutoas ärgati', '2020-06-11 23:36:32'),
(202, 'ja siin on üks', '2020-06-13 21:53:49'),
(203, 'Päike paistab ja palav on', '2020-06-14 09:03:08'),
(204, 'Nüüd proovin nii, et algul see vana vorm', '2020-06-14 13:02:17'),
(205, 'Nüüd proovin nii, et algul see vana vorm', '2020-06-14 13:15:22'),
(206, 'Nüüd teen siis jälle uue', '2020-06-14 13:20:42'),
(207, 'Nüüd oleks tõesti huvitav teada, miks see töötab ja teine mitte', '2020-06-14 19:32:08'),
(208, 'Nüüd teen katse uuenenud süsteemiga', '2020-06-14 19:59:24'),
(209, 'Korraks vaid tahan sind proovida', '2020-06-19 23:09:24'),
(210, 'Proovime veel kord', '2020-06-19 23:11:21'),
(211, 'Proovime ikkagi veel kord', '2020-06-19 23:16:57'),
(212, 'Jälle ommik', '2020-06-20 01:10:15'),
(213, 'Magamistoas keegi justkui sabistas', '2020-06-20 01:14:50'),
(214, 'Proovime uut posti', '2020-06-20 13:44:35'),
(215, 'Helikopterid', '2020-06-22 10:13:50'),
(216, 'PRoovin, kas vana asi ikka funkab', '2020-06-25 23:23:15'),
(217, 'Hambaid pestakse. Tavaline õhtu', '2021-01-31 18:17:25'),
(218, 'Oh ei', '2021-01-31 18:36:43'),
(219, 'Lihtsalt prooviks veel', '2021-01-31 20:06:30'),
(220, 'No korraks veel ilma actionita', '2021-01-31 20:46:22'),
(221, 'Nüüd vaatame, kas tulemused jäävad alla näha', '2021-01-31 20:50:37'),
(222, 'Nüüd uuesti pärast üht veaparandust', '2021-01-31 21:49:37'),
(223, 'Läks', '2021-01-31 22:33:25'),
(224, 'Nüüd proovin jälle posti teha, vaatame, mis ütleb', '2021-02-01 00:42:23'),
(225, 'Siit ka üks proovipostitus', '2021-02-01 00:43:40'),
(226, 'Kui üht ainsat täita, siis vist õnnestub?', '2021-02-01 00:59:39'),
(227, 'Rida siia', '2021-02-01 01:25:51'),
(228, 'Nüüd teen üheainsa sisestuse', '2021-02-01 01:29:26'),
(229, 'Niisama', '2021-02-01 01:42:55'),
(230, 'proovin niisama, kas post töötab', '2021-02-05 18:59:30'),
(231, 'Kas võib postitada või ei või?', '2021-02-05 19:02:32'),
(232, 'Kuidas on seda sisestada hal  browseri kaudu', '2021-02-10 09:07:22'),
(233, 'Katsun sellega midagi sisestada', '2021-02-10 11:56:49'),
(234, 'Sai pisut koodi ümber tehtud. Neetult nüriks teeb', '2021-02-10 12:12:23'),
(235, 'Üha uuesti ja uuuestiiii', '2021-02-10 12:28:55'),
(236, 'Nwoh kas nüüd läheb häste', '2021-02-10 13:06:48'),
(237, 'Nüüd peaks vähemalt kaduma see hala, et ei leitud lehekülge', '2021-02-10 13:34:27'),
(238, 'No kurat', '2021-02-10 14:09:51'),
(239, 'Kontent tüüp ja aktsioon', '2021-02-10 14:22:08'),
(240, 'Issand halasta', '2021-02-10 14:39:24'),
(241, 'Noh, mis nüüd saama hakkab', '2021-02-10 14:43:56'),
(242, 'VAhetasin hobust', '2021-02-11 01:57:59'),
(243, 'Vahetasin brauseriakent', '2021-02-11 02:00:41'),
(244, 'Nüüd täidan selle vormi ja siis vaatame', '2021-02-12 12:40:01'),
(245, 'Oh oh oh hoo', '2021-02-12 12:43:07'),
(246, 'sisestan', '2021-02-12 15:14:31'),
(247, 'ei ole ilus musa', '2021-02-12 17:24:25'),
(248, 'Large large', '2021-02-12 17:56:49'),
(249, 'brrrrrrrrr ssssssssss', '2021-02-12 18:02:00'),
(250, 'Kas asjast asja ka sai või ei', '2021-02-12 20:06:46'),
(251, 'Now new submission', '2021-02-12 20:21:31'),
(252, 'Now new submission', '2021-02-12 20:41:13'),
(253, 'Eks ma siis ', '2021-02-13 01:27:04'),
(254, 'Eks ma siis kirjuta siia midagi', '2021-02-13 01:31:06'),
(255, 'Heia', '2021-02-13 07:06:00'),
(256, 'Mai neim is Jack', '2021-02-14 05:13:01'),
(257, 'Närvi ajab', '2021-02-14 09:42:38');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `new_location_token`
--

CREATE TABLE `new_location_token` (
  `id` bigint(20) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `user_location_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `one`
--

CREATE TABLE `one` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `one`
--

INSERT INTO `one` (`id`, `title`, `created`, `modified`) VALUES
(1, 'first row, the saviour let\'s check ts', '2019-08-16 10:03:35', '2019-08-16 10:12:28'),
(3, 'Esimene sisestus, kus nii mitmekihiline vorm nÃ¤ib toimivat', '2019-08-20 21:57:45', NULL),
(27, 'Now it seems to be clear why in certain cases there was no fk field edited', '2019-08-28 12:32:08', '2019-08-28 13:39:08'),
(31, 'Let\'s check once more', '2019-08-29 00:07:12', NULL),
(32, 'will it create normal url', '2019-08-30 13:40:31', NULL),
(33, 'Now I just wonder how will look like the newly submitted data if we show details here inside the form after submission', '2019-08-30 23:39:37', NULL),
(34, 'Siin ma nÃ¼Ã¼d siis olen', '2019-11-07 10:56:12', '2019-11-07 10:56:59'),
(35, 'Why there was not submitted', '2019-11-14 21:13:43', '2019-11-14 21:14:33'),
(39, 'Tühjus, aga selle vea parandame', '2019-11-16 00:35:37', '2020-06-14 22:48:15'),
(40, 'Täidame sellegi koha ilusti ära', '2019-11-16 00:46:52', '2020-06-14 22:48:38'),
(41, 'Is this shameful error fixed?', '2019-11-16 22:23:10', NULL),
(42, 'Is this shameful error still fixed? Oh yes, indeed!', '2019-11-16 22:44:25', '2019-11-16 23:26:39'),
(43, 'Teen nÃ¼Ã¼d siia ka kontrollsisestuse, et kindel olla', '2019-11-26 01:30:46', NULL),
(44, 'RÃ¤Ã¤givad Iraanist, USAst ja Euroopast', '2020-01-06 12:31:04', NULL),
(45, 'Identity sai muudetud', '2020-06-12 03:05:13', NULL),
(46, 'Veel kord', '2020-06-12 03:47:02', NULL),
(47, 'Üks kaug vana', '2020-06-12 17:34:15', NULL),
(48, 'Nüüd huvitab mind selline imeloom nagu patch', '2020-06-12 22:32:50', NULL),
(49, 'uus tiitel', '2020-06-13 00:25:06', NULL),
(50, 'noh ja möhh', '2020-06-13 16:21:03', NULL),
(51, 'noh ja möhh olen ikka tainas', '2020-06-13 16:23:01', NULL),
(52, 'Vaatame, mis see nüüd teeb', '2020-06-13 16:26:24', NULL),
(53, 'Vaatame, mis see nüüd teeb', '2020-06-13 16:34:44', NULL),
(54, 'Vaatame, mis see nüüd teeb', '2020-06-13 17:53:56', NULL),
(55, 'Vaatame, mis see nüüd teeb', '2020-06-13 17:58:09', NULL),
(56, 'Vaatame, mis see nüüd teeb', '2020-06-13 18:08:36', NULL),
(57, 'noh, pesema', '2020-06-13 18:17:37', NULL),
(58, 'Jälle see neetud proovimine', '2020-06-13 20:58:42', NULL),
(59, 'Jälle see neetud proovimine', '2020-06-13 21:05:39', NULL),
(60, 'one title title', '2020-06-13 21:10:38', NULL),
(61, 'api oli puudu, muud polnud häda midagi', '2020-06-13 21:24:23', NULL),
(62, 'MIs nõüd saab sest laulust', '2020-06-13 21:37:24', NULL),
(63, 'MIs nõüd saab sest laulust', '2020-06-13 21:38:09', NULL),
(64, 'oo üks üks', '2020-06-13 21:49:37', NULL),
(65, 'essa kraam', '2020-06-13 22:31:13', NULL),
(66, 'essa kraam', '2020-06-13 22:35:11', NULL),
(67, 'ohohoh', '2020-06-13 23:35:07', NULL),
(68, 'ddddann', '2020-06-13 23:39:17', NULL),
(69, 'Jäneseöö', '2020-06-13 23:52:55', NULL),
(70, 'Jäneseöö', '2020-06-13 23:53:22', NULL),
(71, 'üks kirje', '2020-06-14 14:48:32', NULL),
(72, 'üks kirje uuesti seesama', '2020-06-14 15:00:09', NULL),
(73, 'Üks järjekordne vormisisestus', '2020-06-14 19:46:50', NULL),
(74, 'ega tea jah', '2020-06-14 20:03:13', NULL),
(75, 'ega tea jah midagi mis juhtuma hakkab', '2020-06-14 20:17:22', NULL),
(76, 'Nüüd selgus, et osa väärtusi oli nullkuupäevad', '2020-06-14 21:50:31', NULL),
(77, 'Teen hal kauuu', '2020-06-14 21:52:42', NULL),
(78, 'Kas ajatempel takistas', '2020-06-14 22:39:29', NULL),
(79, 'Nüüd tuli isegi lombok mängu', '2020-06-14 22:47:04', NULL),
(80, 'Mis siin ikka alustame jälle algusest', '2020-06-15 00:04:13', NULL),
(81, 'Mis siin ikka, äärepealt oleks õnnestunud.', '2020-06-15 00:10:41', NULL),
(82, 'äärepealt oleks õnnestunud.', '2020-06-15 00:20:19', NULL),
(83, 'äärepealt oleks õnnestunud.', '2020-06-15 00:24:28', NULL),
(84, 'äärepealt oleks', '2020-06-15 00:41:00', NULL),
(85, 'Nüüd seisab see siin eraldi', '2020-06-15 19:53:19', NULL),
(86, 'Nüüd seisab see siin eraldi', '2020-06-15 20:07:25', NULL),
(87, 'Mis sste see uueste', '2020-06-15 20:08:36', NULL),
(88, 'Praegu lisan ainult ühe', '2020-06-15 21:03:23', NULL),
(89, 'Nüüd lisan koos ühega veel mitu tükki', '2020-06-15 21:04:11', NULL),
(90, 'Noh, kas nüüd saab asjast õige asja ka', '2020-06-15 21:13:44', NULL),
(91, 'Noh, kas nüüd tagastab parema resuldi', '2020-06-15 21:55:04', NULL),
(92, 'Salvestas, aga ei olnud hea tagastus', '2020-06-15 21:57:01', NULL),
(93, 'ei olnud hea tagastus', '2020-06-15 22:04:34', NULL),
(94, 'Nüüd oli hea tagastus', '2020-06-15 22:09:04', NULL),
(95, 'Tore, kas nüüd', '2020-06-15 22:18:45', NULL),
(96, 'Tore, kas nüüd tohin', '2020-06-15 22:39:37', NULL),
(97, 'Tore, kas nüüd tohin aevastada', '2020-06-15 22:49:39', NULL),
(98, 'Noh, nüüd', '2020-06-15 23:48:52', NULL),
(99, 'Nüüd on siis asjad niimoodi', '2020-06-15 23:57:04', NULL),
(100, 'Teeme siis proovi', '2020-06-16 11:45:08', NULL),
(101, 'Proovime, kas näitab lehel ka', '2020-06-16 11:51:31', NULL),
(102, 'No kurat küll', '2020-06-16 11:58:16', NULL),
(103, 'No kurat küll', '2020-06-16 12:24:22', NULL),
(104, 'ÄIke', '2020-06-16 15:05:31', NULL),
(105, 'Esiplaanipilv kui kaotatud võtmerõngas', '2020-06-16 15:12:06', NULL),
(106, 'LIhtsalt üks uus sisestus', '2020-06-16 15:16:21', NULL),
(107, 'Esiplaanipilv uuesti', '2020-06-16 15:23:57', NULL),
(108, 'Taevas kisub jälle selgeks', '2020-06-16 15:44:02', NULL),
(109, 'Vahelduv pilvisus', '2020-06-16 16:05:15', NULL),
(110, 'Vahelduv pilvisus endiselt', '2020-06-16 19:26:44', NULL),
(111, 'Söövad õuna', '2020-06-16 19:33:53', NULL),
(112, 'Söövad õuna', '2020-06-16 19:38:25', NULL),
(113, 'Kas viga leitud', '2020-06-16 20:33:32', NULL),
(114, 'Vea leidsin üles, nüüd muutsin ühes kohas koodi endiseks', '2020-06-16 20:46:55', NULL),
(115, 'Proovin veidi uut mood', '2020-06-16 23:35:24', NULL),
(116, 'sass sss', '2020-06-17 00:17:33', NULL),
(117, 'üksüks', '2020-06-17 23:04:07', NULL),
(118, 'Keeksi keeksi', '2020-06-18 20:59:44', NULL),
(119, 'Magavad nüüd', '2020-06-18 21:12:28', NULL),
(120, 'uus päev', '2020-06-19 11:15:53', NULL),
(121, 'riivitud', '2020-06-19 15:57:42', NULL),
(122, 'riivatu', '2020-06-19 16:08:58', NULL),
(123, 'käpapatrull', '2020-06-19 16:14:34', NULL),
(124, 'Haisev', '2020-06-19 16:34:11', NULL),
(125, 'Nüüd on siis asi vist selge', '2020-06-19 16:47:21', NULL),
(126, 'heh,veel üks katse ehk', '2020-06-19 17:49:36', NULL),
(127, 'Üks helikopter', '2020-06-22 10:18:07', NULL),
(128, NULL, '2020-06-24 23:44:12', NULL),
(129, NULL, '2020-06-24 23:48:33', NULL),
(130, 'Veel kord siis', '2020-06-24 23:55:02', NULL),
(131, 'Väike retsimine, vaatame', '2020-06-25 00:36:50', NULL),
(132, 'Annotatsioonide katse', '2020-06-25 08:55:34', NULL),
(133, 'Annotatsioonide katse kaks', '2020-06-25 08:58:07', NULL),
(134, 'Annotatsioonide katse kaks', '2020-06-25 10:32:48', NULL),
(135, 'Annotatsiooni katse kuum', '2020-06-25 10:33:22', NULL),
(136, 'Annotatsiooni nimi', '2020-06-25 10:35:22', NULL),
(137, 'Annotatsiooni nimed', '2020-06-25 10:40:50', NULL),
(138, 'Uued annotid', '2020-06-25 10:46:37', NULL),
(139, 'Uued annotid holala', '2020-06-25 10:50:51', NULL),
(140, 'Uued annotid holalaa', '2020-06-25 10:53:19', NULL),
(141, 'Uued annotid holalaaa', '2020-06-25 10:56:00', NULL),
(142, 'Noh annotatisoonid', '2020-06-25 12:43:11', NULL),
(143, 'Noh annotatisoonid väike katse', '2020-06-25 12:51:47', NULL),
(144, 'Viikingid', '2020-06-25 13:09:19', NULL),
(145, 'Viikingid magavad', '2020-06-25 22:05:23', NULL),
(146, 'swaggeri kaudu', '2020-06-26 08:07:37', NULL),
(147, 'Nüüd ilma sisselogimiseta', '2020-06-29 15:53:53', NULL),
(148, 'Oh jummel küll', '2021-02-11 22:16:51', NULL),
(149, 'Oh jummel küll', '2021-02-11 22:19:48', NULL),
(150, 'Nüüd peaks see hästi minema', '2021-02-11 23:31:39', NULL),
(151, 'On j\'älle aeg tsekata, kas jõuavad ka esimese alamad pärale', '2021-02-11 23:48:49', NULL),
(152, 'On j\'älle aeg tsekata, kas jõuavad ka esimese alamad pärale', '2021-02-12 00:12:47', NULL),
(153, 'Katsun nüüd õnne täisvormiga', '2021-02-12 00:22:08', NULL),
(154, 'Proovime nii, et kaks vormi on koos', '2021-02-12 12:36:32', NULL),
(155, NULL, '2021-02-12 15:13:58', NULL),
(156, NULL, '2021-02-12 17:47:43', NULL),
(157, NULL, '2021-02-12 18:01:36', NULL),
(158, NULL, '2021-02-12 18:02:29', NULL),
(159, 'Submission', '2021-02-12 18:50:44', NULL),
(160, 'Kui issi tahab saia, siis', '2021-02-12 20:30:02', NULL),
(161, 'Teine proov ka', '2021-02-13 07:06:22', NULL),
(162, 'Data 1', '2021-02-13 12:15:17', NULL),
(163, 'Ja siin on ka kõik korras', '2021-02-14 09:43:19', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `oneall_user`
--

CREATE TABLE `oneall_user` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_token` char(36) COLLATE utf8mb4_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `oneall_user`
--

INSERT INTO `oneall_user` (`id`, `user_id`, `user_token`) VALUES
(2, 1, 'd63f7344-ce41-4580-b8f4-5a835d00b405'),
(3, 1, 'fa8cad68-1dbe-4f66-b3b2-b52ba6872bfd'),
(5, 19, '783d9d96-01be-446c-93ba-f12ea762f4ad'),
(4, 22, 'af6409a8-958b-47cd-bea8-2c9ec488d740');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `password_reset_token`
--

CREATE TABLE `password_reset_token` (
  `id` bigint(20) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `privilege`
--

CREATE TABLE `privilege` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `privilege`
--

INSERT INTO `privilege` (`id`, `name`) VALUES
(1, 'READ_PRIVILEGE'),
(2, 'WRITE_PRIVILEGE'),
(3, 'CHANGE_PASSWORD_PRIVILEGE');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(4, 'ROLE_ADMIN'),
(5, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `roles_privileges`
--

CREATE TABLE `roles_privileges` (
  `role_id` bigint(20) NOT NULL,
  `privilege_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `roles_privileges`
--

INSERT INTO `roles_privileges` (`role_id`, `privilege_id`) VALUES
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 3);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_estonian_ci NOT NULL,
  `params` text COLLATE utf8mb4_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `tables`
--

INSERT INTO `tables` (`id`, `parent_id`, `name`, `params`) VALUES
(1, -1, 'uusTabel', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `three`
--

CREATE TABLE `three` (
  `id` int(11) NOT NULL,
  `two_id` int(11) DEFAULT -1,
  `title` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `three`
--

INSERT INTO `three` (`id`, `two_id`, `title`, `created`, `modified`) VALUES
(1, 1, 'the same thing as above checking ts', '2019-08-16 10:07:53', '2019-08-16 10:09:50'),
(5, 1, 'Adding one more third', '2019-08-19 00:07:45', '2019-08-28 17:22:52'),
(33, 20, 'kolm', '2019-08-21 17:57:09', NULL),
(34, 20, 'Alustan kolmest', '2019-08-21 18:00:13', '2019-08-29 01:17:56'),
(35, 20, 'alustan jÃ¤lle kolmest', '2019-08-21 18:06:31', '2019-08-29 01:18:36'),
(37, 19, 'jÃ¤lle kolmest', '2019-08-21 18:27:24', NULL),
(120, 102, 'first', '2019-08-29 00:07:12', NULL),
(121, 102, 'second', '2019-08-29 00:07:12', NULL),
(122, 103, 'One more three', '2019-08-29 11:36:11', '2019-08-29 12:02:30'),
(123, 102, 'New three with children', '2019-08-29 11:37:09', NULL),
(124, 104, 'Tried with session and so on', '2019-08-30 23:39:37', NULL),
(125, 105, 'TÃ¼tar vaatab neid mÃµttetuid filme. Mingi Barbie just sÃ¼nnitas', '2019-11-07 10:56:12', NULL),
(126, 107, 'Number three', '2019-11-14 21:13:44', NULL),
(127, 107, 'New three alone', '2019-11-14 21:13:44', NULL),
(128, 112, 'NÃ¼Ã¼d pean igaks juhuks kontrollima', '2019-11-26 01:30:46', NULL),
(129, 113, 'USA olnud solvunud', '2020-01-06 12:31:04', NULL),
(130, 113, 'siia ka Ã¼ks juurde', '2020-01-06 12:33:08', NULL),
(131, 116, 'Kolmas', '2020-06-15 00:04:13', NULL),
(132, 117, 'Kolmas tasand', '2020-06-15 00:10:41', NULL),
(133, 118, 'Kolmas tasand uus', '2020-06-15 00:20:19', NULL),
(134, 119, 'Kolmas tasand uus', '2020-06-15 00:24:28', NULL),
(135, 120, 'uus', '2020-06-15 00:41:00', NULL),
(136, 121, 'kolmas juurde', '2020-06-15 19:53:19', NULL),
(137, 122, 'kolmas juurde', '2020-06-15 20:07:25', NULL),
(138, 123, 'Kolm veel parem', '2020-06-15 20:08:36', NULL),
(139, 124, 'Ja siin tuleb kolmas', '2020-06-15 21:04:11', NULL),
(140, 125, 'Kui lisab, siis lisab', '2020-06-15 21:13:44', NULL),
(141, 126, 'Enne lisas', '2020-06-15 21:55:04', NULL),
(142, 127, 'Enne lisas ja nüüd lisab', '2020-06-15 21:57:01', NULL),
(143, 128, 'lisab', '2020-06-15 22:04:34', NULL),
(144, 129, 'lisab ka', '2020-06-15 22:09:04', NULL),
(145, 131, 'toas', '2020-06-15 22:18:45', NULL),
(146, 132, 'toas', '2020-06-15 22:39:37', NULL),
(147, 133, 'toas', '2020-06-15 22:49:39', NULL),
(148, 134, 'suveöö', '2020-06-15 23:48:52', NULL),
(149, 135, 'sellest htmlst', '2020-06-15 23:57:04', NULL),
(150, 136, 'kolmas tase', '2020-06-16 11:45:08', NULL),
(151, 137, 'palav on, tahaks merre', '2020-06-16 11:51:31', NULL),
(152, 138, 'sada muna', '2020-06-16 11:58:16', NULL),
(153, 139, 'sada muna', '2020-06-16 12:24:22', NULL),
(154, 140, 'Aken lahti', '2020-06-16 15:05:31', NULL),
(155, 141, 'Jänespilv', '2020-06-16 15:12:06', NULL),
(156, 142, 'Jänespilv valgus laiali', '2020-06-16 15:23:57', NULL),
(157, 143, 'mailee', '2020-06-16 15:44:02', NULL),
(158, 144, 'google mail', '2020-06-16 16:05:15', NULL),
(159, 145, 'mail ee', '2020-06-16 19:26:44', NULL),
(160, 146, 'mail.ee ei andnud midagi', '2020-06-16 19:33:53', NULL),
(161, 147, 'midagi', '2020-06-16 19:38:25', NULL),
(162, 148, 'midagi muud', '2020-06-16 20:33:32', NULL),
(163, 149, 'midagi muud vist polnud', '2020-06-16 20:46:55', NULL),
(164, 150, 'Kui vaja, siis pikendan', '2020-06-16 23:35:24', NULL),
(165, 153, 'kolmkolm', '2020-06-17 00:17:33', NULL),
(166, 163, 'värvuklutt', '2020-06-18 20:59:44', NULL),
(167, 164, 'värvuklutt magab', '2020-06-18 21:12:28', NULL),
(168, 168, 'mina olen mina', '2020-06-19 16:45:05', NULL),
(169, 169, 'mina olen', '2020-06-19 16:47:21', NULL),
(170, NULL, 'nüüd saab vist uue kolme kah lisada', '2020-06-19 16:52:56', NULL),
(173, 171, 'olen mina', '2020-06-19 17:49:36', NULL),
(174, 172, 'nüüd vist saab?', '2020-06-19 18:08:56', NULL),
(175, 174, 'kell kohe kohe kolm', '2020-06-24 23:55:02', NULL),
(176, 175, 'Nüüd peaks küll olema', '2020-06-25 00:36:50', NULL),
(177, 176, 'Siin peab tegelikult katse toimuma', '2020-06-25 08:55:34', NULL),
(178, 177, 'Siin peab tegelikult katse toimuma kaks', '2020-06-25 08:58:07', NULL),
(179, 178, 'Siin peab tegelikult katse toimuma kaks', '2020-06-25 10:32:48', NULL),
(180, 179, 'Jälle on see sama', '2020-06-25 10:33:22', NULL),
(181, 180, 'Kolmandat vaja', '2020-06-25 10:35:22', NULL),
(182, 181, 'Kolmandat vaja mitmes kord', '2020-06-25 10:40:50', NULL),
(183, 182, 'Kolmandat ikka vaja', '2020-06-25 10:46:37', NULL),
(184, 183, 'Kolmandat holala', '2020-06-25 10:50:51', NULL),
(185, 184, 'Kolmandat holalaa', '2020-06-25 10:53:19', NULL),
(186, 185, 'Kolmandat holalaaa', '2020-06-25 10:56:00', NULL),
(187, 186, 'Meil on siin palav', '2020-06-25 12:43:11', NULL),
(188, 187, 'Meil on siin palav katsetades', '2020-06-25 12:51:47', NULL),
(189, 188, 'Sauna moodi korter', '2020-06-25 13:09:19', NULL),
(190, 189, 'Sauna moodi korter magab', '2020-06-25 22:05:23', NULL),
(191, 190, 'mina kirjutan', '2020-06-26 08:07:37', NULL),
(192, NULL, 'kolmas on parent', '2020-06-26 08:12:39', NULL),
(193, 192, 'Piisavalt palju', '2021-02-12 00:12:47', NULL),
(194, 193, 'Et veenduda', '2021-02-12 00:22:08', NULL),
(195, 194, 'Kolmas sia', '2021-02-12 12:36:32', NULL),
(196, 195, 'teeb piruka', '2021-02-12 20:30:02', NULL),
(197, 197, 'Data 3', '2021-02-13 12:15:17', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `two`
--

CREATE TABLE `two` (
  `id` int(11) NOT NULL,
  `one_id` int(11) DEFAULT -1,
  `title` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `two`
--

INSERT INTO `two` (`id`, `one_id`, `title`, `created`, `modified`) VALUES
(1, 1, '1st row to joined data seems to be ok edit', '2020-05-31 21:44:22', '2020-06-14 21:44:34'),
(19, 3, 'Alustan otsast ja muudan', '2020-06-01 21:44:40', '2020-06-14 21:44:44'),
(20, 3, 'Alustan jÃ¤lle ja muudan ka', '2020-04-01 21:44:34', '2020-06-14 21:45:12'),
(102, 31, 'with 2 three lines', '2019-08-29 00:07:12', '2019-08-29 00:19:29'),
(103, 31, 'Making it more complex', '2019-08-29 12:01:20', NULL),
(104, 33, 'I looked whole day for such solution', '2019-08-30 23:39:37', NULL),
(105, 34, 'Telekast tulevad mÃµttetud filmid', '2019-11-07 10:56:12', NULL),
(106, 35, 'The second', '2019-11-14 21:13:44', NULL),
(107, 35, 'Second second', '2019-11-14 21:13:44', NULL),
(108, NULL, 'deedf', '2019-11-16 00:36:19', '2020-06-14 17:25:23'),
(109, 35, 'sec ces', '2019-11-16 00:36:54', '2020-06-14 17:25:40'),
(110, 42, 'Checking it with this second level', '2019-11-16 22:44:26', NULL),
(111, 43, 'Asi selles, et vaatan kogu asja esimest korda lÃ¤bi Visual Studio Code', '2019-11-26 01:30:46', NULL),
(112, 43, 'Ja seesinane asjandus leidis vigu', '2019-11-26 01:30:46', NULL),
(113, 44, 'Euroopa olnud leige USA tegemiste suhtes', '2020-01-06 12:31:04', '2020-01-06 12:33:08'),
(114, 44, 'Lisan juurde', '2020-01-06 12:33:08', NULL),
(115, NULL, 'Eraldi sisestada pole ju viga vist', '2020-06-14 21:55:21', NULL),
(116, 80, 'Siin hakkab teine tasand pihta', '2020-06-15 00:04:13', NULL),
(117, 81, 'Siin hakkab teine tasand jälle pihta', '2020-06-15 00:10:41', NULL),
(118, 82, 'teine tasand jälle pihta', '2020-06-15 00:20:19', NULL),
(119, 83, 'teine tasand jälle pihta', '2020-06-15 00:24:28', NULL),
(120, 84, 'teine tjälle pihta', '2020-06-15 00:41:00', NULL),
(121, NULL, 'ja see on teises kontrolleris', '2020-06-15 19:53:19', NULL),
(122, 86, 'ja see on teises kontrolleris', '2020-06-15 20:07:25', NULL),
(123, 87, 'Kaks on parem', '2020-06-15 20:08:36', NULL),
(124, 89, 'See on teine level', '2020-06-15 21:04:11', NULL),
(125, 90, 'panin tagastamismeetodiks void', '2020-06-15 21:13:44', NULL),
(126, 91, 'panin tagastamismeetodiks stringi', '2020-06-15 21:55:04', NULL),
(127, 92, 'stringi ühedasin nüüd tühikuga', '2020-06-15 21:57:01', NULL),
(128, 93, 'stringi ühedasin nüüd * ', '2020-06-15 22:04:34', NULL),
(129, 94, 'stringi ühedasin nüüd * ja proovin muudki', '2020-06-15 22:09:04', NULL),
(130, 94, 'Huvi pärast panen lihtsalt selle rea ka juurde', '2020-06-15 22:09:04', NULL),
(131, 95, 'Palav on', '2020-06-15 22:18:45', NULL),
(132, 96, 'Palav on', '2020-06-15 22:39:37', NULL),
(133, 97, 'Palav on', '2020-06-15 22:49:39', NULL),
(134, 98, 'suursääsk', '2020-06-15 23:48:52', NULL),
(135, 99, 'et ma eemaldasin midagi', '2020-06-15 23:57:04', NULL),
(136, 100, 'teine tase', '2020-06-16 11:45:08', NULL),
(137, 101, 'Tegin nii, et see näitaks', '2020-06-16 11:51:31', NULL),
(138, 102, 'saatana silmamuna', '2020-06-16 11:58:16', NULL),
(139, 103, 'saatana silmamuna', '2020-06-16 12:24:22', NULL),
(140, 104, 'Soojus', '2020-06-16 15:05:31', NULL),
(141, 105, 'Õunarüüp', '2020-06-16 15:12:06', NULL),
(142, 107, 'Õunarüüp tegutseb', '2020-06-16 15:23:57', NULL),
(143, 108, 'multikas', '2020-06-16 15:44:02', NULL),
(144, 109, 'Ja televiisoris Mina ja Mia', '2020-06-16 16:05:15', NULL),
(145, 110, 'Televiisor on kinni', '2020-06-16 19:26:44', NULL),
(146, 111, 'Lähevad magama', '2020-06-16 19:33:53', NULL),
(147, 112, 'Loevad raamatut ja jäävad magama', '2020-06-16 19:38:25', NULL),
(148, 113, 'Jsonignore oli vales kohas', '2020-06-16 20:33:32', NULL),
(149, 114, 'Nagu öeldud, jsonignore oli vales kohas', '2020-06-16 20:46:55', NULL),
(150, 115, 'Ahelas', '2020-06-16 23:35:24', NULL),
(152, NULL, NULL, '2020-06-16 23:44:42', NULL),
(153, NULL, 'kakaskkss', '2020-06-17 00:17:33', NULL),
(154, NULL, NULL, '2020-06-17 00:24:20', NULL),
(155, NULL, 'Miks see ei salvestunud', '2020-06-17 00:30:24', '2020-06-17 00:33:04'),
(156, NULL, 'tere', '2020-06-17 21:56:56', NULL),
(157, NULL, 'tere ise kah', '2020-06-17 22:05:57', NULL),
(158, NULL, 'tere ise juba jälle', '2020-06-17 22:34:58', NULL),
(159, NULL, 'tere ise juba jälle sina', '2020-06-17 22:43:28', NULL),
(160, NULL, 'pole ammu näinud', '2020-06-17 22:48:23', NULL),
(161, NULL, 'tere', '2020-06-17 22:56:15', NULL),
(162, 117, 'tere sinagi', '2020-06-17 23:04:07', NULL),
(163, 118, 'tahab', '2020-06-18 20:59:44', NULL),
(164, 119, 'soe öö', '2020-06-18 21:12:28', NULL),
(165, 122, 'šokolaad', '2020-06-19 16:08:58', NULL),
(166, 123, 'piimaga', '2020-06-19 16:14:34', NULL),
(167, 124, 'kala', '2020-06-19 16:34:11', NULL),
(168, NULL, 'tere', '2020-06-19 16:45:05', NULL),
(169, 125, 'tere kui tahad', '2020-06-19 16:47:21', NULL),
(171, 126, 'tere talv', '2020-06-19 17:49:36', NULL),
(172, NULL, 'Katseline sisestus hoopistükis mujalt', '2020-06-19 18:08:56', NULL),
(173, 127, 'ja teine helikopter', '2020-06-22 10:18:07', NULL),
(174, 130, 'kajakad vaid', '2020-06-24 23:55:02', NULL),
(175, NULL, 'Tõstsin jupikese koodi teise kohta', '2020-06-25 00:36:50', NULL),
(176, NULL, 'Paneme selle vahele', '2020-06-25 08:55:34', NULL),
(177, NULL, 'Paneme selle vahele kaks', '2020-06-25 08:58:07', NULL),
(178, NULL, 'Paneme selle vahele kaks', '2020-06-25 10:32:48', NULL),
(179, NULL, 'Jälle vahele', '2020-06-25 10:33:22', NULL),
(180, NULL, 'Jälle vahele teine', '2020-06-25 10:35:22', NULL),
(181, NULL, 'Jälle vahele teine teine', '2020-06-25 10:40:50', NULL),
(182, NULL, 'Ei saa me läbi teiseta', '2020-06-25 10:46:37', NULL),
(183, NULL, 'Ei saa me läbi holala', '2020-06-25 10:50:51', NULL),
(184, NULL, 'Ei saa me läbi holalaa', '2020-06-25 10:53:19', NULL),
(185, NULL, 'Ei saa me läbi holalaaa', '2020-06-25 10:56:00', NULL),
(186, NULL, 'Kuidas elate', '2020-06-25 12:43:11', NULL),
(187, NULL, 'Kuidas elate katsetades', '2020-06-25 12:51:47', NULL),
(188, NULL, 'Marjade sõda', '2020-06-25 13:09:19', NULL),
(189, NULL, 'Marjade sõda magab', '2020-06-25 22:05:23', NULL),
(190, NULL, 'põnts pildistab', '2020-06-26 08:07:37', NULL),
(191, 151, 'Aitab seegi kord vast kolmest', '2021-02-11 23:48:49', NULL),
(192, 152, 'Aitab seegi kord vast kolmest', '2021-02-12 00:12:47', NULL),
(193, 153, 'Seekord kõik viis taset', '2021-02-12 00:22:08', NULL),
(194, 154, 'Teine tiitel siia', '2021-02-12 12:36:32', NULL),
(195, 160, 'võtab', '2021-02-12 20:30:02', NULL),
(196, 161, 'TEine proov', '2021-02-13 07:06:22', NULL),
(197, 162, 'Data 2', '2021-02-13 12:15:17', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_estonian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_estonian_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_estonian_ci NOT NULL,
  `password` text COLLATE utf8mb4_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`) VALUES
(1, '', 'test@test.com', '', 'Mellon'),
(2, 'Jaanus Nurmoja', 'jaanus.nurmoja@gmail.com', '', ''),
(19, 'Jaanus Nurmoja', '', '', ''),
(20, 'Kaia Tambi', 'pollakoer@gmail.com', '', ''),
(22, 'Jaanus Nurmoja', 'jaanus.nurmoja@outlook.com', '', '');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(7, 5),
(6, 4);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `user_account`
--

CREATE TABLE `user_account` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `is_using2fa` bit(1) NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

--
-- Andmete tõmmistamine tabelile `user_account`
--

INSERT INTO `user_account` (`id`, `email`, `enabled`, `first_name`, `is_using2fa`, `last_name`, `password`, `secret`) VALUES
(6, 'test@test.com', b'1', 'Test', b'0', 'Test', '$2a$11$tJp10ETrZkYlnizej/kFJOfLtn77yM0gh67buPmyIDblFPkdpGxLS', 'HL65OJO53EGQUVCR'),
(7, 'pohisissetulek.eesti@gmail.com', b'0', 'Baaselatis', b'0', 'Eestisse', '$2a$11$F.1a42Q0IkK1QBWwjU0CWO63CCEoouPMrrGV0SA.U5MsuNQxZKKni', 'QUWFGM3BGR6NKKRI');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `user_location`
--

CREATE TABLE `user_location` (
  `id` bigint(20) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `verification_token`
--

CREATE TABLE `verification_token` (
  `id` bigint(20) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_estonian_ci DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_estonian_ci;

-- --------------------------------------------------------

--
-- Vaate struktuur `getids`
--
DROP TABLE IF EXISTS `getids`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getids`  AS  select group_concat(distinct `main_data`.`id` separator ',') AS `mainId`,count(`main_data`.`id`) AS `main`,group_concat(distinct ifnull(`location`.`id`,'') separator ',') AS `locationId`,count(`location`.`id`) AS `location`,group_concat(distinct ifnull(`grouped_entry`.`id`,'') separator ',') AS `groupedId`,count(`grouped_entry`.`id`) AS `grouped_entry`,group_concat(distinct ifnull(`collection`.`id`,'') separator ',') AS `collectionId`,count(`collection`.`id`) AS `collection`,group_concat(distinct ifnull(concat_ws(':',`items`.`collection_id`,`items`.`id`),'') separator ',') AS `itemsId`,count(`items`.`id`) AS `items` from ((((`main_data` left join `location` on(`location`.`main_id` = `main_data`.`id`)) left join `grouped_entry` on(`grouped_entry`.`main_id` = `main_data`.`id`)) left join `collection` on(`collection`.`main_id` = `main_data`.`id`)) left join `items` on(`items`.`collection_id` = `collection`.`id`)) group by `main_data`.`id` ;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `blog_content_order_by`
--
ALTER TABLE `blog_content_order_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkbkgf85mbb4618lcqmgc6ao2t` (`blog_post_id`);

--
-- Indeksid tabelile `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `blog_post_paragraph`
--
ALTER TABLE `blog_post_paragraph`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post` (`blog_post_id`),
  ADD KEY `FkBlogContentOrder` (`blog_content_order_by_id`),
  ADD KEY `FKhxt57yvsd8hdv5wx7yurfj1b` (`blog_post_sub_part_id`);

--
-- Indeksid tabelile `blog_post_sub_part`
--
ALTER TABLE `blog_post_sub_part`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post` (`blog_post_id`),
  ADD KEY `blogContentOrder` (`blog_content_order_by_id`);

--
-- Indeksid tabelile `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main` (`main_id`);

--
-- Indeksid tabelile `device_metadata`
--
ALTER TABLE `device_metadata`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `experimental`
--
ALTER TABLE `experimental`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables` (`tables_id`);

--
-- Indeksid tabelile `five`
--
ALTER TABLE `five`
  ADD PRIMARY KEY (`id`),
  ADD KEY `four` (`four_id`) USING BTREE;

--
-- Indeksid tabelile `four`
--
ALTER TABLE `four`
  ADD PRIMARY KEY (`id`),
  ADD KEY `three` (`three_id`) USING BTREE;

--
-- Indeksid tabelile `grouped_entry`
--
ALTER TABLE `grouped_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main` (`main_id`);

--
-- Indeksid tabelile `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collection` (`collection_id`);

--
-- Indeksid tabelile `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main` (`main_id`);

--
-- Indeksid tabelile `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `main_data`
--
ALTER TABLE `main_data`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `new_location_token`
--
ALTER TABLE `new_location_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt4d61xu4ompo2fy5upb033mwm` (`user_location_id`);

--
-- Indeksid tabelile `one`
--
ALTER TABLE `one`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `oneall_user`
--
ALTER TABLE `oneall_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_token` (`user_id`,`user_token`) USING BTREE;

--
-- Indeksid tabelile `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKns9q9f0f318uaoxiqn6lka9ux` (`user_id`);

--
-- Indeksid tabelile `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `roles_privileges`
--
ALTER TABLE `roles_privileges`
  ADD KEY `FK5yjwxw2gvfyu76j3rgqwo685u` (`privilege_id`),
  ADD KEY `FK9h2vewsqh8luhfq71xokh4who` (`role_id`);

--
-- Indeksid tabelile `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables` (`parent_id`);

--
-- Indeksid tabelile `three`
--
ALTER TABLE `three`
  ADD PRIMARY KEY (`id`),
  ADD KEY `two` (`two_id`) USING BTREE;

--
-- Indeksid tabelile `two`
--
ALTER TABLE `two`
  ADD PRIMARY KEY (`id`),
  ADD KEY `one` (`one_id`);

--
-- Indeksid tabelile `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userdata` (`name`,`email`);

--
-- Indeksid tabelile `users_roles`
--
ALTER TABLE `users_roles`
  ADD KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  ADD KEY `FKci4mdvg1fmo9eqmwno1y9o0fa` (`user_id`);

--
-- Indeksid tabelile `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`id`);

--
-- Indeksid tabelile `user_location`
--
ALTER TABLE `user_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKewiig159t5fn9jt50sra34adr` (`user_id`);

--
-- Indeksid tabelile `verification_token`
--
ALTER TABLE `verification_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_VERIFY_USER` (`user_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `blog_content_order_by`
--
ALTER TABLE `blog_content_order_by`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `blog_post_paragraph`
--
ALTER TABLE `blog_post_paragraph`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT tabelile `experimental`
--
ALTER TABLE `experimental`
  MODIFY `id` int(15) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `five`
--
ALTER TABLE `five`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT tabelile `four`
--
ALTER TABLE `four`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT tabelile `grouped_entry`
--
ALTER TABLE `grouped_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT tabelile `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT tabelile `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT tabelile `main`
--
ALTER TABLE `main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `main_data`
--
ALTER TABLE `main_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT tabelile `one`
--
ALTER TABLE `one`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT tabelile `oneall_user`
--
ALTER TABLE `oneall_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT tabelile `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `three`
--
ALTER TABLE `three`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT tabelile `two`
--
ALTER TABLE `two`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT tabelile `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `blog_content_order_by`
--
ALTER TABLE `blog_content_order_by`
  ADD CONSTRAINT `FKkbkgf85mbb4618lcqmgc6ao2t` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`);

--
-- Piirangud tabelile `blog_post_paragraph`
--
ALTER TABLE `blog_post_paragraph`
  ADD CONSTRAINT `FK4j811b9mr0k2aj1fh6fqo6w9c` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`),
  ADD CONSTRAINT `FKhxt57yvsd8hdv5wx7yurfj1b` FOREIGN KEY (`blog_post_sub_part_id`) REFERENCES `blog_post_sub_part` (`id`),
  ADD CONSTRAINT `FKnrum44508pi67m0b4eor8naps` FOREIGN KEY (`blog_content_order_by_id`) REFERENCES `blog_content_order_by` (`id`);

--
-- Piirangud tabelile `blog_post_sub_part`
--
ALTER TABLE `blog_post_sub_part`
  ADD CONSTRAINT `FK4fe6xn44784wybxh2xhph2v80` FOREIGN KEY (`blog_content_order_by_id`) REFERENCES `blog_content_order_by` (`id`),
  ADD CONSTRAINT `FKfn7sdbua1mc647ir58x9xpo63` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_post` (`id`);

--
-- Piirangud tabelile `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `FKdnk3vl3ho1s0eb94vy3272wxs` FOREIGN KEY (`main_id`) REFERENCES `main_data` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Piirangud tabelile `five`
--
ALTER TABLE `five`
  ADD CONSTRAINT `FKcdn309aq5b2yxhhrtdqvps853` FOREIGN KEY (`four_id`) REFERENCES `four` (`id`);

--
-- Piirangud tabelile `four`
--
ALTER TABLE `four`
  ADD CONSTRAINT `FK9jwuc35p92p7occ8cmhbe1v5v` FOREIGN KEY (`three_id`) REFERENCES `three` (`id`);

--
-- Piirangud tabelile `grouped_entry`
--
ALTER TABLE `grouped_entry`
  ADD CONSTRAINT `FKdls7netera1500x85rjmyi12r` FOREIGN KEY (`main_id`) REFERENCES `main_data` (`id`);

--
-- Piirangud tabelile `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `FKllod9leg66f3thvf4l73qqwsn` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`);

--
-- Piirangud tabelile `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `FK1p66q5ocepog0njpy6jtv59yq` FOREIGN KEY (`main_id`) REFERENCES `main_data` (`id`);

--
-- Piirangud tabelile `new_location_token`
--
ALTER TABLE `new_location_token`
  ADD CONSTRAINT `FKt4d61xu4ompo2fy5upb033mwm` FOREIGN KEY (`user_location_id`) REFERENCES `user_location` (`id`);

--
-- Piirangud tabelile `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD CONSTRAINT `FKns9q9f0f318uaoxiqn6lka9ux` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`id`);

--
-- Piirangud tabelile `roles_privileges`
--
ALTER TABLE `roles_privileges`
  ADD CONSTRAINT `FK5yjwxw2gvfyu76j3rgqwo685u` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`),
  ADD CONSTRAINT `FK9h2vewsqh8luhfq71xokh4who` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Piirangud tabelile `three`
--
ALTER TABLE `three`
  ADD CONSTRAINT `FKpfnkt94dxbxvea7xlb5an3ep5` FOREIGN KEY (`two_id`) REFERENCES `two` (`id`);

--
-- Piirangud tabelile `two`
--
ALTER TABLE `two`
  ADD CONSTRAINT `FKtr1ui40a13ej8cdmsge1xrq4a` FOREIGN KEY (`one_id`) REFERENCES `one` (`id`);

--
-- Piirangud tabelile `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FKci4mdvg1fmo9eqmwno1y9o0fa` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`id`),
  ADD CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Piirangud tabelile `user_location`
--
ALTER TABLE `user_location`
  ADD CONSTRAINT `FKewiig159t5fn9jt50sra34adr` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`id`);

--
-- Piirangud tabelile `verification_token`
--
ALTER TABLE `verification_token`
  ADD CONSTRAINT `FK_VERIFY_USER` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

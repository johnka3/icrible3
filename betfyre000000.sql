-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 03-Jan-2024 às 19:33
-- Versão do servidor: 10.5.19-MariaDB-cll-lve
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `betfyre`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `email` text NOT NULL,
  `contato` text DEFAULT NULL,
  `senha` text NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `token_recover` text DEFAULT NULL,
  `avatar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `admin_users`
--

INSERT INTO `admin_users` (`id`, `nome`, `email`, `contato`, `senha`, `nivel`, `status`, `token_recover`, `avatar`) VALUES
(1, 'mscodex', 'mxv@gmail.com', '(84) 99624-9982', '$2y$10$f2krWUPTulSkQSHmzslw0.eIzaksYRFEmB1dfqzEyBpRUPRP7Qpbq', 1, 1, NULL, 'avatar-131677188367.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `afiliados_config`
--

CREATE TABLE `afiliados_config` (
  `id` int(11) NOT NULL,
  `cpaLvl1` decimal(10,2) DEFAULT NULL,
  `cpaLvl2` decimal(10,2) DEFAULT NULL,
  `cpaLvl3` decimal(10,2) DEFAULT NULL,
  `chanceCpa` decimal(5,2) DEFAULT NULL,
  `revShareFalso` decimal(5,2) DEFAULT NULL,
  `revShareLvl1` decimal(5,2) DEFAULT NULL,
  `revShareLvl2` decimal(5,2) DEFAULT NULL,
  `revShareLvl3` decimal(5,2) DEFAULT NULL,
  `minDepForCpa` decimal(10,2) DEFAULT NULL,
  `minResgate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `afiliados_config`
--

INSERT INTO `afiliados_config` (`id`, `cpaLvl1`, `cpaLvl2`, `cpaLvl3`, `chanceCpa`, `revShareFalso`, `revShareLvl1`, `revShareLvl2`, `revShareLvl3`, `minDepForCpa`, `minResgate`) VALUES
(1, '25.00', '5.00', '2.00', '0.00', '0.00', '1.00', '0.75', '0.25', '50.00', '50.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `img` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `banner`
--

INSERT INTO `banner` (`id`, `titulo`, `criado_em`, `img`, `status`) VALUES
(37, 'mxvbet', '2023-12-17 03:53:52', 'slider-184577797759.png', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `nome_site` text DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `telegram` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `whatsapp` text DEFAULT NULL,
  `suporte` text DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sublogo` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `rodapelogo` text DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `googleAnalytics` text DEFAULT NULL,
  `minplay` int(11) DEFAULT NULL,
  `minsaque` double DEFAULT NULL,
  `mindep` int(11) NOT NULL DEFAULT 1,
  `cor_padrao` varchar(45) NOT NULL,
  `custom_css` longtext NOT NULL,
  `texto` varchar(45) NOT NULL,
  `img_seo` text DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `status_topheader` int(11) NOT NULL DEFAULT 0,
  `cor_topheader` varchar(48) DEFAULT '#ed1c24'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `config`
--

INSERT INTO `config` (`id`, `nome`, `nome_site`, `descricao`, `logo`, `telegram`, `instagram`, `whatsapp`, `suporte`, `email`, `sublogo`, `facebook`, `rodapelogo`, `favicon`, `googleAnalytics`, `minplay`, `minsaque`, `mindep`, `cor_padrao`, `custom_css`, `texto`, `img_seo`, `keyword`, `status_topheader`, `cor_topheader`) VALUES
(1, 'MXVBET', 'MXVBET - Sua Bet Favorita', 'MXVBET - Sua Bet Favorita', '158982718158.png', '', '', '', NULL, '', '', '', NULL, '247756639346.png', '', 1, 30, 10, '#a70202', '', '', '128341974185.png', 'cassino,afiliados,pix,slots', 1, '#a70202');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom`
--

CREATE TABLE `cupom` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1 COMMENT '1: recarga / 2:saldo',
  `valor` int(11) NOT NULL,
  `qtd` int(11) NOT NULL DEFAULT 0,
  `qtd_insert` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom_usados`
--

CREATE TABLE `cupom_usados` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_cupom` int(11) NOT NULL,
  `valor` int(11) NOT NULL DEFAULT 0,
  `data_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `double`
--

CREATE TABLE `double` (
  `id` int(11) NOT NULL,
  `winner_color` varchar(255) DEFAULT NULL,
  `winner_number` int(11) NOT NULL DEFAULT 0,
  `pot` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(255) DEFAULT NULL,
  `profit` varchar(255) DEFAULT NULL,
  `ranked` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `double`
--

INSERT INTO `double` (`id`, `winner_color`, `winner_number`, `pot`, `status`, `hash`, `profit`, `ranked`, `updated_at`, `created_at`) VALUES
(1, NULL, 0, 1.00, 1, 'f42b867443b3e4c901512c678e132731', NULL, 0, '2023-10-10 09:23:49', '2023-10-09 16:31:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ezzebank`
--

CREATE TABLE `ezzebank` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `client_id` text DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `atualizado` varchar(45) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `ezzebank`
--

INSERT INTO `ezzebank` (`id`, `url`, `client_id`, `client_secret`, `atualizado`, `ativo`) VALUES
(0, '', '', '', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `financeiro`
--

CREATE TABLE `financeiro` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `saldo_afiliados` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fiverscan`
--

CREATE TABLE `fiverscan` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `agent_code` text DEFAULT NULL,
  `agent_token` text DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `fiverscan`
--

INSERT INTO `fiverscan` (`id`, `url`, `agent_code`, `agent_token`, `ativo`) VALUES
(1, 'https://api.fiverscan.com', '...', '...', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `game_code` text NOT NULL,
  `game_name` text NOT NULL,
  `banner` text NOT NULL,
  `status` int(11) NOT NULL,
  `provider` text DEFAULT NULL,
  `popular` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `games`
--

INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`) VALUES
(2691, '67', 'Golden eggs', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/67_EN.png', 1, 'CQ9', 0),
(2692, '161', 'Hercules', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/161_EN.png', 1, 'CQ9', 0),
(2693, '16', 'Super 5', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/16_EN.png', 1, 'CQ9', 0),
(2694, '72', 'Happy Rich Year', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/72_EN.png', 1, 'CQ9', 0),
(2695, '1', 'Fruit King', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/1_EN.png', 1, 'CQ9', 0),
(2696, '163', 'Neja Advent', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/163_EN.png', 1, 'CQ9', 0),
(2697, '26', '777', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/26_EN.png', 1, 'CQ9', 0),
(2698, '50', 'Good fortune', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/50_EN.png', 1, 'CQ9', 0),
(2699, '31', 'God of war', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/31_EN.png', 1, 'CQ9', 0),
(2700, '64', 'Zeus', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/64_EN.png', 1, 'CQ9', 0),
(2701, '69', 'Pasaycen', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/69_EN.png', 1, 'CQ9', 0),
(2702, '89', 'Thor', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/89_EN.png', 1, 'CQ9', 0),
(2703, '46', 'Wolf moon', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/46_EN.png', 1, 'CQ9', 0),
(2704, '139', 'Fire chibi', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/139_EN.png', 1, 'CQ9', 0),
(2705, '15', 'Gu Gu Gu', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/15_EN.png', 1, 'CQ9', 0),
(2706, '140', 'Fire Chibi 2', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/140_EN.png', 1, 'CQ9', 0),
(2707, '8', 'So Sweet', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/8_EN.png', 1, 'CQ9', 0),
(2708, '147', 'Flower fortune', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/147_EN.png', 1, 'CQ9', 0),
(2709, '113', 'Flying Kai Shen', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/113_EN.png', 1, 'CQ9', 0),
(2710, '58', 'Gu Gu Gu 2', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/58_EN.png', 1, 'CQ9', 0),
(2711, '128', 'Wheel money', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/128_EN.png', 1, 'CQ9', 0),
(2712, '5', 'Mr Rich', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/5_EN.png', 1, 'CQ9', 0),
(2713, '180', 'Gu Gu Gu 3', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/9835.png', 1, 'CQ9', 0),
(2714, '118', 'SkullSkull', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/118_EN.png', 1, 'CQ9', 0),
(2715, '148', 'Fortune totem', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/148_EN.png', 1, 'CQ9', 0),
(2716, '144', 'Diamond treasure', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/144_EN.png', 1, 'CQ9', 0),
(2717, '19', 'Hot spin', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/19_EN.png', 1, 'CQ9', 0),
(2718, '112', 'Pyramid radar', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/112_EN.png', 1, 'CQ9', 0),
(2719, '160', 'Pa Kai Shen2', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/160_EN.png', 1, 'CQ9', 0),
(2720, '132', 'Miou', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/132_EN.png', 1, 'CQ9', 0),
(2721, '47', 'Pharaoh gold', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/47_EN.png', 1, 'CQ9', 0),
(2722, '13', 'Sakura legend', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/13_EN.png', 1, 'CQ9', 0),
(2723, '34', 'Gopher\'s War', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/34_EN.png', 1, 'CQ9', 0),
(2724, '59', 'Summer mood', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/59_EN.png', 1, 'CQ9', 0),
(2725, '76', 'Won won won', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/76_EN.png', 1, 'CQ9', 0),
(2726, '95', 'Football boots', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/95_EN.png', 1, 'CQ9', 0),
(2727, '57', 'The Beast War', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/57_EN.png', 1, 'CQ9', 0),
(2728, '17', 'Great lion', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/17_EN.png', 1, 'CQ9', 0),
(2729, '20', '888', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/20_EN.png', 1, 'CQ9', 0),
(2730, '182', 'Thor 2', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/10044.png', 1, 'CQ9', 0),
(2731, '66', 'Fire 777', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/66_EN.png', 1, 'CQ9', 0),
(2732, '2', 'God of Chess', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/2_EN.png', 1, 'CQ9', 0),
(2733, '21', 'Big wolf', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/21_EN.png', 1, 'CQ9', 0),
(2734, '197', 'Dragon\'s Treasure', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11502.png', 1, 'CQ9', 0),
(2735, '208', 'Money tree', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11593.png', 1, 'CQ9', 0),
(2736, '212', 'Burning Si-Yow', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11805.png', 1, 'CQ9', 0),
(2737, '214', 'Ninja raccoon', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11806.png', 1, 'CQ9', 0),
(2738, '218', 'Dollar night', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/12141.png', 1, 'CQ9', 0),
(2739, '01rb77cq1gtenhmo', 'Auto-Roulette VIP', 'https://evolution.bet4wins.net/assets/banner/auto_roulette_vip.webp', 1, 'EVOLUTION', 0),
(2740, 'qgqrucipvltnvnvq', 'Speed Baccarat W', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratw.webp', 1, 'EVOLUTION', 0),
(2741, 'DragonTiger00001', 'Dragon Tiger', 'https://evolution.bet4wins.net/assets/banner/dragon_tiger.webp', 1, 'EVOLUTION', 0),
(2742, 'NoCommBac0000001', 'No Commission Baccarat', 'https://evolution.bet4wins.net/assets/banner/super_six.webp', 1, 'EVOLUTION', 0),
(2743, 'PTBaccarat000001', 'Prosperity Tree Baccarat', 'https://evolution.bet4wins.net/assets/banner/ProsperityTreeBaccarat.webp', 1, 'EVOLUTION', 0),
(2744, 'LightningTable01', 'Lightning Roulette', 'https://mxvbet.xyz/uploads/game-236561573144.webp', 1, 'EVOLUTION', 0),
(2745, 'ndgvz5mlhfuaad6e', 'Speed Baccarat D', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratd.webp', 1, 'EVOLUTION', 0),
(2746, 'obj64qcnqfunjelj', 'Speed Baccarat J', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratj.webp', 1, 'EVOLUTION', 0),
(2747, 'qgqrv4asvltnvuty', 'Speed Baccarat X', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratx.webp', 1, 'EVOLUTION', 0),
(2748, '48z5pjps3ntvqc1b', 'Auto-Roulette', 'https://evolution.bet4wins.net/assets/banner/auto_la_partage.webp', 1, 'EVOLUTION', 0),
(2749, 'RedDoorRoulette1', 'Red Door Roulette', 'https://evolution.bet4wins.net/assets/banner/RedDoorRoulette.webp', 1, 'EVOLUTION', 0),
(2750, 'nmwde3fd7hvqhq43', 'Speed Baccarat F', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratf.webp', 1, 'EVOLUTION', 0),
(2751, 'ocye2ju2bsoyq6vv', 'Speed Baccarat K', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratk.webp', 1, 'EVOLUTION', 0),
(2752, 'ovu5eja74ccmyoiq', 'Speed Baccarat N', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratn.webp', 1, 'EVOLUTION', 0),
(2753, 'EmperorSB0000001', 'Emperor Sic Bo', 'https://evolution.bet4wins.net/assets/banner/EmperorSicBo.webp', 1, 'EVOLUTION', 0),
(2754, 'CrazyTime0000002', 'Crazy Time A', 'https://evolution.bet4wins.net/assets/banner/crazytimea.webp', 1, 'EVOLUTION', 0),
(2755, 'SBCTable00000001', 'Side Bet City', 'https://evolution.bet4wins.net/assets/banner/sidebetcity.webp', 1, 'EVOLUTION', 0),
(2756, 'nmwdzhbg7hvqh6a7', 'Speed Baccarat G', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratg.webp', 1, 'EVOLUTION', 0),
(2757, 'AmericanTable001', 'American Roulette', 'https://evolution.bet4wins.net/assets/banner/americanroulette.webp', 1, 'EVOLUTION', 0),
(2758, 'pv5q45yjhasyt46y', 'Emperor Roulette', 'https://evolution.bet4wins.net/assets/banner/EmperorRoulette.webp', 1, 'EVOLUTION', 0),
(2759, 'ndgv45bghfuaaebf', 'Speed Baccarat E', 'https://evolution.bet4wins.net/assets/banner/speed_baccarate.webp', 1, 'EVOLUTION', 0),
(2760, '7x0b1tgh7agmf6hv', 'Immersive Roulette', 'https://evolution.bet4wins.net/assets/banner/immersive_roulette.webp', 1, 'EVOLUTION', 0),
(2761, 'ovu5h6b3ujb4y53w', 'No Commission Speed Baccarat C', 'https://evolution.bet4wins.net/assets/banner/nocomm_speed_baccaratc.webp', 1, 'EVOLUTION', 0),
(2762, 'qsf63ownyvbqnz33', 'Speed Baccarat Z', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratz.webp', 1, 'EVOLUTION', 0),
(2763, 'ndgvwvgthfuaad3q', 'Speed Baccarat C', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratc.webp', 1, 'EVOLUTION', 0),
(2764, 'qgqrhfvsvltnueqf', 'Speed Baccarat U', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratu.webp', 1, 'EVOLUTION', 0),
(2765, 'CSPTable00000001', 'Caribbean Stud Poker', 'https://evolution.bet4wins.net/assets/banner/stud_poker.webp', 1, 'EVOLUTION', 0),
(2766, 'n4jwxsz2x4tqitvx', 'Japanese Roulette', 'https://evolution.bet4wins.net/assets/banner/japanese_roulette.webp', 1, 'EVOLUTION', 0),
(2767, 'f1f4rm9xgh4j3u2z', 'Auto-Roulette La Partage', 'https://evolution.bet4wins.net/assets/banner/auto_roulette.webp', 1, 'EVOLUTION', 0),
(2768, 'leqhceumaq6qfoug', 'Speed Baccarat A', 'https://evolution.bet4wins.net/assets/banner/speed_baccarata.webp', 1, 'EVOLUTION', 0),
(2769, 'puu47n7mic3rfd7y', 'Emperor Dragon Tiger', 'https://evolution.bet4wins.net/assets/banner/EmperorDragonTiger.webp', 1, 'EVOLUTION', 0),
(2770, 'qgonc7t4ucdiel4o', 'Speed Baccarat T', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratt.webp', 1, 'EVOLUTION', 0),
(2771, 'ETHTable00000001', 'Extreme Texas Hold\'em', 'https://evolution.bet4wins.net/assets/banner/extreme_texas_holdem.webp', 1, 'EVOLUTION', 0),
(2772, 'q6ardco6opnfwes4', 'Emperor Speed Baccarat D', 'https://evolution.bet4wins.net/assets/banner/EmperorSpeedBaccaratD.webp', 1, 'EVOLUTION', 0),
(2773, '7nyiaws9tgqrzaz3', 'Football Studio Roulette', 'https://evolution.bet4wins.net/assets/banner/FootballStudioRoulette.webp', 1, 'EVOLUTION', 0),
(2774, 'ndgvs3tqhfuaadyg', 'Baccarat C', 'https://evolution.bet4wins.net/assets/banner/baccarat_c.webp', 1, 'EVOLUTION', 0),
(2775, 'pwsaqk24fcz5qpcr', 'Emperor Speed Baccarat C', 'https://evolution.bet4wins.net/assets/banner/EmperorSpeedBaccaratC.webp', 1, 'EVOLUTION', 0),
(2776, 'lkcbrbdckjxajdol', 'Speed Roulette', 'https://evolution.bet4wins.net/assets/banner/speed_roulette.webp', 1, 'EVOLUTION', 0),
(2777, 'o4kymodby2fa2c7g', 'Speed Baccarat S', 'https://evolution.bet4wins.net/assets/banner/speed_baccarats.webp', 1, 'EVOLUTION', 0),
(2778, 'nxpkul2hgclallno', 'Speed Baccarat I', 'https://evolution.bet4wins.net/assets/banner/speed_baccarati.webp', 1, 'EVOLUTION', 0),
(2779, 'CrazyTime0000001', 'Crazy Time', 'https://evolution.bet4wins.net/assets/banner/crazytime.webp', 1, 'EVOLUTION', 0),
(2780, 'vctlz20yfnmp1ylr', 'Roulette', 'https://evolution.bet4wins.net/assets/banner/roulette.webp', 1, 'EVOLUTION', 0),
(2781, 'zixzea8nrf1675oh', 'Baccarat Squeeze', 'https://evolution.bet4wins.net/assets/banner/baccarat_squeeze.webp', 1, 'EVOLUTION', 0),
(2782, 'teenpattitable01', 'Teen Patti', 'https://evolution.bet4wins.net/assets/banner/TeenPatti.webp', 1, 'EVOLUTION', 0),
(2783, 'peekbaccarat0001', 'Peek Baccarat', 'https://evolution.bet4wins.net/assets/banner/PeekBaccarat.webp', 1, 'EVOLUTION', 0),
(2784, 'o4kyj7tgpwqqy4m4', 'Speed Baccarat Q', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratq.webp', 1, 'EVOLUTION', 0),
(2785, 'FunkyTime0000001', 'Funky Time', 'https://evolution.bet4wins.net/assets/banner/FunkyTime.webp', 1, 'EVOLUTION', 0),
(2786, 'o4kylkahpwqqy57w', 'Speed Baccarat R', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratr.webp', 1, 'EVOLUTION', 0),
(2787, 'XxxtremeLigh0001', 'XXXtreme Lightning Roulette', 'https://evolution.bet4wins.net/assets/banner/XXXTremeLightningRoulette.webp', 1, 'EVOLUTION', 0),
(2788, 'AndarBahar000001', 'Super Andar Bahar', 'https://evolution.bet4wins.net/assets/banner/SuperAndarBahar.webp', 1, 'EVOLUTION', 0),
(2789, 'ndgv76kehfuaaeec', 'No Commission Speed Baccarat A', 'https://evolution.bet4wins.net/assets/banner/nocomm_speed_baccarat.webp', 1, 'EVOLUTION', 0),
(2790, '60i0lcfx5wkkv3sy', 'Baccarat B', 'https://evolution.bet4wins.net/assets/banner/baccarat_b.webp', 1, 'EVOLUTION', 0),
(2791, 'ocye5hmxbsoyrcii', 'No Commission Speed Baccarat B', 'https://evolution.bet4wins.net/assets/banner/nocomm_speed_baccaratb.webp', 1, 'EVOLUTION', 0),
(2792, 'rep5kwmdnyjmasxi', 'Speed Baccarat 11', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat11.webp', 1, 'EVOLUTION', 0),
(2793, 'rep5m2cdnyjmazzo', 'Speed Baccarat 12', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat12.webp', 1, 'EVOLUTION', 0),
(2794, 'BonsaiBacc000002', 'Bonsai Speed Baccarat B', 'https://evolution.bet4wins.net/assets/banner/BonsaiSpeedBaccaratB.webp', 1, 'EVOLUTION', 0),
(2795, 'DoubleBallRou001', 'Double Ball Roulette', 'https://evolution.bet4wins.net/assets/banner/double_ball.webp', 1, 'EVOLUTION', 0),
(2796, 'qsf7alptyvbqohva', 'Speed Baccarat 2', 'https://evolution.bet4wins.net/assets/banner/speed_baccarat_2.webp', 1, 'EVOLUTION', 0),
(2797, 'lv2kzclunt2qnxo5', 'Speed Baccarat B', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratb.webp', 1, 'EVOLUTION', 0),
(2798, 'HoldemTable00001', 'Casino Hold\'em', 'https://evolution.bet4wins.net/assets/banner/casino_holdem.webp', 1, 'EVOLUTION', 0),
(2799, 'puu43e6c5uvrfikr', 'Emperor Speed Baccarat B', 'https://evolution.bet4wins.net/assets/banner/EmperorSpeedBaccaratB.webp', 1, 'EVOLUTION', 0),
(2800, 'wzg6kdkad1oe7m5k', 'French Roulette Gold', 'https://evolution.bet4wins.net/assets/banner/french_roulette_gold.webp', 1, 'EVOLUTION', 0),
(2801, 'ovu5cwp54ccmymck', 'Speed Baccarat L', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratl.webp', 1, 'EVOLUTION', 0),
(2802, 'FanTan0000000001', 'Fan Tan', 'https://evolution.bet4wins.net/assets/banner/fan_tan.webp', 1, 'EVOLUTION', 0),
(2803, 'BonsaiBacc000003', 'Bonsai Speed Baccarat C', 'https://evolution.bet4wins.net/assets/banner/BonsaiSpeedBaccaratC.webp', 1, 'EVOLUTION', 0),
(2804, 'ovu5dsly4ccmynil', 'Speed Baccarat M', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratm.webp', 1, 'EVOLUTION', 0),
(2805, 'oytmvb9m1zysmc44', 'Baccarat A', 'https://evolution.bet4wins.net/assets/banner/baccarat_a.webp', 1, 'EVOLUTION', 0),
(2806, 'LightningBac0001', 'Lightning Baccarat', 'https://mxvbet.xyz/uploads/game-204534194788.jpg', 1, 'EVOLUTION', 0),
(2807, 'qsf7bpfvyvbqolwp', 'Speed Baccarat 3', 'https://evolution.bet4wins.net/assets/banner/speed_baccarat_3.webp', 1, 'EVOLUTION', 0),
(2808, 'TopDice000000001', 'Football Studio Dice', 'https://evolution.bet4wins.net/assets/banner/FootballStudioDice.webp', 1, 'EVOLUTION', 0),
(2809, 'k2oswnib7jjaaznw', 'Baccarat Control Squeeze', 'https://evolution.bet4wins.net/assets/banner/baccarat_controlled.webp', 1, 'EVOLUTION', 0),
(2810, 'qsf65xtoyvbqoaop', 'Speed Baccarat 1', 'https://evolution.bet4wins.net/assets/banner/speed_baccarat_1.webp', 1, 'EVOLUTION', 0),
(2811, 'ovu5fzje4ccmyqnr', 'Speed Baccarat P', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratp.webp', 1, 'EVOLUTION', 0),
(2812, 'qgqrrnuqvltnvejx', 'Speed Baccarat V', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratv.webp', 1, 'EVOLUTION', 0),
(2813, 'TRPTable00000001', 'Triple Card Poker', 'https://evolution.bet4wins.net/assets/banner/triple_card.webp', 1, 'EVOLUTION', 0),
(2814, 'wzg6kdkad1oe7m5k', 'VIP Roulette', 'https://evolution.bet4wins.net/assets/banner/vip_roulette.webp', 1, 'EVOLUTION', 0),
(2815, 'rfbo6mhpdgyqbpay', 'Emperor Bac Bo', 'https://evolution.bet4wins.net/assets/banner/EmperorBacBo.webp', 1, 'EVOLUTION', 0),
(2816, 'TopCard000000001', 'Football Studio', 'https://evolution.bet4wins.net/assets/banner/top_card.webp', 1, 'EVOLUTION', 0),
(2817, 'SuperSicBo000001', 'Super Sic Bo', 'https://evolution.bet4wins.net/assets/banner/super_sicbo.webp', 1, 'EVOLUTION', 0),
(2818, 'ovu5fbxm4ccmypmb', 'Speed Baccarat O', 'https://evolution.bet4wins.net/assets/banner/speed_baccarato.webp', 1, 'EVOLUTION', 0),
(2819, 'nxpj4wumgclak2lx', 'Speed Baccarat H', 'https://evolution.bet4wins.net/assets/banner/speed_baccarath.webp', 1, 'EVOLUTION', 0),
(2820, 'EmperorSB0000002', 'Emperor Sic Bo A', 'https://evolution.bet4wins.net/assets/banner/EmperorSicBoA.webp', 1, 'EVOLUTION', 0),
(2821, 'XXXtremeLB000001', 'XXXtreme Lightning Baccarat', 'https://evolution.bet4wins.net/assets/banner/XXXtremeLightningBaccarat.webp', 1, 'EVOLUTION', 0),
(2822, 'GoldVaultRo00001', 'Gold Vault Roulette', 'https://evolution.bet4wins.net/assets/banner/GoldVaultRoulette.webp', 1, 'EVOLUTION', 0),
(2823, 'MOWDream00000001', 'Dream Catcher', 'https://evolution.bet4wins.net/assets/banner/dream_catcher.webp', 1, 'EVOLUTION', 0),
(2824, 'SpeedAutoRo00001', 'Speed Auto Roulette', 'https://evolution.bet4wins.net/assets/banner/speed_auto_roulette.webp', 1, 'EVOLUTION', 0),
(2825, 'puu4yfymic3reudn', 'Emperor Speed Baccarat A', 'https://evolution.bet4wins.net/assets/banner/EmperorSpeedBaccaratA.webp', 1, 'EVOLUTION', 0),
(2826, 'BacBo00000000001', 'Bac Bo', 'https://evolution.bet4wins.net/assets/banner/BacBo.webp', 1, 'EVOLUTION', 0),
(2827, 'BonsaiBacc000001', 'Bonsai Speed Baccarat A', 'https://evolution.bet4wins.net/assets/banner/BonsaiSpeedBaccaratA.webp', 1, 'EVOLUTION', 0),
(2828, 'LightningDice001', 'Lightning Dice', 'https://mxvbet.xyz/uploads/game-88310560421.jpg', 1, 'EVOLUTION', 0),
(2829, '100', 'Baccarat', 'https://ezugi.bet4wins.net/assets/banner/BaccaratLobby.webp', 1, 'EZUGI', 0),
(2830, '102', 'Fortune Baccarat', 'https://ezugi.bet4wins.net/assets/banner/SpeedFortuneBaccarat.webp', 1, 'EZUGI', 0),
(2831, '105', 'Speed Fortune Baccarat', 'https://ezugi.bet4wins.net/assets/banner/SpeedFortuneBaccarat.webp', 1, 'EZUGI', 0),
(2832, '106', 'VIP Fortune Baccarat', 'https://ezugi.bet4wins.net/assets/banner/VIPFortuneBaccarat.webp', 1, 'EZUGI', 0),
(2833, '107', 'Italian Baccarat', 'https://ezugi.bet4wins.net/assets/banner/ItalianBaccarat.webp', 1, 'EZUGI', 0),
(2834, '120', 'Knockout Baccarat', 'https://ezugi.bet4wins.net/assets/banner/GoldenBaccaratKnockOut.webp', 1, 'EZUGI', 0),
(2835, '130', 'Super 6 Baccarat', 'https://ezugi.bet4wins.net/assets/banner/GoldenBaccaratSuperSix.webp', 1, 'EZUGI', 0),
(2836, '150', 'Dragon Tiger', 'https://ezugi.bet4wins.net/assets/banner/DragonTiger.webp', 1, 'EZUGI', 0),
(2837, '170', 'No Commission Baccarat', 'https://ezugi.bet4wins.net/assets/banner/NoCommissionBaccarat.webp', 1, 'EZUGI', 0),
(2838, '171', 'VIP No Commission Speed Cricket Baccarat', 'https://ezugi.bet4wins.net/assets/banner/VIPNoCommissionSpeedCricketBaccarat.webp', 1, 'EZUGI', 0),
(2839, '1000', 'Italian Roulette', 'https://ezugi.bet4wins.net/assets/banner/RouletteGold2.webp', 1, 'EZUGI', 0),
(2840, '5001', 'Auto Roulette', 'https://ezugi.bet4wins.net/assets/banner/AutomaticRoulette1.webp', 1, 'EZUGI', 0),
(2841, '32100', 'Casino Marina Baccarat 1', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaBaccarat1.webp', 1, 'EZUGI', 0),
(2842, '32101', 'Casino Marina Baccarat 2', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaBaccarat2.webp', 1, 'EZUGI', 0),
(2843, '32102', 'Casino Marina Baccarat 3', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaBaccarat3.webp', 1, 'EZUGI', 0),
(2844, '32103', 'Casino Marina Baccarat 4', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaBaccarat4.webp', 1, 'EZUGI', 0),
(2845, '43100', 'Fiesta Baccarat', 'https://ezugi.bet4wins.net/assets/banner/FiestaBaccarat.webp', 1, 'EZUGI', 0),
(2846, '221000', 'Speed Roulette', 'https://ezugi.bet4wins.net/assets/banner/SpeedRoulette.webp', 1, 'EZUGI', 0),
(2847, '221002', 'Speed Auto Roulette', 'https://ezugi.bet4wins.net/assets/banner/SpeedAutoRoulette.webp', 1, 'EZUGI', 0),
(2848, '221003', 'Diamond Roulette', 'https://ezugi.bet4wins.net/assets/banner/DiamondRoulette.webp', 1, 'EZUGI', 0),
(2849, '221004', 'Prestige Auto Roulette', 'https://ezugi.bet4wins.net/assets/banner/AutomaticRoulette1.webp', 1, 'EZUGI', 0),
(2850, '221005', 'Namaste Roulette', 'https://ezugi.bet4wins.net/assets/banner/NamasteRoulette.webp', 1, 'EZUGI', 0),
(2851, '224100', 'Ultimate Sic Bo', 'https://ezugi.bet4wins.net/assets/banner/UltimateSicBo.webp', 1, 'EZUGI', 0),
(2852, '228000', 'Andar Bahar', 'https://ezugi.bet4wins.net/assets/banner/AndarBahar.webp', 1, 'EZUGI', 0),
(2853, '228001', 'Lucky 7', 'https://ezugi.bet4wins.net/assets/banner/Lucky7.webp', 1, 'EZUGI', 0),
(2854, '228100', 'Ultimate Andar Bahar', 'https://ezugi.bet4wins.net/assets/banner/UltimateAndarBahar.webp', 1, 'EZUGI', 0),
(2855, '321000', 'Casino Marina Roulette 1', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaRoulette1.webp', 1, 'EZUGI', 0),
(2856, '321001', 'Casino Marina Roulette 2', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaRoulette2.webp', 1, 'EZUGI', 0),
(2857, '411000', 'Spanish Roulette', 'https://ezugi.bet4wins.net/assets/banner/CumbiaRuleta1.webp', 1, 'EZUGI', 0),
(2858, '431000', 'Ruleta del Sol', 'https://ezugi.bet4wins.net/assets/banner/RuletadelSol.webp', 1, 'EZUGI', 0),
(2859, '431001', 'Fiesta Roulette', 'https://ezugi.bet4wins.net/assets/banner/FiestaRoulette.webp', 1, 'EZUGI', 0),
(2860, '481001', 'EZ Dealer Roulette Thai', 'https://ezugi.bet4wins.net/assets/banner/EZDealerRoulette.webp', 1, 'EZUGI', 0),
(2861, '481002', 'EZ Dealer Roulette Japanese', 'https://ezugi.bet4wins.net/assets/banner/EZDealerRouletteJapanese.webp', 1, 'EZUGI', 0),
(2862, '481003', 'EZ Dealer Roulette Mandarin', 'https://ezugi.bet4wins.net/assets/banner/EZDealerRouletteMandarin.webp', 1, 'EZUGI', 0),
(2863, '501000', 'Turkish Roulette', 'https://ezugi.bet4wins.net/assets/banner/TurkishRoulette.webp', 1, 'EZUGI', 0),
(2864, '601000', 'Russian Roulette', 'https://ezugi.bet4wins.net/assets/banner/RouletteGold3.webp', 1, 'EZUGI', 0),
(2865, '611000', 'Portomaso Roulette 2', 'https://ezugi.bet4wins.net/assets/banner/PortomasoCasinoRoulette.webp', 1, 'EZUGI', 0),
(2866, '611001', 'Oracle Real Roulette', 'https://ezugi.bet4wins.net/assets/banner/OracleCasinoRoulette.webp', 1, 'EZUGI', 0),
(2867, '611003', 'Oracle 360 Roulette', 'https://ezugi.bet4wins.net/assets/banner/OracleCasinoRoulette360.webp', 1, 'EZUGI', 0),
(2868, 'vs5ultrab', 'Ultra Burn', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5ultrab.png', 1, 'REELKINGDOM', 0),
(2869, 'vs5ultra', 'Ultra Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5ultra.png', 1, 'REELKINGDOM', 0),
(2870, 'vs10returndead', 'Return of the Dead', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10returndead.png', 1, 'REELKINGDOM', 0),
(2871, 'vs10bbbonanza', 'Big Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bbbonanza.png', 1, 'REELKINGDOM', 0),
(2872, 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20hburnhs.png', 1, 'REELKINGDOM', 0),
(2873, 'vswayslight', 'Lucky Lightning', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayslight.png', 1, 'REELKINGDOM', 0),
(2874, 'vs12bbb', 'Bigger Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs12bbb.png', 1, 'REELKINGDOM', 0),
(2875, 'vs10floatdrg', 'Floating Dragon', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10floatdrg.png', 1, 'REELKINGDOM', 0),
(2876, 'vs1024temuj', 'Temujin Treasures', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1024temuj.png', 1, 'REELKINGDOM', 0),
(2877, 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bxmasbnza.png', 1, 'REELKINGDOM', 0),
(2878, 'vswaysbbb', 'Big Bass Bonanza Megaways™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysbbb.png', 1, 'REELKINGDOM', 0),
(2879, 'vs40bigjuan', 'Big Juan', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40bigjuan.png', 1, 'REELKINGDOM', 0),
(2880, 'vs10starpirate', 'Star Pirates Code', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10starpirate.png', 1, 'REELKINGDOM', 0),
(2881, 'vs5hotburn', 'Hot to burn', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5hotburn.png', 1, 'REELKINGDOM', 0),
(2882, 'vs25bkofkngdm', 'Book of Kingdoms', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25bkofkngdm.png', 1, 'REELKINGDOM', 0),
(2883, 'vs10eyestorm', 'Eye of the Storm', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10eyestorm.png', 1, 'REELKINGDOM', 0),
(2884, 'vs10amm', 'The Amazing Money Machine', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10amm.png', 1, 'REELKINGDOM', 0),
(2885, 'vs10luckcharm', 'Lucky Grace And Charm', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10luckcharm.png', 1, 'REELKINGDOM', 0),
(2886, 'vs25goldparty', 'Gold Party®', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25goldparty.png', 1, 'REELKINGDOM', 0),
(2887, 'vs20rockvegas', 'Rock Vegas Mega Hold & Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rockvegas.png', 1, 'REELKINGDOM', 0),
(2888, 'vs10tictac', 'Tic Tac Take', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10tictac.png', 1, 'REELKINGDOM', 0),
(2889, 'vs243queenie', 'Queenie', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243queenie.png', 1, 'REELKINGDOM', 0),
(2890, 'vs10spiritadv', 'Spirit of Adventure', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10spiritadv.png', 1, 'REELKINGDOM', 0),
(2891, 'vs5littlegem', 'Little Gem Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5littlegem.png', 1, 'REELKINGDOM', 0),
(2892, 'piggy-gold', 'Piggy Gold', 'https://mxvbet.xyz/uploads/game-140473189254.png', 1, 'PGSOFT', 1),
(2893, 'ganesha-gold', 'Ganesha Gold', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11337.png', 1, 'PGSOFT', 0),
(2894, 'jungle-delight', 'Jungle Delight', 'https://mxvbet.xyz/uploads/game-195055689218.jpg', 1, 'PGSOFT', 1),
(2895, 'double-fortune', 'Double Fortune', 'https://mxvbet.xyz/uploads/game-130071787445.jpg', 1, 'PGSOFT', 1),
(2896, 'the-great-icescape', 'The Great Icescape', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11343.png', 1, 'PGSOFT', 0),
(2897, 'captains-bounty', 'Captain\'s Bounty', 'https://mxvbet.xyz/uploads/game-108436035039.png', 1, 'PGSOFT', 1),
(2898, 'leprechaun-riches', 'Leprechaun Riches', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11347.png', 1, 'PGSOFT', 0),
(2899, 'mahjong-ways', 'Mahjong Ways', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11352.png', 1, 'PGSOFT', 0),
(2900, 'fortune-mouse', 'Fortune Mouse', 'https://mxvbet.xyz/uploads/game-198877809095.png', 1, 'PGSOFT', 1),
(2901, 'gem-saviour-conquest', 'Gem Saviour Conquest', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11356.png', 1, 'PGSOFT', 0),
(2902, 'candy-burst', 'Candy Burst', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11359.png', 1, 'PGSOFT', 0),
(2903, 'bikini-paradise', 'Bikini Paradise', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11360.png', 1, 'PGSOFT', 0),
(2904, 'mahjong-ways2', 'Mahjong Ways 2', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11361.png', 1, 'PGSOFT', 0),
(2905, 'egypts-book-mystery', 'Egypt\'s Book of Mystery', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11362.png', 1, 'PGSOFT', 0),
(2906, 'ganesha-fortune', 'Ganesha Fortune', 'https://mxvbet.xyz/uploads/game-234953428826.jpg', 1, 'PGSOFT', 1),
(2907, 'phoenix-rises', 'Phoenix Rises', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11365.png', 1, 'PGSOFT', 0),
(2908, 'wild-fireworks', 'Wild Fireworks', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11369.png', 1, 'PGSOFT', 0),
(2909, 'genies-wishes', 'Genie\'s 3 Wishes', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11371.png', 1, 'PGSOFT', 0),
(2910, 'treasures-aztec', 'Treasures of Aztec', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11372.png', 1, 'PGSOFT', 0),
(2911, 'queen-bounty', 'Queen of Bounty', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11610.jpg', 1, 'PGSOFT', 0),
(2912, 'jewels-prosper', 'Jewels of Prosperity', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11611.jpg', 1, 'PGSOFT', 0),
(2913, 'galactic-gems', 'Galactic Gems', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11614.png', 1, 'PGSOFT', 0),
(2914, 'gdn-ice-fire', 'Guardians of Ice and Fire', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11615.png', 1, 'PGSOFT', 0),
(2915, 'fortune-ox', 'Fortune Ox', 'https://mxvbet.xyz/uploads/game-203232781989.png', 1, 'PGSOFT', 1),
(2916, 'wild-bandito', 'Wild Bandito', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11855.jpg', 1, 'PGSOFT', 0),
(2917, 'candy-bonanza', 'Candy Bonanza', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11854.jpg', 1, 'PGSOFT', 0),
(2918, 'majestic-ts', 'Majestic Treasures', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11853.jpg', 1, 'PGSOFT', 0),
(2919, 'crypt-fortune', 'Raider Jane\'s Crypt of Fortune', 'https://mxvbet.xyz/uploads/game-95602634503.jpg', 1, 'PGSOFT', 1),
(2920, 'sprmkt-spree', 'Supermarket Spree', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12207.png', 1, 'PGSOFT', 0),
(2921, 'lgd-monkey-kg', 'Legendary Monkey King', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12209.png', 1, 'PGSOFT', 0),
(2922, 'spirit-wonder', 'Spirited Wonders', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12306.jpg', 1, 'PGSOFT', 0),
(2923, 'emoji-riches', 'Emoji Riches', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12308.png', 1, 'PGSOFT', 0),
(2924, 'fortune-tiger', 'Fortune Tiger', 'https://mxvbet.xyz/uploads/game-54064930455.jpg', 1, 'PGSOFT', 1),
(2925, 'garuda-gems', 'Garuda Gems', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12504.png', 1, 'PGSOFT', 0),
(2926, 'dest-sun-moon', 'Destiny of Sun & Moon', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12505.png', 1, 'PGSOFT', 0),
(2927, 'btrfly-blossom', 'Butterfly Blossom', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12569.jpeg', 1, 'PGSOFT', 0),
(2928, 'rooster-rbl', 'Rooster Rumble', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12594.jpg', 1, 'PGSOFT', 0),
(2929, 'battleground', 'Battleground Royale', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12633.jpg', 1, 'PGSOFT', 0),
(2930, 'fortune-rabbit', 'Fortune Rabbit', 'https://mxvbet.xyz/uploads/game-174372858262.jpg', 1, 'PGSOFT', 1),
(2931, 'btball5x20', 'Crazy Basketball', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/021.Crazy Basketball.png', 1, 'DREAMTECH', 0),
(2932, 'dnp', 'DragonPhoenix Prosper', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/022.DragonPhoenix Prosper.png', 1, 'DREAMTECH', 0),
(2933, 'crystal', 'Glory of Heroes', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/023.Glory of Heroes.png', 1, 'DREAMTECH', 0),
(2934, 'xjqy5x9', 'Chinese Paladin', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/024.Chinese Paladin.png', 1, 'DREAMTECH', 0),
(2935, 'fls', 'FULUSHOU', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/025.FULUSHOU.png', 1, 'DREAMTECH', 0),
(2936, 'fourss', 'Four Holy Beasts', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/026.Four Holy Beasts.png', 1, 'DREAMTECH', 0),
(2937, 'casino', '3D Slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/028.3D Slot.png', 1, 'DREAMTECH', 0),
(2938, 'crazy5x243', 'Crazy GO GO GO', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/029.Crazy GO GO GO.png', 1, 'DREAMTECH', 0),
(2939, 'rocknight', 'RocknRoll Night', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/031.RocknRoll Night.png', 1, 'DREAMTECH', 0),
(2940, 'bluesea', 'Blue Sea', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/032.Blue Sea.png', 1, 'DREAMTECH', 0),
(2941, 'klnz5x20', 'Happy Farm', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/033.Happy Farm.png', 1, 'DREAMTECH', 0),
(2942, 'circus', 'Crazy Circus', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/034.Crazy Circus.png', 1, 'DREAMTECH', 0),
(2943, 'sq5x243', '4X4 BATTLE', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/036.4X4 BATTLE.png', 1, 'DREAMTECH', 0),
(2944, 'bikini', 'Bikini Party', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/037.Bikini Party.png', 1, 'DREAMTECH', 0),
(2945, 'estate5x25', 'Monopoly', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/039.Monopoly.png', 1, 'DREAMTECH', 0),
(2946, 'piratetreasure', 'Pirate_Treasure', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/042.PirateTreasure.png', 1, 'DREAMTECH', 0),
(2947, 'foryouth5x25', 'SO YOUNG', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/045.SO YOUNG.png', 1, 'DREAMTECH', 0),
(2948, 'fourbeauty', 'Four Beauties', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/046.Four Beauties.png', 1, 'DREAMTECH', 0),
(2949, 'sweethouse', 'Candy House', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/047.Candy House.png', 1, 'DREAMTECH', 0),
(2950, 'legend5x25', 'Legend of the King', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/048.Legend of the King.png', 1, 'DREAMTECH', 0),
(2951, 'rocket6x25', 'Happiness Overflow', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/049.Happiness Overflow.png', 1, 'DREAMTECH', 0),
(2952, 'hotpot5x25', 'Spicy Hotpot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/050.Spicy Hotpot.png', 1, 'DREAMTECH', 0),
(2953, 'opera', 'Beijing opera', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/051.Beijing opera.jpeg', 1, 'DREAMTECH', 0),
(2954, 'bigred', 'Big Red', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/055.Big Red.jpeg', 1, 'DREAMTECH', 0),
(2955, 'wrathofthor', 'Wrath of Thor', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/056.Wrath of Thor.png', 1, 'DREAMTECH', 0),
(2956, 'boxingarena', 'Boxing Arena', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/059.Boxing Arena.jpeg', 1, 'DREAMTECH', 0),
(2957, 'bxgh5x25', 'Eight Immortals', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/060.Eight Immortals.png', 1, 'DREAMTECH', 0),
(2958, 'fantasyforest', 'Elf Kingdom', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/061.Elf Kingdom.png', 1, 'DREAMTECH', 0),
(2959, 'camgirl5x25', 'Sexy Camgirl', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/062.Sexy Camgirl.png', 1, 'DREAMTECH', 0),
(2960, 'hotpotfeast', 'Hotpot Feast', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/064.Hotpot Feast.png', 1, 'DREAMTECH', 0),
(2961, 'magician', 'Magician', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/065.Magician.png', 1, 'DREAMTECH', 0),
(2962, 'armorCrisis5x25', 'Armor Crisis', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/067.Armor Crisis.jpeg', 1, 'DREAMTECH', 0),
(2963, 'galaxywars', 'Galaxy Wars', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/068.Galaxy Wars.png', 1, 'DREAMTECH', 0),
(2964, 'easyrider', 'Easy Rider', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/069.Easy Rider.png', 1, 'DREAMTECH', 0),
(2965, 'bwzq5x25', 'Joust for a spouse', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/070.Joust for a spouse.png', 1, 'DREAMTECH', 0),
(2966, 'worldCup5x25', 'FIFA World Cup', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/071.FIFA World Cup.png', 1, 'DREAMTECH', 0),
(2967, 'goldjade5x50', 'Jin Yu Man Tang', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/072.Jin Yu Man Tang.png', 1, 'DREAMTECH', 0),
(2968, 'shokudo', 'shokudo', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/073.shokudo.jpeg', 1, 'DREAMTECH', 0),
(2969, 'train', 'Treasure Hunt Trip', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/074.Treasure Hunt Trip.png', 1, 'DREAMTECH', 0),
(2970, 'oceanpark5x50', 'Ocean Park', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/075.Ocean Park.jpeg', 1, 'DREAMTECH', 0),
(2971, 'lovefighters', 'Love Fighters', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/077.Love Fighters.png', 1, 'DREAMTECH', 0),
(2972, 'genie', 'Aladdin\'s Wish', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/078.Aladdin\'s Wish.png', 1, 'DREAMTECH', 0),
(2973, 'garden', 'Little Big Garden', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/079.Little Big Garden.png', 1, 'DREAMTECH', 0),
(2974, 'legendary', 'Legendary Tales', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/081.Legendary Tales.png', 1, 'DREAMTECH', 0),
(2975, 'superstar5x50', 'Star Generation', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/083.Star Generation.png', 1, 'DREAMTECH', 0),
(2976, 'alchemist', 'Crazy Alchemist', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/084.Crazy Alchemist.png', 1, 'DREAMTECH', 0),
(2977, 'dinosaur5x25', 'Dinosaur World', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/089.Dinosaur World.png', 1, 'DREAMTECH', 0),
(2978, 'shopping5x243', 'National Carnival', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/090.National Carnival.png', 1, 'DREAMTECH', 0),
(2979, 'tombshadow', 'Tomb Shadow', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/086.Tomb Shadow.png', 1, 'DREAMTECH', 0),
(2980, 'clash', 'Clash of Three kingdoms', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/088.Clash of Three kingdoms.png', 1, 'DREAMTECH', 0),
(2981, 'icefire', 'Ice And Fire', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/093.Ice And Fire.png', 1, 'DREAMTECH', 0),
(2982, 'legendMir5x25', 'Legendary Hegemony', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/095.Legendary Hegemony.png', 1, 'DREAMTECH', 0),
(2983, 'whackamole', 'Whack-A-Mole', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/094.Whack-A-Mole.png', 1, 'DREAMTECH', 0),
(2984, 'onenight5x243', 'Truffle Butter', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/096.Truffle Butter.png', 1, 'DREAMTECH', 0),
(2985, 'magicbean', 'Magic Bean Legend', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/097.Magic Bean Legend.png', 1, 'DREAMTECH', 0),
(2986, 'xiaoxiaole7x50', 'Monster Pop', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/103.Monster Pop.png', 1, 'DREAMTECH', 0),
(2987, 'newyear5x25', 'Happy Piggy New Year', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/101.Happy Piggy New Year.png', 1, 'DREAMTECH', 0),
(2988, 'secretdate', 'Secret Date', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/104.Secret Date.png', 1, 'DREAMTECH', 0),
(2989, 'king5x25', 'Im King', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/105.ImKing.png', 1, 'DREAMTECH', 0),
(2990, 'bacteria', 'Germ Lab', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/106.GermLab.png', 1, 'DREAMTECH', 0),
(2991, 'cute5x50', 'Castle Guardian', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/107.CastleGurdian.png', 1, 'DREAMTECH', 0),
(2992, 'baseball', 'Baseball Frenzy', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/108.BaseballFrenzy.png', 1, 'DREAMTECH', 0),
(2993, 'streetdance5x25', 'Street Dance Show', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/109.StreetDanceShow.png', 1, 'DREAMTECH', 0),
(2994, 'museum', 'Wondrous Museum', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/110.WondrousMuseum.png', 1, 'DREAMTECH', 0),
(2995, 'mysticalstones', 'Mystical Stones', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/111.MysticalStones.png', 1, 'DREAMTECH', 0),
(2996, 'sincity', 'Sin City', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/113.SinCity.png', 1, 'DREAMTECH', 0),
(2997, 'wheel', 'Secrets of The Pentagram', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/114.Secretsofthe pentagram.png', 1, 'DREAMTECH', 0),
(2998, 'westwild', 'West Wild', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/116.WestWild.png', 1, 'DREAMTECH', 0),
(2999, 'halloween', 'Witch Winnings', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/115.WitchWinnings.png', 1, 'DREAMTECH', 0),
(3000, 'bloodmoon', 'Blood Wolf legend', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/118.BloodWolf.png', 1, 'DREAMTECH', 0),
(3001, 'wildchaser5x20', 'Battle Field', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/120.BattleField.png', 1, 'DREAMTECH', 0),
(3002, 'dragonball2', 'Heroes of the East', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/121.HeroesofTheEast.png', 1, 'DREAMTECH', 0),
(3003, 'sgkill5x20', 'Three Kingdoms', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/122.ThreeKingdoms.png', 1, 'DREAMTECH', 0),
(3004, 'pirate5x25', 'Captain\'s Treasure', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9658.png', 1, 'DREAMTECH', 0),
(3005, 'muaythai', 'Muaythai', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9659.png', 1, 'DREAMTECH', 0),
(3006, 'sailor', 'Sailor Princess', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9660.png', 1, 'DREAMTECH', 0),
(3007, 'nightclub', 'Infinity Club', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9661.png', 1, 'DREAMTECH', 0),
(3008, 'nezha', 'Nezha Legend', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9662.png', 1, 'DREAMTECH', 0),
(3009, 'bird', 'Bird Island', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10900.png', 1, 'DREAMTECH', 0),
(3010, 'chess', 'Dragon Auto Chess', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10901.png', 1, 'DREAMTECH', 0),
(3011, 'honor', 'Field Of Honor', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10902.png', 1, 'DREAMTECH', 0),
(3012, 'goldrat5x243', 'Golden Rat', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10905.png', 1, 'DREAMTECH', 0),
(3013, 'girlgroup5x25', 'Sexy Girls', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10906.png', 1, 'DREAMTECH', 0),
(3014, 'boss5x20', 'Rich Asians', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10907.png', 1, 'DREAMTECH', 0),
(3015, 'vikings', 'Nordic Saga', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10908.png', 1, 'DREAMTECH', 0),
(3016, 'treasures', 'Secret Treasures', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10909.png', 1, 'DREAMTECH', 0),
(3017, 'shiningstars', 'ShiningStars', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11268.png', 1, 'DREAMTECH', 0),
(3018, 'tgow2plus', 'Cai Shen Dao Plus', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11555.png', 1, 'DREAMTECH', 0),
(3019, 'peeping', 'Peeping', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11556.png', 1, 'DREAMTECH', 0),
(3020, 'ds5x25', 'Drawing Sword', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12032.png', 1, 'DREAMTECH', 0),
(3021, 'empire5x40', 'The Magic Blade', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12033.png', 1, 'DREAMTECH', 0),
(3022, 'luckyfortune5x50', 'Lucky Fortune', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12034.png', 1, 'DREAMTECH', 0),
(3023, 'maidhotel5x25', 'Maid Hotel', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12035.png', 1, 'DREAMTECH', 0),
(3024, 'secretary3x9', 'Sexy Secretary', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12036.png', 1, 'DREAMTECH', 0),
(3025, 'hawaii5x20', 'Hawaii Vacation', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12037.png', 1, 'DREAMTECH', 0),
(3026, 'billiards5x243', 'POOL EIGHT BALL', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12362.png', 1, 'DREAMTECH', 0),
(3027, 'WildTriads', 'WildTriads', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/WildTriads.png', 1, 'TOPTREND', 0),
(3028, 'ReelsOfFortune', 'Reels Of Fortune', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ReelsOfFortune.png', 1, 'TOPTREND', 0),
(3029, 'GoldenAmazon', 'Golden Amazon', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/GoldenAmazon.png', 1, 'TOPTREND', 0),
(3030, 'MonkeyLuck', 'MonkeyLuck', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/MonkeyLuck.png', 1, 'TOPTREND', 0),
(3031, 'LeagueOfChampions', 'League Of Champions', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LeagueOfChampions.png', 1, 'TOPTREND', 0),
(3032, 'MadMonkeyH5', 'MadMonkey', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/MadMonkeyH5.png', 1, 'TOPTREND', 0),
(3033, 'DynastyEmpire', 'Dynasty Empire', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DynastyEmpire.png', 1, 'TOPTREND', 0),
(3034, 'SuperKids', 'SuperKids', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/SuperKids.png', 1, 'TOPTREND', 0),
(3035, 'HotVolcanoH5', 'HotVolcano', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/HotVolcano.png', 1, 'TOPTREND', 0),
(3036, 'Huluwa', 'Huluwa', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/Huluwa.png', 1, 'TOPTREND', 0),
(3037, 'LegendOfLinkH5', 'LegendOfLink', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LegendOfLinkH5.png', 1, 'TOPTREND', 0),
(3038, 'DetectiveBlackCat', 'DetectiveBlackCat', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DetectiveBlackcat.png', 1, 'TOPTREND', 0),
(3039, 'ChilliGoldH5', 'Chilli Gold', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ChiliGoldH5.png', 1, 'TOPTREND', 0),
(3040, 'SilverLionH5', 'Silver Lion', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/SilverLionH5.png', 1, 'TOPTREND', 0),
(3041, 'ThunderingZeusH5', 'ThunderingZeus', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ThunderingZeus.png', 1, 'TOPTREND', 0),
(3042, 'DragonPalaceH5', 'Dragon Palace', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11658.png', 1, 'TOPTREND', 0),
(3043, 'MadMonkey2', 'MadMonkey', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11660.png', 1, 'TOPTREND', 0),
(3044, 'MedusaCurse', 'Medusa Curse', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11661.png', 1, 'TOPTREND', 0),
(3045, 'BattleHeroes', 'Battle Heroes', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11662.png', 1, 'TOPTREND', 0),
(3046, 'NeptunesGoldH5', 'Neptunes Gold', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11664.png', 1, 'TOPTREND', 0),
(3047, 'HeroesNeverDie', 'Heroes Never Die', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11665.png', 1, 'TOPTREND', 0),
(3048, 'WildWildWitch', 'Wild Wild Witch', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11666.png', 1, 'TOPTREND', 0),
(3049, 'WildKartRacers', 'Wild Kart Racers', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11667.png', 1, 'TOPTREND', 0),
(3050, 'KingDinosaur', 'KingDinosaur', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11668.png', 1, 'TOPTREND', 0),
(3051, 'GoldenGenie', 'GoldenGenie', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11669.png', 1, 'TOPTREND', 0),
(3052, 'UltimateFighter', 'UltimateFighter', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11672.png', 1, 'TOPTREND', 0),
(3053, 'EverlastingSpins', 'EverlastingSpins', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11673.png', 1, 'TOPTREND', 0),
(3054, 'Zoomania', 'Zoomania', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11676.png', 1, 'TOPTREND', 0),
(3055, 'LaserCats', 'Laser Cats', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11679.png', 1, 'TOPTREND', 0),
(3056, 'DiamondFortune', 'DiamondFortune', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11682.png', 1, 'TOPTREND', 0),
(3057, 'GoldenClaw', 'GoldenClaw', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11685.png', 1, 'TOPTREND', 0),
(3058, 'PandaWarrior', 'PandaWarrior', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11687.png', 1, 'TOPTREND', 0),
(3059, 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11690.png', 1, 'TOPTREND', 0),
(3060, 'MegaMaya', 'MegaMaya', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11697.png', 1, 'TOPTREND', 0),
(3061, 'MegaPhoenix', 'MegaPhoenix', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11864.png', 1, 'TOPTREND', 0),
(3062, 'DolphinGoldH5', 'DolphinGold', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DolphinGoldH5.png', 1, 'TOPTREND', 0),
(3063, 'DragonKingH5', 'DragonKing', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DragonKingH5.png', 1, 'TOPTREND', 0),
(3064, 'LuckyPandaH5', 'LuckyPanda', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LuckyPanda.png', 1, 'TOPTREND', 0),
(3065, 'greatwall', 'The Great Wall Treasure', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/The_Great_Wall_Treasures_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3066, 'chinesenewyear', 'Chinese New Year', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Chinese_New_Year_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3067, 'jewellerystore', 'Jewelry store', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Jewellery_Store_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3068, 'redcliff', 'Red cliff', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Red_Cliff_360x340.png', 1, 'EVOPLAY', 0),
(3069, 'ElvenPrincesses', 'Elven Princess', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Elven_Princesses_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3070, 'robinzon', 'Robinson', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Robinson_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3071, 'aeronauts', 'Aeronauts', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Aeronauts_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3072, 'NukeWorld', 'Nook World', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/9102.jpg', 1, 'EVOPLAY', 0),
(3073, 'legendofkaan', 'Legend of Khan', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/10033.png', 1, 'EVOPLAY', 0),
(3074, 'LivingTales', 'Night of the Living Tales', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11292.jpg', 1, 'EVOPLAY', 0),
(3075, 'IceMania', 'Ice mania', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11384.jpg', 1, 'EVOPLAY', 0),
(3076, 'ValleyOfDreams', 'Valley of Dreams', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11427.png', 1, 'EVOPLAY', 0),
(3077, 'FruitNova', 'Fruit Nova', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11428.jpg', 1, 'EVOPLAY', 0),
(3078, 'TreeOfLight', 'Tree of light', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11503.png', 1, 'EVOPLAY', 0),
(3079, 'TempleOfDead', 'Temple of the dead', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11604.png', 1, 'EVOPLAY', 0),
(3080, 'RunesOfDestiny', 'Runes of Destiny', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11728.png', 1, 'EVOPLAY', 0),
(3081, 'EllensFortune', 'Ellen Fortune', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11729.jpg', 1, 'EVOPLAY', 0),
(3082, 'UnlimitedWishes', 'Unlimited Wishes', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11807.jpg', 1, 'EVOPLAY', 0),
(3083, 'FoodFeast', 'Food fist', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11808.jpg', 1, 'EVOPLAY', 0);
INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`) VALUES
(3084, 'EpicLegends', 'Epic legends', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11810.jpg', 1, 'EVOPLAY', 0),
(3085, 'SweetSugar', 'Sweet sugar', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11811.png', 1, 'EVOPLAY', 0),
(3086, 'GangsterNight', 'Gangster night', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12057.jpg', 1, 'EVOPLAY', 0),
(3087, 'GoldOfSirens', 'Gold of sirens', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12058.jpg', 1, 'EVOPLAY', 0),
(3088, 'BloodyBrilliant', 'Bloody brilliant', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12059.jpg', 1, 'EVOPLAY', 0),
(3089, 'TempleOfDeadBonusBuy', 'Temple of the Dead BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12133.jpg', 1, 'EVOPLAY', 0),
(3090, 'AnubisMoon', 'Anubis moon', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12171.jpg', 1, 'EVOPLAY', 0),
(3091, 'FruitDisco', 'Fruit disco', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12172.jpg', 1, 'EVOPLAY', 0),
(3092, 'FruitSuperNova30', 'Fruit Super Nova 30', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12173.jpg', 1, 'EVOPLAY', 0),
(3093, 'CurseOfThePharaoh', 'Curse of the Pharaoh', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12174.jpg', 1, 'EVOPLAY', 0),
(3094, 'FruitSuperNova60', 'Fruit Super Nova 60', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12227.jpg', 1, 'EVOPLAY', 0),
(3095, 'CurseofthePharaohBonusBuy', 'Curse of the Pharaoh BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12228.jpg', 1, 'EVOPLAY', 0),
(3096, 'FruitSuperNova100', 'Fruit Super Nova 100', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12256.jpg', 1, 'EVOPLAY', 0),
(3097, 'ChristmasReach', 'Christmas lychee', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12269.jpg', 1, 'EVOPLAY', 0),
(3098, 'FruitSuperNova80', 'Whoft Super Nova 80', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12326.jpg', 1, 'EVOPLAY', 0),
(3099, 'DragonsTavern', 'Dragon\'s Tavern', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12327.jpg', 1, 'EVOPLAY', 0),
(3100, 'ChristmasReachBonusBuy', 'Christmas Riti BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12329.jpg', 1, 'EVOPLAY', 0),
(3101, 'WildOverlords', 'Wild overlord', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12329.jpg', 1, 'EVOPLAY', 0),
(3102, 'DragonsTavernBonusBuy', 'Dragon\'s Tavern BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12358.jpg', 1, 'EVOPLAY', 0),
(3103, 'BudaiReels', 'Budai reels', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12381.jpg', 1, 'EVOPLAY', 0),
(3104, 'MoneyMinter', 'Money minter', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12575_.jpeg', 1, 'EVOPLAY', 0),
(3105, 'JuicyGems', 'Watch gem', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12895.jpg', 1, 'EVOPLAY', 0),
(3106, 'JuicyGemsBB', 'Watch Gem BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12896.jpg', 1, 'EVOPLAY', 0),
(3107, 'TheGreatestCatch', 'The Greatest Catch', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12892.jpg', 1, 'EVOPLAY', 0),
(3108, 'TheGreatestCatchBonusBuy', 'The Greatest Catch BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12893.jpg', 1, 'EVOPLAY', 0),
(3109, 'TreeOfLightBB', 'Tree of Light BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12899.jpg', 1, 'EVOPLAY', 0),
(3110, 'WolfHiding', 'Wolf Hiding', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12953.jpg', 1, 'EVOPLAY', 0),
(3111, 'CaminoDeChili', 'Camino de Chili', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12902.jpg', 1, 'EVOPLAY', 0),
(3112, 'CandyDreamsSweetPlanet', 'Candy dreams', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12902.jpg', 1, 'EVOPLAY', 0),
(3113, 'WildOverlordsBonusBuy', 'Wild Overlord BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12890.jpg', 1, 'EVOPLAY', 0),
(3114, 'TempleOfThunder', 'Temple of Thunder', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12891.jpg', 1, 'EVOPLAY', 0),
(3115, 'hand_of_gold', 'HAND OF GOLD', 'https://cdn46952.bngsrv.com/games/banner_220_en.png?ts=1618995876889', 1, 'PLAYSON', 0),
(3116, 'legend_of_cleopatra', 'LEGEND OF CLEOPATRA', 'https://cdn46952.bngsrv.com/static/games/banner_69_en.jpg', 1, 'PLAYSON', 0),
(3117, '40_joker_staxx', '40 JOKER STAXX', 'https://cdn46952.bngsrv.com/games/banner_96_en.png?ts=1616657514396', 1, 'PLAYSON', 0),
(3118, 'burning_wins', 'BURNING WINS', 'https://cdn46952.bngsrv.com/games/banner_102_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3119, 'book_of_gold', 'BOOK OF GOLD', 'https://cdn46952.bngsrv.com/games/banner_133_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3120, '100_joker_staxx', '100 JOKER STAXX', 'https://cdn46952.bngsrv.com/games/banner_144_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3121, 'book_of_gold_classic', 'BOOK OF GOLD CLASSIC', 'https://cdn46952.bngsrv.com/games/banner_159_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3122, 'book_of_gold_multichance', 'BOOK OF GOLD MULTICHANCE', 'https://cdn46952.bngsrv.com/games/banner_199_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3123, 'buffalo_xmas', 'BUFFALO XMAS', 'https://cdn46952.bngsrv.com/games/banner_248_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3124, 'sun_of_egypt', 'SUN OF EGYPT', 'https://cdn46952.bngsrv.com/games/banner_173_en.jpe?ts=1573550830337', 1, 'BOOONGO', 0),
(3125, 'sun_of_egypt_2', 'SUN OF EGYPT 2', 'https://cdn46952.bngsrv.com/games/banner_202_en.jpg?ts=1602582288012', 1, 'BOOONGO', 0),
(3126, 'happy_fish', 'HAPPY FISH', 'https://cdn46952.bngsrv.com/games/banner_261_en.jpg?ts=1644912611364', 1, 'BOOONGO', 0),
(3127, 'queen_of_the_sun', 'QUEEN OF THE SUN', 'https://cdn46952.bngsrv.com/games/banner_256_en.jpg?ts=1643099409287', 1, 'BOOONGO', 0),
(3128, 'tiger_jungle', 'TIGER JUNGLE', 'https://cdn46952.bngsrv.com/games/banner_242_en.jpg?ts=1630999887216', 1, 'BOOONGO', 0),
(3129, 'black_wolf', 'BLACK WOLF', 'https://cdn46952.bngsrv.com/games/banner_254_en.jpg?ts=1637589465054', 1, 'BOOONGO', 0),
(3130, 'hit_the_gold', 'HIT THE GOLD', 'https://cdn46952.bngsrv.com/games/banner_228_en.jpg?ts=1621873173151', 1, 'BOOONGO', 0),
(3131, 'candy_boom', 'CANDY BOOM', 'https://cdn46952.bngsrv.com/games/banner_250_en.jpg?ts=1635783617393', 1, 'BOOONGO', 0),
(3132, 'scarab_riches', 'SCARAB RICHES', 'https://cdn46952.bngsrv.com/games/banner_168_en.jpe?ts=1568115171958', 1, 'BOOONGO', 0),
(3133, 'golden_dancing_lion', 'GOLDEN DANCING LION', 'https://cdn46952.bngsrv.com/games/banner_252_en.jpg?ts=1637050697146', 1, 'BOOONGO', 0),
(3134, 'dragon_pearls', 'DRAGON PEARLS', 'https://cdn46952.bngsrv.com/games/banner_151_en.jpeg?ts=1551785453936', 1, 'BOOONGO', 0),
(3135, '3_coins', '3 COINS', 'https://cdn46952.bngsrv.com/games/banner_212_en.jpg?ts=1610363762913', 1, 'BOOONGO', 0),
(3136, 'super_rich_god', 'SUPER RICH GOD', 'https://cdn46952.bngsrv.com/games/banner_217_en.jpg?ts=1614080397964', 1, 'BOOONGO', 0),
(3137, '15_dragon_pearls', '15 DRAGON PEARLS', 'https://cdn46952.bngsrv.com/games/banner_197_en.jpeg?ts=1597062411022', 1, 'BOOONGO', 0),
(3138, 'aztec_sun', 'AZTEC SUN', 'https://cdn46952.bngsrv.com/games/banner_187_en.jpe?ts=1591699656458', 1, 'BOOONGO', 0),
(3139, 'scarab_temple', 'SCARAB TEMPLE', 'https://cdn46952.bngsrv.com/games/banner_201_en.jpeg?ts=1601369529833', 1, 'BOOONGO', 0),
(3140, 'gods_temple_deluxe', 'GODS TEMPLE DELUXE', 'https://cdn46952.bngsrv.com/static/games/banner_86_en.png', 1, 'BOOONGO', 0),
(3141, 'book_of_sun', 'BOOK OF SUN', 'https://cdn46952.bngsrv.com/static/games/banner_139_en.jpg', 1, 'BOOONGO', 0),
(3142, '777_gems', '777 GEMS', 'https://cdn46952.bngsrv.com/games/banner_148_en.jpeg', 1, 'BOOONGO', 0),
(3143, 'book_of_sun_multichance', 'BOOK OF SUN MULTICHANCE', 'https://cdn46952.bngsrv.com/games/banner_157_en.jpg?ts=1557834927593', 1, 'BOOONGO', 0),
(3144, 'olympian_gods', 'OLYMPIAN GODS', 'https://cdn46952.bngsrv.com/games/banner_166_en.jpeg?ts=1565181937129', 1, 'BOOONGO', 0),
(3145, '777_gems_respin', '777 GEMS RESPIN', 'https://cdn46952.bngsrv.com/games/banner_175_en.jpg?ts=1575289527907', 1, 'BOOONGO', 0),
(3146, 'tigers_gold', 'TIGERS GOLD', 'https://cdn46952.bngsrv.com/games/banner_178_en.jpe?ts=1580204919370', 1, 'BOOONGO', 0),
(3147, 'moon_sisters', 'MOON SISTERS', 'https://cdn46952.bngsrv.com/games/banner_183_en.jpg?ts=1589276977044', 1, 'BOOONGO', 0),
(3148, 'book_of_sun_choice', 'BOOK OF SUN CHOICE', 'https://cdn46952.bngsrv.com/games/banner_184_en.jpg?ts=1586766763403', 1, 'BOOONGO', 0),
(3149, 'super_marble', 'SUPER MARBLE', 'https://cdn46952.bngsrv.com/games/banner_189_en.jpg?ts=1592834985255', 1, 'BOOONGO', 0),
(3150, 'buddha_fortune', 'BUDDHA FORTUNE', 'https://cdn46952.bngsrv.com/games/banner_190_en.jpg?ts=1594723112381', 1, 'BOOONGO', 0),
(3151, 'great_panda', 'GREAT PANDA', 'https://cdn46952.bngsrv.com/games/banner_181_en.jpg?ts=1583843045334', 1, 'BOOONGO', 0),
(3152, '15_golden_eggs', '15 GOLDEN EGGS', 'https://cdn46952.bngsrv.com/static/games/banner_14_en.png', 1, 'BOOONGO', 0),
(3153, 'thunder_of_olympus', 'THUNDER OF OLYMPUS', 'https://cdn46952.bngsrv.com/games/banner_200_en.jpe?ts=1599463031466', 1, 'BOOONGO', 0),
(3154, 'eye_of_gold', 'EYE OF GOLD', 'https://cdn46952.bngsrv.com/games/banner_204_en.jpg?ts=1607423095999', 1, 'BOOONGO', 0),
(3155, 'tiger_stone', 'TIGER STONE', 'https://cdn46952.bngsrv.com/games/banner_209_en.jpg?ts=1604945706164', 1, 'BOOONGO', 0),
(3156, 'magic_apple', 'MAGIC APPLE', 'https://cdn46952.bngsrv.com/games/banner_219_en.jpg?ts=1615278797585', 1, 'BOOONGO', 0),
(3157, 'wolf_saga', 'WOLF SAGA', 'https://cdn46952.bngsrv.com/games/banner_216_en.png?ts=1612371564816', 1, 'BOOONGO', 0),
(3158, 'magic_ball', 'MAGIC BALL', 'https://cdn46952.bngsrv.com/games/banner_223_en.jpg?ts=1618214765589', 1, 'BOOONGO', 0),
(3159, 'scarab_boost', 'SCARAB BOOST', 'https://cdn46952.bngsrv.com/games/banner_231_en.jpg?ts=1623137017503', 1, 'BOOONGO', 0),
(3160, 'wukong', 'WUKONG', 'https://cdn46952.bngsrv.com/games/banner_233_en.jpg?ts=1624348278790', 1, 'BOOONGO', 0),
(3161, 'pearl_diver', 'PEARL DIVER', 'https://cdn46952.bngsrv.com/games/banner_232_en.jpg?ts=1624952929307', 1, 'BOOONGO', 0),
(3162, '3_coins_egypt', '3 COINS EGYPT', 'https://cdn46952.bngsrv.com/games/banner_236_en.jpg?ts=1626173501198', 1, 'BOOONGO', 0),
(3163, 'ganesha_boost', 'GANESHA BOOST', 'https://cdn46952.bngsrv.com/games/banner_240_en.jpg?ts=1629708978121', 1, 'BOOONGO', 0),
(3164, 'wolf_night', 'WOLF NIGHT', 'https://cdn46952.bngsrv.com/games/banner_237_en.jpg?ts=1628583185745', 1, 'BOOONGO', 0),
(3165, 'book_of_wizard', 'BOOK OF WIZARD', 'https://cdn46952.bngsrv.com/games/banner_244_en.jpg?ts=1632823480279', 1, 'BOOONGO', 0),
(3166, 'lord_fortune_2', 'LORD FORTUNE 2', 'https://cdn46952.bngsrv.com/games/banner_245_en.jpg?ts=1633430937520', 1, 'BOOONGO', 0),
(3167, 'gold_express', 'GOLD EXPRESS', 'https://cdn46952.bngsrv.com/games/banner_249_en.jpg?ts=1634629019700', 1, 'BOOONGO', 0),
(3168, 'book_of_wizard_crystal', 'BOOK OF WIZARD CRYSTAL', 'https://cdn46952.bngsrv.com/games/banner_255_en.jpg?ts=1641895746148', 1, 'BOOONGO', 0),
(3169, 'pearl_diver_2', 'PEARL DIVER 2', 'https://cdn46952.bngsrv.com/games/banner_259_en.jpg?ts=1645521353434', 1, 'BOOONGO', 0),
(3170, 'sun_of_egypt_3', 'SUN OF EGYPT 3', 'https://cdn46952.bngsrv.com/games/banner_262_en.jpg?ts=1646655112312', 1, 'BOOONGO', 0),
(3171, 'caishen_wealth', 'CAISHEN WEALTH', 'https://cdn46952.bngsrv.com/games/banner_265_en.jpg?ts=1649711719448', 1, 'BOOONGO', 0),
(3172, 'aztec_fire', 'AZTEC FIRE', 'https://cdn46952.bngsrv.com/games/banner_272_en.jpg?ts=1658177726858', 1, 'BOOONGO', 0),
(3173, 'SGReturnToTheFeature', 'Return to the Future', 'https://app-b.insvr.com/img/s/300/SGReturnToTheFeature_ko-KR.png', 1, 'HABANERO', 0),
(3174, 'SGTabernaDeLosMuertosUltra', 'Tevena de los Muirtos Ultra', 'https://app-b.insvr.com/img/s/300/SGTabernaDeLosMuertosUltra_ko-KR.png', 1, 'HABANERO', 0),
(3175, 'SGTotemTowers', 'Totem towers', 'https://app-b.insvr.com/img/s/300/SGTotemTowers_ko-KR.png', 1, 'HABANERO', 0),
(3176, 'SGChristmasGiftRush', 'Christmas Kipoot Rush', 'https://app-b.insvr.com/img/s/300/SGChristmasGiftRush_ko-KR.png', 1, 'HABANERO', 0),
(3177, 'SGOrbsOfAtlantis', 'Overs of Atlantis', 'https://app-b.insvr.com/img/s/300/SGOrbsOfAtlantis_ko-KR.png', 1, 'HABANERO', 0),
(3178, 'SGBeforeTimeRunsOut', 'Before Time Runner Out', 'https://app-b.insvr.com/img/s/300/SGBeforeTimeRunsOut_ko-KR.png', 1, 'HABANERO', 0),
(3179, 'SGTechnoTumble', 'Techno tumble', 'https://app-b.insvr.com/img/s/300/SGTechnoTumble_ko-KR.png', 1, 'HABANERO', 0),
(3180, 'SGWealthInn', 'Wells Inn', 'https://app-b.insvr.com/img/s/300/SGWealthInn_ko-KR.png', 1, 'HABANERO', 0),
(3181, 'SGHappyApe', 'Happy ape', 'https://app-b.insvr.com/img/s/300/SGHappyApe_ko-KR.png', 1, 'HABANERO', 0),
(3182, 'SGTabernaDeLosMuertos', 'Tevena di los Muertos', 'https://app-b.insvr.com/img/s/300/SGTabernaDeLosMuertos_ko-KR.png', 1, 'HABANERO', 0),
(3183, 'SGNaughtySanta', 'Notty Santa', 'https://app-b.insvr.com/img/s/300/SGNaughtySanta_ko-KR.png', 1, 'HABANERO', 0),
(3184, 'SGFaCaiShenDeluxe', 'Pakai Sen Deluxe', 'https://app-b.insvr.com/img/s/300/SGFaCaiShenDeluxe_ko-KR.png', 1, 'HABANERO', 0),
(3185, 'SGHeySushi', 'Hey sushi', 'https://app-b.insvr.com/img/s/300/SGHeySushi_ko-KR.png', 1, 'HABANERO', 0),
(3186, 'SGKnockoutFootballRush', 'Knockout football rush', 'https://app-b.insvr.com/img/s/300/SGKnockoutFootballRush_ko-KR.png', 1, 'HABANERO', 0),
(3187, 'SGColossalGems', 'Closal Gems', 'https://app-b.insvr.com/img/s/300/SGColossalGems_ko-KR.png', 1, 'HABANERO', 0),
(3188, 'SGHotHotHalloween', 'hot hot halloween', 'https://app-b.insvr.com/img/s/300/SGHotHotHalloween_ko-KR.png', 1, 'HABANERO', 0),
(3189, 'SGLuckyFortuneCat', 'Lucky fortune cat', 'https://app-b.insvr.com/img/s/300/SGLuckyFortuneCat_ko-KR.png', 1, 'HABANERO', 0),
(3190, 'SGHotHotFruit', 'hot hot fruit', 'https://app-b.insvr.com/img/s/300/SGHotHotFruit_ko-KR.png', 1, 'HABANERO', 0),
(3191, 'SGMountMazuma', 'Mount Majuma', 'https://app-b.insvr.com/img/s/300/SGMountMazuma_ko-KR.png', 1, 'HABANERO', 0),
(3192, 'SGWildTrucks', 'Wild Trucks', 'https://app-b.insvr.com/img/s/300/SGWildTrucks_ko-KR.png', 1, 'HABANERO', 0),
(3193, 'SGLuckyLucky', 'Lucky Lucky', 'https://app-b.insvr.com/img/s/300/SGLuckyLucky_ko-KR.png', 1, 'HABANERO', 0),
(3194, 'SGKnockoutFootball', 'Knockout football', 'https://app-b.insvr.com/img/s/300/SGKnockoutFootball_ko-KR.png', 1, 'HABANERO', 0),
(3195, 'SGJump', 'Jump!', 'https://app-b.insvr.com/img/s/300/SGJump_ko-KR.png', 1, 'HABANERO', 0),
(3196, 'SGPumpkinPatch', 'Pumpkin patch', 'https://app-b.insvr.com/img/s/300/SGPumpkinPatch_ko-KR.png', 1, 'HABANERO', 0),
(3197, 'SGWaysOfFortune', 'Way of Fortune', 'https://app-b.insvr.com/img/s/300/SGWaysOfFortune_ko-KR.png', 1, 'HABANERO', 0),
(3198, 'SGFourDivineBeasts', 'For Devine Beasts', 'https://app-b.insvr.com/img/s/300/SGFourDivineBeasts_ko-KR.png', 1, 'HABANERO', 0),
(3199, 'SGPandaPanda', 'Panda panda', 'https://app-b.insvr.com/img/s/300/SGPandaPanda_ko-KR.png', 1, 'HABANERO', 0),
(3200, 'SGOceansCall', 'Ocean\'s Call', 'https://app-b.insvr.com/img/s/300/SGOceansCall_ko-KR.png', 1, 'HABANERO', 0),
(3201, 'SGScruffyScallywags', 'Scruffy Skellywex', 'https://app-b.insvr.com/img/s/300/SGScruffyScallywags_ko-KR.png', 1, 'HABANERO', 0),
(3202, 'SGNuwa', 'Nuwa', 'https://app-b.insvr.com/img/s/300/SGNuwa_ko-KR.png', 1, 'HABANERO', 0),
(3203, 'SGTheKoiGate', 'Koi gate', 'https://app-b.insvr.com/img/s/300/SGTheKoiGate_ko-KR.png', 1, 'HABANERO', 0),
(3204, 'SGFaCaiShen', 'Pacaishen', 'https://app-b.insvr.com/img/s/300/SGFaCaiShen_ko-KR.png', 1, 'HABANERO', 0),
(3205, 'SG12Zodiacs', '12 zodiacs', 'https://app-b.insvr.com/img/s/300/SG12Zodiacs_ko-KR.png', 1, 'HABANERO', 0),
(3206, 'SGFireRooster', 'Fire rooster', 'https://app-b.insvr.com/img/s/300/SGFireRooster_ko-KR.png', 1, 'HABANERO', 0),
(3207, 'SGFenghuang', 'Phoenix', 'https://app-b.insvr.com/img/s/300/SGFenghuang_ko-KR.png', 1, 'HABANERO', 0),
(3208, 'SGBirdOfThunder', 'Bird of Thunder', 'https://app-b.insvr.com/img/s/300/SGBirdOfThunder_ko-KR.png', 1, 'HABANERO', 0),
(3209, 'SGTheDeadEscape', 'The Dead Escape', 'https://app-b.insvr.com/img/s/300/SGTheDeadEscape_ko-KR.png', 1, 'HABANERO', 0),
(3210, 'SGBombsAway', 'Bombs Away', 'https://app-b.insvr.com/img/s/300/SGBombsAway_ko-KR.png', 1, 'HABANERO', 0),
(3211, 'SGGoldRush', 'Gold rush', 'https://app-b.insvr.com/img/s/300/SGGoldRush_ko-KR.png', 1, 'HABANERO', 0),
(3212, 'SGRuffledUp', 'Ruffled up', 'https://app-b.insvr.com/img/s/300/SGRuffledUp_ko-KR.png', 1, 'HABANERO', 0),
(3213, 'SGRomanEmpire', 'Roman empire', 'https://app-b.insvr.com/img/s/300/SGRomanEmpire_ko-KR.png', 1, 'HABANERO', 0),
(3214, 'SGCoyoteCrash', 'Coyote crash', 'https://app-b.insvr.com/img/s/300/SGCoyoteCrash_ko-KR.png', 1, 'HABANERO', 0),
(3215, 'SGWickedWitch', 'Wickt Location', 'https://app-b.insvr.com/img/s/300/SGWickedWitch_ko-KR.png', 1, 'HABANERO', 0),
(3216, 'SGDragonsThrone', 'Dragon\'s Throne', 'https://app-b.insvr.com/img/s/300/SGDragonsThrone_ko-KR.png', 1, 'HABANERO', 0),
(3217, 'SGBuggyBonus', 'Buggy bonus', 'https://app-b.insvr.com/img/s/300/SGBuggyBonus_ko-KR.png', 1, 'HABANERO', 0),
(3218, 'SGGlamRock', 'Glam rock', 'https://app-b.insvr.com/img/s/300/SGGlamRock_ko-KR.png', 1, 'HABANERO', 0),
(3219, 'SGSuperTwister', 'Super twister', 'https://app-b.insvr.com/img/s/300/SGSuperTwister_ko-KR.png', 1, 'HABANERO', 0),
(3220, 'SGKanesInferno', 'Keynes Inferno', 'https://app-b.insvr.com/img/s/300/SGKanesInferno_ko-KR.png', 1, 'HABANERO', 0),
(3221, 'SGTreasureTomb', 'Treasure Tomb', 'https://app-b.insvr.com/img/s/300/SGTreasureTomb_ko-KR.png', 1, 'HABANERO', 0),
(3222, 'SGJugglenaut', 'Jugglenut', 'https://app-b.insvr.com/img/s/300/SGJugglenaut_ko-KR.png', 1, 'HABANERO', 0),
(3223, 'SGGalacticCash', 'Glactic Cash', 'https://app-b.insvr.com/img/s/300/SGGalacticCash_ko-KR.png', 1, 'HABANERO', 0),
(3224, 'SGZeus2', 'Zeus 2', 'https://app-b.insvr.com/img/s/300/SGZeus2_ko-KR.png', 1, 'HABANERO', 0),
(3225, 'SGTheDragonCastle', 'Dragon castle', 'https://app-b.insvr.com/img/s/300/SGTheDragonCastle_ko-KR.png', 1, 'HABANERO', 0),
(3226, 'SGKingTutsTomb', 'King Teeth Tomb', 'https://app-b.insvr.com/img/s/300/SGKingTutsTomb_ko-KR.png', 1, 'HABANERO', 0),
(3227, 'SGCarnivalCash', 'Carnival cash', 'https://app-b.insvr.com/img/s/300/SGCarnivalCash_ko-KR.png', 1, 'HABANERO', 0),
(3228, 'SGTreasureDiver', 'Treasure diver', 'https://app-b.insvr.com/img/s/300/SGTreasureDiver_ko-KR.png', 1, 'HABANERO', 0),
(3229, 'SGLittleGreenMoney', 'Little Green Money', 'https://app-b.insvr.com/img/s/300/SGLittleGreenMoney_ko-KR.png', 1, 'HABANERO', 0),
(3230, 'SGMonsterMashCash', 'Monster Mash Cash', 'https://app-b.insvr.com/img/s/300/SGMonsterMashCash_ko-KR.png', 1, 'HABANERO', 0),
(3231, 'SGShaolinFortunes100', 'Xiaolin Fortune 100', 'https://app-b.insvr.com/img/s/300/SGShaolinFortunes100_ko-KR.png', 1, 'HABANERO', 0),
(3232, 'SGShaolinFortunes243', 'Xiaolin Fortune', 'https://app-b.insvr.com/img/s/300/SGShaolinFortunes243_ko-KR.png', 1, 'HABANERO', 0),
(3233, 'SGWeirdScience', 'Weird Science', 'https://app-b.insvr.com/img/s/300/SGWeirdScience_ko-KR.png', 1, 'HABANERO', 0),
(3234, 'SGBlackbeardsBounty', 'Blackbeards Bounty', 'https://app-b.insvr.com/img/s/300/SGBlackbeardsBounty_ko-KR.png', 1, 'HABANERO', 0),
(3235, 'SGDrFeelgood', 'Dr. Feelgood', 'https://app-b.insvr.com/img/s/300/SGDrFeelgood_ko-KR.png', 1, 'HABANERO', 0),
(3236, 'SGVikingsPlunder', 'Vikings plunder', 'https://app-b.insvr.com/img/s/300/SGVikingsPlunder_ko-KR.png', 1, 'HABANERO', 0),
(3237, 'SGDoubleODollars', 'Double O Dollars', 'https://app-b.insvr.com/img/s/300/SGDoubleODollars_ko-KR.png', 1, 'HABANERO', 0),
(3238, 'SGSpaceFortune', 'Space fortune', 'https://app-b.insvr.com/img/s/300/SGSpaceFortune_ko-KR.png', 1, 'HABANERO', 0),
(3239, 'SGPamperMe', 'Pamper me', 'https://app-b.insvr.com/img/s/300/SGPamperMe_ko-KR.png', 1, 'HABANERO', 0),
(3240, 'SGZeus', 'Zeus', 'https://app-b.insvr.com/img/s/300/SGZeus_ko-KR.png', 1, 'HABANERO', 0),
(3241, 'SGSOS', 'S.O.S.!', 'https://app-b.insvr.com/img/s/300/SGSOS_ko-KR.png', 1, 'HABANERO', 0),
(3242, 'SGPoolShark', 'Full shark', 'https://app-b.insvr.com/img/s/300/SGPoolShark_ko-KR.png', 1, 'HABANERO', 0),
(3243, 'SGEgyptianDreams', 'Egyptian Dreams', 'https://app-b.insvr.com/img/s/300/SGEgyptianDreams_ko-KR.png', 1, 'HABANERO', 0),
(3244, 'SGBarnstormerBucks', 'Barnstormer Bucks', 'https://app-b.insvr.com/img/s/300/SGBarnstormerBucks_ko-KR.png', 1, 'HABANERO', 0),
(3245, 'SGSuperStrike', 'Super strike', 'https://app-b.insvr.com/img/s/300/SGSuperStrike_ko-KR.png', 1, 'HABANERO', 0),
(3246, 'SGJungleRumble', 'Jungle rumble', 'https://app-b.insvr.com/img/s/300/SGJungleRumble_ko-KR.png', 1, 'HABANERO', 0),
(3247, 'SGArcticWonders', 'Arctic Wonders', 'https://app-b.insvr.com/img/s/300/SGArcticWonders_ko-KR.png', 1, 'HABANERO', 0),
(3248, 'SGTowerOfPizza', 'Tower of Pizza', 'https://app-b.insvr.com/img/s/300/SGTowerOfPizza_ko-KR.png', 1, 'HABANERO', 0),
(3249, 'SGMummyMoney', 'Mummy money', 'https://app-b.insvr.com/img/s/300/SGMummyMoney_ko-KR.png', 1, 'HABANERO', 0),
(3250, 'SGBikiniIsland', 'bikini island', 'https://app-b.insvr.com/img/s/300/SGBikiniIsland_ko-KR.png', 1, 'HABANERO', 0),
(3251, 'SGQueenOfQueens1024', 'Queen of Queens II', 'https://app-b.insvr.com/img/s/300/SGQueenOfQueens1024_ko-KR.png', 1, 'HABANERO', 0),
(3252, 'SGDragonsRealm', 'Dragon\'s Realm', 'https://app-b.insvr.com/img/s/300/SGDragonsRealm_ko-KR.png', 1, 'HABANERO', 0),
(3253, 'SGAllForOne', 'All for one', 'https://app-b.insvr.com/img/s/300/SGAllForOne_ko-KR.png', 1, 'HABANERO', 0),
(3254, 'SGFlyingHigh', 'Flying high', 'https://app-b.insvr.com/img/s/300/SGFlyingHigh_ko-KR.png', 1, 'HABANERO', 0),
(3255, 'SGMrBling', 'Mr. Bling', 'https://app-b.insvr.com/img/s/300/SGMrBling_ko-KR.png', 1, 'HABANERO', 0),
(3256, 'SGMysticFortune', 'Mystic Fortune', 'https://app-b.insvr.com/img/s/300/SGMysticFortune_ko-KR.png', 1, 'HABANERO', 0),
(3257, 'SGPuckerUpPrince', 'Funker up prince', 'https://app-b.insvr.com/img/s/300/SGPuckerUpPrince_ko-KR.png', 1, 'HABANERO', 0),
(3258, 'SGSirBlingalot', 'Bring it all', 'https://app-b.insvr.com/img/s/300/SGSirBlingalot_ko-KR.png', 1, 'HABANERO', 0),
(3259, 'SGCashReef', 'Cash leaf', 'https://app-b.insvr.com/img/s/300/SGCashReef_ko-KR.png', 1, 'HABANERO', 0),
(3260, 'SGQueenOfQueens243', 'Queen of queens', 'https://app-b.insvr.com/img/s/300/SGQueenOfQueens243_ko-KR.png', 1, 'HABANERO', 0),
(3261, 'SGRideEmCowboy', 'Lytham Cowboy (Pick Game)', 'https://app-b.insvr.com/img/s/300/SGRideEmCowboy_ko-KR.png', 1, 'HABANERO', 0),
(3262, 'SGGrapeEscape', 'The Graph Escape', 'https://app-b.insvr.com/img/s/300/SGGrapeEscape_ko-KR.png', 1, 'HABANERO', 0),
(3263, 'SGGoldenUnicorn', 'Golden unicorn', 'https://app-b.insvr.com/img/s/300/SGGoldenUnicorn_ko-KR.png', 1, 'HABANERO', 0),
(3264, 'SGFrontierFortunes', 'Frontier Fortune', 'https://app-b.insvr.com/img/s/300/SGFrontierFortunes_ko-KR.png', 1, 'HABANERO', 0),
(3265, 'SGIndianCashCatcher', 'Indian Cash Catcher', 'https://app-b.insvr.com/img/s/300/SGIndianCashCatcher_ko-KR.png', 1, 'HABANERO', 0),
(3266, 'SGSkysTheLimit', 'Sky\'s the Limit', 'https://app-b.insvr.com/img/s/300/SGSkysTheLimit_ko-KR.png', 1, 'HABANERO', 0),
(3267, 'SGTheBigDeal', 'The Big Deal', 'https://app-b.insvr.com/img/s/300/SGTheBigDeal_ko-KR.png', 1, 'HABANERO', 0),
(3268, 'SGCashosaurus', 'Cashosaurus', 'https://app-b.insvr.com/img/s/300/SGCashosaurus_ko-KR.png', 1, 'HABANERO', 0),
(3269, 'SGDiscoFunk', 'Disco funk', 'https://app-b.insvr.com/img/s/300/SGDiscoFunk_ko-KR.png', 1, 'HABANERO', 0),
(3270, 'SGCalaverasExplosivas', 'Calaveras Explociba', 'https://app-b.insvr.com/img/s/300/SGCalaverasExplosivas_ko-KR.png', 1, 'HABANERO', 0),
(3271, 'SGNewYearsBash', 'New Year Bessie', 'https://app-b.insvr.com/img/s/300/SGNewYearsBash_ko-KR.png', 1, 'HABANERO', 0),
(3272, 'SGNineTails', 'Nine Tales', 'https://app-b.insvr.com/img/s/300/SGNineTails_ko-KR.png', 1, 'HABANERO', 0),
(3273, 'SGMysticFortuneDeluxe', 'Mystic Fortune Deluxe', 'https://app-b.insvr.com/img/s/300/SGMysticFortuneDeluxe_ko-KR.png', 1, 'HABANERO', 0),
(3274, 'SGLuckyDurian', 'Lucky durian', 'https://app-b.insvr.com/img/s/300/SGLuckyDurian_ko-KR.png', 1, 'HABANERO', 0),
(3275, 'SGDiscoBeats', 'Disco beat', 'https://app-b.insvr.com/img/s/300/SGDiscoBeats_ko-KR.png', 1, 'HABANERO', 0),
(3276, 'SGLanternLuck', 'Lantern lucky', 'https://app-b.insvr.com/img/s/300/SGLanternLuck_ko-KR.png', 1, 'HABANERO', 0),
(3277, 'SGBombRunner', 'Boom runner', 'https://app-b.insvr.com/img/s/300/SGBombRunner_ko-KR.png', 1, 'HABANERO', 0),
(3278, 'vs243mwarrior', 'Monkey Warrior', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243mwarrior.png', 1, 'PRAGMATIC', 0),
(3279, 'vs20doghouse', 'The Dog House', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20doghouse.png', 1, 'PRAGMATIC', 0),
(3280, 'vs40pirate', 'Pirate Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40pirate.png', 1, 'PRAGMATIC', 0),
(3281, 'vs20rhino', 'Great Rhino', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rhino.png', 1, 'PRAGMATIC', 0),
(3282, 'vs25pandagold', 'Panda Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25pandagold.png', 1, 'PRAGMATIC', 0),
(3283, 'vs4096bufking', 'Buffalo King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs4096bufking.png', 1, 'PRAGMATIC', 0),
(3284, 'vs25pyramid', 'Pyramid King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25pyramid.png', 1, 'PRAGMATIC', 0),
(3285, 'vs5ultrab', 'Ultra Burn', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5ultrab.png', 1, 'PRAGMATIC', 0),
(3286, 'vs5ultra', 'Ultra Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5ultra.png', 1, 'PRAGMATIC', 0),
(3287, 'vs25jokerking', 'Joker King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25jokerking.png', 1, 'PRAGMATIC', 0),
(3288, 'vs10returndead', 'Return of the Dead', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10returndead.png', 1, 'PRAGMATIC', 0),
(3289, 'vs10madame', 'Madame Destiny', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10madame.png', 1, 'PRAGMATIC', 0),
(3290, 'vs15diamond', 'Diamond Strike', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs15diamond.png', 1, 'PRAGMATIC', 0),
(3291, 'vs25aztecking', 'Aztec King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25aztecking.png', 1, 'PRAGMATIC', 0),
(3292, 'vs25wildspells', 'Wild Spells', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25wildspells.png', 1, 'PRAGMATIC', 0),
(3293, 'vs10bbbonanza', 'Big Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bbbonanza.png', 1, 'PRAGMATIC', 0),
(3294, 'vs10cowgold', 'Cowboys Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10cowgold.png', 1, 'PRAGMATIC', 0),
(3295, 'vs25tigerwar', 'The Tiger Warrior', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25tigerwar.png', 1, 'PRAGMATIC', 0),
(3296, 'vs25mustang', 'Mustang Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25mustang.png', 1, 'PRAGMATIC', 0),
(3297, 'vs25hotfiesta', 'Hotfiesta', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25hotfiesta.png', 1, 'PRAGMATIC', 0),
(3298, 'vs243dancingpar', 'Dance Party', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243dancingpar.png', 1, 'PRAGMATIC', 0),
(3299, 'vs576treasures', 'Wild Wild Riches', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs576treasures.png', 1, 'PRAGMATIC', 0),
(3300, 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20hburnhs.png', 1, 'PRAGMATIC', 0),
(3301, 'vs20emptybank', 'Empty the Bank', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20emptybank.png', 1, 'PRAGMATIC', 0),
(3302, 'vs20midas', 'The Hand of Midas', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20midas.png', 1, 'PRAGMATIC', 0),
(3303, 'vs20olympgate', 'Gates of Olympus', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20olympgate.png', 1, 'PRAGMATIC', 0),
(3304, 'vswayslight', 'Lucky Lightning', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayslight.png', 1, 'PRAGMATIC', 0),
(3305, 'vs20vegasmagic', 'Vegas Magic', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20vegasmagic.png', 1, 'PRAGMATIC', 0),
(3306, 'vs20fruitparty', 'Fruit Party', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20fruitparty.png', 1, 'PRAGMATIC', 0),
(3307, 'vs20fparty2', 'Fruit Party 2', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20fparty2.png', 1, 'PRAGMATIC', 0),
(3308, 'vswaysdogs', 'The Dog House Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysdogs.png', 1, 'PRAGMATIC', 0),
(3309, 'vs50juicyfr', 'Juicy Fruits', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50juicyfr.png', 1, 'PRAGMATIC', 0),
(3310, 'vs25pandatemple', 'Panda Fortune 2', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25pandatemple.png', 1, 'PRAGMATIC', 0),
(3311, 'vswaysbufking', 'Buffalo King Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysbufking.png', 1, 'PRAGMATIC', 0),
(3312, 'vs40wildwest', 'Wild West Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40wildwest.png', 1, 'PRAGMATIC', 0),
(3313, 'vs20chickdrop', 'Chicken Drop', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20chickdrop.png', 1, 'PRAGMATIC', 0),
(3314, 'vs40spartaking', 'Spartan King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40spartaking.png', 1, 'PRAGMATIC', 0),
(3315, 'vswaysrhino', 'Great Rhino Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysrhino.png', 1, 'PRAGMATIC', 0),
(3316, 'vs20sbxmas', 'Sweet Bonanza Xmas', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20sbxmas.png', 1, 'PRAGMATIC', 0),
(3317, 'vs10fruity2', 'Extra Juicy', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10fruity2.png', 1, 'PRAGMATIC', 0),
(3318, 'vs10egypt', 'Ancient Egypt', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10egypt.png', 1, 'PRAGMATIC', 0),
(3319, 'vs5drhs', 'Dragon Hot Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5drhs.png', 1, 'PRAGMATIC', 0),
(3320, 'vs12bbb', 'Bigger Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs12bbb.png', 1, 'PRAGMATIC', 0),
(3321, 'vs20tweethouse', 'The Tweety House', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20tweethouse.png', 1, 'PRAGMATIC', 0),
(3322, 'vswayslions', '5 Lions Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayslions.png', 1, 'PRAGMATIC', 0),
(3323, 'vswayssamurai', 'Rise of Samurai Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayssamurai.png', 1, 'PRAGMATIC', 0),
(3324, 'vs50pixie', 'Pixie Wings', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50pixie.png', 1, 'PRAGMATIC', 0),
(3325, 'vs10floatdrg', 'Floating Dragon', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10floatdrg.png', 1, 'PRAGMATIC', 0),
(3326, 'vs20fruitsw', 'Sweet Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20fruitsw.png', 1, 'PRAGMATIC', 0),
(3327, 'vs20rhinoluxe', 'Great Rhino Deluxe', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rhinoluxe.png', 1, 'PRAGMATIC', 0),
(3328, 'vswaysmadame', 'Madame Destiny Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysmadame.png', 1, 'PRAGMATIC', 0),
(3329, 'vs1024temuj', 'Temujin Treasures', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1024temuj.png', 1, 'PRAGMATIC', 0),
(3330, 'vs40pirgold', 'Pirate Gold Deluxe', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40pirgold.png', 1, 'PRAGMATIC', 0),
(3331, 'vs25mmouse', 'Money Mouse', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25mmouse.png', 1, 'PRAGMATIC', 0),
(3332, 'vs10threestar', 'Three Star Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10threestar.png', 1, 'PRAGMATIC', 0),
(3333, 'vs1ball', 'Lucky Dragon Ball', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1ball.png', 1, 'PRAGMATIC', 0),
(3334, 'vs243lionsgold', '5 Lions', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243lionsgold.png', 1, 'PRAGMATIC', 0),
(3335, 'vs10egyptcls', 'Ancient Egypt Classic', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10egyptcls.png', 1, 'PRAGMATIC', 0),
(3336, 'vs25davinci', 'Da Vinci Treasure', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25davinci.png', 1, 'PRAGMATIC', 0),
(3337, 'vs7776secrets', 'Aztec Treasure', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7776secrets.png', 1, 'PRAGMATIC', 0),
(3338, 'vs25wolfgold', 'Wolf Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25wolfgold.png', 1, 'PRAGMATIC', 0),
(3339, 'vs50safariking', 'Safari King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50safariking.png', 1, 'PRAGMATIC', 0),
(3340, 'vs25peking', 'Peking Luck', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25peking.png', 1, 'PRAGMATIC', 0),
(3341, 'vs25asgard', 'Asgard', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25asgard.png', 1, 'PRAGMATIC', 0),
(3342, 'vs25vegas', 'Vegas Nights', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25vegas.png', 1, 'PRAGMATIC', 0),
(3343, 'vs25scarabqueen', 'John Hunter and the Tomb of the Scarab Queen', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25scarabqueen.png', 1, 'PRAGMATIC', 0),
(3344, 'vs20starlight', 'Starlight Princess', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20starlight.png', 1, 'PRAGMATIC', 0),
(3345, 'vs10bookoftut', 'John Hunter and the Book of Tut', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bookoftut.png', 1, 'PRAGMATIC', 0),
(3346, 'vs9piggybank', 'Piggy Bank Bills', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9piggybank.png', 1, 'PRAGMATIC', 0),
(3347, 'vs5drmystery', 'Dragon Kingdom Mystery', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5drmystery.png', 1, 'PRAGMATIC', 0),
(3348, 'vs20eightdragons', 'Eight Dragons', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20eightdragons.png', 1, 'PRAGMATIC', 0),
(3349, 'vs1024lionsd', '5 Lions Dance', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1024lionsd.png', 1, 'PRAGMATIC', 0),
(3350, 'vs25rio', 'Heart of Rio', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25rio.png', 1, 'PRAGMATIC', 0),
(3351, 'vs10nudgeit', 'Rise of Giza PowerNudge', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10nudgeit.png', 1, 'PRAGMATIC', 0),
(3352, 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bxmasbnza.png', 1, 'PRAGMATIC', 0),
(3353, 'vs20santawonder', 'Santa\'s Wonderland', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20santawonder.png', 1, 'PRAGMATIC', 0),
(3354, 'vs10bblpop', 'Bubble Pop', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bblpop.png', 1, 'PRAGMATIC', 0),
(3355, 'vs25btygold', 'Bounty Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25btygold.png', 1, 'PRAGMATIC', 0),
(3356, 'vs88hockattack', 'Hockey Attack™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs88hockattack.png', 1, 'PRAGMATIC', 0),
(3357, 'vswaysbbb', 'Big Bass Bonanza Megaways™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysbbb.png', 1, 'PRAGMATIC', 0),
(3358, 'vs10bookfallen', 'Book of the Fallen', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bookfallen.png', 1, 'PRAGMATIC', 0),
(3359, 'vs40bigjuan', 'Big Juan', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40bigjuan.png', 1, 'PRAGMATIC', 0),
(3360, 'vs20bermuda', 'John Hunter and the Quest for Bermuda Riches', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20bermuda.png', 1, 'PRAGMATIC', 0),
(3361, 'vs10starpirate', 'Star Pirates Code', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10starpirate.png', 1, 'PRAGMATIC', 0),
(3362, 'vswayswest', 'Mystic Chief', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayswest.png', 1, 'PRAGMATIC', 0),
(3363, 'vs20daydead', 'Day of Dead', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20daydead.png', 1, 'PRAGMATIC', 0),
(3364, 'vs20candvil', 'Candy Village', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20candvil.png', 1, 'PRAGMATIC', 0),
(3365, 'vs20wildboost', 'Wild Booster', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20wildboost.png', 1, 'PRAGMATIC', 0),
(3366, 'vswayshammthor', 'Power of Thor Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayshammthor.png', 1, 'PRAGMATIC', 0),
(3367, 'vs243lions', '5 Lions', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243lions.png', 1, 'PRAGMATIC', 0),
(3368, 'vs5super7', 'Super 7s', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5super7.png', 1, 'PRAGMATIC', 0),
(3369, 'vs1masterjoker', 'Master Joker', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1masterjoker.png', 1, 'PRAGMATIC', 0),
(3370, 'vs20kraken', 'Release the Kraken', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20kraken.png', 1, 'PRAGMATIC', 0),
(3371, 'vs10firestrike', 'Fire Strike', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10firestrike.png', 1, 'PRAGMATIC', 0),
(3372, 'vs243fortune', 'Caishen\'s Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243fortune.png', 1, 'PRAGMATIC', 0),
(3373, 'vs20aladdinsorc', 'Aladdin and the Sorcerrer', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20aladdinsorc.png', 1, 'PRAGMATIC', 0),
(3374, 'vs243fortseren', 'Greek Gods', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243fortseren.png', 1, 'PRAGMATIC', 0),
(3375, 'vs25chilli', 'Chilli Heat', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25chilli.png', 1, 'PRAGMATIC', 0),
(3376, 'vs8magicjourn', 'Magic Journey', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs8magicjourn.png', 1, 'PRAGMATIC', 0),
(3377, 'vs20leprexmas', 'Leprechaun Carol', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20leprexmas.png', 1, 'PRAGMATIC', 0),
(3378, 'vs7pigs', '7 Piggies', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7pigs.png', 1, 'PRAGMATIC', 0),
(3379, 'vs243caishien', 'Caishen\'s Cash', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243caishien.png', 1, 'PRAGMATIC', 0),
(3380, 'vs5joker', 'Joker\'s Jewels', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5joker.png', 1, 'PRAGMATIC', 0),
(3381, 'vs25gladiator', 'Wild Gladiator', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25gladiator.png', 1, 'PRAGMATIC', 0),
(3382, 'vs25goldpig', 'Golden Pig', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25goldpig.png', 1, 'PRAGMATIC', 0),
(3383, 'vs25goldrush', 'Gold Rush', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25goldrush.png', 1, 'PRAGMATIC', 0),
(3384, 'vs25dragonkingdom', 'Dragon Kingdom', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25dragonkingdom.png', 1, 'PRAGMATIC', 0),
(3385, 'vs1dragon8', '888 Dragons', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1dragon8.png', 1, 'PRAGMATIC', 0),
(3386, 'vs5aztecgems', 'Aztec Gems', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5aztecgems.png', 1, 'PRAGMATIC', 0),
(3387, 'vs20hercpeg', 'Hercules and Pegasus', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20hercpeg.png', 1, 'PRAGMATIC', 0),
(3388, 'vs7fire88', 'Fire 88', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7fire88.png', 1, 'PRAGMATIC', 0),
(3389, 'vs20honey', 'Honey Honey Honey', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20honey.png', 1, 'PRAGMATIC', 0),
(3390, 'vs25safari', 'Hot Safari', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25safari.png', 1, 'PRAGMATIC', 0),
(3391, 'vs25journey', 'Journey to the West', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25journey.png', 1, 'PRAGMATIC', 0),
(3392, 'vs20chicken', 'The Great Chicken Escape', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20chicken.png', 1, 'PRAGMATIC', 0),
(3393, 'vs1fortunetree', 'Tree of Riches', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1fortunetree.png', 1, 'PRAGMATIC', 0),
(3394, 'vs20wildpix', 'Wild Pixies', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20wildpix.png', 1, 'PRAGMATIC', 0),
(3395, 'vs15fairytale', 'Fairytale Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs15fairytale.png', 1, 'PRAGMATIC', 0),
(3396, 'vs20santa', 'Santa', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20santa.png', 1, 'PRAGMATIC', 0),
(3397, 'vs10vampwolf', 'Vampires vs Wolves', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10vampwolf.png', 1, 'PRAGMATIC', 0),
(3398, 'vs50aladdin', '3 Genie Wishes', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50aladdin.png', 1, 'PRAGMATIC', 0),
(3399, 'vs50hercules', 'Hercules Son of Zeus', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50hercules.png', 1, 'PRAGMATIC', 0),
(3400, 'vs7776aztec', 'Aztec Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7776aztec.png', 1, 'PRAGMATIC', 0),
(3401, 'vs5trdragons', 'Triple Dragons', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5trdragons.png', 1, 'PRAGMATIC', 0),
(3402, 'vs40madwheel', 'The Wild Machine', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40madwheel.png', 1, 'PRAGMATIC', 0),
(3403, 'vs25newyear', 'Lucky New Year', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25newyear.png', 1, 'PRAGMATIC', 0),
(3404, 'vs40frrainbow', 'Fruit Rainbow', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40frrainbow.png', 1, 'PRAGMATIC', 0),
(3405, 'vs50kingkong', 'Mighty Kong', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50kingkong.png', 1, 'PRAGMATIC', 0),
(3406, 'vs20godiva', 'Lady Godiva', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20godiva.png', 1, 'PRAGMATIC', 0),
(3407, 'vs9madmonkey', 'Monkey Madness', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9madmonkey.png', 1, 'PRAGMATIC', 0),
(3408, 'vs1tigers', 'Triple Tigers', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1tigers.png', 1, 'PRAGMATIC', 0),
(3409, 'vs9chen', 'Master Chen\'s Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9chen.png', 1, 'PRAGMATIC', 0),
(3410, 'vs5hotburn', 'Hot to burn', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5hotburn.png', 1, 'PRAGMATIC', 0),
(3411, 'vs25dwarves_new', 'Dwarven Gold Deluxe', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25dwarves_new.png', 1, 'PRAGMATIC', 0),
(3412, 'vs25sea', 'Great Reef', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25sea.png', 1, 'PRAGMATIC', 0),
(3413, 'vs20leprechaun', 'Leprechaun Song', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20leprechaun.png', 1, 'PRAGMATIC', 0),
(3414, 'vs7monkeys', '7 Monkeys', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7monkeys.png', 1, 'PRAGMATIC', 0),
(3415, 'vs50chinesecharms', 'Lucky Dragons', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50chinesecharms.png', 1, 'PRAGMATIC', 0),
(3416, 'vs18mashang', 'Treasure Horse', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs18mashang.png', 1, 'PRAGMATIC', 0),
(3417, 'vs5spjoker', 'Super Joker', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5spjoker.png', 1, 'PRAGMATIC', 0),
(3418, 'vs20egypttrs', 'Egyptian Fortunes', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20egypttrs.png', 1, 'PRAGMATIC', 0),
(3419, 'vs25queenofgold', 'Queen of Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25queenofgold.png', 1, 'PRAGMATIC', 0),
(3420, 'vs9hotroll', 'Hot Chilli', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9hotroll.png', 1, 'PRAGMATIC', 0),
(3421, 'vs4096jurassic', 'Jurassic Giants', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs4096jurassic.png', 1, 'PRAGMATIC', 0),
(3422, 'vs3train', 'Gold Train', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs3train.png', 1, 'PRAGMATIC', 0),
(3423, 'vs40beowulf', 'Beowulf', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40beowulf.png', 1, 'PRAGMATIC', 0),
(3424, 'vs20bl', 'Busy Bees', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20bl.png', 1, 'PRAGMATIC', 0),
(3425, 'vs1money', 'Money Money Money', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1money.png', 1, 'PRAGMATIC', 0),
(3426, 'vs1600drago', 'Drago - Jewels of Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1600drago.png', 1, 'PRAGMATIC', 0),
(3427, 'vs1fufufu', 'Fu Fu Fu', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1fufufu.png', 1, 'PRAGMATIC', 0),
(3428, 'vs40streetracer', 'Street Racer', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40streetracer.png', 1, 'PRAGMATIC', 0),
(3429, 'vs9aztecgemsdx', 'Aztec Gems Deluxe', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9aztecgemsdx.png', 1, 'PRAGMATIC', 0),
(3430, 'vs20gorilla', 'Jungle Gorilla', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20gorilla.png', 1, 'PRAGMATIC', 0),
(3431, 'vswayswerewolf', 'Curse of the Werewolf Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayswerewolf.png', 1, 'PRAGMATIC', 0),
(3432, 'vswayshive', 'Star Bounty', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayshive.png', 1, 'PRAGMATIC', 0),
(3433, 'vs25samurai', 'Rise of Samurai', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25samurai.png', 1, 'PRAGMATIC', 0),
(3434, 'vs25walker', 'Wild Walker', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25walker.png', 1, 'PRAGMATIC', 0),
(3435, 'vs20goldfever', 'Gems Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20goldfever.png', 1, 'PRAGMATIC', 0),
(3436, 'vs25bkofkngdm', 'Book of Kingdoms', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25bkofkngdm.png', 1, 'PRAGMATIC', 0),
(3437, 'vs10goldfish', 'Fishin Reels', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10goldfish.png', 1, 'PRAGMATIC', 0),
(3438, 'vs1024dtiger', 'The Dragon Tiger', 'https://mxvbet.xyz/uploads/game-134329614054.jpg', 1, 'PRAGMATIC', 1),
(3439, 'vs20xmascarol', 'Christmas Carol Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20xmascarol.png', 1, 'PRAGMATIC', 0),
(3440, 'vs10mayangods', 'John Hunter and the Mayan Gods', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10mayangods.png', 1, 'PRAGMATIC', 0),
(3441, 'vs20bonzgold', 'Bonanza Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20bonzgold.png', 1, 'PRAGMATIC', 0),
(3442, 'vs40voodoo', 'Voodoo Magic', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40voodoo.png', 1, 'PRAGMATIC', 0),
(3443, 'vs25gldox', 'Golden Ox', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25gldox.png', 1, 'PRAGMATIC', 0),
(3444, 'vs10wildtut', 'Mysterious Egypt', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10wildtut.png', 1, 'PRAGMATIC', 0),
(3445, 'vs10eyestorm', 'Eye of the Storm', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10eyestorm.png', 1, 'PRAGMATIC', 0),
(3446, 'vs117649starz', 'Starz Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs117649starz.png', 1, 'PRAGMATIC', 0),
(3447, 'vs10amm', 'The Amazing Money Machine', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10amm.png', 1, 'PRAGMATIC', 0),
(3448, 'vs20magicpot', 'The Magic Cauldron - Enchanted Brew', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20magicpot.png', 1, 'PRAGMATIC', 0),
(3449, 'vswayselements', 'Elemental Gems Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayselements.png', 1, 'PRAGMATIC', 0),
(3450, 'vswayschilheat', 'Chilli Heat Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayschilheat.png', 1, 'PRAGMATIC', 0),
(3451, 'vs10luckcharm', 'Lucky Grace And Charm', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10luckcharm.png', 1, 'PRAGMATIC', 0),
(3452, 'vswaysaztecking', 'Aztec King Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysaztecking.png', 1, 'PRAGMATIC', 0),
(3453, 'vs20phoenixf', 'Phoenix Forge', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20phoenixf.png', 1, 'PRAGMATIC', 0),
(3454, 'vs576hokkwolf', 'Hokkaido Wolf', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs576hokkwolf.png', 1, 'PRAGMATIC', 0),
(3455, 'vs20trsbox', 'Treasure Wild', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20trsbox.png', 1, 'PRAGMATIC', 0),
(3456, 'vs243chargebull', 'Raging Bull', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243chargebull.png', 1, 'PRAGMATIC', 0),
(3457, 'vswaysbankbonz', 'Cash Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysbankbonz.png', 1, 'PRAGMATIC', 0),
(3458, 'vs20pbonanza', 'Pyramid Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20pbonanza.png', 1, 'PRAGMATIC', 0),
(3459, 'vs243empcaishen', 'Emperor Caishen', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243empcaishen.png', 1, 'PRAGMATIC', 0),
(3460, 'vs25tigeryear', 'New Year Tiger Treasures ™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25tigeryear.png', 1, 'PRAGMATIC', 0),
(3461, 'vs20amuleteg', 'Fortune of Giza™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20amuleteg.png', 1, 'PRAGMATIC', 0),
(3462, 'vs10runes', 'Gates of Valhalla™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10runes.png', 1, 'PRAGMATIC', 0),
(3463, 'vs25goldparty', 'Gold Party®', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25goldparty.png', 1, 'PRAGMATIC', 0),
(3464, 'vswaysxjuicy', 'Extra Juicy Megaways™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysxjuicy.png', 1, 'PRAGMATIC', 0),
(3465, 'vs40wanderw', 'Wild Depths™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40wanderw.png', 1, 'PRAGMATIC', 0),
(3466, 'vs4096magician', 'Magician\'s Secrets™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs4096magician.png', 1, 'PRAGMATIC', 0);
INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`) VALUES
(3467, 'vs20smugcove', 'Smugglers Cove™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20smugcove.png', 1, 'PRAGMATIC', 0),
(3468, 'vswayscryscav', 'Crystal Caverns Megaways™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayscryscav.png', 1, 'PRAGMATIC', 0),
(3469, 'vs20superx', 'Super X™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20superx.png', 1, 'PRAGMATIC', 0),
(3470, 'vs20rockvegas', 'Rock Vegas Mega Hold & Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rockvegas.png', 1, 'PRAGMATIC', 0),
(3471, 'vs25copsrobbers', 'Cash Patrol', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25copsrobbers.png', 1, 'PRAGMATIC', 0),
(3472, 'vs20colcashzone', 'Colossal Cash Zone', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20colcashzone.png', 1, 'PRAGMATIC', 0),
(3473, 'vs20ultim5', 'The Ultimate 5', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20ultim5.png', 1, 'PRAGMATIC', 0),
(3474, 'vs20bchprty', 'Wild Beach Party', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20bchprty.png', 1, 'PRAGMATIC', 0),
(3475, 'vs10bookazteck', 'Book of Aztec King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bookazteck.png', 1, 'PRAGMATIC', 0),
(3476, 'vs50mightra', 'Might of Ra', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50mightra.png', 1, 'PRAGMATIC', 0),
(3477, 'vs25bullfiesta', 'Bull Fiesta', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25bullfiesta.png', 1, 'PRAGMATIC', 0),
(3478, 'vs20rainbowg', 'Rainbow Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rainbowg.png', 1, 'PRAGMATIC', 0),
(3479, 'vs10tictac', 'Tic Tac Take', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10tictac.png', 1, 'PRAGMATIC', 0),
(3480, 'vs243discolady', 'Disco Lady', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243discolady.png', 1, 'PRAGMATIC', 0),
(3481, 'vs243queenie', 'Queenie', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243queenie.png', 1, 'PRAGMATIC', 0),
(3482, 'vs20farmfest', 'Barn Festival', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20farmfest.png', 1, 'PRAGMATIC', 0),
(3483, 'vs10chkchase', 'Chicken Chase', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10chkchase.png', 1, 'PRAGMATIC', 0),
(3484, 'vswayswildwest', 'Wild West Gold Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayswildwest.png', 1, 'PRAGMATIC', 0),
(3485, 'vs20mustanggld2', 'Clover Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20mustanggld2.png', 1, 'PRAGMATIC', 0),
(3486, 'vs20drtgold', 'Drill That Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20drtgold.png', 1, 'PRAGMATIC', 0),
(3487, 'vs10spiritadv', 'Spirit of Adventure', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10spiritadv.png', 1, 'PRAGMATIC', 0),
(3488, 'vs10firestrike2', 'Fire Strike 2', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10firestrike2.png', 1, 'PRAGMATIC', 0),
(3489, 'vs40cleoeye', 'Eye of Cleopatra', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40cleoeye.png', 1, 'PRAGMATIC', 0),
(3490, 'vs20gobnudge', 'Goblin Heist Powernudge', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20gobnudge.png', 1, 'PRAGMATIC', 0),
(3491, 'vs20stickysymbol', 'The Great Stick-up', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20stickysymbol.png', 1, 'PRAGMATIC', 0),
(3492, 'vswayszombcarn', 'Zombie Carnival', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayszombcarn.png', 1, 'PRAGMATIC', 0),
(3493, 'vs50northgard', 'North Guardians', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50northgard.png', 1, 'PRAGMATIC', 0),
(3494, 'vs20sugarrush', 'Sugar Rush', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20sugarrush.png', 1, 'PRAGMATIC', 0),
(3495, 'vs20cleocatra', 'Cleocatra', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20cleocatra.png', 1, 'PRAGMATIC', 0),
(3496, 'vs5littlegem', 'Little Gem Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5littlegem.png', 1, 'PRAGMATIC', 0),
(3497, 'vs10egrich', 'Queen of Gods', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10egrich.png', 1, 'PRAGMATIC', 0),
(3498, 'vs243koipond', 'Koi Pond', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs243koipond.png', 1, 'PRAGMATIC', 0),
(3499, 'vs40samurai3', 'Rise of Samurai 3', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40samurai3.png', 1, 'PRAGMATIC', 0),
(3500, 'vs40cosmiccash', 'Cosmic Cash', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40cosmiccash.png', 1, 'PRAGMATIC', 0),
(3501, 'vs25bomb', 'Bomb Bonanza', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs25bomb.png', 1, 'PRAGMATIC', 0),
(3502, 'vs1024mahjpanda', 'Mahjong Panda', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs1024mahjpanda.png', 1, 'PRAGMATIC', 0),
(3503, 'vs10coffee', 'Coffee Wild', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10coffee.png', 1, 'PRAGMATIC', 0),
(3504, 'vs100sh', 'Shining Hot 100', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs100sh.png', 1, 'PRAGMATIC', 0),
(3505, 'vs20sh', 'Shining Hot 20', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20sh.png', 1, 'PRAGMATIC', 0),
(3506, 'vs40sh', 'Shining Hot 40', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40sh.png', 1, 'PRAGMATIC', 0),
(3507, 'vs5sh', 'Shining Hot 5', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs5sh.png', 1, 'PRAGMATIC', 0),
(3508, 'vswaysjkrdrop', 'Tropical Tiki', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswaysjkrdrop.png', 1, 'PRAGMATIC', 0),
(3509, 'vs243ckemp', 'Cheeky Emperor', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs243ckemp.png', 1, 'PRAGMATIC', 0),
(3510, 'vs40hotburnx', 'Hot To Burn Extreme', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40hotburnx.png', 1, 'PRAGMATIC', 0),
(3511, 'vs1024gmayhem', 'Gorilla Mayhem', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs1024gmayhem.png', 1, 'PRAGMATIC', 0),
(3512, 'vs20octobeer', 'Octobeer Fortunes', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20octobeer.png', 1, 'PRAGMATIC', 0),
(3513, 'vs10txbigbass', 'Big Bass Splash', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10txbigbass.png', 1, 'PRAGMATIC', 0),
(3514, 'vs100firehot', 'Fire Hot 100', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs100firehot.png', 1, 'PRAGMATIC', 0),
(3515, 'vs20fh', 'Fire Hot 20', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20fh.png', 1, 'PRAGMATIC', 0),
(3516, 'vs40firehot', 'Fire Hot 40', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40firehot.png', 1, 'PRAGMATIC', 0),
(3517, 'vs5firehot', 'Fire Hot 5', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs5firehot.png', 1, 'PRAGMATIC', 0),
(3518, 'vs20wolfie', 'Greedy Wolf', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20wolfie.png', 1, 'PRAGMATIC', 0),
(3519, 'vs20underground', 'Down the Rails', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20underground.png', 1, 'PRAGMATIC', 0),
(3520, 'vs10mmm', 'Magic Money Maze', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10mmm.png', 1, 'PRAGMATIC', 0),
(3521, 'vswaysfltdrg', 'Floating Dragon Hold & Spin Megaways', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswaysfltdrg.png', 1, 'PRAGMATIC', 0),
(3522, 'vs20trswild2', 'Black Bull', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20trswild2.png', 1, 'PRAGMATIC', 0),
(3523, 'vswaysstrwild', 'Candy Stars', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswaysstrwild.png', 1, 'PRAGMATIC', 0),
(3524, 'vs10crownfire', 'Crown of Fire', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10crownfire.png', 1, 'PRAGMATIC', 0),
(3525, 'vs20muertos', 'Muertos Multiplier Megaways', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20muertos.png', 1, 'PRAGMATIC', 0),
(3526, 'vswayslofhero', 'Legend of Heroes', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswayslofhero.png', 1, 'PRAGMATIC', 0),
(3527, 'vs5strh', 'Striking Hot 5', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs5strh.png', 1, 'PRAGMATIC', 0),
(3528, 'vs10snakeeyes', 'Snakes & Ladders - Snake Eyes', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10snakeeyes.png', 1, 'PRAGMATIC', 0),
(3529, 'vswaysbook', 'Book of Golden Sands', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswaysbook.png', 1, 'PRAGMATIC', 0),
(3530, 'vs20mparty', 'Wild Hop and Drop', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20mparty.png', 1, 'PRAGMATIC', 0),
(3531, 'vs20swordofares', 'Sword of Ares', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20swordofares.png', 1, 'PRAGMATIC', 0),
(3532, 'vswaysfrywld', 'Spin & Score Megaways', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14187.png', 1, 'PRAGMATIC', 0),
(3533, 'vs12bbbxmas', 'Bigger Bass Blizzaro', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14192.jpg', 1, 'PRAGMATIC', 0),
(3534, 'vs25kfruit', 'Aztec Blaze', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14236.jpg', 1, 'PRAGMATIC', 0),
(3535, 'vswaysconcoll', 'Sweet PowerNudge™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14240.jpg', 1, 'PRAGMATIC', 0),
(3536, 'vs20schristmas', 'Starlight Chrismas', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14241.jpg', 1, 'PRAGMATIC', 0),
(3537, 'vs20lcount', 'Gems of Serengeti™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14257.jpg', 1, 'PRAGMATIC', 0),
(3538, 'vs20sparta', 'Shield of Sparta', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14259.jpg', 1, 'PRAGMATIC', 0),
(3539, 'vs10bbkir', 'Big Bass Bonanza Keeping it Reel', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14275.jpg', 1, 'PRAGMATIC', 0),
(3540, 'vswaysluckyfish', 'Lucky Fishing Megaways™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14276.jpg', 1, 'PRAGMATIC', 0),
(3541, 'vs20drgbless', 'Dragon Hero', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14282.jpg', 1, 'PRAGMATIC', 0),
(3542, 'vswayspizza', 'Pizza Pizza Pizza', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14324.jpg', 1, 'PRAGMATIC', 0),
(3543, 'vs20dugems', 'Hot Pepper™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14327.jpg', 1, 'PRAGMATIC', 0),
(3544, 'vs20clspwrndg', 'Sweet PowerNudge', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14328.jpg', 1, 'PRAGMATIC', 0),
(3545, 'vswaysfuryodin', 'Fury of Odin Megaways™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14337.jpg', 1, 'PRAGMATIC', 0),
(3546, 'vs20sugarcoins', 'Viking Forge', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sugarcoins.png', 1, 'PRAGMATIC', 0),
(3547, 'vs20dhcluster', 'Twilight Princess', 'https://api-2103.ppgames.net/game_pic/square/200/vs20dhcluster.png', 1, 'PRAGMATIC', 0),
(3548, 'vs20olympgrace', 'Grace of Ebisu', 'https://api-2103.ppgames.net/game_pic/square/200/vs20olympgrace.png', 1, 'PRAGMATIC', 0),
(3549, 'vs20starlightx', 'Starlight Princess 1000', 'https://api-2103.ppgames.net/game_pic/square/200/vs20starlightx.png', 1, 'PRAGMATIC', 0),
(3550, 'vswaysmoneyman', 'The Money Men Megaways', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmoneyman.png', 1, 'PRAGMATIC', 0),
(3551, 'vs40demonpots', 'Demon Pots', 'https://api-2103.ppgames.net/game_pic/square/200/vs40demonpots.png', 1, 'PRAGMATIC', 0),
(3552, 'vswaystut', 'John Hunter and the Book of Tut Megaways', 'https://api-2103.ppgames.net/game_pic/square/200/vswaystut.png', 1, 'PRAGMATIC', 0),
(3553, 'vs10gdchalleng', '8 Golden Dragon Challenge', 'https://api-2103.ppgames.net/game_pic/square/200/vs10gdchalleng.png', 1, 'PRAGMATIC', 0),
(3554, 'vs20yisunshin', 'Yi Sun Shin', 'https://api-2103.ppgames.net/game_pic/square/200/vs20yisunshin.png', 1, 'PRAGMATIC', 0),
(3555, 'vs20candyblitz', 'Candy Blitz', 'https://api-2103.ppgames.net/game_pic/square/200/vs20candyblitz.png', 1, 'PRAGMATIC', 0),
(3556, 'vswaysstrlght', 'Fortunes of Aztec', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysstrlght.png', 1, 'PRAGMATIC', 0),
(3557, 'vs40infwild', 'Infective Wild', 'https://api-2103.ppgames.net/game_pic/square/200/vs40infwild.png', 1, 'PRAGMATIC', 0),
(3558, 'vs20gravity', 'Gravity Bonanza', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gravity.png', 1, 'PRAGMATIC', 0),
(3559, 'vs40rainbowr', 'Rainbow Reels', 'https://api-2103.ppgames.net/game_pic/square/200/vs40rainbowr.png', 1, 'PRAGMATIC', 0),
(3560, 'vs20bnnzdice', 'Sweet Bonanza Dice', 'https://api-2103.ppgames.net/game_pic/square/200/vs20bnnzdice.png', 1, 'PRAGMATIC', 0),
(3561, 'vs10bhallbnza', 'Big Bass Halloween', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bhallbnza.png', 1, 'PRAGMATIC', 0),
(3562, 'vswaysraghex', 'Tundra\'s Fortune', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysraghex.png', 1, 'PRAGMATIC', 0),
(3563, 'vs20maskgame', 'Cash Chips', 'https://api-2103.ppgames.net/game_pic/square/200/vs20maskgame.png', 1, 'PRAGMATIC', 0),
(3564, 'vs5gemstone', 'Gemstone', 'https://api-2103.ppgames.net/game_pic/square/200/vs5gemstone.png', 1, 'PRAGMATIC', 0),
(3565, 'vs1024mahjwins', 'Mahjong Wins', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024mahjwins.png', 1, 'PRAGMATIC', 0),
(3566, 'vs20procount', 'Wisdom of Athena', 'https://api-2103.ppgames.net/game_pic/square/200/vs20procount.png', 1, 'PRAGMATIC', 0),
(3567, 'vs20forge', 'Forge of Olympus', 'https://api-2103.ppgames.net/game_pic/square/200/vs20forge.png', 1, 'PRAGMATIC', 0),
(3568, 'vswaysbbhas', 'Big Bass Hold & Spinner Megaways', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysbbhas.png', 1, 'PRAGMATIC', 0),
(3569, 'vs20earthquake', 'Cyclops Smash', 'https://api-2103.ppgames.net/game_pic/square/200/vs20earthquake.png', 1, 'PRAGMATIC', 0),
(3570, 'vs20saiman', 'Saiyan Mania', 'https://api-2103.ppgames.net/game_pic/square/200/vs20saiman.png', 1, 'PRAGMATIC', 0),
(3571, 'vs20piggybank', 'Piggy Bankers', 'https://api-2103.ppgames.net/game_pic/square/200/vs20piggybank.png', 1, 'PRAGMATIC', 0),
(3572, 'vs20lvlup', 'Pub Kings', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lvlup.png', 1, 'PRAGMATIC', 0),
(3573, 'vs10trail', 'Mustang Trail', 'https://api-2103.ppgames.net/game_pic/square/200/vs10trail.png', 1, 'PRAGMATIC', 0),
(3574, 'vs20supermania', 'Supermania', 'https://api-2103.ppgames.net/game_pic/square/200/vs20supermania.png', 1, 'PRAGMATIC', 0),
(3575, 'vs50dmdcascade', 'Diamond Cascade', 'https://api-2103.ppgames.net/game_pic/square/200/vs50dmdcascade.png', 1, 'PRAGMATIC', 0),
(3576, 'vs20lobcrab', 'Lobster Bob\'s Crazy Crab Shack', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lobcrab.png', 1, 'PRAGMATIC', 0),
(3577, 'vs20wildparty', '3 Buzzing Wilds', 'https://api-2103.ppgames.net/game_pic/square/200/vs20wildparty.png', 1, 'PRAGMATIC', 0),
(3578, 'vs20doghousemh', 'The Dog House Multihold', 'https://api-2103.ppgames.net/game_pic/square/200/vs20doghousemh.png', 1, 'PRAGMATIC', 0),
(3579, 'vs20splmystery', 'Spellbinding Mystery', 'https://api-2103.ppgames.net/game_pic/square/200/vs20splmystery.png', 1, 'PRAGMATIC', 0),
(3580, 'vs20cashmachine', 'Cash Box', 'https://api-2103.ppgames.net/game_pic/square/200/vs20cashmachine.png', 1, 'PRAGMATIC', 0),
(3581, 'vs50jucier', 'Sky Bounty', 'https://api-2103.ppgames.net/game_pic/square/200/vs50jucier.png', 1, 'PRAGMATIC', 0),
(3582, 'vs243nudge4gold', 'Hellvis Wild', 'https://api-2103.ppgames.net/game_pic/square/200/vs243nudge4gold.png', 1, 'PRAGMATIC', 0),
(3583, 'vs25jokrace', 'Joker Race', 'https://api-2103.ppgames.net/game_pic/square/200/vs25jokrace.png', 1, 'PRAGMATIC', 0),
(3584, 'vs20hstgldngt', 'Heist for the Golden Nuggets', 'https://api-2103.ppgames.net/game_pic/square/200/vs20hstgldngt.png', 1, 'PRAGMATIC', 0),
(3585, 'vs20beefed', 'Fat Panda', 'https://api-2103.ppgames.net/game_pic/square/200/vs20beefed.png', 1, 'PRAGMATIC', 0),
(3586, 'vs20jewelparty', 'Jewel Rush', 'https://api-2103.ppgames.net/game_pic/square/200/vs20jewelparty.png', 1, 'PRAGMATIC', 0),
(3587, 'vs9outlaw', 'Pirates Pub', 'https://api-2103.ppgames.net/game_pic/square/200/vs9outlaw.png', 1, 'PRAGMATIC', 0),
(3588, 'vswaysfrbugs', 'Frogs & Bugs', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysfrbugs.png', 1, 'PRAGMATIC', 0),
(3589, 'vs20lampinf', 'Lamp Of Infinity', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lampinf.png', 1, 'PRAGMATIC', 0),
(3590, 'vs4096robber', 'Robber Strike', 'https://api-2103.ppgames.net/game_pic/square/200/vs4096robber.png', 1, 'PRAGMATIC', 0),
(3591, 'vs10fdrasbf', 'Floating Dragon - Dragon Boat Festival', 'https://api-2103.ppgames.net/game_pic/square/200/vs10fdrasbf.png', 1, 'PRAGMATIC', 0),
(3592, 'vs20clustwild', 'Sticky Bees', 'https://api-2103.ppgames.net/game_pic/square/200/vs20clustwild.png', 1, 'PRAGMATIC', 0),
(3593, 'vs25spotz', 'Knight Hot Spotz', 'https://api-2103.ppgames.net/game_pic/square/200/vs25spotz.png', 1, 'PRAGMATIC', 0),
(3594, 'vs20excalibur', 'Excalibur Unleashed', 'https://api-2103.ppgames.net/game_pic/square/200/vs20excalibur.png', 1, 'PRAGMATIC', 0),
(3595, 'vs20stickywild', 'Wild Bison Charge', 'https://api-2103.ppgames.net/game_pic/square/200/vs20stickywild.png', 1, 'PRAGMATIC', 0),
(3596, 'vs25holiday', 'Holiday Ride', 'https://api-2103.ppgames.net/game_pic/square/200/vs25holiday.png', 1, 'PRAGMATIC', 0),
(3597, 'vs20mvwild', 'Jasmine Dreams', 'https://api-2103.ppgames.net/game_pic/square/200/vs20mvwild.png', 1, 'PRAGMATIC', 0),
(3598, 'vs10kingofdth', 'Kingdom of the Dead', 'https://api-2103.ppgames.net/game_pic/square/200/vs10kingofdth.png', 1, 'PRAGMATIC', 0),
(3599, 'vswaysultrcoin', 'Cowboy Coins', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysultrcoin.png', 1, 'PRAGMATIC', 0),
(3600, 'vs10gizagods', 'Gods of Giza', 'https://api-2103.ppgames.net/game_pic/square/200/vs10gizagods.png', 1, 'PRAGMATIC', 0),
(3601, 'vswaysrsm', 'Wild Celebrity Bus Megaways', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysrsm.png', 1, 'PRAGMATIC', 0),
(3602, 'vswaysmonkey', '3 Dancing Monkeys', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmonkey.png', 1, 'PRAGMATIC', 0),
(3603, 'vs20hotzone', 'African Elephant', 'https://api-2103.ppgames.net/game_pic/square/200/vs20hotzone.png', 1, 'PRAGMATIC', 0),
(3604, 'vs10bbhas', 'Big Bass - Hold & Spinner', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bbhas.png', 1, 'PRAGMATIC', 0),
(3605, 'vs1024moonsh', 'Moonshot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024moonsh.png', 1, 'PRAGMATIC', 0),
(3606, 'vswaysredqueen', 'The Red Queen', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysredqueen.png', 1, 'PRAGMATIC', 0),
(3607, 'vs20framazon', 'Fruits of the Amazon', 'https://api-2103.ppgames.net/game_pic/square/200/vs20framazon.png', 1, 'PRAGMATIC', 0),
(3608, 'vs20sknights', 'The Knight King', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sknights.png', 1, 'PRAGMATIC', 0),
(3609, 'vs20goldclust', 'Rabbit Garden', 'https://api-2103.ppgames.net/game_pic/square/200/vs20goldclust.png', 1, 'PRAGMATIC', 0),
(3610, 'vswaysmorient', 'Mystery of the Orient', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmorient.png', 1, 'PRAGMATIC', 0),
(3611, 'vs10powerlines', 'Peak Power', 'https://api-2103.ppgames.net/game_pic/square/200/vs10powerlines.png', 1, 'PRAGMATIC', 0),
(3612, 'vs12tropicana', 'Club Tropicana', 'https://api-2103.ppgames.net/game_pic/square/200/vs12tropicana.png', 1, 'PRAGMATIC', 0),
(3613, 'vs25archer', 'Fire Archer', 'https://api-2103.ppgames.net/game_pic/square/200/vs25archer.png', 1, 'PRAGMATIC', 0),
(3614, 'vs20gatotfury', 'Gatot Kaca\'s Fury', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gatotfury.png', 1, 'PRAGMATIC', 0),
(3615, 'vs20mochimon', 'Mochimon', 'https://api-2103.ppgames.net/game_pic/square/200/vs20mochimon.png', 1, 'PRAGMATIC', 0),
(3616, 'vs10fisheye', 'Fish Eye', 'https://api-2103.ppgames.net/game_pic/square/200/vs10fisheye.png', 1, 'PRAGMATIC', 0),
(3617, 'vs20superlanche', 'Monster Superlanche', 'https://api-2103.ppgames.net/game_pic/square/200/vs20superlanche.png', 1, 'PRAGMATIC', 0),
(3618, 'vswaysftropics', 'Frozen Tropics', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysftropics.png', 1, 'PRAGMATIC', 0),
(3619, 'vswaysincwnd', 'Gold Oasis', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysincwnd.png', 1, 'PRAGMATIC', 0),
(3620, 'vs25spgldways', 'Secret City Gold', 'https://api-2103.ppgames.net/game_pic/square/200/vs25spgldways.png', 1, 'PRAGMATIC', 0),
(3621, 'vswayswwhex', 'Wild Wild Bananas', 'https://api-2103.ppgames.net/game_pic/square/200/vswayswwhex.png', 1, 'PRAGMATIC', 0),
(3622, 'prosper-ftree', 'Prosperity Fortune Tree', 'https://mxvbet.xyz/uploads/game-164668899011.webp', 1, 'PGSOFT', 1),
(3623, 'pnkk4iuchw7blb2p', 'Dragonara Roulette', 'https://evolution.bet4wins.net/assets/banner/DragonaraRoulette.webp', 1, 'EVOLUTION', 0),
(3624, 'MonBigBaller0001', 'MONOPOLY Big Baller', 'https://mxvbet.xyz/uploads/game-60672771801.jpg', 1, 'EVOLUTION', 0),
(3625, 'lr6t4k3lcd4qgyrk', 'Grand Casino Roulette', 'https://evolution.bet4wins.net/assets/banner/grand_casino.webp', 1, 'EVOLUTION', 0),
(3626, 'rep5ca4ynyjl7wdw', 'Speed Baccarat 7', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat7.webp', 1, 'EVOLUTION', 0),
(3627, 'mrpuiwhx5slaurcy', 'Hippodrome Grand Casino', 'https://evolution.bet4wins.net/assets/banner/hippodrome_grand.webp', 1, 'EVOLUTION', 0),
(3628, 'Monopoly00000001', 'MONOPOLY Live', 'https://evolution.bet4wins.net/assets/banner/monopoly.webp', 1, 'EVOLUTION', 0),
(3629, 'TRLRou0000000001', 'Türkçe Lightning Rulet', 'https://evolution.bet4wins.net/assets/banner/TurkishLightningRoulette.webp', 1, 'EVOLUTION', 0),
(3630, 'mvrcophqscoqosd6', 'Casino Malta Roulette', 'https://evolution.bet4wins.net/assets/banner/casino_malta.webp', 1, 'EVOLUTION', 0),
(3631, 'rep5eiecnyjl75lq', 'Speed Baccarat 8', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat8.webp', 1, 'EVOLUTION', 0),
(3632, 'rep5aor7nyjl7qli', 'Speed Baccarat 6', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat6.webp', 1, 'EVOLUTION', 0),
(3633, '541000', 'Ultimate Roulette', 'https://ezugi.bet4wins.net/assets/banner/UltimateRoulette.webp', 1, 'EZUGI', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico_play`
--

CREATE TABLE `historico_play` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nome_game` text NOT NULL,
  `bet_money` decimal(10,2) NOT NULL DEFAULT 0.00,
  `win_money` decimal(10,2) NOT NULL DEFAULT 0.00,
  `txn_id` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status_play` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs_acessos_adm`
--

CREATE TABLE `logs_acessos_adm` (
  `id` int(11) NOT NULL,
  `id_adm` int(11) NOT NULL,
  `entrada` time NOT NULL,
  `saida` time DEFAULT NULL,
  `token` text NOT NULL,
  `data_cad` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pay_valores_cassino`
--

CREATE TABLE `pay_valores_cassino` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 0 COMMENT '0: CPA / 1: REV / 2: GAMES',
  `data_time` datetime NOT NULL,
  `game` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `populares`
--

CREATE TABLE `populares` (
  `id` int(11) NOT NULL,
  `game_code` varchar(20) NOT NULL,
  `game_name` varchar(100) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `provider` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `provedores`
--

CREATE TABLE `provedores` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `provedores`
--

INSERT INTO `provedores` (`id`, `code`, `name`, `type`, `status`) VALUES
(39, 'PRAGMATIC', 'Pragmatic Play', 'slot', 1),
(40, 'HABANERO', 'Habanero', 'slot', 1),
(41, 'BOOONGO', 'Booongo', 'slot', 1),
(42, 'PLAYSON', 'Playson', 'slot', 1),
(43, 'CQ9', 'CQ9', 'slot', 1),
(44, 'EVOPLAY', 'Evoplay', 'slot', 1),
(45, 'TOPTREND', 'TopTrend Gaming', 'slot', 1),
(46, 'DREAMTECH', 'DreamTech', 'slot', 1),
(47, 'PGSOFT', 'PG Soft', 'slot', 1),
(48, 'REELKINGDOM', 'Reel Kingdom', 'slot', 1),
(49, 'EZUGI', 'Ezugi', 'live', 1),
(50, 'EVOLUTION', 'Evolution', 'live', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao_saques`
--

CREATE TABLE `solicitacao_saques` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `transacao_id` text NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` text NOT NULL,
  `pix` text NOT NULL,
  `data_cad` date NOT NULL,
  `data_hora` time NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `data_att` datetime DEFAULT NULL,
  `tipo_saque` int(11) NOT NULL DEFAULT 0 COMMENT '0: cassino / 1: afiliados'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `suitpay`
--

CREATE TABLE `suitpay` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `client_id` text DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `atualizado` varchar(45) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `suitpay`
--

INSERT INTO `suitpay` (`id`, `url`, `client_id`, `client_secret`, `atualizado`, `ativo`) VALUES
(1, 'https://ws.suitpay.app', '...', '...', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tema`
--

CREATE TABLE `tema` (
  `id` int(11) NOT NULL,
  `cor_padrao` varchar(45) DEFAULT NULL,
  `custom_css` longtext DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `status_topheader` int(11) NOT NULL DEFAULT 0,
  `cor_topheader` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `tema`
--

INSERT INTO `tema` (`id`, `cor_padrao`, `custom_css`, `texto`, `status_topheader`, `cor_topheader`) VALUES
(0, '#9BCD10', '', '#FFFFFF', 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(11) NOT NULL,
  `transacao_id` varchar(255) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `tipo` enum('deposito','saque') DEFAULT NULL,
  `data_hora` varchar(255) DEFAULT NULL,
  `qrcode` text DEFAULT NULL,
  `code` text DEFAULT NULL,
  `status` enum('pago','processamento') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `token_refer` text DEFAULT NULL,
  `nascimento` varchar(50) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `afiliado` varchar(255) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `cep` text DEFAULT NULL,
  `chave_pix` text DEFAULT NULL,
  `data_cad` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `visita_site`
--

CREATE TABLE `visita_site` (
  `id` int(11) NOT NULL,
  `nav_os` text DEFAULT NULL,
  `mac_os` text DEFAULT NULL,
  `ip_visita` text DEFAULT NULL,
  `refer_visita` text DEFAULT NULL,
  `data_cad` date DEFAULT NULL,
  `hora_cad` time DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `pais` text DEFAULT NULL,
  `cidade` text DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `ads_tipo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `visita_site`
--

INSERT INTO `visita_site` (`id`, `nav_os`, `mac_os`, `ip_visita`, `refer_visita`, `data_cad`, `hora_cad`, `id_user`, `pais`, `cidade`, `estado`, `ads_tipo`) VALUES
(46, 'Chrome', 'Windows 10', '46.183.221.197', 'https://brsbet.online/', '2023-12-18', '01:02:24', 1, 'Latvia', 'Riga', 'Riga', NULL),
(47, 'Unknown Browser', 'iPhone', '66.220.149.8', 'https://brsbet.online/?fbclid=IwAR1krR2a3yHT88rZHIigRZfmJ5Erbmg8okFvX4LcIAo-kNQDiIEVhOvypXM', '2023-12-18', '01:03:15', 1, 'United States', 'Menlo Park', 'California', NULL),
(48, 'Firefox', 'Linux', '113.30.153.7', 'https://brsbet.online/', '2023-12-18', '01:04:18', 1, 'United States', 'Jerusalem', 'Ohio', NULL),
(49, 'Handheld Browser', 'Android', '185.67.34.70', 'https://brsbet.online/', '2023-12-18', '01:04:31', 1, 'Turkey', 'Ankara', 'Ankara', NULL),
(50, 'Chrome', 'Mac OS X', '44.203.122.123', 'https://brsbet.online/', '2023-12-18', '01:06:03', 1, 'United States', 'Ashburn', 'Virginia', NULL),
(51, 'Chrome', 'Windows 7', '34.122.89.224', 'https://brsbet.online/', '2023-12-18', '01:09:20', 1, 'United States', 'Council Bluffs', 'Iowa', NULL),
(52, 'Chrome', 'Mac OS X', '104.164.173.99', 'https://brsbet.online/', '2023-12-18', '01:09:37', 1, 'United States', 'San Jose', 'California', NULL),
(53, 'Chrome', 'Linux', '154.28.229.116', 'https://brsbet.online/', '2023-12-18', '01:09:41', 1, 'United States', 'Charlotte', 'North Carolina', NULL),
(54, 'Firefox', 'Linux', '54.247.57.72', 'https://www.brsbet.online/', '2023-12-18', '01:14:06', 1, 'Ireland', 'Dublin', 'Leinster', NULL),
(55, 'Unknown Browser', 'Windows 10', '45.77.99.178', 'https://brsbet.online/', '2023-12-18', '01:15:05', 1, 'United States', 'Piscataway', 'New Jersey', NULL),
(56, 'Unknown Browser', 'Windows 10', '15.204.137.225', 'https://brsbet.online/', '2023-12-18', '01:15:06', 1, 'United States', 'Palo Alto', 'California', NULL),
(57, 'Safari', 'Mac OS X', '93.119.227.91', 'https://brsbet.online/', '2023-12-18', '01:17:16', 1, 'Romania', 'Suceava', 'Suceava', NULL),
(58, 'Chrome', 'Windows 7', '8.215.42.88', 'https://brsbet.online/', '2023-12-18', '01:17:34', 1, 'Indonesia', 'Jakarta', 'Jakarta', NULL),
(59, 'Chrome', 'Windows 10', '82.199.130.38', 'https://brsbet.online/', '2023-12-18', '01:52:04', 1, 'United Kingdom', 'Blackwall', 'England', NULL),
(60, 'Handheld Browser', 'iPhone', '128.90.61.22', 'https://brsbet.online/', '2023-12-18', '02:06:10', 1, 'United States', 'Austin', 'Texas', NULL),
(61, 'Handheld Browser', 'iPhone', '172.94.84.2', 'https://brsbet.online/', '2023-12-18', '02:06:10', 1, 'Spain', 'Madrid', 'Madrid', NULL),
(62, 'Handheld Browser', 'iPhone', '104.244.209.39', 'https://brsbet.online/', '2023-12-18', '02:06:11', 1, 'United States', 'Saline', 'Michigan', NULL),
(63, 'Chrome', 'Windows 10', '84.17.42.45', 'https://brsbet.online/', '2023-12-18', '02:06:13', 1, 'France', 'Paris', 'Ile-de-France', NULL),
(64, 'Unknown Browser', 'Android', '31.6.10.39', 'https://brsbet.online/', '2023-12-18', '02:07:06', 1, 'Egypt', 'Cairo', 'Cairo Governorate', NULL),
(65, 'Safari', 'Mac OS X', '165.231.253.254', 'https://brsbet.online/', '2023-12-18', '02:07:06', 1, 'India', 'Mumbai', 'Maharashtra', NULL),
(66, 'Handheld Browser', 'iPhone', '104.255.169.118', 'https://brsbet.online/', '2023-12-18', '02:07:06', 1, 'United States', 'Melbourne', 'Florida', NULL),
(67, 'Safari', 'Mac OS X', '128.90.104.55', 'https://brsbet.online/', '2023-12-18', '02:07:08', 1, 'Algeria', 'Algiers', 'Algiers Province', NULL),
(68, 'Handheld Browser', 'iPhone', '87.89.48.69', 'http://brsbet.online/', '2023-12-18', '02:07:52', 1, 'France', 'Roubaix', 'Hauts-de-France', NULL),
(69, 'Chrome', 'Mac OS X', '104.129.56.71', 'http://brsbet.online/', '2023-12-18', '02:07:54', 1, 'United States', 'Kent', 'Washington', NULL),
(70, 'Handheld Browser', 'Android', '133.242.174.119', 'https://www.brsbet.online/', '2023-12-18', '03:57:51', 1, 'Japan', 'Tokyo', 'Tokyo', NULL),
(71, 'Chrome', 'Windows 10', '96.9.249.36', 'https://brsbet.online/', '2023-12-18', '04:09:28', 1, 'United States', 'Buffalo', 'New York', NULL),
(72, 'Chrome', 'Windows 10', '46.228.199.158', 'https://brsbet.online/', '2023-12-18', '04:13:09', 1, 'Germany', 'Dusseldorf', 'Nordrhein-Westfalen', NULL),
(73, 'Chrome', 'Windows 10', '51.159.214.65', 'https://brsbet.online/', '2023-12-18', '06:33:40', 1, 'France', 'Paris', 'Ile-de-France', NULL),
(74, 'Handheld Browser', 'Android', '171.244.43.14', 'https://www.brsbet.online/', '2023-12-18', '07:43:47', 1, 'Vietnam', 'Hanoi', 'Hanoi', NULL),
(75, 'Chrome', 'Windows 10', '36.99.136.142', 'http://brsbet.online', '2023-12-18', '08:33:29', 1, 'China', 'Hangzhou', 'Zhejiang', NULL),
(76, 'Chrome', 'Windows 10', '2804:14d:be88:8a71:3850:daea:de11:eadb', 'https://mxvbet.xyz/', '2023-12-29', '13:27:35', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(77, 'Handheld Browser', 'iPhone', '43.128.68.127', 'http://www.mxvbet.xyz', '2023-12-29', '13:40:27', 1, 'Singapore', 'Singapore', '', NULL),
(78, 'Handheld Browser', 'iPhone', '2001:818:e8da:6900:a85b:47a8:edf4:4279', 'https://mxvbet.xyz/', '2023-12-29', '13:49:59', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(79, 'Firefox', 'Windows 10', '2804:29b8:5158:5fe:f533:b8d3:2740:864', 'https://mxvbet.xyz/', '2023-12-29', '13:54:20', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(80, 'Handheld Browser', 'iPhone', '170.106.82.193', 'http://mxvbet.xyz', '2023-12-29', '15:01:44', 1, 'United States', 'San Francisco', 'California', NULL),
(81, 'Chrome', 'Windows 10', '164.152.195.40', 'https://mxvbet.xyz/', '2023-12-29', '15:03:19', 1, 'Brazil', 'Praia Grande', 'Sao Paulo', NULL),
(82, 'Handheld Browser', 'Android', '23.111.114.116', 'https://mxvbet.xyz/', '2023-12-29', '15:39:40', 1, 'Russia', 'Moscow', 'Moscow', NULL),
(83, 'Chrome', 'Windows 10', '2804:14d:5880:9357:8976:d3ee:963b:14a', 'https://mxvbet.xyz/', '2023-12-29', '15:44:27', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(84, 'Handheld Browser', 'iPhone', '187.26.200.52', 'https://mxvbet.xyz/', '2023-12-29', '15:44:47', 1, 'Brazil', 'Maringa', 'Parana', NULL),
(85, 'Chrome', 'Mac OS X', '47.242.182.173', 'https://mxvbet.xyz/', '2023-12-29', '16:33:12', 1, 'Hong Kong', 'Hong Kong', 'Southern', NULL),
(86, 'Chrome', 'Mac OS X', '47.243.15.50', 'https://www.mxvbet.xyz/', '2023-12-29', '16:33:23', 1, 'Hong Kong', 'Hong Kong', 'Southern', NULL),
(87, 'Handheld Browser', 'iPhone', '179.211.190.83', 'https://mxvbet.xyz/', '2023-12-29', '16:38:05', 1, 'Brazil', 'Natal', 'Rio Grande do Norte', NULL),
(88, 'Handheld Browser', 'iPhone', '190.111.150.140', 'https://mxvbet.xyz/', '2023-12-29', '16:48:43', 1, 'Brazil', 'Planaltina', 'Goias', NULL),
(89, 'Chrome', 'Windows 10', '2804:7490:89ce:c900:7486:85c:38d:424', 'https://mxvbet.xyz/', '2023-12-29', '17:44:33', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(90, 'Chrome', 'Windows 10', '200.71.118.8', 'https://mxvbet.xyz/', '2023-12-29', '18:01:53', 1, 'Brazil', 'Bituruna', 'Parana', NULL),
(91, 'Handheld Browser', 'iPhone', '129.226.146.179', 'http://www.mxvbet.xyz', '2023-12-29', '18:01:55', 1, 'Singapore', 'Singapore', '', NULL),
(92, 'Handheld Browser', 'iPhone', '143.208.127.90', 'https://mxvbet.xyz/', '2023-12-29', '18:36:12', 1, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(93, 'Handheld Browser', 'iPhone', '2804:2af0:2dd:3700:6098:6ad2:39a8:761d', 'https://mxvbet.xyz/', '2023-12-29', '18:54:24', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(94, 'Handheld Browser', 'iPhone', '2a09:bac5:58c2:2c8::47:560', 'https://mxvbet.xyz/', '2023-12-29', '19:05:37', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(95, 'Chrome', 'Windows 10', '138.36.56.244', 'https://web.telegram.org/', '2023-12-29', '19:05:38', 1, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(96, 'Handheld Browser', 'iPhone', '143.208.113.108', 'https://mxvbet.xyz/', '2023-12-29', '19:37:10', 1, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(97, 'Chrome', 'Windows 10', '189.89.220.70', 'https://mxvbet.xyz/aovivo', '2023-12-29', '19:40:41', 1, 'Brazil', 'Lavras', 'Minas Gerais', NULL),
(98, 'Handheld Browser', 'iPhone', '179.241.15.43', 'https://mxvbet.xyz/', '2023-12-29', '20:09:21', 1, 'Brazil', 'Campinas', 'Sao Paulo', NULL),
(99, 'Handheld Browser', 'iPhone', '2804:14d:5880:8975:75d1:b6e4:d9d5:22a2', 'https://mxvbet.xyz/', '2023-12-29', '20:14:04', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(100, 'Handheld Browser', 'iPhone', '189.63.224.104', 'https://mxvbet.xyz/', '2023-12-29', '20:57:19', 1, 'Brazil', 'Ribeirao Preto', 'Sao Paulo', NULL),
(101, 'Handheld Browser', 'iPhone', '43.133.38.182', 'http://mxvbet.xyz', '2023-12-29', '21:02:35', 1, 'Singapore', 'Singapore', '', NULL),
(102, 'Handheld Browser', 'Android', '67.220.86.160', 'https://mxvbet.xyz/', '2023-12-29', '21:06:27', 1, 'United States', 'Phoenix', 'Arizona', NULL),
(103, 'Handheld Browser', 'Android', '2804:10f8:4287:e000:6856:daa6:65be:8f1a', 'https://mxvbet.xyz/', '2023-12-29', '21:08:14', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(104, 'Handheld Browser', 'Android', '2804:7d6c:44:7a00:9808:fddc:2244:e4d3', 'https://mxvbet.xyz/', '2023-12-29', '21:48:45', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(105, 'Handheld Browser', 'iPhone', '2804:14d:be88:8a71:f48a:4f4a:5a50:7b9c', 'https://mxvbet.xyz/', '2023-12-29', '21:48:56', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(106, 'Handheld Browser', 'Android', '66.249.66.208', 'https://www.mxvbet.xyz/', '2023-12-29', '22:13:54', 1, 'United States', 'Mountain View', 'California', NULL),
(107, 'Handheld Browser', 'iPhone', '43.134.37.211', 'http://www.mxvbet.xyz', '2023-12-29', '22:14:09', 1, 'Singapore', 'Singapore', '', NULL),
(108, 'Handheld Browser', 'Android', '66.249.66.206', 'https://www.mxvbet.xyz/', '2023-12-29', '22:14:21', 1, 'United States', 'Mountain View', 'California', NULL),
(109, 'Handheld Browser', 'iPhone', '43.159.129.209', 'http://www.mxvbet.xyz', '2023-12-29', '23:01:20', 1, 'United States', 'Santa Clara', 'California', NULL),
(110, 'Handheld Browser', 'Android', '192.141.114.252', 'https://mxvbet.xyz/', '2023-12-29', '23:12:20', 1, 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro', NULL),
(111, 'Chrome', 'Windows 10', '179.253.245.145', 'https://mxvbet.xyz/', '2023-12-29', '23:38:46', 1, 'Brazil', 'Colombo', 'Parana', NULL),
(112, 'Chrome', 'Windows 10', '2804:14d:be88:8a71:3850:daea:de11:eadb', 'https://mxvbet.xyz/', '2023-12-30', '00:02:06', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(113, 'Handheld Browser', 'iPhone', '43.128.68.127', 'http://www.mxvbet.xyz', '2023-12-30', '00:09:53', 1, 'Singapore', 'Singapore', '', NULL),
(114, 'Handheld Browser', 'Android', '177.87.135.206', 'https://mxvbet.xyz/', '2023-12-30', '00:11:46', 1, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(115, 'Chrome', 'Mac OS X', '2804:d6c:fff1:802e:b1fd:5774:f7c5:a2ae', 'https://mxvbet.xyz/', '2023-12-30', '00:13:00', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(116, 'Chrome', 'Windows 10', '200.71.118.8', 'https://mxvbet.xyz/', '2023-12-30', '00:18:14', 1, 'Brazil', 'Bituruna', 'Parana', NULL),
(117, 'Handheld Browser', 'iPhone', '2804:14d:be88:8a71:f48a:4f4a:5a50:7b9c', 'https://mxvbet.xyz/aovivo', '2023-12-30', '00:34:23', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(118, 'Handheld Browser', 'Android', '170.81.108.227', 'https://mxvbet.xyz/', '2023-12-30', '00:38:14', 1, 'Brazil', 'Vitoria da Conquista', 'Bahia', NULL),
(119, 'Chrome', 'Windows 10', '89.104.111.6', 'https://mxvbet.xyz/', '2023-12-30', '00:45:04', 1, 'Russia', 'Moscow', 'Moscow', NULL),
(120, 'Chrome', 'Windows 10', '186.236.196.151', 'https://mxvbet.xyz/', '2023-12-30', '01:33:47', 1, 'Brazil', 'Natal', 'Rio Grande do Norte', NULL),
(121, 'Handheld Browser', 'Android', '45.239.10.104', 'https://mxvbet.xyz/', '2023-12-30', '01:56:21', 1, 'Brazil', 'Aquiraz', 'Ceara', NULL),
(122, 'Handheld Browser', 'iPhone', '95.177.180.82', 'https://mxvbet.xyz/', '2023-12-30', '02:17:10', 1, 'Saudi Arabia', 'Riyadh', 'Ar Riyad', NULL),
(123, 'Handheld Browser', 'iPhone', '179.211.190.83', 'https://mxvbet.xyz/', '2023-12-30', '02:21:52', 1, 'Brazil', 'Natal', 'Rio Grande do Norte', NULL),
(124, 'Firefox', 'Windows 10', '2620:101:2002:11a4::1019', 'https://www.mxvbet.xyz/', '2023-12-30', '02:24:01', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(125, 'Handheld Browser', 'Android', '2804:18:7064:83d2:4fd:7fff:fe14:2528', 'https://mxvbet.xyz/', '2023-12-30', '04:05:22', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(126, 'Chrome', 'Windows 10', '89.104.111.22', 'https://mxvbet.xyz/', '2023-12-30', '04:44:29', 1, 'Russia', 'Moscow', 'Moscow', NULL),
(127, 'Firefox', 'Windows 10', '128.90.135.40', 'https://mxvbet.xyz/', '2023-12-30', '04:59:58', 1, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(128, 'Handheld Browser', 'Android', '2804:14d:1685:a2a0:7506:89bb:f519:5a81', 'https://mxvbet.xyz/', '2023-12-30', '05:58:56', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(129, 'Chrome', 'Windows 10', '82.147.84.193', 'https://mxvbet.xyz/', '2023-12-30', '06:21:56', 1, 'United States', 'Claymont', 'Delaware', NULL),
(130, 'Handheld Browser', 'Android', '191.57.14.173', 'https://mxvbet.xyz/', '2023-12-30', '08:31:19', 1, 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro', NULL),
(131, 'Handheld Browser', 'Android', '66.249.64.108', 'https://www.mxvbet.xyz/aovivo', '2023-12-30', '08:54:57', 1, 'United States', 'Mountain View', 'California', NULL),
(132, 'Handheld Browser', 'iPhone', '43.130.37.62', 'http://www.mxvbet.xyz', '2023-12-30', '09:01:40', 1, 'United States', 'Santa Clara', 'California', NULL),
(133, 'Handheld Browser', 'Android', '66.249.64.110', 'https://www.mxvbet.xyz/termos-de-uso', '2023-12-30', '09:22:02', 1, 'United States', 'Mountain View', 'California', NULL),
(134, 'Handheld Browser', 'iPhone', '2804:d84:21af:ef00:c493:316d:4894:fb84', 'https://mxvbet.xyz/', '2023-12-30', '09:49:56', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(135, 'Chrome', 'Linux', '18.117.89.73', 'https://mxvbet.xyz/', '2023-12-30', '09:54:00', 1, 'United States', 'Columbus', 'Ohio', NULL),
(136, 'Chrome', 'Windows 7', '46.191.187.71', 'https://mxvbet.xyz/', '2023-12-30', '10:38:13', 1, 'Russia', 'Orenburg', 'Orenburg Oblast', NULL),
(137, 'Chrome', 'Linux', '54.187.62.104', 'https://mxvbet.xyz/', '2023-12-30', '11:25:23', 1, 'United States', 'Portland', 'Oregon', NULL),
(138, 'Chrome', 'Linux', '35.91.57.97', 'https://mxvbet.xyz/', '2023-12-30', '11:26:36', 1, 'United States', 'Portland', 'Oregon', NULL),
(139, 'Chrome', 'Linux', '54.190.64.231', 'https://mxvbet.xyz/', '2023-12-30', '11:26:41', 1, 'United States', 'Portland', 'Oregon', NULL),
(140, 'Chrome', 'Linux', '34.210.27.15', 'https://mxvbet.xyz/', '2023-12-30', '11:27:12', 1, 'United States', 'Portland', 'Oregon', NULL),
(141, 'Chrome', 'Linux', '35.90.5.166', 'http://mxvbet.xyz', '2023-12-30', '11:29:18', 1, 'United States', 'Portland', 'Oregon', NULL),
(142, 'Handheld Browser', 'iPhone', '143.208.127.90', 'https://mxvbet.xyz/aovivo', '2023-12-30', '11:36:25', 1, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(143, 'Handheld Browser', 'Android', '189.84.81.45', 'https://mxvbet.xyz/', '2023-12-30', '11:37:44', 1, 'Brazil', 'Marica', 'Rio de Janeiro', NULL),
(144, 'Handheld Browser', 'iPhone', '43.134.89.111', 'http://www.mxvbet.xyz', '2023-12-30', '12:03:56', 1, 'Singapore', 'Singapore', '', NULL),
(145, 'Chrome', 'Windows 10', '2400:6180:10:200::ee:d000', 'https://mxvbet.xyz/', '2023-12-30', '12:11:23', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(146, 'Firefox', 'Ubuntu', '185.144.76.217', 'https://mxvbet.xyz/', '2023-12-30', '13:03:28', 1, 'Turkey', 'Mersin', 'Mersin', NULL),
(147, 'Chrome', 'Windows 10', '168.0.190.211', 'https://mxvbet.xyz/', '2023-12-30', '13:05:39', 1, 'Brazil', 'Sousa', 'Paraiba', NULL),
(148, 'Handheld Browser', 'Android', '2804:214:82a0:5fce:c14:5ff:fe65:458d', 'https://mxvbet.xyz/', '2023-12-30', '13:12:41', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(149, 'Handheld Browser', 'iPhone', '2804:389:a285:6c89:2c:2a33:f3ef:3fa5', 'https://mxvbet.xyz/', '2023-12-30', '13:15:23', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(150, 'Chrome', 'Linux', '2804:30c:1b11:9f00:8f28:2ebc:691b:a22b', 'https://mxvbet.xyz/', '2023-12-30', '14:02:09', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(151, 'Handheld Browser', 'iPhone', '177.124.149.113', 'https://mxvbet.xyz/', '2023-12-30', '14:27:06', 1, 'Brazil', 'Garopaba', 'Santa Catarina', NULL),
(152, 'Unknown Browser', 'Windows 95', '54.235.17.232', 'https://mxvbet.xyz/', '2023-12-30', '14:49:20', 1, 'United States', 'Ashburn', 'Virginia', NULL),
(153, 'Handheld Browser', 'iPhone', '43.159.128.172', 'http://mxvbet.xyz', '2023-12-30', '15:01:34', 1, 'United States', 'Santa Clara', 'California', NULL),
(154, 'Handheld Browser', 'Android', '179.180.156.211', 'https://mxvbet.xyz/', '2023-12-30', '15:19:41', 1, 'Brazil', 'Recife', 'Pernambuco', NULL),
(155, 'Chrome', 'Windows 10', '181.233.26.136', 'https://mxvbet.xyz/', '2023-12-30', '15:23:02', 1, 'Peru', 'Lima', 'Lima region', NULL),
(156, 'Chrome', 'Windows 10', '2804:29b8:5119:783:2943:ea2:4cf5:b441', 'https://mxvbet.xyz/', '2023-12-30', '15:59:05', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(157, 'Chrome', 'Linux', '188.166.104.51', 'https://mxvbet.xyz/', '2023-12-30', '16:04:02', 1, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(158, 'Handheld Browser', 'iPhone', '2804:14d:be88:8a71:c48c:4625:3658:1dd7', 'https://mxvbet.xyz/', '2023-12-30', '16:05:13', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(159, 'Handheld Browser', 'Android', '2804:8aa4:330a:1e00:bf98:e84d:e0d1:47e4', 'https://mxvbet.xyz/', '2023-12-30', '16:23:28', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(160, 'Handheld Browser', 'Android', '2804:4df4:fffe:a630:83f:c19a:3eac:5fb7', 'https://mxvbet.xyz/', '2023-12-30', '16:31:56', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(161, 'Handheld Browser', 'Android', '45.226.117.91', 'android-app://ir.ilmili.telegraph/', '2023-12-30', '16:46:19', 1, 'Brazil', 'Sao Pedro da Aldeia', 'Rio de Janeiro', NULL),
(162, 'Handheld Browser', 'Android', '23.111.114.116', 'https://mxvbet.xyz/', '2023-12-30', '16:55:06', 1, 'Russia', 'Moscow', 'Moscow', NULL),
(163, 'Chrome', 'Windows 10', '2804:d45:9b46:8800:f08d:e189:6337:788c', 'https://mxvbet.xyz/', '2023-12-30', '17:18:46', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(164, 'Handheld Browser', 'Android', '179.97.29.133', 'https://mxvbet.xyz/', '2023-12-30', '17:36:52', 1, 'Brazil', 'Nova Iguacu', 'Rio de Janeiro', NULL),
(165, 'Chrome', 'Windows 10', '2804:14d:be88:8a71:55b9:93f9:7812:f45d', 'https://mxvbet.xyz/', '2023-12-30', '17:47:39', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(166, 'Handheld Browser', 'iPhone', '43.159.141.180', 'http://www.mxvbet.xyz', '2023-12-30', '18:02:19', 1, 'United States', 'Santa Clara', 'California', NULL),
(167, 'Chrome', 'Mac OS X', '2a02:4780:13::2d', 'https://mxvbet.xyz/', '2023-12-30', '18:06:12', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(168, 'Chrome', 'Windows 10', '2804:14d:be88:8a71:d034:b4a8:fa9f:6d42', 'https://lafortuna.bet/', '2024-01-03', '16:24:11', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(169, 'Firefox', 'Linux', '45.61.122.28', 'https://lafortuna.bet/', '2024-01-03', '16:29:53', 1, 'United States', 'Dallas', 'Texas', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `afiliados_config`
--
ALTER TABLE `afiliados_config`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cupom`
--
ALTER TABLE `cupom`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cupom_usados`
--
ALTER TABLE `cupom_usados`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `double`
--
ALTER TABLE `double`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices para tabela `ezzebank`
--
ALTER TABLE `ezzebank`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `financeiro`
--
ALTER TABLE `financeiro`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fiverscan`
--
ALTER TABLE `fiverscan`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `historico_play`
--
ALTER TABLE `historico_play`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `logs_acessos_adm`
--
ALTER TABLE `logs_acessos_adm`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pay_valores_cassino`
--
ALTER TABLE `pay_valores_cassino`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `populares`
--
ALTER TABLE `populares`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `provedores`
--
ALTER TABLE `provedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `solicitacao_saques`
--
ALTER TABLE `solicitacao_saques`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `suitpay`
--
ALTER TABLE `suitpay`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `cpf_UNIQUE` (`cpf`);

--
-- Índices para tabela `visita_site`
--
ALTER TABLE `visita_site`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `afiliados_config`
--
ALTER TABLE `afiliados_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `cupom`
--
ALTER TABLE `cupom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cupom_usados`
--
ALTER TABLE `cupom_usados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `double`
--
ALTER TABLE `double`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `financeiro`
--
ALTER TABLE `financeiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=835;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3634;

--
-- AUTO_INCREMENT de tabela `historico_play`
--
ALTER TABLE `historico_play`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logs_acessos_adm`
--
ALTER TABLE `logs_acessos_adm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pay_valores_cassino`
--
ALTER TABLE `pay_valores_cassino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `populares`
--
ALTER TABLE `populares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `provedores`
--
ALTER TABLE `provedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `solicitacao_saques`
--
ALTER TABLE `solicitacao_saques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=620;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=835;

--
-- AUTO_INCREMENT de tabela `visita_site`
--
ALTER TABLE `visita_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

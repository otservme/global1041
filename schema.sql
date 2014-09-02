-- phpMyAdmin SQL Dump
-- version 4.2.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 02, 2014 at 06:20 AM
-- Server version: 5.5.37-0ubuntu0.13.10.1
-- PHP Version: 5.5.3-1ubuntu2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `global1041`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL DEFAULT '0',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `type`, `premdays`, `lastday`, `email`, `creation`, `key`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`) VALUES
(1, '1', 'e0f68134d29dc326d115de4c8fab8700a3c4b002', 5, 0, 0, '70428@gmail.com', 1402322190, '', '', 0, '', '', 3, '', 0, 0, 0, 2147483647, 0, 'unknown');

-- --------------------------------------------------------

--
-- Table structure for table `account_bans`
--

CREATE TABLE IF NOT EXISTS `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_ban_history`
--

CREATE TABLE IF NOT EXISTS `account_ban_history` (
`id` int(10) unsigned NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_viplist`
--

CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Triggers `guilds`
--
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `guildwar_kills`
--

CREATE TABLE IF NOT EXISTS `guildwar_kills` (
`id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT '0',
  `targetguild` int(11) NOT NULL DEFAULT '0',
  `warid` int(11) NOT NULL DEFAULT '0',
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_invites`
--

CREATE TABLE IF NOT EXISTS `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_membership`
--

CREATE TABLE IF NOT EXISTS `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
`id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_wars`
--

CREATE TABLE IF NOT EXISTS `guild_wars` (
`id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT '0',
  `guild2` int(11) NOT NULL DEFAULT '0',
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `started` bigint(15) NOT NULL DEFAULT '0',
  `ended` bigint(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
`id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `bid` int(11) NOT NULL DEFAULT '0',
  `bid_end` int(11) NOT NULL DEFAULT '0',
  `last_bid` int(11) NOT NULL DEFAULT '0',
  `highest_bidder` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `beds` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2423 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `beds`) VALUES
(2, 0, 0, 0, 'Market Street 4 (Shop)', 5105, 1, 0, 0, 0, 0, 168, 3),
(4, 487, 1405769990, 0, 'Market Street 3', 3475, 1, 0, 0, 0, 0, 112, 2),
(5, 406, 0, 1, 'Market Street 2', 4925, 1, 0, 0, 0, 0, 176, 3),
(6, 0, 0, 0, 'Market Street 1', 6680, 1, 0, 0, 0, 0, 206, 3),
(7, 0, 0, 0, 'Old Lighthouse', 3610, 1, 0, 0, 0, 0, 117, 2),
(8, 0, 0, 0, 'Seagull Walk 1', 5095, 1, 0, 0, 0, 0, 163, 2),
(9, 0, 0, 0, 'Seagull Walk 2', 2765, 1, 0, 0, 0, 0, 102, 3),
(10, 0, 0, 0, 'Dream Street 4', 3765, 1, 0, 0, 0, 0, 131, 4),
(11, 0, 0, 0, 'Elm Street 2', 2665, 1, 0, 0, 0, 0, 94, 2),
(12, 0, 0, 0, 'Elm Street 1', 2710, 1, 0, 0, 0, 0, 94, 2),
(13, 0, 0, 0, 'Elm Street 3', 2855, 1, 0, 0, 0, 0, 94, 3),
(14, 0, 0, 0, 'Elm Street 4', 3765, 1, 0, 0, 0, 0, 98, 2),
(15, 0, 0, 0, 'Dream Street 3', 2710, 1, 0, 0, 0, 0, 95, 2),
(16, 0, 0, 0, 'Dream Street 2', 3340, 1, 0, 0, 0, 0, 113, 2),
(18, 0, 0, 0, 'Paupers Palace, Flat 13', 450, 1, 0, 0, 0, 0, 16, 1),
(19, 0, 0, 0, 'Paupers Palace, Flat 12', 685, 1, 0, 0, 0, 0, 23, 2),
(23, 0, 0, 0, 'Paupers Palace, Flat 14', 585, 1, 0, 0, 0, 0, 23, 1),
(24, 0, 0, 0, 'Paupers Palace, Flat 15', 450, 1, 0, 0, 0, 0, 12, 1),
(25, 0, 0, 0, 'Paupers Palace, Flat 16', 585, 1, 0, 0, 0, 0, 19, 1),
(26, 0, 0, 0, 'Paupers Palace, Flat 17', 450, 1, 0, 0, 0, 0, 16, 1),
(27, 0, 0, 0, 'Paupers Palace, Flat 18', 315, 1, 0, 0, 0, 0, 16, 1),
(28, 0, 0, 0, 'Paupers Palace, Flat 01', 405, 1, 0, 0, 0, 0, 15, 1),
(29, 0, 0, 0, 'Paupers Palace, Flat 02', 450, 1, 0, 0, 0, 0, 19, 1),
(30, 0, 0, 0, 'Paupers Palace, Flat 03', 405, 1, 0, 0, 0, 0, 15, 1),
(31, 0, 0, 0, 'Paupers Palace, Flat 04', 450, 1, 0, 0, 0, 0, 16, 1),
(32, 0, 0, 0, 'Paupers Palace, Flat 05', 315, 1, 0, 0, 0, 0, 12, 1),
(33, 0, 0, 0, 'Paupers Palace, Flat 06', 450, 1, 0, 0, 0, 0, 16, 1),
(34, 0, 0, 0, 'Paupers Palace, Flat 07', 685, 1, 0, 0, 0, 0, 23, 2),
(35, 0, 0, 0, 'Paupers Palace, Flat 21', 315, 1, 0, 0, 0, 0, 12, 1),
(36, 0, 0, 0, 'Paupers Palace, Flat 22', 450, 1, 0, 0, 0, 0, 16, 1),
(37, 0, 0, 0, 'Paupers Palace, Flat 23', 585, 1, 0, 0, 0, 0, 23, 1),
(38, 0, 0, 0, 'Paupers Palace, Flat 24', 450, 1, 0, 0, 0, 0, 16, 1),
(39, 0, 0, 0, 'Paupers Palace, Flat 26', 450, 1, 0, 0, 0, 0, 16, 1),
(40, 0, 0, 0, 'Paupers Palace, Flat 28', 315, 1, 0, 0, 0, 0, 15, 1),
(41, 0, 0, 0, 'Paupers Palace, Flat 27', 685, 1, 0, 0, 0, 0, 24, 2),
(42, 0, 0, 0, 'Paupers Palace, Flat 25', 585, 1, 0, 0, 0, 0, 24, 1),
(43, 0, 0, 0, 'Paupers Palace, Flat 31', 855, 1, 0, 0, 0, 0, 28, 1),
(44, 0, 0, 0, 'Paupers Palace, Flat 32', 1135, 1, 0, 0, 0, 0, 32, 2),
(45, 0, 0, 0, 'Paupers Palace, Flat 33', 765, 1, 0, 0, 0, 0, 31, 1),
(46, 0, 0, 0, 'Paupers Palace, Flat 34', 1675, 1, 0, 0, 0, 0, 51, 2),
(47, 0, 0, 0, 'Salvation Street 1 (Shop)', 6240, 1, 0, 0, 0, 0, 200, 4),
(49, 0, 0, 0, 'Dream Street 1 (Shop)', 4330, 1, 0, 0, 0, 0, 147, 2),
(50, 0, 0, 0, 'Blessed Shield Guildhall', 8090, 1, 0, 0, 0, 0, 258, 9),
(51, 0, 0, 0, 'Dagger Alley 1', 2665, 1, 0, 0, 0, 0, 93, 2),
(52, 0, 0, 0, 'Steel Home', 13845, 1, 0, 0, 0, 0, 384, 13),
(53, 0, 0, 0, 'Iron Alley 1', 3450, 1, 0, 0, 0, 0, 111, 4),
(54, 0, 0, 0, 'Iron Alley 2', 3450, 1, 0, 0, 0, 0, 108, 4),
(55, 0, 0, 0, 'Swamp Watch', 11090, 1, 0, 0, 0, 0, 347, 12),
(57, 0, 0, 0, 'Salvation Street 2', 3790, 1, 0, 0, 0, 0, 116, 2),
(60, 0, 0, 0, 'Salvation Street 3', 3790, 1, 0, 0, 0, 0, 123, 2),
(61, 0, 0, 0, 'Silver Street 3', 1980, 1, 0, 0, 0, 0, 51, 1),
(62, 0, 0, 0, 'Golden Axe Guildhall', 10485, 1, 0, 0, 0, 0, 327, 10),
(63, 0, 0, 0, 'Silver Street 1', 2565, 1, 0, 0, 0, 0, 94, 1),
(64, 0, 0, 0, 'Silver Street 2', 1980, 1, 0, 0, 0, 0, 51, 1),
(66, 0, 0, 0, 'Silver Street 4', 3295, 1, 0, 0, 0, 0, 114, 2),
(67, 0, 0, 0, 'Mystic Lane 2', 2980, 1, 0, 0, 0, 0, 99, 2),
(69, 0, 0, 0, 'Mystic Lane 1', 2945, 1, 0, 0, 0, 0, 97, 3),
(70, 0, 0, 0, 'Loot Lane 1 (Shop)', 4565, 1, 0, 0, 0, 0, 158, 3),
(71, 0, 0, 0, 'Market Street 6', 5485, 1, 0, 0, 0, 0, 168, 5),
(72, 0, 0, 0, 'Market Street 7', 2305, 1, 0, 0, 0, 0, 89, 2),
(73, 0, 0, 0, 'Market Street 5 (Shop)', 6375, 1, 0, 0, 0, 0, 198, 4),
(194, 0, 0, 0, 'Lucky Lane 1 (Shop)', 6960, 1, 0, 0, 0, 0, 211, 4),
(208, 0, 0, 0, 'Underwood 1', 1495, 5, 0, 0, 0, 0, 41, 2),
(209, 0, 0, 0, 'Underwood 2', 1495, 5, 0, 0, 0, 0, 41, 2),
(210, 0, 0, 0, 'Underwood 5', 1370, 5, 0, 0, 0, 0, 35, 3),
(211, 0, 0, 0, 'Underwood 3', 1685, 5, 0, 0, 0, 0, 44, 3),
(212, 0, 0, 0, 'Underwood 4', 2235, 5, 0, 0, 0, 0, 56, 4),
(213, 0, 0, 0, 'Underwood 10', 585, 5, 0, 0, 0, 0, 20, 1),
(214, 0, 0, 0, 'Underwood 6', 1595, 5, 0, 0, 0, 0, 42, 3),
(215, 0, 0, 0, 'Great Willow 1a', 500, 5, 0, 0, 0, 0, 16, 1),
(216, 0, 0, 0, 'Great Willow 1b', 650, 5, 0, 0, 0, 0, 22, 1),
(217, 0, 0, 0, 'Great Willow 1c', 650, 5, 0, 0, 0, 0, 22, 1),
(218, 0, 0, 0, 'Great Willow 2d', 450, 5, 0, 0, 0, 0, 10, 1),
(219, 0, 0, 0, 'Great Willow 2c', 650, 5, 0, 0, 0, 0, 21, 1),
(220, 0, 0, 0, 'Great Willow 2b', 450, 5, 0, 0, 0, 0, 16, 1),
(221, 0, 0, 0, 'Great Willow 2a', 650, 5, 0, 0, 0, 0, 17, 1),
(222, 0, 0, 0, 'Great Willow 3d', 450, 5, 0, 0, 0, 0, 17, 1),
(223, 0, 0, 0, 'Great Willow 3c', 650, 5, 0, 0, 0, 0, 21, 1),
(224, 0, 0, 0, 'Great Willow 3b', 450, 5, 0, 0, 0, 0, 16, 1),
(225, 0, 0, 0, 'Great Willow 3a', 650, 5, 0, 0, 0, 0, 20, 1),
(226, 0, 0, 0, 'Great Willow 4b', 950, 5, 0, 0, 0, 0, 25, 2),
(227, 0, 0, 0, 'Great Willow 4c', 950, 5, 0, 0, 0, 0, 25, 2),
(228, 0, 0, 0, 'Great Willow 4d', 750, 5, 0, 0, 0, 0, 26, 1),
(229, 0, 0, 0, 'Great Willow 4a', 950, 5, 0, 0, 0, 0, 25, 2),
(230, 0, 0, 0, 'Underwood 7', 1460, 5, 0, 0, 0, 0, 39, 2),
(231, 0, 0, 0, 'Shadow Caves 3', 300, 5, 0, 0, 0, 0, 16, 1),
(232, 0, 0, 0, 'Shadow Caves 4', 300, 5, 0, 0, 0, 0, 18, 1),
(233, 0, 0, 0, 'Shadow Caves 2', 300, 5, 0, 0, 0, 0, 18, 1),
(234, 0, 0, 0, 'Shadow Caves 1', 300, 5, 0, 0, 0, 0, 16, 1),
(235, 0, 0, 0, 'Shadow Caves 17', 300, 5, 0, 0, 0, 0, 16, 1),
(236, 0, 0, 0, 'Shadow Caves 18', 300, 5, 0, 0, 0, 0, 17, 1),
(237, 0, 0, 0, 'Shadow Caves 15', 300, 5, 0, 0, 0, 0, 16, 1),
(238, 0, 0, 0, 'Shadow Caves 16', 300, 5, 0, 0, 0, 0, 17, 1),
(239, 0, 0, 0, 'Shadow Caves 13', 300, 5, 0, 0, 0, 0, 16, 1),
(240, 0, 0, 0, 'Shadow Caves 14', 300, 5, 0, 0, 0, 0, 19, 1),
(241, 0, 0, 0, 'Shadow Caves 11', 300, 5, 0, 0, 0, 0, 16, 1),
(242, 0, 0, 0, 'Shadow Caves 12', 300, 5, 0, 0, 0, 0, 18, 1),
(243, 0, 0, 0, 'Shadow Caves 27', 300, 5, 0, 0, 0, 0, 14, 1),
(244, 0, 0, 0, 'Shadow Caves 28', 300, 5, 0, 0, 0, 0, 17, 1),
(245, 0, 0, 0, 'Shadow Caves 25', 300, 5, 0, 0, 0, 0, 16, 1),
(246, 0, 0, 0, 'Shadow Caves 26', 300, 5, 0, 0, 0, 0, 17, 1),
(247, 0, 0, 0, 'Shadow Caves 23', 300, 5, 0, 0, 0, 0, 16, 1),
(248, 0, 0, 0, 'Shadow Caves 24', 300, 5, 0, 0, 0, 0, 19, 1),
(249, 0, 0, 0, 'Shadow Caves 21', 300, 5, 0, 0, 0, 0, 16, 1),
(250, 0, 0, 0, 'Shadow Caves 22', 300, 5, 0, 0, 0, 0, 17, 1),
(251, 0, 0, 0, 'Underwood 9', 585, 5, 0, 0, 0, 0, 17, 1),
(252, 0, 0, 0, 'Treetop 13', 1400, 5, 0, 0, 0, 0, 33, 2),
(254, 0, 0, 0, 'Underwood 8', 865, 5, 0, 0, 0, 0, 25, 2),
(255, 0, 0, 0, 'Mangrove 4', 950, 5, 0, 0, 0, 0, 25, 2),
(256, 0, 0, 0, 'Coastwood 10', 1630, 5, 0, 0, 0, 0, 36, 3),
(257, 0, 0, 0, 'Mangrove 1', 1750, 5, 0, 0, 0, 0, 42, 3),
(258, 0, 0, 0, 'Coastwood 1', 980, 5, 0, 0, 0, 0, 24, 2),
(259, 0, 0, 0, 'Coastwood 2', 980, 5, 0, 0, 0, 0, 24, 2),
(260, 0, 0, 0, 'Mangrove 2', 1350, 5, 0, 0, 0, 0, 33, 2),
(262, 0, 0, 0, 'Mangrove 3', 1150, 5, 0, 0, 0, 0, 29, 2),
(263, 0, 0, 0, 'Coastwood 9', 935, 5, 0, 0, 0, 0, 22, 1),
(264, 0, 0, 0, 'Coastwood 8', 1255, 5, 0, 0, 0, 0, 31, 2),
(265, 0, 0, 0, 'Coastwood 6 (Shop)', 1595, 5, 0, 0, 0, 0, 44, 1),
(266, 0, 0, 0, 'Coastwood 7', 660, 5, 0, 0, 0, 0, 19, 1),
(267, 0, 0, 0, 'Coastwood 5', 1530, 5, 0, 0, 0, 0, 35, 2),
(268, 0, 0, 0, 'Coastwood 4', 1145, 5, 0, 0, 0, 0, 30, 2),
(269, 0, 0, 0, 'Coastwood 3', 1310, 5, 0, 0, 0, 0, 34, 2),
(270, 0, 0, 0, 'Treetop 11', 900, 5, 0, 0, 0, 0, 26, 2),
(271, 0, 0, 0, 'Treetop 5 (Shop)', 1350, 5, 0, 0, 0, 0, 40, 1),
(272, 0, 0, 0, 'Treetop 7', 800, 5, 0, 0, 0, 0, 24, 1),
(273, 0, 0, 0, 'Treetop 6', 450, 5, 0, 0, 0, 0, 15, 1),
(274, 0, 0, 0, 'Treetop 8', 800, 5, 0, 0, 0, 0, 23, 1),
(275, 0, 0, 0, 'Treetop 9', 1150, 5, 0, 0, 0, 0, 30, 2),
(276, 0, 0, 0, 'Treetop 10', 1150, 5, 0, 0, 0, 0, 34, 2),
(277, 0, 0, 0, 'Treetop 4 (Shop)', 1250, 5, 0, 0, 0, 0, 40, 1),
(278, 0, 0, 0, 'Treetop 3 (Shop)', 1250, 5, 0, 0, 0, 0, 38, 1),
(279, 0, 0, 0, 'Treetop 2', 650, 5, 0, 0, 0, 0, 21, 1),
(280, 0, 0, 0, 'Treetop 1', 650, 5, 0, 0, 0, 0, 19, 1),
(281, 0, 0, 0, 'Treetop 12 (Shop)', 1350, 5, 0, 0, 0, 0, 40, 1),
(469, 0, 0, 0, 'Darashia 2, Flat 07', 1000, 10, 0, 0, 0, 0, 48, 1),
(470, 0, 0, 0, 'Darashia 2, Flat 01', 1000, 10, 0, 0, 0, 0, 48, 1),
(471, 0, 0, 0, 'Darashia 2, Flat 02', 1000, 10, 0, 0, 0, 0, 42, 1),
(472, 0, 0, 0, 'Darashia 2, Flat 06', 520, 10, 0, 0, 0, 0, 24, 1),
(473, 0, 0, 0, 'Darashia 2, Flat 05', 1260, 10, 0, 0, 0, 0, 48, 2),
(474, 0, 0, 0, 'Darashia 2, Flat 04', 520, 10, 0, 0, 0, 0, 24, 1),
(475, 0, 0, 0, 'Darashia 2, Flat 03', 1160, 10, 0, 0, 0, 0, 42, 1),
(476, 0, 0, 0, 'Darashia 2, Flat 13', 1160, 10, 0, 0, 0, 0, 42, 1),
(477, 0, 0, 0, 'Darashia 2, Flat 12', 520, 10, 0, 0, 0, 0, 24, 1),
(478, 0, 0, 0, 'Darashia 2, Flat 11', 1000, 10, 0, 0, 0, 0, 42, 1),
(479, 0, 0, 0, 'Darashia 2, Flat 14', 520, 10, 0, 0, 0, 0, 24, 1),
(480, 0, 0, 0, 'Darashia 2, Flat 15', 1260, 10, 0, 0, 0, 0, 47, 2),
(481, 0, 0, 0, 'Darashia 2, Flat 16', 680, 10, 0, 0, 0, 0, 30, 1),
(482, 0, 0, 0, 'Darashia 2, Flat 17', 1000, 10, 0, 0, 0, 0, 48, 1),
(483, 0, 0, 0, 'Darashia 2, Flat 18', 680, 10, 0, 0, 0, 0, 30, 1),
(484, 0, 0, 0, 'Darashia 1, Flat 05', 1100, 10, 0, 0, 0, 0, 48, 2),
(485, 0, 0, 0, 'Darashia 1, Flat 01', 1100, 10, 0, 0, 0, 0, 48, 2),
(486, 0, 0, 0, 'Darashia 1, Flat 04', 1000, 10, 0, 0, 0, 0, 42, 1),
(487, 0, 0, 0, 'Darashia 1, Flat 03', 2660, 10, 0, 0, 0, 0, 96, 4),
(488, 0, 0, 0, 'Darashia 1, Flat 02', 1000, 10, 0, 0, 0, 0, 41, 1),
(490, 0, 0, 0, 'Darashia 1, Flat 12', 1780, 10, 0, 0, 0, 0, 66, 2),
(491, 0, 0, 0, 'Darashia 1, Flat 11', 1100, 10, 0, 0, 0, 0, 41, 2),
(492, 0, 0, 0, 'Darashia 1, Flat 13', 1780, 10, 0, 0, 0, 0, 72, 2),
(493, 0, 0, 0, 'Darashia 1, Flat 14', 2760, 10, 0, 0, 0, 0, 108, 5),
(494, 0, 0, 0, 'Darashia 4, Flat 01', 1000, 10, 0, 0, 0, 0, 48, 1),
(495, 0, 0, 0, 'Darashia 4, Flat 05', 1100, 10, 0, 0, 0, 0, 48, 2),
(496, 0, 0, 0, 'Darashia 4, Flat 04', 1780, 10, 0, 0, 0, 0, 72, 2),
(497, 0, 0, 0, 'Darashia 4, Flat 03', 1000, 10, 0, 0, 0, 0, 42, 1),
(498, 0, 0, 0, 'Darashia 4, Flat 02', 1780, 10, 0, 0, 0, 0, 66, 2),
(499, 0, 0, 0, 'Darashia 4, Flat 13', 1780, 10, 0, 0, 0, 0, 78, 2),
(500, 0, 0, 0, 'Darashia 4, Flat 14', 1780, 10, 0, 0, 0, 0, 72, 2),
(501, 0, 0, 0, 'Darashia 4, Flat 11', 1000, 10, 0, 0, 0, 0, 41, 1),
(502, 0, 0, 0, 'Darashia 4, Flat 12', 2560, 10, 0, 0, 0, 0, 96, 3),
(503, 0, 0, 0, 'Darashia 7, Flat 05', 1225, 10, 0, 0, 0, 0, 40, 2),
(504, 0, 0, 0, 'Darashia 7, Flat 01', 1125, 10, 0, 0, 0, 0, 40, 1),
(505, 0, 0, 0, 'Darashia 7, Flat 02', 1125, 10, 0, 0, 0, 0, 41, 1),
(506, 0, 0, 0, 'Darashia 7, Flat 03', 2955, 10, 0, 0, 0, 0, 108, 4),
(507, 0, 0, 0, 'Darashia 7, Flat 04', 1125, 10, 0, 0, 0, 0, 42, 1),
(508, 0, 0, 0, 'Darashia 7, Flat 14', 2955, 10, 0, 0, 0, 0, 108, 4),
(509, 0, 0, 0, 'Darashia 7, Flat 13', 1125, 10, 0, 0, 0, 0, 42, 1),
(510, 0, 0, 0, 'Darashia 7, Flat 11', 1125, 10, 0, 0, 0, 0, 41, 1),
(511, 0, 0, 0, 'Darashia 7, Flat 12', 2955, 10, 0, 0, 0, 0, 95, 4),
(512, 0, 0, 0, 'Darashia 5, Flat 01', 1000, 10, 0, 0, 0, 0, 38, 1),
(513, 0, 0, 0, 'Darashia 5, Flat 05', 1000, 10, 0, 0, 0, 0, 48, 1),
(514, 0, 0, 0, 'Darashia 5, Flat 02', 1620, 10, 0, 0, 0, 0, 57, 2),
(515, 0, 0, 0, 'Darashia 5, Flat 03', 1000, 10, 0, 0, 0, 0, 41, 1),
(516, 0, 0, 0, 'Darashia 5, Flat 04', 1620, 10, 0, 0, 0, 0, 66, 2),
(517, 0, 0, 0, 'Darashia 5, Flat 11', 1780, 10, 0, 0, 0, 0, 66, 2),
(518, 0, 0, 0, 'Darashia 5, Flat 12', 1620, 10, 0, 0, 0, 0, 65, 2),
(519, 0, 0, 0, 'Darashia 5, Flat 13', 1780, 10, 0, 0, 0, 0, 78, 2),
(520, 0, 0, 0, 'Darashia 5, Flat 14', 1620, 10, 0, 0, 0, 0, 66, 2),
(521, 0, 0, 0, 'Darashia 6a', 3115, 10, 0, 0, 0, 0, 117, 2),
(522, 0, 0, 0, 'Darashia 6b', 3430, 10, 0, 0, 0, 0, 139, 2),
(523, 0, 0, 0, 'Darashia, Villa', 5385, 10, 0, 0, 0, 0, 233, 4),
(525, 0, 0, 0, 'Darashia, Western Guildhall', 10435, 10, 0, 0, 0, 0, 376, 14),
(526, 0, 0, 0, 'Darashia 3, Flat 01', 1100, 10, 0, 0, 0, 0, 40, 2),
(527, 0, 0, 0, 'Darashia 3, Flat 05', 1000, 10, 0, 0, 0, 0, 40, 1),
(529, 0, 0, 0, 'Darashia 3, Flat 02', 1620, 10, 0, 0, 0, 0, 65, 2),
(530, 0, 0, 0, 'Darashia 3, Flat 03', 1100, 10, 0, 0, 0, 0, 42, 2),
(531, 0, 0, 0, 'Darashia 3, Flat 04', 1620, 10, 0, 0, 0, 0, 72, 2),
(532, 0, 0, 0, 'Darashia 3, Flat 13', 1100, 10, 0, 0, 0, 0, 42, 2),
(533, 0, 0, 0, 'Darashia 3, Flat 14', 2400, 10, 0, 0, 0, 0, 102, 3),
(534, 0, 0, 0, 'Darashia 3, Flat 11', 1000, 10, 0, 0, 0, 0, 41, 1),
(535, 0, 0, 0, 'Darashia 3, Flat 12', 2600, 10, 0, 0, 0, 0, 90, 5),
(541, 0, 0, 0, 'Darashia 8, Flat 11', 1990, 10, 0, 0, 0, 0, 66, 2),
(542, 0, 0, 0, 'Darashia 8, Flat 12', 1810, 10, 0, 0, 0, 0, 65, 2),
(544, 0, 0, 0, 'Darashia 8, Flat 14', 1810, 10, 0, 0, 0, 0, 66, 2),
(545, 0, 0, 0, 'Darashia 8, Flat 13', 1990, 10, 0, 0, 0, 0, 78, 2),
(574, 0, 0, 0, 'Oskahl I j', 680, 9, 0, 0, 0, 0, 25, 1),
(575, 0, 0, 0, 'Oskahl I f', 840, 9, 0, 0, 0, 0, 34, 1),
(576, 0, 0, 0, 'Oskahl I i', 840, 9, 0, 0, 0, 0, 30, 1),
(577, 0, 0, 0, 'Oskahl I g', 1140, 9, 0, 0, 0, 0, 42, 2),
(578, 0, 0, 0, 'Oskahl I h', 1760, 9, 0, 0, 0, 0, 63, 3),
(579, 0, 0, 0, 'Oskahl I d', 1140, 9, 0, 0, 0, 0, 36, 2),
(580, 0, 0, 0, 'Oskahl I b', 840, 9, 0, 0, 0, 0, 30, 1),
(581, 0, 0, 0, 'Oskahl I c', 680, 9, 0, 0, 0, 0, 29, 1),
(582, 0, 0, 0, 'Oskahl I e', 840, 9, 0, 0, 0, 0, 33, 1),
(583, 0, 0, 0, 'Oskahl I a', 1580, 9, 0, 0, 0, 0, 52, 2),
(584, 0, 0, 0, 'Chameken I', 850, 9, 0, 0, 0, 0, 33, 1),
(585, 0, 0, 0, 'Charsirakh III', 680, 9, 0, 0, 0, 0, 30, 1),
(586, 0, 0, 0, 'Murkhol I d', 440, 9, 0, 0, 0, 0, 21, 1),
(587, 0, 0, 0, 'Murkhol I c', 440, 9, 0, 0, 0, 0, 18, 1),
(588, 0, 0, 0, 'Murkhol I b', 440, 9, 0, 0, 0, 0, 18, 1),
(589, 0, 0, 0, 'Murkhol I a', 440, 9, 0, 0, 0, 0, 20, 1),
(590, 0, 0, 0, 'Charsirakh II', 1140, 9, 0, 0, 0, 0, 39, 2),
(591, 0, 0, 0, 'Thanah II h', 1400, 9, 0, 0, 0, 0, 40, 2),
(592, 0, 0, 0, 'Thanah II g', 1650, 9, 0, 0, 0, 0, 45, 2),
(593, 0, 0, 0, 'Thanah II f', 2850, 9, 0, 0, 0, 0, 80, 3),
(594, 0, 0, 0, 'Thanah II b', 450, 9, 0, 0, 0, 0, 20, 1),
(595, 0, 0, 0, 'Thanah II c', 450, 9, 0, 0, 0, 0, 15, 1),
(596, 0, 0, 0, 'Thanah II d', 350, 9, 0, 0, 0, 0, 16, 1),
(597, 0, 0, 0, 'Thanah II e', 350, 9, 0, 0, 0, 0, 12, 1),
(599, 0, 0, 0, 'Thanah II a', 850, 9, 0, 0, 0, 0, 37, 1),
(600, 0, 0, 0, 'Thrarhor I c (Shop)', 1050, 9, 0, 0, 0, 0, 57, 2),
(601, 0, 0, 0, 'Thrarhor I d (Shop)', 1050, 9, 0, 0, 0, 0, 21, 1),
(602, 0, 0, 0, 'Thrarhor I a (Shop)', 1050, 9, 0, 0, 0, 0, 32, 1),
(603, 0, 0, 0, 'Thrarhor I b (Shop)', 1050, 9, 0, 0, 0, 0, 24, 1),
(604, 0, 0, 0, 'Thanah I c', 3250, 9, 0, 0, 0, 0, 91, 3),
(605, 0, 0, 0, 'Thanah I d', 2900, 9, 0, 0, 0, 0, 80, 4),
(606, 0, 0, 0, 'Thanah I b', 3000, 9, 0, 0, 0, 0, 84, 3),
(607, 0, 0, 0, 'Thanah I a', 850, 9, 0, 0, 0, 0, 27, 1),
(608, 0, 0, 0, 'Harrah I', 5740, 9, 0, 0, 0, 0, 190, 10),
(609, 0, 0, 0, 'Charsirakh I b', 1580, 9, 0, 0, 0, 0, 51, 2),
(610, 0, 0, 0, 'Charsirakh I a', 280, 9, 0, 0, 0, 0, 15, 1),
(611, 0, 0, 0, 'Othehothep I d', 2020, 9, 0, 0, 0, 0, 68, 4),
(612, 0, 0, 0, 'Othehothep I c', 1720, 9, 0, 0, 0, 0, 58, 3),
(613, 0, 0, 0, 'Othehothep I b', 1380, 9, 0, 0, 0, 0, 49, 2),
(614, 0, 0, 0, 'Othehothep I a', 280, 9, 0, 0, 0, 0, 14, 1),
(615, 0, 0, 0, 'Othehothep II e', 1340, 9, 0, 0, 0, 0, 44, 2),
(616, 0, 0, 0, 'Othehothep II f', 1340, 9, 0, 0, 0, 0, 44, 2),
(617, 0, 0, 0, 'Othehothep II d', 840, 9, 0, 0, 0, 0, 32, 1),
(618, 0, 0, 0, 'Othehothep II c', 840, 9, 0, 0, 0, 0, 30, 1),
(619, 0, 0, 0, 'Othehothep II b', 1920, 9, 0, 0, 0, 0, 67, 3),
(620, 0, 0, 0, 'Othehothep II a', 400, 9, 0, 0, 0, 0, 18, 1),
(621, 0, 0, 0, 'Mothrem I', 1140, 9, 0, 0, 0, 0, 38, 2),
(622, 0, 0, 0, 'Arakmehn I', 1320, 9, 0, 0, 0, 0, 41, 3),
(623, 0, 0, 0, 'Othehothep III d', 1040, 9, 0, 0, 0, 0, 36, 1),
(624, 0, 0, 0, 'Othehothep III c', 940, 9, 0, 0, 0, 0, 30, 2),
(625, 0, 0, 0, 'Othehothep III e', 840, 9, 0, 0, 0, 0, 32, 1),
(626, 0, 0, 0, 'Othehothep III f', 680, 9, 0, 0, 0, 0, 27, 1),
(627, 0, 0, 0, 'Othehothep III b', 1340, 9, 0, 0, 0, 0, 49, 2),
(628, 0, 0, 0, 'Othehothep III a', 280, 9, 0, 0, 0, 0, 14, 1),
(629, 0, 0, 0, 'Unklath I d', 1680, 9, 0, 0, 0, 0, 49, 3),
(630, 0, 0, 0, 'Unklath I e', 1580, 9, 0, 0, 0, 0, 51, 2),
(631, 0, 0, 0, 'Unklath I g', 1480, 9, 0, 0, 0, 0, 51, 1),
(632, 0, 0, 0, 'Unklath I f', 1580, 9, 0, 0, 0, 0, 51, 2),
(633, 0, 0, 0, 'Unklath I c', 1460, 9, 0, 0, 0, 0, 50, 2),
(634, 0, 0, 0, 'Unklath I b', 1460, 9, 0, 0, 0, 0, 50, 2),
(635, 0, 0, 0, 'Unklath I a', 1140, 9, 0, 0, 0, 0, 38, 2),
(636, 0, 0, 0, 'Arakmehn II', 1040, 9, 0, 0, 0, 0, 38, 1),
(637, 0, 0, 0, 'Arakmehn III', 1140, 9, 0, 0, 0, 0, 38, 2),
(638, 0, 0, 0, 'Unklath II b', 680, 9, 0, 0, 0, 0, 25, 1),
(639, 0, 0, 0, 'Unklath II c', 680, 9, 0, 0, 0, 0, 27, 1),
(640, 0, 0, 0, 'Unklath II d', 1580, 9, 0, 0, 0, 0, 52, 2),
(641, 0, 0, 0, 'Unklath II a', 1040, 9, 0, 0, 0, 0, 36, 1),
(642, 0, 0, 0, 'Arakmehn IV', 1220, 9, 0, 0, 0, 0, 41, 2),
(643, 0, 0, 0, 'Rathal I b', 680, 9, 0, 0, 0, 0, 25, 1),
(644, 0, 0, 0, 'Rathal I c', 680, 9, 0, 0, 0, 0, 27, 1),
(645, 0, 0, 0, 'Rathal I e', 780, 9, 0, 0, 0, 0, 27, 2),
(646, 0, 0, 0, 'Rathal I d', 780, 9, 0, 0, 0, 0, 27, 2),
(647, 0, 0, 0, 'Rathal I a', 1140, 9, 0, 0, 0, 0, 36, 2),
(648, 0, 0, 0, 'Rathal II b', 680, 9, 0, 0, 0, 0, 25, 1),
(649, 0, 0, 0, 'Rathal II c', 680, 9, 0, 0, 0, 0, 27, 1),
(650, 0, 0, 0, 'Rathal II d', 1460, 9, 0, 0, 0, 0, 52, 2),
(651, 0, 0, 0, 'Rathal II a', 1040, 9, 0, 0, 0, 0, 38, 1),
(653, 0, 0, 0, 'Esuph II a', 280, 9, 0, 0, 0, 0, 14, 1),
(654, 0, 0, 0, 'Uthemath II', 4460, 9, 0, 0, 0, 0, 138, 8),
(655, 0, 0, 0, 'Uthemath I e', 940, 9, 0, 0, 0, 0, 32, 2),
(656, 0, 0, 0, 'Uthemath I d', 840, 9, 0, 0, 0, 0, 30, 1),
(657, 0, 0, 0, 'Uthemath I f', 2440, 9, 0, 0, 0, 0, 86, 3),
(658, 0, 0, 0, 'Uthemath I b', 800, 9, 0, 0, 0, 0, 32, 1),
(659, 0, 0, 0, 'Uthemath I c', 900, 9, 0, 0, 0, 0, 34, 2),
(660, 0, 0, 0, 'Uthemath I a', 400, 9, 0, 0, 0, 0, 18, 1),
(661, 0, 0, 0, 'Botham I c', 1700, 9, 0, 0, 0, 0, 49, 2),
(662, 0, 0, 0, 'Botham I e', 1650, 9, 0, 0, 0, 0, 44, 2),
(663, 0, 0, 0, 'Botham I d', 3050, 9, 0, 0, 0, 0, 80, 3),
(664, 0, 0, 0, 'Botham I b', 3000, 9, 0, 0, 0, 0, 83, 3),
(666, 0, 0, 0, 'Horakhal', 9420, 9, 0, 0, 0, 0, 277, 14),
(667, 0, 0, 0, 'Esuph III b', 1340, 9, 0, 0, 0, 0, 49, 2),
(668, 0, 0, 0, 'Esuph III a', 280, 9, 0, 0, 0, 0, 14, 1),
(669, 0, 0, 0, 'Esuph IV b', 400, 9, 0, 0, 0, 0, 16, 1),
(670, 0, 0, 0, 'Esuph IV c', 400, 9, 0, 0, 0, 0, 18, 1),
(671, 0, 0, 0, 'Esuph IV d', 800, 9, 0, 0, 0, 0, 34, 1),
(672, 0, 0, 0, 'Esuph IV a', 400, 9, 0, 0, 0, 0, 16, 1),
(673, 0, 0, 0, 'Botham II e', 1650, 9, 0, 0, 0, 0, 42, 2),
(674, 0, 0, 0, 'Botham II g', 1400, 9, 0, 0, 0, 0, 38, 2),
(675, 0, 0, 0, 'Botham II f', 1650, 9, 0, 0, 0, 0, 44, 2),
(676, 0, 0, 0, 'Botham II d', 1950, 9, 0, 0, 0, 0, 49, 2),
(677, 0, 0, 0, 'Botham II c', 1250, 9, 0, 0, 0, 0, 38, 2),
(678, 0, 0, 0, 'Botham II b', 1600, 9, 0, 0, 0, 0, 47, 2),
(679, 0, 0, 0, 'Botham II a', 850, 9, 0, 0, 0, 0, 25, 1),
(680, 0, 0, 0, 'Botham III g', 1650, 9, 0, 0, 0, 0, 42, 2),
(681, 0, 0, 0, 'Botham III f', 2350, 9, 0, 0, 0, 0, 56, 3),
(682, 0, 0, 0, 'Botham III h', 3750, 9, 0, 0, 0, 0, 98, 3),
(683, 0, 0, 0, 'Botham III d', 850, 9, 0, 0, 0, 0, 27, 1),
(684, 0, 0, 0, 'Botham III e', 850, 9, 0, 0, 0, 0, 27, 1),
(685, 0, 0, 0, 'Botham III b', 950, 9, 0, 0, 0, 0, 25, 2),
(686, 0, 0, 0, 'Botham III c', 850, 9, 0, 0, 0, 0, 27, 1),
(687, 0, 0, 0, 'Botham III a', 1400, 9, 0, 0, 0, 0, 36, 2),
(688, 0, 0, 0, 'Botham IV i', 1800, 9, 0, 0, 0, 0, 51, 3),
(689, 0, 0, 0, 'Botham IV h', 1850, 9, 0, 0, 0, 0, 49, 1),
(690, 0, 0, 0, 'Botham IV f', 1700, 9, 0, 0, 0, 0, 49, 2),
(691, 0, 0, 0, 'Botham IV g', 1650, 9, 0, 0, 0, 0, 49, 2),
(692, 0, 0, 0, 'Botham IV c', 850, 9, 0, 0, 0, 0, 27, 1),
(693, 0, 0, 0, 'Botham IV e', 850, 9, 0, 0, 0, 0, 27, 1),
(694, 0, 0, 0, 'Botham IV d', 850, 9, 0, 0, 0, 0, 27, 1),
(695, 0, 0, 0, 'Botham IV b', 850, 9, 0, 0, 0, 0, 25, 1),
(696, 0, 0, 0, 'Botham IV a', 1400, 9, 0, 0, 0, 0, 36, 2),
(697, 0, 0, 0, 'Ramen Tah', 7650, 9, 0, 0, 0, 0, 182, 16),
(698, 0, 0, 0, 'Banana Bay 1', 450, 8, 0, 0, 0, 0, 25, 1),
(699, 0, 0, 0, 'Banana Bay 2', 765, 8, 0, 0, 0, 0, 36, 1),
(700, 0, 0, 0, 'Banana Bay 3', 450, 8, 0, 0, 0, 0, 25, 1),
(701, 0, 0, 0, 'Banana Bay 4', 450, 8, 0, 0, 0, 0, 25, 1),
(702, 0, 0, 0, 'Shark Manor', 8780, 8, 0, 0, 0, 0, 286, 15),
(703, 0, 0, 0, 'Coconut Quay 1', 1765, 8, 0, 0, 0, 0, 64, 2),
(704, 0, 0, 0, 'Coconut Quay 2', 1045, 8, 0, 0, 0, 0, 42, 2),
(705, 0, 0, 0, 'Coconut Quay 3', 2145, 8, 0, 0, 0, 0, 70, 4),
(706, 0, 0, 0, 'Coconut Quay 4', 2135, 8, 0, 0, 0, 0, 72, 3),
(707, 0, 0, 0, 'Crocodile Bridge 3', 1270, 8, 0, 0, 0, 0, 49, 2),
(708, 0, 0, 0, 'Crocodile Bridge 2', 865, 8, 0, 0, 0, 0, 36, 2),
(709, 0, 0, 0, 'Crocodile Bridge 1', 1045, 8, 0, 0, 0, 0, 42, 2),
(710, 0, 0, 0, 'Bamboo Garden 1', 1640, 8, 0, 0, 0, 0, 63, 3),
(711, 0, 0, 0, 'Crocodile Bridge 4', 4755, 8, 0, 0, 0, 0, 176, 4),
(712, 0, 0, 0, 'Crocodile Bridge 5', 3970, 8, 0, 0, 0, 0, 157, 2),
(713, 0, 0, 0, 'Woodway 1', 765, 8, 0, 0, 0, 0, 36, 1),
(714, 0, 0, 0, 'Woodway 2', 585, 8, 0, 0, 0, 0, 30, 1),
(715, 0, 0, 0, 'Woodway 3', 1540, 8, 0, 0, 0, 0, 65, 2),
(716, 0, 0, 0, 'Woodway 4', 405, 8, 0, 0, 0, 0, 24, 1),
(717, 0, 0, 0, 'Flamingo Flats 5', 1845, 8, 0, 0, 0, 0, 84, 1),
(718, 0, 0, 0, 'Bamboo Fortress', 21970, 8, 0, 0, 0, 0, 848, 20),
(719, 0, 0, 0, 'Bamboo Garden 3', 1540, 8, 0, 0, 0, 0, 63, 2),
(720, 0, 0, 0, 'Bamboo Garden 2', 1045, 8, 0, 0, 0, 0, 42, 2),
(721, 0, 0, 0, 'Flamingo Flats 4', 865, 8, 0, 0, 0, 0, 36, 2),
(722, 0, 0, 0, 'Flamingo Flats 2', 1045, 8, 0, 0, 0, 0, 42, 2),
(723, 0, 0, 0, 'Flamingo Flats 3', 685, 8, 0, 0, 0, 0, 30, 2),
(724, 0, 0, 0, 'Flamingo Flats 1', 685, 8, 0, 0, 0, 0, 30, 2),
(725, 0, 0, 0, 'Jungle Edge 4', 865, 8, 0, 0, 0, 0, 36, 2),
(726, 0, 0, 0, 'Jungle Edge 5', 865, 8, 0, 0, 0, 0, 36, 2),
(727, 0, 0, 0, 'Jungle Edge 6', 450, 8, 0, 0, 0, 0, 25, 1),
(728, 0, 0, 0, 'Jungle Edge 2', 3170, 8, 0, 0, 0, 0, 128, 3),
(729, 0, 0, 0, 'Jungle Edge 3', 865, 8, 0, 0, 0, 0, 36, 2),
(730, 0, 0, 0, 'Jungle Edge 1', 2495, 8, 0, 0, 0, 0, 98, 3),
(731, 0, 0, 0, 'Haggler''s Hangout 6', 6450, 8, 0, 0, 0, 0, 208, 4),
(732, 0, 0, 0, 'Haggler''s Hangout 5 (Shop)', 1550, 8, 0, 0, 0, 0, 56, 1),
(733, 0, 0, 0, 'Haggler''s Hangout 4a (Shop)', 1850, 8, 0, 0, 0, 0, 56, 1),
(734, 0, 0, 0, 'Haggler''s Hangout 4b (Shop)', 1550, 8, 0, 0, 0, 0, 56, 1),
(735, 0, 0, 0, 'Haggler''s Hangout 3', 7550, 8, 0, 0, 0, 0, 256, 4),
(736, 0, 0, 0, 'Haggler''s Hangout 2', 1300, 8, 0, 0, 0, 0, 49, 1),
(737, 0, 0, 0, 'Haggler''s Hangout 1', 1400, 8, 0, 0, 0, 0, 49, 2),
(738, 0, 0, 0, 'River Homes 1', 3485, 8, 0, 0, 0, 0, 128, 3),
(739, 0, 0, 0, 'River Homes 2a', 1270, 8, 0, 0, 0, 0, 42, 2),
(740, 0, 0, 0, 'River Homes 2b', 1595, 8, 0, 0, 0, 0, 56, 3),
(741, 0, 0, 0, 'River Homes 3', 5055, 8, 0, 0, 0, 0, 176, 7),
(742, 0, 0, 0, 'The Treehouse', 24120, 8, 0, 0, 0, 0, 897, 23),
(743, 0, 0, 0, 'Corner Shop (Shop)', 2215, 12, 0, 0, 0, 0, 96, 2),
(744, 0, 0, 0, 'Tusk Flats 1', 765, 12, 0, 0, 0, 0, 40, 2),
(745, 0, 0, 0, 'Tusk Flats 2', 835, 12, 0, 0, 0, 0, 42, 2),
(746, 0, 0, 0, 'Tusk Flats 3', 660, 12, 0, 0, 0, 0, 34, 2),
(747, 0, 0, 0, 'Tusk Flats 4', 315, 12, 0, 0, 0, 0, 24, 1),
(748, 0, 0, 0, 'Tusk Flats 6', 660, 12, 0, 0, 0, 0, 35, 2),
(749, 0, 0, 0, 'Tusk Flats 5', 455, 12, 0, 0, 0, 0, 30, 1),
(750, 0, 0, 0, 'Shady Rocks 5', 2890, 12, 0, 0, 0, 0, 110, 2),
(751, 0, 0, 0, 'Shady Rocks 4 (Shop)', 2710, 12, 0, 0, 0, 0, 110, 2),
(752, 0, 0, 0, 'Shady Rocks 3', 4115, 12, 0, 0, 0, 0, 154, 3),
(753, 0, 0, 0, 'Shady Rocks 2', 2010, 12, 0, 0, 0, 0, 77, 4),
(754, 0, 0, 0, 'Shady Rocks 1', 3630, 12, 0, 0, 0, 0, 132, 4),
(755, 0, 0, 0, 'Crystal Glance', 19625, 12, 0, 0, 0, 0, 569, 24),
(756, 0, 0, 0, 'Arena Walk 3', 3550, 12, 0, 0, 0, 0, 126, 3),
(757, 0, 0, 0, 'Arena Walk 2', 1400, 12, 0, 0, 0, 0, 54, 2),
(758, 0, 0, 0, 'Arena Walk 1', 3250, 12, 0, 0, 0, 0, 128, 3),
(759, 0, 0, 0, 'Bears Paw 2', 2305, 12, 0, 0, 0, 0, 100, 2),
(760, 0, 0, 0, 'Bears Paw 1', 1810, 12, 0, 0, 0, 0, 72, 2),
(761, 0, 0, 0, 'Spirit Homes 5', 1450, 12, 0, 0, 0, 0, 56, 2),
(762, 0, 0, 0, 'Glacier Side 3', 1950, 12, 0, 0, 0, 0, 75, 2),
(763, 0, 0, 0, 'Glacier Side 2', 4750, 12, 0, 0, 0, 0, 154, 3),
(764, 0, 0, 0, 'Glacier Side 1', 1600, 12, 0, 0, 0, 0, 65, 2),
(765, 0, 0, 0, 'Spirit Homes 1', 1700, 12, 0, 0, 0, 0, 56, 2),
(766, 0, 0, 0, 'Spirit Homes 2', 1900, 12, 0, 0, 0, 0, 72, 2),
(767, 0, 0, 0, 'Spirit Homes 3', 4250, 12, 0, 0, 0, 0, 128, 3),
(768, 0, 0, 0, 'Spirit Homes 4', 1100, 12, 0, 0, 0, 0, 49, 1),
(770, 0, 0, 0, 'Glacier Side 4', 2050, 12, 0, 0, 0, 0, 75, 1),
(771, 0, 0, 0, 'Shelf Site', 4800, 12, 0, 0, 0, 0, 160, 3),
(772, 0, 0, 0, 'Raven Corner 1', 855, 12, 0, 0, 0, 0, 45, 1),
(773, 0, 0, 0, 'Raven Corner 2', 1685, 12, 0, 0, 0, 0, 60, 3),
(774, 0, 0, 0, 'Raven Corner 3', 855, 12, 0, 0, 0, 0, 45, 1),
(775, 0, 0, 0, 'Bears Paw 3', 2090, 12, 0, 0, 0, 0, 82, 3),
(776, 0, 0, 0, 'Bears Paw 4', 5205, 12, 0, 0, 0, 0, 189, 4),
(778, 0, 0, 0, 'Bears Paw 5', 2045, 12, 0, 0, 0, 0, 81, 3),
(779, 0, 0, 0, 'Trout Plaza 5 (Shop)', 3880, 12, 0, 0, 0, 0, 144, 2),
(780, 0, 0, 0, 'Pilchard Bin 1', 685, 12, 0, 0, 0, 0, 30, 2),
(781, 0, 0, 0, 'Pilchard Bin 2', 685, 12, 0, 0, 0, 0, 24, 2),
(782, 0, 0, 0, 'Pilchard Bin 3', 585, 12, 0, 0, 0, 0, 24, 1),
(783, 0, 0, 0, 'Pilchard Bin 4', 585, 12, 0, 0, 0, 0, 24, 1),
(784, 0, 0, 0, 'Pilchard Bin 5', 685, 12, 0, 0, 0, 0, 24, 2),
(785, 0, 0, 0, 'Pilchard Bin 10', 450, 12, 0, 0, 0, 0, 20, 1),
(786, 0, 0, 0, 'Pilchard Bin 9', 450, 12, 0, 0, 0, 0, 20, 1),
(787, 0, 0, 0, 'Pilchard Bin 8', 450, 12, 0, 0, 0, 0, 20, 2),
(789, 0, 0, 0, 'Pilchard Bin 7', 450, 12, 0, 0, 0, 0, 20, 1),
(790, 0, 0, 0, 'Pilchard Bin 6', 450, 12, 0, 0, 0, 0, 25, 1),
(791, 0, 0, 0, 'Trout Plaza 1', 2395, 12, 0, 0, 0, 0, 112, 2),
(792, 0, 0, 0, 'Trout Plaza 2', 1540, 12, 0, 0, 0, 0, 64, 2),
(793, 0, 0, 0, 'Trout Plaza 3', 900, 12, 0, 0, 0, 0, 36, 1),
(794, 0, 0, 0, 'Trout Plaza 4', 900, 12, 0, 0, 0, 0, 45, 1),
(795, 0, 0, 0, 'Skiffs End 1', 1540, 12, 0, 0, 0, 0, 70, 2),
(796, 0, 0, 0, 'Skiffs End 2', 910, 12, 0, 0, 0, 0, 42, 2),
(797, 0, 0, 0, 'Furrier Quarter 3', 1010, 12, 0, 0, 0, 0, 54, 2),
(798, 0, 0, 0, 'Mammoth Belly', 22810, 12, 0, 0, 0, 0, 634, 30),
(799, 0, 0, 0, 'Furrier Quarter 2', 1045, 12, 0, 0, 0, 0, 56, 2),
(800, 0, 0, 0, 'Furrier Quarter 1', 1635, 12, 0, 0, 0, 0, 84, 3),
(801, 0, 0, 0, 'Fimbul Shelf 3', 1255, 12, 0, 0, 0, 0, 66, 2),
(802, 0, 0, 0, 'Fimbul Shelf 4', 1045, 12, 0, 0, 0, 0, 56, 2),
(803, 0, 0, 0, 'Fimbul Shelf 2', 1045, 12, 0, 0, 0, 0, 56, 2),
(804, 0, 0, 0, 'Fimbul Shelf 1', 975, 12, 0, 0, 0, 0, 48, 2),
(805, 0, 0, 0, 'Frost Manor', 26370, 12, 0, 0, 0, 0, 806, 24),
(807, 0, 0, 0, 'Lower Barracks 12', 300, 3, 0, 0, 0, 0, 16, 1),
(809, 0, 0, 0, 'Lower Barracks 10', 300, 3, 0, 0, 0, 0, 19, 1),
(811, 0, 0, 0, 'Lower Barracks 8', 300, 3, 0, 0, 0, 0, 16, 1),
(813, 0, 0, 0, 'Lower Barracks 6', 300, 3, 0, 0, 0, 0, 16, 1),
(815, 0, 0, 0, 'Lower Barracks 4', 300, 3, 0, 0, 0, 0, 19, 1),
(817, 0, 0, 0, 'Lower Barracks 2', 300, 3, 0, 0, 0, 0, 16, 1),
(818, 0, 0, 0, 'Lower Barracks 24', 300, 3, 0, 0, 0, 0, 20, 1),
(819, 0, 0, 0, 'Lower Barracks 23', 300, 3, 0, 0, 0, 0, 16, 1),
(820, 0, 0, 0, 'Lower Barracks 22', 300, 3, 0, 0, 0, 0, 20, 1),
(821, 0, 0, 0, 'Lower Barracks 21', 300, 3, 0, 0, 0, 0, 16, 1),
(822, 0, 0, 0, 'Lower Barracks 20', 300, 3, 0, 0, 0, 0, 20, 1),
(823, 0, 0, 0, 'Lower Barracks 19', 300, 3, 0, 0, 0, 0, 16, 1),
(824, 0, 0, 0, 'Lower Barracks 18', 300, 3, 0, 0, 0, 0, 20, 1),
(825, 0, 0, 0, 'Lower Barracks 17', 300, 3, 0, 0, 0, 0, 16, 1),
(826, 0, 0, 0, 'Lower Barracks 16', 300, 3, 0, 0, 0, 0, 20, 1),
(828, 0, 0, 0, 'Lower Barracks 15', 300, 3, 0, 0, 0, 0, 16, 1),
(829, 0, 0, 0, 'Lower Barracks 14', 300, 3, 0, 0, 0, 0, 20, 1),
(830, 0, 0, 0, 'Lower Barracks 13', 300, 3, 0, 0, 0, 0, 13, 0),
(831, 0, 0, 0, 'Marble Guildhall', 16810, 3, 0, 0, 0, 0, 540, 17),
(832, 0, 0, 0, 'Iron Guildhall', 15560, 3, 0, 0, 0, 0, 453, 17),
(833, 0, 0, 0, 'The Market 1 (Shop)', 650, 3, 0, 0, 0, 0, 25, 1),
(834, 0, 0, 0, 'The Market 3 (Shop)', 1450, 3, 0, 0, 0, 0, 40, 1),
(835, 0, 0, 0, 'The Market 2 (Shop)', 1100, 3, 0, 0, 0, 0, 40, 1),
(836, 0, 0, 0, 'The Market 4 (Shop)', 1800, 3, 0, 0, 0, 0, 48, 1),
(837, 0, 0, 0, 'Granite Guildhall', 17845, 3, 0, 0, 0, 0, 456, 17),
(838, 0, 0, 0, 'Upper Barracks 1', 210, 3, 0, 0, 0, 0, 8, 1),
(850, 0, 0, 0, 'Upper Barracks 13', 580, 3, 0, 0, 0, 0, 16, 2),
(851, 0, 0, 0, 'Nobility Quarter 4', 765, 3, 0, 0, 0, 0, 16, 1),
(852, 0, 0, 0, 'Nobility Quarter 5', 765, 3, 0, 0, 0, 0, 16, 1),
(853, 0, 0, 0, 'Nobility Quarter 7', 765, 3, 0, 0, 0, 0, 16, 1),
(854, 0, 0, 0, 'Nobility Quarter 6', 765, 3, 0, 0, 0, 0, 16, 1),
(855, 0, 0, 0, 'Nobility Quarter 8', 765, 3, 0, 0, 0, 0, 16, 1),
(856, 0, 0, 0, 'Nobility Quarter 9', 765, 3, 0, 0, 0, 0, 16, 1),
(857, 0, 0, 0, 'Nobility Quarter 2', 1865, 3, 0, 0, 0, 0, 36, 3),
(858, 0, 0, 0, 'Nobility Quarter 3', 1865, 3, 0, 0, 0, 0, 36, 3),
(859, 0, 0, 0, 'Nobility Quarter 1', 1865, 3, 0, 0, 0, 0, 36, 3),
(863, 0, 0, 0, 'The Farms 6, Fishing Hut', 1255, 3, 0, 0, 0, 0, 32, 2),
(864, 0, 0, 0, 'The Farms 5', 1530, 3, 0, 0, 0, 0, 28, 2),
(866, 0, 0, 0, 'The Farms 3', 1530, 3, 0, 0, 0, 0, 25, 2),
(867, 0, 0, 0, 'The Farms 2', 1530, 3, 0, 0, 0, 0, 25, 2),
(868, 0, 0, 0, 'The Farms 1', 2510, 3, 0, 0, 0, 0, 41, 3),
(886, 0, 0, 0, 'Outlaw Castle', 8000, 3, 0, 0, 0, 0, 250, 9),
(889, 0, 0, 0, 'Tunnel Gardens 3', 2000, 3, 0, 0, 0, 0, 12, 0),
(890, 0, 0, 0, 'Tunnel Gardens 4', 2000, 3, 0, 0, 0, 0, 4, 0),
(892, 0, 0, 0, 'Tunnel Gardens 5', 1360, 3, 0, 0, 0, 0, 35, 2),
(893, 0, 0, 0, 'Tunnel Gardens 6', 1360, 3, 0, 0, 0, 0, 38, 2),
(894, 0, 0, 0, 'Tunnel Gardens 8', 1360, 3, 0, 0, 0, 0, 35, 2),
(895, 0, 0, 0, 'Tunnel Gardens 7', 1360, 3, 0, 0, 0, 0, 35, 2),
(900, 0, 0, 0, 'Wolftower', 21550, 3, 0, 0, 0, 0, 638, 23),
(901, 0, 0, 0, 'Paupers Palace, Flat 11', 315, 1, 0, 0, 0, 0, 12, 1),
(905, 0, 0, 0, 'Botham I a', 950, 9, 0, 0, 0, 0, 36, 1),
(906, 0, 0, 0, 'Esuph I', 680, 9, 0, 0, 0, 0, 39, 1),
(907, 0, 0, 0, 'Esuph II b', 1380, 9, 0, 0, 0, 0, 51, 2),
(1883, 0, 0, 0, 'Aureate Court 1', 5240, 13, 0, 0, 0, 0, 276, 3),
(1884, 0, 0, 0, 'Aureate Court 2', 4860, 13, 0, 0, 0, 0, 198, 2),
(1885, 0, 0, 0, 'Aureate Court 3', 4300, 13, 0, 0, 0, 0, 226, 2),
(1886, 0, 0, 0, 'Aureate Court 4', 3980, 13, 0, 0, 0, 0, 208, 4),
(1887, 387, 0, 0, 'Fortune Wing 1', 10180, 13, 0, 0, 0, 0, 420, 4),
(1888, 0, 0, 0, 'Fortune Wing 2', 5580, 13, 0, 0, 0, 0, 260, 2),
(1889, 0, 0, 0, 'Fortune Wing 3', 5740, 13, 0, 0, 0, 0, 258, 2),
(1890, 0, 0, 0, 'Fortune Wing 4', 5740, 13, 0, 0, 0, 0, 305, 4),
(1891, 0, 0, 0, 'Luminous Arc 1', 6460, 13, 0, 0, 0, 0, 344, 2),
(1892, 0, 0, 0, 'Luminous Arc 2', 6460, 13, 0, 0, 0, 0, 301, 4),
(1893, 0, 1405349999, 0, 'Luminous Arc 3', 5400, 13, 0, 0, 0, 0, 249, 3),
(1894, 0, 0, 0, 'Luminous Arc 4', 8000, 13, 0, 0, 0, 0, 343, 5),
(1895, 0, 0, 0, 'Radiant Plaza 1', 5620, 13, 0, 0, 0, 0, 276, 4),
(1896, 0, 0, 0, 'Radiant Plaza 2', 3820, 13, 0, 0, 0, 0, 179, 2),
(1897, 0, 0, 0, 'Radiant Plaza 3', 4900, 13, 0, 0, 0, 0, 256, 2),
(1898, 0, 0, 0, 'Radiant Plaza 4', 7460, 13, 0, 0, 0, 0, 367, 3),
(1899, 0, 0, 0, 'Sun Palace', 23120, 13, 0, 0, 0, 0, 974, 27),
(1900, 0, 0, 0, 'Halls of Serenity', 23360, 13, 0, 0, 0, 0, 1090, 33),
(1901, 0, 0, 0, 'Cascade Towers', 19500, 13, 0, 0, 0, 0, 810, 33),
(1902, 0, 0, 0, 'Sorcerer''s Avenue 5', 2695, 2, 0, 0, 0, 0, 96, 1),
(1903, 0, 0, 0, 'Sorcerer''s Avenue 1a', 1255, 2, 0, 0, 0, 0, 42, 2),
(1904, 0, 0, 0, 'Sorcerer''s Avenue 1b', 1035, 2, 0, 0, 0, 0, 36, 2),
(1905, 0, 0, 0, 'Sorcerer''s Avenue 1c', 1255, 2, 0, 0, 0, 0, 36, 2),
(1906, 0, 0, 0, 'Beach Home Apartments, Flat 06', 1145, 2, 0, 0, 0, 0, 40, 2),
(1907, 0, 0, 0, 'Beach Home Apartments, Flat 01', 715, 2, 0, 0, 0, 0, 30, 1),
(1908, 0, 0, 0, 'Beach Home Apartments, Flat 02', 715, 2, 0, 0, 0, 0, 25, 1),
(1909, 0, 0, 0, 'Beach Home Apartments, Flat 03', 715, 2, 0, 0, 0, 0, 30, 1),
(1910, 0, 0, 0, 'Beach Home Apartments, Flat 04', 715, 2, 0, 0, 0, 0, 24, 1),
(1911, 0, 0, 0, 'Beach Home Apartments, Flat 05', 715, 2, 0, 0, 0, 0, 24, 1),
(1912, 0, 0, 0, 'Beach Home Apartments, Flat 16', 1145, 2, 0, 0, 0, 0, 40, 2),
(1913, 0, 0, 0, 'Beach Home Apartments, Flat 11', 715, 2, 0, 0, 0, 0, 30, 1),
(1914, 0, 0, 0, 'Beach Home Apartments, Flat 12', 880, 2, 0, 0, 0, 0, 30, 1),
(1915, 0, 0, 0, 'Beach Home Apartments, Flat 13', 880, 2, 0, 0, 0, 0, 29, 1),
(1916, 0, 0, 0, 'Beach Home Apartments, Flat 14', 385, 2, 0, 0, 0, 0, 15, 1),
(1917, 0, 0, 0, 'Beach Home Apartments, Flat 15', 385, 2, 0, 0, 0, 0, 15, 1),
(1918, 0, 0, 3, 'Thais Clanhall', 8420, 2, 0, 0, 0, 0, 370, 10),
(1919, 0, 0, 0, 'Harbour Street 4', 935, 2, 0, 0, 0, 0, 30, 1),
(1920, 0, 0, 0, 'Thais Hostel', 6980, 2, 0, 0, 0, 0, 171, 24),
(1921, 0, 0, 0, 'Lower Swamp Lane 1', 4740, 2, 0, 0, 0, 0, 166, 4),
(1923, 0, 0, 0, 'Lower Swamp Lane 3', 4740, 2, 0, 0, 0, 0, 161, 4),
(1924, 0, 0, 0, 'Sunset Homes, Flat 01', 520, 2, 0, 0, 0, 0, 25, 1),
(1925, 0, 0, 0, 'Sunset Homes, Flat 02', 520, 2, 0, 0, 0, 0, 30, 1),
(1926, 0, 0, 0, 'Sunset Homes, Flat 03', 520, 2, 0, 0, 0, 0, 30, 1),
(1927, 0, 0, 0, 'Sunset Homes, Flat 14', 520, 2, 0, 0, 0, 0, 30, 1),
(1929, 0, 0, 0, 'Sunset Homes, Flat 13', 860, 2, 0, 0, 0, 0, 35, 2),
(1930, 0, 0, 0, 'Sunset Homes, Flat 12', 520, 2, 0, 0, 0, 0, 25, 1),
(1932, 0, 0, 0, 'Sunset Homes, Flat 11', 520, 2, 0, 0, 0, 0, 25, 1),
(1935, 0, 0, 0, 'Sunset Homes, Flat 24', 520, 2, 0, 0, 0, 0, 30, 1),
(1936, 0, 0, 0, 'Sunset Homes, Flat 23', 860, 2, 0, 0, 0, 0, 35, 2),
(1937, 0, 0, 0, 'Sunset Homes, Flat 22', 520, 2, 0, 0, 0, 0, 25, 1),
(1938, 0, 0, 0, 'Sunset Homes, Flat 21', 520, 2, 0, 0, 0, 0, 25, 1),
(1939, 379, 1405598432, 2, 'Harbour Place 1 (Shop)', 1100, 2, 0, 0, 0, 0, 22, 1),
(1940, 433, 1405456710, 5, 'Harbour Place 2 (Shop)', 1300, 2, 0, 0, 0, 0, 48, 1),
(1941, 459, 1405261207, 0, 'Warriors Guildhall', 14725, 2, 0, 0, 0, 0, 523, 11),
(1942, 0, 0, 0, 'Farm Lane, 1st floor (Shop)', 945, 2, 0, 0, 0, 0, 42, 0),
(1943, 0, 0, 0, 'Farm Lane, Basement (Shop)', 945, 2, 0, 0, 0, 0, 36, 0),
(1944, 480, 1405261207, 0, 'Main Street 9, 1st floor (Shop)', 1440, 2, 0, 0, 0, 0, 47, 0),
(1945, 0, 0, 0, 'Main Street 9a, 2nd floor (Shop)', 765, 2, 0, 0, 0, 0, 30, 0),
(1946, 475, 0, 1, 'Main Street 9b, 2nd floor (Shop)', 1260, 2, 0, 0, 0, 0, 48, 0),
(1947, 0, 0, 0, 'Farm Lane, 2nd Floor (Shop)', 945, 2, 0, 0, 0, 0, 42, 0),
(1948, 0, 0, 0, 'The City Wall 5a', 585, 2, 0, 0, 0, 0, 24, 1),
(1949, 0, 0, 0, 'The City Wall 5c', 585, 2, 0, 0, 0, 0, 24, 1),
(1950, 0, 0, 0, 'The City Wall 5e', 585, 2, 0, 0, 0, 0, 30, 1),
(1951, 0, 0, 0, 'The City Wall 5b', 585, 2, 0, 0, 0, 0, 24, 1),
(1952, 0, 0, 0, 'The City Wall 5d', 585, 2, 0, 0, 0, 0, 24, 1),
(1953, 0, 0, 0, 'The City Wall 5f', 585, 2, 0, 0, 0, 0, 30, 1),
(1954, 0, 0, 0, 'The City Wall 3a', 1045, 2, 0, 0, 0, 0, 42, 2),
(1955, 0, 0, 0, 'The City Wall 3b', 1045, 2, 0, 0, 0, 0, 35, 2),
(1956, 0, 0, 0, 'The City Wall 3c', 1045, 2, 0, 0, 0, 0, 35, 2),
(1957, 0, 0, 0, 'The City Wall 3d', 1045, 2, 0, 0, 0, 0, 41, 2),
(1958, 0, 0, 0, 'The City Wall 3e', 1045, 2, 0, 0, 0, 0, 30, 2),
(1959, 0, 0, 0, 'The City Wall 3f', 1045, 2, 0, 0, 0, 0, 31, 2),
(1960, 0, 0, 0, 'The City Wall 1a', 1270, 2, 0, 0, 0, 0, 49, 2),
(1961, 0, 0, 0, 'Mill Avenue 3', 1400, 2, 0, 0, 0, 0, 49, 2),
(1962, 0, 0, 0, 'The City Wall 1b', 1270, 2, 0, 0, 0, 0, 49, 2),
(1963, 0, 0, 0, 'Mill Avenue 4', 1400, 2, 0, 0, 0, 0, 49, 2),
(1964, 474, 0, 1, 'Mill Avenue 5', 3250, 2, 0, 0, 0, 0, 128, 4),
(1965, 449, 0, 1, 'Mill Avenue 1 (Shop)', 1300, 2, 0, 0, 0, 0, 54, 1),
(1966, 0, 0, 0, 'Mill Avenue 2 (Shop)', 2350, 2, 0, 0, 0, 0, 80, 2),
(1967, 0, 0, 0, 'The City Wall 7c', 865, 2, 0, 0, 0, 0, 36, 2),
(1968, 0, 0, 0, 'The City Wall 7a', 585, 2, 0, 0, 0, 0, 30, 1),
(1969, 0, 0, 0, 'The City Wall 7e', 865, 2, 0, 0, 0, 0, 36, 2),
(1970, 0, 0, 0, 'The City Wall 7g', 585, 2, 0, 0, 0, 0, 30, 1),
(1971, 0, 0, 0, 'The City Wall 7d', 865, 2, 0, 0, 0, 0, 36, 2),
(1972, 0, 0, 0, 'The City Wall 7b', 585, 2, 0, 0, 0, 0, 30, 1),
(1973, 0, 0, 0, 'The City Wall 7f', 865, 2, 0, 0, 0, 0, 35, 2),
(1974, 0, 0, 0, 'The City Wall 7h', 585, 2, 0, 0, 0, 0, 30, 1),
(1975, 0, 0, 0, 'The City Wall 9', 955, 2, 0, 0, 0, 0, 50, 2),
(1976, 0, 0, 0, 'Upper Swamp Lane 12', 3800, 2, 0, 0, 0, 0, 116, 3),
(1977, 0, 0, 0, 'Upper Swamp Lane 10', 2060, 2, 0, 0, 0, 0, 70, 3),
(1978, 0, 1405945253, 7, 'Upper Swamp Lane 8', 8120, 2, 0, 0, 0, 0, 216, 3),
(1979, 0, 0, 0, 'Southern Thais Guildhall', 22440, 2, 0, 0, 0, 0, 596, 16),
(1980, 0, 0, 0, 'Alai Flats, Flat 04', 765, 2, 0, 0, 0, 0, 30, 1),
(1981, 0, 0, 0, 'Alai Flats, Flat 05', 1225, 2, 0, 0, 0, 0, 38, 2),
(1982, 0, 0, 0, 'Alai Flats, Flat 06', 1225, 2, 0, 0, 0, 0, 48, 2),
(1983, 0, 0, 0, 'Alai Flats, Flat 07', 765, 2, 0, 0, 0, 0, 30, 1),
(1984, 0, 0, 0, 'Alai Flats, Flat 08', 765, 2, 0, 0, 0, 0, 30, 1),
(1985, 0, 0, 0, 'Alai Flats, Flat 03', 765, 2, 0, 0, 0, 0, 35, 1),
(1986, 0, 0, 0, 'Alai Flats, Flat 01', 765, 2, 0, 0, 0, 0, 25, 1),
(1987, 0, 0, 0, 'Alai Flats, Flat 02', 765, 2, 0, 0, 0, 0, 36, 1),
(1988, 0, 0, 0, 'Alai Flats, Flat 14', 900, 2, 0, 0, 0, 0, 33, 1),
(1989, 0, 0, 0, 'Alai Flats, Flat 15', 1450, 2, 0, 0, 0, 0, 48, 2),
(1990, 0, 0, 0, 'Alai Flats, Flat 16', 1450, 2, 0, 0, 0, 0, 54, 2),
(1991, 0, 0, 0, 'Alai Flats, Flat 17', 900, 2, 0, 0, 0, 0, 38, 1),
(1992, 0, 0, 0, 'Alai Flats, Flat 18', 900, 2, 0, 0, 0, 0, 38, 1),
(1993, 0, 0, 0, 'Alai Flats, Flat 13', 765, 2, 0, 0, 0, 0, 36, 1),
(1994, 0, 0, 0, 'Alai Flats, Flat 12', 765, 2, 0, 0, 0, 0, 25, 1),
(1995, 0, 0, 0, 'Alai Flats, Flat 11', 765, 2, 0, 0, 0, 0, 35, 1),
(1996, 0, 0, 0, 'Alai Flats, Flat 24', 900, 2, 0, 0, 0, 0, 36, 1),
(1997, 0, 0, 0, 'Alai Flats, Flat 25', 1450, 2, 0, 0, 0, 0, 52, 2),
(1998, 0, 0, 0, 'Alai Flats, Flat 26', 1450, 2, 0, 0, 0, 0, 60, 2),
(1999, 0, 0, 0, 'Alai Flats, Flat 27', 900, 2, 0, 0, 0, 0, 38, 1),
(2000, 0, 0, 0, 'Alai Flats, Flat 28', 900, 2, 0, 0, 0, 0, 38, 1),
(2001, 0, 0, 0, 'Alai Flats, Flat 23', 765, 2, 0, 0, 0, 0, 35, 1),
(2002, 0, 0, 0, 'Alai Flats, Flat 22', 765, 2, 0, 0, 0, 0, 25, 1),
(2003, 0, 0, 0, 'Alai Flats, Flat 21', 765, 2, 0, 0, 0, 0, 36, 1),
(2004, 378, 0, 1, 'Upper Swamp Lane 4', 4740, 2, 0, 0, 0, 0, 165, 4),
(2005, 436, 1406218881, 1, 'Upper Swamp Lane 2', 4740, 2, 0, 0, 0, 0, 159, 4),
(2006, 0, 0, 0, 'Sorcerer''s Avenue Labs 2c', 715, 2, 0, 0, 0, 0, 20, 1),
(2007, 0, 0, 0, 'Sorcerer''s Avenue Labs 2d', 715, 2, 0, 0, 0, 0, 20, 1),
(2008, 0, 0, 0, 'Sorcerer''s Avenue Labs 2e', 715, 2, 0, 0, 0, 0, 20, 1),
(2009, 0, 0, 0, 'Sorcerer''s Avenue Labs 2f', 715, 2, 0, 0, 0, 0, 20, 1),
(2010, 0, 0, 0, 'Sorcerer''s Avenue Labs 2b', 715, 2, 0, 0, 0, 0, 24, 1),
(2011, 0, 0, 0, 'Sorcerer''s Avenue Labs 2a', 715, 2, 0, 0, 0, 0, 24, 1),
(2012, 0, 0, 0, 'Ivory Circle 1', 4280, 7, 0, 0, 0, 0, 160, 2),
(2013, 0, 0, 0, 'Admiral''s Avenue 3', 4115, 7, 0, 0, 0, 0, 142, 2),
(2014, 0, 0, 0, 'Admiral''s Avenue 2', 5470, 7, 0, 0, 0, 0, 176, 4),
(2015, 0, 0, 0, 'Admiral''s Avenue 1', 5105, 7, 0, 0, 0, 0, 168, 2),
(2016, 0, 0, 0, 'Sugar Street 5', 1350, 7, 0, 0, 0, 0, 48, 2),
(2017, 0, 0, 0, 'Freedom Street 1', 2450, 7, 0, 0, 0, 0, 84, 2),
(2018, 0, 0, 0, 'Freedom Street 2', 6050, 7, 0, 0, 0, 0, 208, 4),
(2019, 0, 0, 0, 'Trader''s Point 2 (Shop)', 5350, 7, 0, 0, 0, 0, 198, 2),
(2020, 0, 0, 0, 'Trader''s Point 3 (Shop)', 5950, 7, 0, 0, 0, 0, 195, 2),
(2021, 0, 0, 0, 'Ivory Circle 2', 7030, 7, 0, 0, 0, 0, 214, 2),
(2022, 0, 0, 0, 'The Tavern 1a', 2750, 7, 0, 0, 0, 0, 72, 4),
(2023, 0, 0, 0, 'The Tavern 1b', 1900, 7, 0, 0, 0, 0, 54, 2),
(2024, 0, 0, 0, 'The Tavern 1c', 4150, 7, 0, 0, 0, 0, 132, 3),
(2025, 0, 0, 0, 'The Tavern 1d', 1550, 7, 0, 0, 0, 0, 48, 2),
(2026, 0, 0, 0, 'The Tavern 2d', 1350, 7, 0, 0, 0, 0, 40, 2),
(2027, 0, 0, 0, 'The Tavern 2c', 950, 7, 0, 0, 0, 0, 32, 1),
(2028, 0, 0, 0, 'The Tavern 2b', 1700, 7, 0, 0, 0, 0, 62, 2),
(2029, 0, 0, 0, 'The Tavern 2a', 5550, 7, 0, 0, 0, 0, 163, 5),
(2030, 0, 0, 0, 'Straycat''s Corner 4', 210, 7, 0, 0, 0, 0, 20, 1),
(2031, 0, 0, 0, 'Straycat''s Corner 3', 210, 7, 0, 0, 0, 0, 20, 1),
(2032, 0, 0, 0, 'Straycat''s Corner 2', 660, 7, 0, 0, 0, 0, 49, 1),
(2033, 0, 0, 0, 'Litter Promenade 5', 580, 7, 0, 0, 0, 0, 35, 2),
(2034, 0, 0, 0, 'Litter Promenade 4', 390, 7, 0, 0, 0, 0, 30, 1),
(2035, 0, 0, 0, 'Litter Promenade 3', 450, 7, 0, 0, 0, 0, 36, 1),
(2036, 0, 0, 0, 'Litter Promenade 2', 300, 7, 0, 0, 0, 0, 25, 1),
(2037, 0, 0, 0, 'Litter Promenade 1', 400, 7, 0, 0, 0, 0, 25, 2),
(2038, 0, 0, 0, 'The Shelter', 13590, 7, 0, 0, 0, 0, 560, 31),
(2039, 0, 0, 0, 'Straycat''s Corner 6', 300, 7, 0, 0, 0, 0, 25, 1),
(2040, 0, 0, 0, 'Straycat''s Corner 5', 760, 7, 0, 0, 0, 0, 48, 2),
(2042, 0, 0, 0, 'Rum Alley 3', 330, 7, 0, 0, 0, 0, 28, 1),
(2043, 0, 0, 0, 'Straycat''s Corner 1', 300, 7, 0, 0, 0, 0, 25, 1),
(2044, 0, 0, 0, 'Rum Alley 2', 300, 7, 0, 0, 0, 0, 25, 1),
(2045, 0, 0, 0, 'Rum Alley 1', 510, 7, 0, 0, 0, 0, 36, 1),
(2046, 0, 0, 0, 'Smuggler Backyard 3', 700, 7, 0, 0, 0, 0, 40, 2),
(2048, 0, 0, 0, 'Shady Trail 3', 300, 7, 0, 0, 0, 0, 25, 1),
(2049, 0, 0, 0, 'Shady Trail 1', 1150, 7, 0, 0, 0, 0, 48, 5),
(2050, 0, 0, 0, 'Shady Trail 2', 490, 7, 0, 0, 0, 0, 30, 2),
(2051, 0, 0, 0, 'Smuggler Backyard 5', 610, 7, 0, 0, 0, 0, 35, 2),
(2052, 0, 0, 0, 'Smuggler Backyard 4', 390, 7, 0, 0, 0, 0, 30, 1),
(2053, 0, 0, 0, 'Smuggler Backyard 2', 670, 7, 0, 0, 0, 0, 40, 2),
(2054, 0, 0, 0, 'Smuggler Backyard 1', 670, 7, 0, 0, 0, 0, 40, 2),
(2055, 0, 0, 0, 'Sugar Street 2', 2550, 7, 0, 0, 0, 0, 84, 3),
(2056, 0, 0, 0, 'Sugar Street 1', 3000, 7, 0, 0, 0, 0, 84, 3),
(2057, 0, 0, 0, 'Sugar Street 3a', 1650, 7, 0, 0, 0, 0, 54, 3),
(2058, 0, 0, 0, 'Sugar Street 3b', 2050, 7, 0, 0, 0, 0, 60, 3),
(2059, 0, 0, 0, 'Harvester''s Haven, Flat 01', 950, 7, 0, 0, 0, 0, 36, 2),
(2060, 0, 0, 0, 'Harvester''s Haven, Flat 03', 950, 7, 0, 0, 0, 0, 30, 2),
(2061, 0, 0, 0, 'Harvester''s Haven, Flat 05', 950, 7, 0, 0, 0, 0, 30, 2),
(2062, 0, 0, 0, 'Harvester''s Haven, Flat 02', 950, 7, 0, 0, 0, 0, 36, 2),
(2063, 0, 0, 0, 'Harvester''s Haven, Flat 04', 950, 7, 0, 0, 0, 0, 30, 2),
(2064, 0, 0, 0, 'Harvester''s Haven, Flat 06', 950, 7, 0, 0, 0, 0, 30, 2),
(2065, 0, 0, 0, 'Harvester''s Haven, Flat 07', 950, 7, 0, 0, 0, 0, 30, 2),
(2066, 0, 0, 0, 'Harvester''s Haven, Flat 09', 950, 7, 0, 0, 0, 0, 30, 2),
(2067, 0, 0, 0, 'Harvester''s Haven, Flat 11', 950, 7, 0, 0, 0, 0, 36, 2),
(2068, 0, 0, 0, 'Harvester''s Haven, Flat 12', 950, 7, 0, 0, 0, 0, 36, 2),
(2069, 0, 0, 0, 'Harvester''s Haven, Flat 10', 950, 7, 0, 0, 0, 0, 30, 2),
(2070, 0, 0, 0, 'Harvester''s Haven, Flat 08', 950, 7, 0, 0, 0, 0, 30, 2),
(2071, 0, 0, 0, 'Marble Lane 4', 6350, 7, 0, 0, 0, 0, 192, 4),
(2072, 0, 0, 0, 'Marble Lane 2', 6415, 7, 0, 0, 0, 0, 200, 3),
(2073, 0, 0, 0, 'Marble Lane 3', 8055, 7, 0, 0, 0, 0, 240, 4),
(2074, 0, 0, 0, 'Marble Lane 1', 11060, 7, 0, 0, 0, 0, 320, 6),
(2075, 0, 0, 0, 'Ivy Cottage', 30650, 7, 0, 0, 0, 0, 858, 26),
(2076, 0, 0, 0, 'Sugar Street 4d', 750, 7, 0, 0, 0, 0, 24, 2),
(2077, 0, 0, 0, 'Sugar Street 4c', 650, 7, 0, 0, 0, 0, 24, 1),
(2078, 0, 0, 0, 'Sugar Street 4b', 950, 7, 0, 0, 0, 0, 36, 2),
(2079, 0, 0, 0, 'Sugar Street 4a', 950, 7, 0, 0, 0, 0, 30, 2),
(2080, 0, 0, 0, 'Trader''s Point 1', 2200, 7, 0, 0, 0, 0, 77, 2),
(2081, 0, 0, 0, 'Mountain Hideout', 15550, 7, 0, 0, 0, 0, 486, 17),
(2082, 0, 0, 0, 'Dark Mansion', 17845, 2, 0, 0, 0, 0, 573, 17),
(2083, 0, 0, 0, 'Halls of the Adventurers', 15380, 2, 0, 0, 0, 0, 518, 18),
(2084, 0, 0, 0, 'Castle of Greenshore', 18860, 2, 0, 0, 0, 0, 600, 12),
(2085, 0, 0, 0, 'Greenshore Clanhall', 10800, 2, 0, 0, 0, 0, 312, 10),
(2086, 0, 0, 0, 'Greenshore Village 1', 2420, 2, 0, 0, 0, 0, 64, 3),
(2087, 0, 0, 0, 'Greenshore Village, Shop', 1800, 2, 0, 0, 0, 0, 56, 1),
(2088, 0, 0, 0, 'Greenshore Village, Villa', 8700, 2, 0, 0, 0, 0, 263, 4),
(2089, 0, 0, 0, 'Greenshore Village 2', 780, 2, 0, 0, 0, 0, 30, 1),
(2090, 0, 0, 0, 'Greenshore Village 3', 780, 2, 0, 0, 0, 0, 25, 1),
(2091, 0, 0, 0, 'Greenshore Village 5', 780, 2, 0, 0, 0, 0, 30, 1),
(2092, 0, 0, 0, 'Greenshore Village 4', 780, 2, 0, 0, 0, 0, 25, 1),
(2093, 0, 0, 0, 'Greenshore Village 6', 4360, 2, 0, 0, 0, 0, 118, 2),
(2094, 0, 0, 0, 'Greenshore Village 7', 1260, 2, 0, 0, 0, 0, 42, 1),
(2095, 0, 0, 0, 'The Tibianic', 34500, 2, 0, 0, 0, 0, 862, 22),
(2097, 0, 0, 0, 'Fibula Village 5', 1790, 2, 0, 0, 0, 0, 42, 2),
(2098, 0, 0, 0, 'Fibula Village 4', 1790, 2, 0, 0, 0, 0, 42, 2),
(2099, 0, 0, 0, 'Fibula Village, Tower Flat', 5105, 2, 0, 0, 0, 0, 161, 2),
(2100, 0, 0, 0, 'Fibula Village 1', 845, 2, 0, 0, 0, 0, 30, 1),
(2101, 0, 0, 0, 'Fibula Village 2', 845, 2, 0, 0, 0, 0, 30, 1),
(2102, 0, 0, 0, 'Fibula Village 3', 3810, 2, 0, 0, 0, 0, 110, 4),
(2103, 0, 0, 0, 'Mercenary Tower', 41955, 2, 0, 0, 0, 0, 996, 26),
(2104, 0, 0, 0, 'Guildhall of the Red Rose', 27725, 2, 0, 0, 0, 0, 572, 15),
(2105, 0, 0, 0, 'Fibula Village, Bar', 5235, 2, 0, 0, 0, 0, 122, 2),
(2106, 0, 0, 0, 'Fibula Village, Villa', 11490, 2, 0, 0, 0, 0, 402, 5),
(2107, 0, 0, 0, 'Fibula Clanhall', 11430, 2, 0, 0, 0, 0, 290, 10),
(2108, 0, 0, 0, 'Spiritkeep', 19210, 2, 0, 0, 0, 0, 783, 23),
(2109, 0, 0, 0, 'Snake Tower', 29720, 2, 0, 0, 0, 0, 1064, 21),
(2110, 0, 0, 0, 'Bloodhall', 15270, 2, 0, 0, 0, 0, 569, 15),
(2111, 0, 0, 0, 'Senja Clanhall', 10575, 4, 0, 0, 0, 0, 396, 9),
(2112, 0, 0, 0, 'Senja Village 2', 765, 4, 0, 0, 0, 0, 36, 1),
(2113, 0, 0, 0, 'Senja Village 1a', 765, 4, 0, 0, 0, 0, 36, 1),
(2114, 0, 0, 0, 'Senja Village 1b', 1630, 4, 0, 0, 0, 0, 66, 2),
(2115, 0, 0, 0, 'Senja Village 4', 765, 4, 0, 0, 0, 0, 30, 1),
(2116, 0, 0, 0, 'Senja Village 3', 1765, 4, 0, 0, 0, 0, 72, 2),
(2117, 0, 0, 0, 'Senja Village 6b', 765, 4, 0, 0, 0, 0, 30, 1),
(2118, 0, 0, 0, 'Senja Village 6a', 765, 4, 0, 0, 0, 0, 30, 1),
(2119, 0, 0, 0, 'Senja Village 5', 1225, 4, 0, 0, 0, 0, 48, 2),
(2120, 0, 0, 0, 'Senja Village 10', 1485, 4, 0, 0, 0, 0, 72, 1),
(2121, 0, 0, 0, 'Senja Village 11', 2620, 4, 0, 0, 0, 0, 96, 2),
(2122, 0, 0, 0, 'Senja Village 9', 2575, 4, 0, 0, 0, 0, 103, 2),
(2123, 0, 0, 0, 'Senja Village 8', 1675, 4, 0, 0, 0, 0, 57, 2),
(2124, 0, 0, 0, 'Senja Village 7', 865, 4, 0, 0, 0, 0, 37, 2),
(2125, 0, 0, 0, 'Rosebud C', 1340, 4, 0, 0, 0, 0, 70, 0),
(2127, 0, 0, 0, 'Rosebud A', 1000, 4, 0, 0, 0, 0, 60, 1),
(2128, 0, 0, 0, 'Rosebud B', 1000, 4, 0, 0, 0, 0, 60, 1),
(2129, 0, 0, 0, 'Nordic Stronghold', 18400, 4, 0, 0, 0, 0, 706, 11),
(2130, 0, 0, 0, 'Northport Village 2', 1475, 4, 0, 0, 0, 0, 40, 2),
(2131, 0, 0, 0, 'Northport Village 1', 1475, 4, 0, 0, 0, 0, 48, 2),
(2132, 0, 0, 0, 'Northport Village 3', 5435, 4, 0, 0, 0, 0, 178, 2),
(2133, 0, 0, 0, 'Northport Village 4', 2630, 4, 0, 0, 0, 0, 81, 2),
(2134, 0, 0, 0, 'Northport Village 5', 1805, 4, 0, 0, 0, 0, 56, 2),
(2135, 0, 0, 0, 'Northport Village 6', 2135, 4, 0, 0, 0, 0, 64, 2),
(2136, 0, 0, 0, 'Seawatch', 25010, 4, 0, 0, 0, 0, 749, 19),
(2137, 0, 0, 0, 'Northport Clanhall', 9810, 4, 0, 0, 0, 0, 292, 10),
(2138, 0, 0, 0, 'Druids Retreat D', 1180, 4, 0, 0, 0, 0, 54, 2),
(2139, 0, 0, 0, 'Druids Retreat A', 1340, 4, 0, 0, 0, 0, 60, 2),
(2140, 0, 0, 0, 'Druids Retreat C', 980, 4, 0, 0, 0, 0, 45, 2),
(2141, 0, 0, 0, 'Druids Retreat B', 980, 4, 0, 0, 0, 0, 55, 2),
(2142, 0, 0, 0, 'Theater Avenue 14 (Shop)', 2115, 4, 0, 0, 0, 0, 83, 1),
(2143, 0, 0, 0, 'Theater Avenue 12', 955, 4, 0, 0, 0, 0, 28, 2),
(2144, 0, 0, 0, 'Theater Avenue 10', 1090, 4, 0, 0, 0, 0, 45, 2),
(2145, 0, 0, 0, 'Theater Avenue 11c', 585, 4, 0, 0, 0, 0, 24, 1),
(2146, 0, 0, 0, 'Theater Avenue 11b', 585, 4, 0, 0, 0, 0, 24, 1),
(2147, 0, 0, 0, 'Theater Avenue 11a', 1405, 4, 0, 0, 0, 0, 54, 2),
(2148, 0, 0, 0, 'Magician''s Alley 1', 1050, 4, 0, 0, 0, 0, 35, 2),
(2149, 0, 0, 0, 'Magician''s Alley 1a', 700, 4, 0, 0, 0, 0, 29, 2),
(2150, 0, 0, 0, 'Magician''s Alley 1d', 450, 4, 0, 0, 0, 0, 24, 1),
(2151, 0, 0, 0, 'Magician''s Alley 1b', 750, 4, 0, 0, 0, 0, 24, 2),
(2152, 0, 0, 0, 'Magician''s Alley 1c', 500, 4, 0, 0, 0, 0, 20, 1),
(2153, 0, 0, 0, 'Magician''s Alley 5a', 350, 4, 0, 0, 0, 0, 14, 1),
(2154, 0, 0, 0, 'Magician''s Alley 5b', 500, 4, 0, 0, 0, 0, 25, 1),
(2155, 0, 0, 0, 'Magician''s Alley 5d', 500, 4, 0, 0, 0, 0, 20, 1),
(2156, 0, 0, 0, 'Magician''s Alley 5e', 500, 4, 0, 0, 0, 0, 25, 1),
(2157, 0, 0, 0, 'Magician''s Alley 5c', 1150, 4, 0, 0, 0, 0, 35, 2),
(2158, 0, 0, 0, 'Magician''s Alley 5f', 1150, 4, 0, 0, 0, 0, 42, 2),
(2159, 0, 0, 0, 'Carlin Clanhall', 10750, 4, 0, 0, 0, 0, 364, 10),
(2160, 0, 0, 0, 'Magician''s Alley 4', 2750, 4, 0, 0, 0, 0, 96, 4),
(2161, 0, 0, 0, 'Lonely Sea Side Hostel', 10540, 4, 0, 0, 0, 0, 454, 8),
(2162, 0, 0, 0, 'Suntower', 10080, 4, 0, 0, 0, 0, 450, 7),
(2163, 0, 0, 0, 'Harbour Lane 3', 3560, 4, 0, 0, 0, 0, 145, 3),
(2164, 0, 0, 0, 'Harbour Flats, Flat 11', 520, 4, 0, 0, 0, 0, 24, 1),
(2165, 0, 0, 0, 'Harbour Flats, Flat 13', 520, 4, 0, 0, 0, 0, 24, 1),
(2166, 0, 0, 0, 'Harbour Flats, Flat 15', 360, 4, 0, 0, 0, 0, 18, 1),
(2167, 0, 0, 0, 'Harbour Flats, Flat 17', 360, 4, 0, 0, 0, 0, 24, 1),
(2168, 0, 0, 0, 'Harbour Flats, Flat 12', 400, 4, 0, 0, 0, 0, 20, 1),
(2169, 0, 0, 0, 'Harbour Flats, Flat 14', 400, 4, 0, 0, 0, 0, 20, 1),
(2170, 0, 0, 0, 'Harbour Flats, Flat 16', 400, 4, 0, 0, 0, 0, 20, 1),
(2171, 0, 0, 0, 'Harbour Flats, Flat 18', 400, 4, 0, 0, 0, 0, 25, 1),
(2172, 0, 0, 0, 'Harbour Flats, Flat 21', 860, 4, 0, 0, 0, 0, 35, 2),
(2173, 0, 0, 0, 'Harbour Flats, Flat 22', 980, 4, 0, 0, 0, 0, 45, 2),
(2174, 0, 0, 0, 'Harbour Flats, Flat 23', 400, 4, 0, 0, 0, 0, 25, 1),
(2175, 0, 0, 0, 'Harbour Lane 2a (Shop)', 680, 4, 0, 0, 0, 0, 32, 0),
(2176, 0, 0, 0, 'Harbour Lane 2b (Shop)', 680, 4, 0, 0, 0, 0, 40, 0),
(2177, 0, 0, 0, 'Harbour Lane 1 (Shop)', 1040, 4, 0, 0, 0, 0, 54, 0),
(2178, 0, 0, 0, 'Theater Avenue 6e', 820, 4, 0, 0, 0, 0, 31, 2),
(2179, 0, 0, 0, 'Theater Avenue 6c', 225, 4, 0, 0, 0, 0, 12, 1),
(2180, 0, 0, 0, 'Theater Avenue 6a', 820, 4, 0, 0, 0, 0, 35, 2),
(2181, 0, 0, 0, 'Theater Avenue 6f', 820, 4, 0, 0, 0, 0, 31, 2),
(2182, 0, 0, 0, 'Theater Avenue 6d', 225, 4, 0, 0, 0, 0, 12, 1),
(2183, 0, 0, 0, 'Theater Avenue 6b', 820, 4, 0, 0, 0, 0, 35, 2),
(2184, 0, 0, 0, 'East Lane 1a', 2260, 4, 0, 0, 0, 0, 95, 2),
(2185, 0, 0, 0, 'East Lane 1b', 1700, 4, 0, 0, 0, 0, 83, 2),
(2186, 0, 0, 0, 'East Lane 2', 3900, 4, 0, 0, 0, 0, 172, 2),
(2191, 0, 0, 0, 'Northern Street 5', 1980, 4, 0, 0, 0, 0, 94, 2),
(2192, 0, 0, 0, 'Northern Street 7', 1700, 4, 0, 0, 0, 0, 83, 2),
(2193, 0, 0, 0, 'Northern Street 3a', 740, 4, 0, 0, 0, 0, 31, 2),
(2194, 0, 0, 0, 'Northern Street 3b', 780, 4, 0, 0, 0, 0, 36, 2),
(2195, 0, 0, 0, 'Northern Street 1c', 740, 4, 0, 0, 0, 0, 31, 2),
(2196, 0, 0, 0, 'Northern Street 1b', 740, 4, 0, 0, 0, 0, 37, 2),
(2197, 0, 0, 0, 'Northern Street 1a', 940, 4, 0, 0, 0, 0, 41, 2),
(2198, 0, 0, 0, 'Theater Avenue 7, Flat 06', 315, 4, 0, 0, 0, 0, 20, 1),
(2199, 0, 0, 0, 'Theater Avenue 7, Flat 01', 315, 4, 0, 0, 0, 0, 15, 1),
(2200, 0, 0, 0, 'Theater Avenue 7, Flat 05', 405, 4, 0, 0, 0, 0, 20, 1),
(2201, 0, 0, 0, 'Theater Avenue 7, Flat 02', 405, 4, 0, 0, 0, 0, 20, 1),
(2202, 0, 0, 0, 'Theater Avenue 7, Flat 04', 495, 4, 0, 0, 0, 0, 20, 1),
(2203, 0, 0, 0, 'Theater Avenue 7, Flat 03', 405, 4, 0, 0, 0, 0, 19, 1),
(2204, 0, 0, 0, 'Theater Avenue 7, Flat 14', 495, 4, 0, 0, 0, 0, 20, 1),
(2205, 0, 0, 0, 'Theater Avenue 7, Flat 13', 405, 4, 0, 0, 0, 0, 17, 1),
(2206, 0, 0, 0, 'Theater Avenue 7, Flat 15', 405, 4, 0, 0, 0, 0, 19, 1),
(2207, 0, 0, 0, 'Theater Avenue 7, Flat 16', 405, 4, 0, 0, 0, 0, 20, 1);
INSERT INTO `houses` (`id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `beds`) VALUES
(2208, 0, 0, 0, 'Theater Avenue 7, Flat 11', 495, 4, 0, 0, 0, 0, 23, 1),
(2209, 0, 0, 0, 'Theater Avenue 7, Flat 12', 405, 4, 0, 0, 0, 0, 15, 1),
(2210, 380, 0, 2, 'Theater Avenue 8a', 1270, 4, 0, 0, 0, 0, 50, 2),
(2211, 0, 0, 6, 'Theater Avenue 8b', 1370, 4, 0, 0, 0, 0, 49, 3),
(2212, 0, 0, 0, 'Central Plaza 3', 600, 4, 0, 0, 0, 0, 20, 0),
(2213, 0, 0, 0, 'Central Plaza 2', 600, 4, 0, 0, 0, 0, 20, 0),
(2214, 0, 0, 0, 'Central Plaza 1', 600, 4, 0, 0, 0, 0, 20, 0),
(2215, 0, 0, 0, 'Park Lane 1a', 1220, 4, 0, 0, 0, 0, 53, 2),
(2216, 0, 0, 0, 'Park Lane 3a', 1220, 4, 0, 0, 0, 0, 48, 2),
(2217, 0, 0, 0, 'Park Lane 1b', 1380, 4, 0, 0, 0, 0, 64, 2),
(2218, 0, 0, 0, 'Park Lane 3b', 1100, 4, 0, 0, 0, 0, 48, 2),
(2219, 0, 0, 0, 'Park Lane 4', 980, 4, 0, 0, 0, 0, 42, 2),
(2220, 0, 0, 0, 'Park Lane 2', 980, 4, 0, 0, 0, 0, 42, 2),
(2221, 0, 0, 0, 'Magician''s Alley 8', 1400, 4, 0, 0, 0, 0, 42, 2),
(2222, 0, 0, 0, 'Moonkeep', 13020, 4, 0, 0, 0, 0, 522, 16),
(2225, 0, 0, 0, 'Castle, Basement, Flat 01', 585, 11, 0, 0, 0, 0, 30, 1),
(2226, 0, 0, 0, 'Castle, Basement, Flat 02', 585, 11, 0, 0, 0, 0, 20, 1),
(2227, 0, 0, 0, 'Castle, Basement, Flat 03', 585, 11, 0, 0, 0, 0, 20, 1),
(2228, 0, 0, 0, 'Castle, Basement, Flat 04', 585, 11, 0, 0, 0, 0, 20, 1),
(2229, 0, 0, 0, 'Castle, Basement, Flat 07', 585, 11, 0, 0, 0, 0, 20, 1),
(2230, 0, 0, 0, 'Castle, Basement, Flat 08', 585, 11, 0, 0, 0, 0, 20, 1),
(2231, 0, 0, 0, 'Castle, Basement, Flat 09', 585, 11, 0, 0, 0, 0, 24, 1),
(2232, 0, 0, 0, 'Castle, Basement, Flat 06', 585, 11, 0, 0, 0, 0, 24, 1),
(2233, 0, 0, 0, 'Castle, Basement, Flat 05', 585, 11, 0, 0, 0, 0, 24, 1),
(2234, 0, 0, 0, 'Castle Shop 1', 1890, 11, 0, 0, 0, 0, 67, 1),
(2235, 0, 0, 0, 'Castle Shop 2', 1890, 11, 0, 0, 0, 0, 70, 1),
(2236, 0, 0, 0, 'Castle Shop 3', 1890, 11, 0, 0, 0, 0, 67, 1),
(2237, 0, 0, 0, 'Castle, 4th Floor, Flat 09', 720, 11, 0, 0, 0, 0, 28, 1),
(2238, 0, 0, 0, 'Castle, 4th Floor, Flat 08', 945, 11, 0, 0, 0, 0, 42, 1),
(2239, 0, 0, 0, 'Castle, 4th Floor, Flat 06', 945, 11, 0, 0, 0, 0, 36, 1),
(2240, 0, 0, 0, 'Castle, 4th Floor, Flat 07', 720, 11, 0, 0, 0, 0, 30, 1),
(2241, 0, 0, 0, 'Castle, 4th Floor, Flat 05', 765, 11, 0, 0, 0, 0, 30, 1),
(2242, 0, 0, 0, 'Castle, 4th Floor, Flat 04', 585, 11, 0, 0, 0, 0, 25, 1),
(2243, 0, 0, 0, 'Castle, 4th Floor, Flat 03', 585, 11, 0, 0, 0, 0, 30, 1),
(2244, 0, 0, 0, 'Castle, 4th Floor, Flat 02', 765, 11, 0, 0, 0, 0, 30, 1),
(2245, 0, 0, 0, 'Castle, 4th Floor, Flat 01', 585, 11, 0, 0, 0, 0, 30, 1),
(2246, 0, 0, 0, 'Castle, 3rd Floor, Flat 01', 585, 11, 0, 0, 0, 0, 30, 1),
(2247, 0, 0, 0, 'Castle, 3rd Floor, Flat 02', 765, 11, 0, 0, 0, 0, 30, 1),
(2248, 0, 0, 0, 'Castle, 3rd Floor, Flat 03', 585, 11, 0, 0, 0, 0, 25, 1),
(2249, 0, 0, 0, 'Castle, 3rd Floor, Flat 05', 765, 11, 0, 0, 0, 0, 30, 1),
(2250, 0, 0, 0, 'Castle, 3rd Floor, Flat 04', 585, 11, 0, 0, 0, 0, 25, 1),
(2251, 0, 0, 0, 'Castle, 3rd Floor, Flat 06', 1045, 11, 0, 0, 0, 0, 36, 2),
(2252, 0, 0, 0, 'Castle, 3rd Floor, Flat 07', 720, 11, 0, 0, 0, 0, 30, 1),
(2253, 0, 0, 0, 'Castle Street 1', 2900, 11, 0, 0, 0, 0, 112, 3),
(2254, 0, 0, 0, 'Castle Street 2', 1495, 11, 0, 0, 0, 0, 56, 2),
(2255, 0, 0, 0, 'Castle Street 3', 1765, 11, 0, 0, 0, 0, 56, 2),
(2256, 0, 0, 0, 'Castle Street 4', 1765, 11, 0, 0, 0, 0, 64, 2),
(2257, 0, 0, 0, 'Castle Street 5', 1765, 11, 0, 0, 0, 0, 61, 2),
(2258, 0, 0, 0, 'Edron Flats, Basement Flat 2', 1540, 11, 0, 0, 0, 0, 48, 2),
(2259, 0, 0, 0, 'Edron Flats, Basement Flat 1', 1540, 11, 0, 0, 0, 0, 48, 2),
(2260, 0, 0, 0, 'Edron Flats, Flat 01', 400, 11, 0, 0, 0, 0, 20, 1),
(2261, 0, 0, 0, 'Edron Flats, Flat 02', 860, 11, 0, 0, 0, 0, 28, 2),
(2262, 0, 0, 0, 'Edron Flats, Flat 03', 400, 11, 0, 0, 0, 0, 20, 1),
(2263, 0, 0, 0, 'Edron Flats, Flat 04', 400, 11, 0, 0, 0, 0, 20, 1),
(2264, 0, 0, 0, 'Edron Flats, Flat 06', 400, 11, 0, 0, 0, 0, 20, 1),
(2265, 0, 0, 0, 'Edron Flats, Flat 05', 400, 11, 0, 0, 0, 0, 20, 1),
(2266, 0, 0, 0, 'Edron Flats, Flat 07', 400, 11, 0, 0, 0, 0, 20, 1),
(2267, 0, 0, 0, 'Edron Flats, Flat 08', 400, 11, 0, 0, 0, 0, 20, 1),
(2268, 0, 0, 0, 'Edron Flats, Flat 11', 400, 11, 0, 0, 0, 0, 25, 1),
(2269, 0, 0, 0, 'Edron Flats, Flat 12', 400, 11, 0, 0, 0, 0, 25, 1),
(2270, 0, 0, 0, 'Edron Flats, Flat 14', 400, 11, 0, 0, 0, 0, 25, 1),
(2271, 0, 0, 0, 'Edron Flats, Flat 13', 400, 11, 0, 0, 0, 0, 25, 1),
(2272, 0, 0, 0, 'Edron Flats, Flat 16', 400, 11, 0, 0, 0, 0, 20, 1),
(2273, 0, 0, 0, 'Edron Flats, Flat 15', 400, 11, 0, 0, 0, 0, 20, 1),
(2274, 0, 0, 0, 'Edron Flats, Flat 18', 400, 11, 0, 0, 0, 0, 20, 1),
(2275, 0, 0, 0, 'Edron Flats, Flat 17', 400, 11, 0, 0, 0, 0, 20, 1),
(2276, 0, 0, 0, 'Edron Flats, Flat 22', 400, 11, 0, 0, 0, 0, 25, 1),
(2277, 0, 0, 0, 'Edron Flats, Flat 21', 860, 11, 0, 0, 0, 0, 40, 2),
(2278, 0, 0, 0, 'Edron Flats, Flat 24', 400, 11, 0, 0, 0, 0, 20, 1),
(2279, 0, 0, 0, 'Edron Flats, Flat 23', 400, 11, 0, 0, 0, 0, 25, 1),
(2280, 0, 0, 0, 'Edron Flats, Flat 26', 400, 11, 0, 0, 0, 0, 20, 1),
(2281, 0, 0, 0, 'Edron Flats, Flat 27', 400, 11, 0, 0, 0, 0, 20, 1),
(2282, 0, 0, 0, 'Edron Flats, Flat 28', 400, 11, 0, 0, 0, 0, 20, 1),
(2283, 0, 0, 0, 'Edron Flats, Flat 25', 400, 11, 0, 0, 0, 0, 20, 1),
(2284, 403, 1405275736, 1, 'Central Circle 1', 3020, 11, 0, 0, 0, 0, 119, 2),
(2285, 423, 1405339533, 1, 'Central Circle 2', 3300, 11, 0, 0, 0, 0, 108, 2),
(2286, 0, 0, 0, 'Central Circle 3', 4160, 11, 0, 0, 0, 0, 147, 5),
(2287, 0, 0, 0, 'Central Circle 4', 4160, 11, 0, 0, 0, 0, 147, 5),
(2288, 0, 0, 0, 'Central Circle 5', 4160, 11, 0, 0, 0, 0, 161, 5),
(2289, 0, 0, 0, 'Central Circle 6 (Shop)', 3980, 11, 0, 0, 0, 0, 182, 2),
(2290, 0, 0, 0, 'Central Circle 7 (Shop)', 3980, 11, 0, 0, 0, 0, 161, 2),
(2291, 0, 0, 0, 'Central Circle 8 (Shop)', 3980, 11, 0, 0, 0, 0, 166, 2),
(2292, 0, 0, 0, 'Central Circle 9a', 940, 11, 0, 0, 0, 0, 42, 2),
(2293, 0, 0, 0, 'Central Circle 9b', 940, 11, 0, 0, 0, 0, 44, 2),
(2294, 0, 0, 0, 'Sky Lane, Guild 1', 21145, 11, 0, 0, 0, 0, 666, 23),
(2295, 0, 0, 0, 'Sky Lane, Guild 2', 19300, 11, 0, 0, 0, 0, 650, 14),
(2296, 0, 0, 0, 'Sky Lane, Guild 3', 17315, 11, 0, 0, 0, 0, 564, 18),
(2297, 0, 0, 0, 'Sky Lane, Sea Tower', 4775, 11, 0, 0, 0, 0, 196, 6),
(2298, 0, 1405769990, 0, 'Wood Avenue 6a', 1450, 11, 0, 0, 0, 0, 56, 2),
(2299, 0, 0, 0, 'Wood Avenue 9a', 1540, 11, 0, 0, 0, 0, 56, 2),
(2300, 0, 0, 0, 'Wood Avenue 10a', 1540, 11, 0, 0, 0, 0, 64, 2),
(2301, 0, 0, 0, 'Wood Avenue 11', 7205, 11, 0, 0, 0, 0, 253, 6),
(2302, 0, 0, 0, 'Wood Avenue 8', 5960, 11, 0, 0, 0, 0, 198, 3),
(2303, 409, 1405514840, 0, 'Wood Avenue 7', 5960, 11, 0, 0, 0, 0, 191, 3),
(2304, 0, 0, 0, 'Wood Avenue 6b', 1450, 11, 0, 0, 0, 0, 56, 2),
(2305, 0, 0, 0, 'Wood Avenue 9b', 1495, 11, 0, 0, 0, 0, 56, 2),
(2306, 0, 0, 0, 'Wood Avenue 10b', 1595, 11, 0, 0, 0, 0, 64, 3),
(2307, 0, 0, 0, 'Wood Avenue 5', 1765, 11, 0, 0, 0, 0, 64, 2),
(2308, 0, 0, 0, 'Wood Avenue 4a', 1495, 11, 0, 0, 0, 0, 56, 2),
(2309, 0, 0, 0, 'Wood Avenue 4b', 1495, 11, 0, 0, 0, 0, 56, 2),
(2310, 0, 0, 0, 'Wood Avenue 4c', 1765, 11, 0, 0, 0, 0, 56, 2),
(2311, 0, 0, 0, 'Wood Avenue 4', 1765, 11, 0, 0, 0, 0, 64, 2),
(2312, 0, 0, 0, 'Wood Avenue 3', 1765, 11, 0, 0, 0, 0, 56, 2),
(2313, 0, 0, 0, 'Wood Avenue 2', 1765, 11, 0, 0, 0, 0, 49, 2),
(2314, 0, 0, 0, 'Wood Avenue 1', 1765, 11, 0, 0, 0, 0, 64, 2),
(2315, 0, 0, 0, 'Magic Academy, Guild', 12025, 11, 0, 0, 0, 0, 414, 14),
(2316, 0, 0, 0, 'Magic Academy, Flat 1', 1465, 11, 0, 0, 0, 0, 57, 3),
(2317, 0, 0, 0, 'Magic Academy, Flat 2', 1530, 11, 0, 0, 0, 0, 55, 2),
(2318, 0, 0, 0, 'Magic Academy, Flat 3', 1430, 11, 0, 0, 0, 0, 55, 1),
(2319, 0, 0, 0, 'Magic Academy, Flat 4', 1530, 11, 0, 0, 0, 0, 55, 2),
(2320, 0, 0, 0, 'Magic Academy, Flat 5', 1430, 11, 0, 0, 0, 0, 55, 1),
(2321, 0, 0, 0, 'Magic Academy, Shop', 1595, 11, 0, 0, 0, 0, 48, 1),
(2322, 0, 0, 0, 'Stonehome Village 1', 1780, 11, 0, 0, 0, 0, 74, 2),
(2323, 0, 0, 0, 'Stonehome Flats, Flat 05', 400, 11, 0, 0, 0, 0, 20, 1),
(2324, 0, 0, 0, 'Stonehome Flats, Flat 04', 400, 11, 0, 0, 0, 0, 25, 1),
(2325, 0, 0, 0, 'Stonehome Flats, Flat 06', 400, 11, 0, 0, 0, 0, 20, 1),
(2326, 0, 0, 0, 'Stonehome Flats, Flat 03', 400, 11, 0, 0, 0, 0, 20, 1),
(2327, 0, 0, 0, 'Stonehome Flats, Flat 01', 400, 11, 0, 0, 0, 0, 20, 1),
(2328, 0, 0, 0, 'Stonehome Flats, Flat 02', 740, 11, 0, 0, 0, 0, 30, 2),
(2329, 0, 0, 0, 'Stonehome Flats, Flat 11', 740, 11, 0, 0, 0, 0, 35, 2),
(2330, 0, 0, 0, 'Stonehome Flats, Flat 12', 740, 11, 0, 0, 0, 0, 35, 2),
(2331, 0, 0, 0, 'Stonehome Flats, Flat 13', 400, 11, 0, 0, 0, 0, 20, 1),
(2332, 0, 0, 0, 'Stonehome Flats, Flat 14', 400, 11, 0, 0, 0, 0, 20, 1),
(2333, 0, 0, 0, 'Stonehome Flats, Flat 16', 400, 11, 0, 0, 0, 0, 20, 1),
(2334, 0, 0, 0, 'Stonehome Flats, Flat 15', 400, 11, 0, 0, 0, 0, 20, 1),
(2335, 0, 0, 0, 'Stonehome Village 2', 640, 11, 0, 0, 0, 0, 35, 1),
(2336, 0, 0, 0, 'Stonehome Village 3', 680, 11, 0, 0, 0, 0, 36, 1),
(2337, 0, 0, 0, 'Stonehome Village 4', 940, 11, 0, 0, 0, 0, 42, 2),
(2338, 0, 0, 0, 'Stonehome Village 6', 1300, 11, 0, 0, 0, 0, 55, 2),
(2339, 0, 0, 0, 'Stonehome Village 5', 1140, 11, 0, 0, 0, 0, 56, 2),
(2340, 0, 0, 0, 'Stonehome Village 7', 1140, 11, 0, 0, 0, 0, 49, 2),
(2341, 0, 0, 0, 'Stonehome Village 8', 680, 11, 0, 0, 0, 0, 36, 1),
(2342, 0, 0, 0, 'Stonehome Village 9', 680, 11, 0, 0, 0, 0, 36, 1),
(2343, 0, 0, 0, 'Stonehome Clanhall', 8580, 11, 0, 0, 0, 0, 345, 9),
(2344, 0, 0, 0, 'Cormaya 1', 1270, 11, 0, 0, 0, 0, 49, 2),
(2345, 0, 0, 0, 'Cormaya 2', 3710, 11, 0, 0, 0, 0, 145, 3),
(2346, 0, 0, 0, 'Cormaya Flats, Flat 01', 450, 11, 0, 0, 0, 0, 20, 1),
(2347, 0, 0, 0, 'Cormaya Flats, Flat 02', 450, 11, 0, 0, 0, 0, 20, 1),
(2348, 0, 0, 0, 'Cormaya Flats, Flat 03', 820, 11, 0, 0, 0, 0, 30, 2),
(2349, 0, 0, 0, 'Cormaya Flats, Flat 06', 450, 11, 0, 0, 0, 0, 20, 1),
(2350, 0, 0, 0, 'Cormaya Flats, Flat 05', 450, 11, 0, 0, 0, 0, 20, 1),
(2351, 0, 0, 0, 'Cormaya Flats, Flat 04', 820, 11, 0, 0, 0, 0, 30, 2),
(2352, 0, 0, 0, 'Cormaya Flats, Flat 13', 820, 11, 0, 0, 0, 0, 30, 2),
(2353, 0, 0, 0, 'Cormaya Flats, Flat 14', 820, 11, 0, 0, 0, 0, 35, 2),
(2354, 0, 0, 0, 'Cormaya Flats, Flat 15', 450, 11, 0, 0, 0, 0, 20, 1),
(2355, 0, 0, 0, 'Cormaya Flats, Flat 16', 450, 11, 0, 0, 0, 0, 20, 1),
(2356, 0, 0, 0, 'Cormaya Flats, Flat 11', 450, 11, 0, 0, 0, 0, 20, 1),
(2357, 0, 0, 0, 'Cormaya Flats, Flat 12', 450, 11, 0, 0, 0, 0, 20, 1),
(2358, 0, 0, 0, 'Cormaya 3', 2035, 11, 0, 0, 0, 0, 72, 2),
(2359, 0, 0, 0, 'Castle of the White Dragon', 25110, 11, 0, 0, 0, 0, 761, 19),
(2360, 0, 0, 0, 'Cormaya 4', 1720, 11, 0, 0, 0, 0, 63, 2),
(2361, 0, 0, 0, 'Cormaya 5', 4250, 11, 0, 0, 0, 0, 167, 3),
(2362, 0, 0, 0, 'Cormaya 6', 2395, 11, 0, 0, 0, 0, 84, 2),
(2363, 0, 0, 0, 'Cormaya 7', 2395, 11, 0, 0, 0, 0, 84, 2),
(2364, 0, 0, 0, 'Cormaya 8', 2710, 11, 0, 0, 0, 0, 113, 2),
(2365, 0, 0, 0, 'Cormaya 9b', 2620, 11, 0, 0, 0, 0, 88, 2),
(2366, 0, 0, 0, 'Cormaya 9a', 1225, 11, 0, 0, 0, 0, 48, 2),
(2367, 0, 0, 0, 'Cormaya 9c', 1225, 11, 0, 0, 0, 0, 48, 2),
(2368, 0, 0, 0, 'Cormaya 9d', 2620, 11, 0, 0, 0, 0, 88, 2),
(2369, 0, 0, 0, 'Cormaya 10', 3800, 11, 0, 0, 0, 0, 140, 3),
(2370, 0, 0, 0, 'Cormaya 11', 2035, 11, 0, 0, 0, 0, 72, 2),
(2371, 0, 0, 0, 'Demon Tower', 3340, 2, 0, 0, 0, 0, 127, 2),
(2372, 0, 0, 0, 'Nautic Observer', 6540, 4, 0, 0, 0, 0, 300, 4),
(2373, 0, 0, 0, 'Riverspring', 19450, 3, 0, 0, 0, 0, 525, 18),
(2374, 0, 0, 0, 'House of Recreation', 22540, 4, 0, 0, 0, 0, 702, 16),
(2375, 0, 0, 0, 'Valorous Venore', 14435, 1, 0, 0, 0, 0, 430, 9),
(2376, 0, 0, 0, 'Ab''Dendriel Clanhall', 14850, 5, 0, 0, 0, 0, 406, 10),
(2377, 0, 0, 0, 'Castle of the Winds', 23885, 5, 0, 0, 0, 0, 842, 18),
(2378, 0, 0, 0, 'The Hideout', 20800, 5, 0, 0, 0, 0, 597, 20),
(2379, 0, 0, 0, 'Shadow Towers', 21800, 5, 0, 0, 0, 0, 750, 18),
(2380, 0, 0, 0, 'Hill Hideout', 13950, 3, 0, 0, 0, 0, 346, 15),
(2381, 0, 0, 0, 'Meriana Beach', 8230, 7, 0, 0, 0, 0, 184, 3),
(2382, 0, 0, 0, 'Darashia 8, Flat 01', 2485, 10, 0, 0, 0, 0, 80, 2),
(2383, 0, 0, 0, 'Darashia 8, Flat 02', 3385, 10, 0, 0, 0, 0, 114, 2),
(2384, 0, 0, 0, 'Darashia 8, Flat 03', 4700, 10, 0, 0, 0, 0, 171, 3),
(2385, 0, 0, 0, 'Darashia 8, Flat 04', 2845, 10, 0, 0, 0, 0, 90, 2),
(2386, 0, 0, 0, 'Darashia 8, Flat 05', 2665, 10, 0, 0, 0, 0, 85, 2),
(2387, 0, 0, 0, 'Darashia, Eastern Guildhall', 12660, 10, 0, 0, 0, 0, 444, 16),
(2388, 0, 0, 0, 'Theater Avenue 5a', 450, 4, 0, 0, 0, 0, 20, 1),
(2389, 0, 0, 0, 'Theater Avenue 5b', 450, 4, 0, 0, 0, 0, 19, 1),
(2390, 0, 0, 0, 'Theater Avenue 5c', 450, 4, 0, 0, 0, 0, 16, 1),
(2391, 0, 0, 0, 'Theater Avenue 5d', 450, 4, 0, 0, 0, 0, 16, 1),
(2392, 0, 0, 0, 'Outlaw Camp 1', 1660, 3, 0, 0, 0, 0, 47, 2),
(2393, 0, 0, 0, 'Outlaw Camp 2', 280, 3, 0, 0, 0, 0, 7, 1),
(2394, 0, 0, 0, 'Outlaw Camp 3', 740, 3, 0, 0, 0, 0, 16, 2),
(2395, 0, 0, 0, 'Outlaw Camp 4', 200, 3, 0, 0, 0, 0, 5, 1),
(2396, 0, 0, 0, 'Outlaw Camp 5', 200, 3, 0, 0, 0, 0, 5, 1),
(2397, 0, 0, 0, 'Outlaw Camp 6', 200, 3, 0, 0, 0, 0, 5, 1),
(2398, 0, 0, 0, 'Outlaw Camp 7', 780, 3, 0, 0, 0, 0, 17, 2),
(2399, 0, 0, 0, 'Outlaw Camp 8', 280, 3, 0, 0, 0, 0, 7, 1),
(2400, 0, 0, 0, 'Outlaw Camp 9', 200, 3, 0, 0, 0, 0, 5, 1),
(2401, 0, 0, 0, 'Outlaw Camp 10', 200, 3, 0, 0, 0, 0, 5, 1),
(2402, 0, 0, 0, 'Outlaw Camp 11', 200, 3, 0, 0, 0, 0, 5, 1),
(2404, 0, 0, 0, 'Outlaw Camp 12 (Shop)', 280, 3, 0, 0, 0, 0, 7, 0),
(2405, 0, 0, 0, 'Outlaw Camp 13 (Shop)', 280, 3, 0, 0, 0, 0, 7, 0),
(2406, 0, 0, 0, 'Outlaw Camp 14 (Shop)', 640, 3, 0, 0, 0, 0, 16, 0),
(2407, 0, 0, 0, 'Open-Air Theatre', 2700, 2, 0, 0, 0, 0, 60, 1),
(2408, 0, 0, 0, 'The Lair', 7625, 1, 0, 0, 0, 0, 165, 3),
(2409, 0, 0, 0, 'Upper Barracks 2', 210, 3, 0, 0, 0, 0, 7, 1),
(2410, 0, 0, 0, 'Upper Barracks 3', 210, 3, 0, 0, 0, 0, 7, 1),
(2411, 0, 0, 0, 'Upper Barracks 4', 210, 3, 0, 0, 0, 0, 7, 1),
(2412, 0, 0, 0, 'Upper Barracks 5', 210, 3, 0, 0, 0, 0, 7, 1),
(2413, 0, 0, 0, 'Upper Barracks 6', 210, 3, 0, 0, 0, 0, 7, 1),
(2414, 0, 0, 0, 'Upper Barracks 7', 210, 3, 0, 0, 0, 0, 7, 1),
(2415, 0, 0, 0, 'Upper Barracks 8', 210, 3, 0, 0, 0, 0, 7, 1),
(2416, 0, 0, 0, 'Upper Barracks 9', 210, 3, 0, 0, 0, 0, 7, 1),
(2417, 0, 0, 0, 'Upper Barracks 10', 210, 3, 0, 0, 0, 0, 7, 1),
(2418, 0, 0, 0, 'Upper Barracks 11', 210, 3, 0, 0, 0, 0, 7, 1),
(2419, 0, 0, 0, 'Upper Barracks 12', 210, 3, 0, 0, 0, 0, 7, 1),
(2420, 0, 0, 0, 'Low Waters Observatory', 17165, 9, 0, 0, 0, 0, 739, 15),
(2421, 0, 0, 0, 'Temple House', 40000, 2, 0, 0, 0, 0, 40, 0),
(2422, 517, 0, 0, 'Temple House', 15000, 2, 0, 0, 0, 0, 45, 0);

-- --------------------------------------------------------

--
-- Table structure for table `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house_lists`
--

INSERT INTO `house_lists` (`house_id`, `listid`, `list`) VALUES
(1887, 256, 'Tejow\nkelps fortune\nBlokadora'),
(1940, 256, 'red bull\n'),
(1940, 257, 'gomes knight\ngomes pally\n'),
(1965, 257, 'Akka Of Hohhan\n'),
(2004, 257, 'Alan Stor\nJean Pierre\nTejow\n'),
(2005, 257, 'Knight Well'),
(2210, 256, 'Xing Ling Nabugui\n'),
(2210, 257, 'Zeus'),
(2284, 257, 'Black Rider\nShadow Killer\nWisth Black\n'),
(2285, 257, 'Meu Cu\nWisth Black'),
(2303, 257, 'angelzika\nmacaco loco\nmacaco loko'),
(2422, 257, 'Wizard Well');

-- --------------------------------------------------------

--
-- Table structure for table `ip_bans`
--

CREATE TABLE IF NOT EXISTS `ip_bans` (
  `ip` int(10) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `market_history`
--

CREATE TABLE IF NOT EXISTS `market_history` (
`id` int(10) unsigned NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `expires_at` bigint(20) unsigned NOT NULL,
  `inserted` bigint(20) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `market_offers`
--

CREATE TABLE IF NOT EXISTS `market_offers` (
`id` int(10) unsigned NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) unsigned NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `deletion` bigint(15) NOT NULL DEFAULT '0',
  `balance` bigint(20) unsigned NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) unsigned NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` smallint(5) unsigned NOT NULL DEFAULT '2520',
  `skill_fist` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_club` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_sword` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_axe` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_dist` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_shielding` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `skill_fishing` int(10) unsigned NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `cast` tinyint(1) NOT NULL DEFAULT '0',
  `castViewers` tinyint(1) NOT NULL DEFAULT '0',
  `castDescription` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `cast`, `castViewers`, `castDescription`) VALUES
(1, 'GOD OTserv', 3, 1, 8, 0, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0),
(2, 'Rook Sample', 1, 1, 8, 0, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0),
(3, 'Sorcerer Sample', 1, 1, 8, 1, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0),
(4, 'Druid Sample', 1, 1, 8, 2, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0),
(5, 'Paladin Sample', 1, 1, 8, 3, 185, 185, 4200, 44, 98, 15, 76, 128, 0, 0, 35, 35, 0, 100, 1, 0, 0, 0, '', 420, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0),
(6, 'Knight Sample', 1, 1, 8, 4, 185, 185, 4200, 44, 98, 15, 76, 136, 0, 0, 35, 35, 0, 100, 1, 32957, 32076, 7, '', 420, 0, 1409638807, 1619868861, 1, 0, 0, 1409638810, 0, 3, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0, 0, 0);

--
-- Triggers `players`
--
DELIMITER //
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
    UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players_online`
--

CREATE TABLE IF NOT EXISTS `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players_online`
--

INSERT INTO `players_online` (`player_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `player_deaths`
--

CREATE TABLE IF NOT EXISTS `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT '1',
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) NOT NULL DEFAULT '0',
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_inboxitems`
--

CREATE TABLE IF NOT EXISTS `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL DEFAULT '0',
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(6, 1, 101, 2460, 1, ''),
(6, 2, 102, 2661, 1, ''),
(6, 3, 103, 1988, 1, ''),
(6, 4, 104, 2465, 1, ''),
(6, 5, 105, 2525, 1, ''),
(6, 6, 106, 8601, 1, ''),
(6, 7, 107, 2478, 1, ''),
(6, 8, 108, 2643, 1, ''),
(6, 103, 109, 2554, 1, ''),
(6, 103, 110, 2120, 1, ''),
(6, 103, 111, 2439, 1, ''),
(6, 103, 112, 8602, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `player_namelocks`
--

CREATE TABLE IF NOT EXISTS `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(6, 100000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_config`
--

CREATE TABLE IF NOT EXISTS `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '18'),
('motd_hash', ''),
('motd_num', '0'),
('players_record', '33');

-- --------------------------------------------------------

--
-- Table structure for table `tile_store`
--

CREATE TABLE IF NOT EXISTS `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_forum`
--

CREATE TABLE IF NOT EXISTS `z_forum` (
`id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_ots_comunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_shop_history_item`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_item` (
`id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_shop_offer`
--

CREATE TABLE IF NOT EXISTS `z_shop_offer` (
`id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`) VALUES
(2, 4, 12649, 1, 0, 0, 'item', 'Blade of Corruption', 'Blade of Corruption', 0),
(3, 4, 2160, 100, 0, 0, 'item', '100 Crystal Coin', '100 Crystal Coin', 0),
(4, 5, 8927, 1, 0, 0, 'item', 'Dark Trinity Mace', 'Dark Trinity Mace', 0),
(5, 4, 2494, 1, 0, 0, 'item', 'Demon Armor', 'Demon Armor', 0),
(6, 4, 2495, 1, 0, 0, 'item', 'Demon Legs', 'Demon Legs', 0),
(7, 8, 15410, 1, 0, 0, 'item', 'Depth Calcei', 'Depth Calcei', 0),
(8, 8, 15408, 1, 0, 0, 'item', 'Depth Galea', 'Depth Galea', 0),
(9, 8, 15407, 1, 0, 0, 'item', 'Depth Lorica', 'Depth Lorica', 0),
(10, 8, 15409, 1, 0, 0, 'item', 'Depth Ocrea', 'Depth Ocrea', 0),
(11, 6, 15411, 1, 0, 0, 'item', 'Depth Scutum', 'Depth Scutum', 0),
(12, 2, 2472, 1, 0, 0, 'item', 'Magic Plate Armor', 'Magic Plate Armor', 0),
(13, 4, 2646, 1, 0, 0, 'item', 'Golden Boots', 'Golden Boots', 0),
(14, 8, 2471, 1, 0, 0, 'item', 'Golden Helmet', 'Golden Helmet', 0),
(15, 4, 12642, 4, 0, 0, 'item', 'Royal Draken Mail', 'Royal Draken Mail', 0),
(16, 4, 12643, 1, 0, 0, 'item', 'Royal Scale Robe', 'Royal Scale Robe', 0),
(17, 4, 12645, 1, 0, 0, 'item', 'Elite Draken Helmet', 'Elite Draken Helmet', 0),
(18, 5, 18465, 1, 0, 0, 'item', 'Shiny Blade', 'Shiny Blade', 0),
(19, 5, 8884, 1, 0, 0, 'item', 'Oceanborn Leviathan Armor', 'Oceanborn Leviathan Armor', 0),
(20, 5, 8882, 1, 0, 0, 'item', 'Earthborn Titan Armor', 'Earthborn Titan Armor', 0),
(21, 5, 8883, 1, 0, 0, 'item', 'Windborn Colossus Armor', 'Windborn Colossus Armor', 0),
(22, 7, 2640, 1, 0, 0, 'item', 'Soft Boots', 'Soft Boots', 0),
(23, 5, 8878, 1, 0, 0, 'item', 'Crystalline Armor', 'Crystalline Armor', 0),
(24, 5, 8888, 1, 0, 0, 'item', 'Master Archer''s Armor', 'Master Archer''s Armor', 0),
(25, 5, 18452, 1, 0, 0, 'item', 'Mycological Mace', 'Mycological Mace', 0),
(26, 5, 8851, 1, 0, 0, 'item', 'Royal Crossbow', 'Royal Crossbow', 0),
(27, 5, 22398, 1, 0, 0, 'item', 'Crude Umbral Blade', 'Crude Umbral Blade', 0),
(28, 7, 22399, 1, 0, 0, 'item', 'Umbral Blade', 'Umbral Blade', 0),
(29, 10, 22400, 1, 0, 0, 'item', 'Umbral Masterblade', 'Umbral Masterblade', 0),
(30, 3, 22401, 1, 0, 0, 'item', 'Crude Umbral Slayer', 'Crude Umbral Slayer', 0),
(31, 5, 22402, 1, 0, 0, 'item', 'Umbral Slayer', 'Umbral Slayer', 0),
(32, 10, 22403, 1, 0, 0, 'item', 'Umbral Master Slayer', 'Umbral Master Slayer', 0),
(33, 5, 22404, 1, 0, 0, 'item', 'Crude Umbral Axe', 'Crude Umbral Axe', 0),
(34, 7, 22405, 1, 0, 0, 'item', 'Umbral Axe', 'Umbral Axe', 0),
(35, 10, 22406, 1, 0, 0, 'item', 'Umbral Master Axe', 'Umbral Master Axe', 0),
(36, 3, 22407, 1, 0, 0, 'item', 'Crude Umbral Chopper', 'Crude Umbral Chopper', 0),
(37, 5, 22408, 1, 0, 0, 'item', 'Umbral Chopper', 'Umbral Chopper', 0),
(38, 8, 22409, 1, 0, 0, 'item', 'Umbral Master Chopper', 'Umbral Master Chopper', 0),
(39, 5, 22410, 1, 0, 0, 'item', 'Crude Umbral Mace', 'Crude Umbral Mace', 0),
(40, 7, 22411, 1, 0, 0, 'item', 'Umbral Mace', 'Umbral Mace', 0),
(41, 10, 22412, 1, 0, 0, 'item', 'Umbral Master Mace', 'Umbral Master Mace', 0),
(42, 3, 22413, 1, 0, 0, 'item', 'Crude Umbral Hammer', 'Crude Umbral Hammer', 0),
(43, 5, 22414, 1, 0, 0, 'item', 'Umbral Hammer', 'Umbral Hammer', 0),
(44, 8, 22415, 1, 0, 0, 'item', 'Umbral Master Hammer', 'Umbral Master Hammer', 0),
(45, 3, 22416, 1, 0, 0, 'item', 'Crude Umbral Bow', 'Crude Umbral Bow', 0),
(46, 5, 22417, 1, 0, 0, 'item', 'Umbral Bow', 'Umbral Bow', 0),
(47, 10, 22418, 1, 0, 0, 'item', 'Umbral Master Bow', 'Umbral Master Bow', 0),
(48, 3, 22419, 1, 0, 0, 'item', 'Crude Umbral Crossbow', 'Crude Umbral Crossbow', 0),
(49, 5, 22420, 1, 0, 0, 'item', 'Umbral Crossbow', 'Umbral Crossbow', 0),
(50, 10, 22421, 1, 0, 0, 'item', 'Umbral Master Crossbow', 'Umbral Master Crossbow', 0),
(51, 3, 22422, 1, 0, 0, 'item', 'Crude Umbral Spellbook', 'Crude Umbral Spellbook', 0),
(52, 5, 22423, 1, 0, 0, 'item', 'Umbral Spellbook', 'Umbral Spellbook', 0),
(53, 10, 22424, 1, 0, 0, 'item', 'Umbral Master Spellbook', 'Umbral Master Spellbook', 0),
(54, 7, 16111, 1, 0, 0, 'item', 'Thorn Spitter', 'Thorn Spitter', 0),
(55, 10, 2523, 1, 0, 0, 'item', 'Blessed Shield', 'Blessed Shield', 0),
(56, 5, 12644, 1, 0, 0, 'item', 'Shield of Corruption', 'Shield of Corruption', 0),
(57, 4, 15413, 1, 0, 0, 'item', 'Ornate Shield', 'Ornate Shield', 0),
(58, 5, 6391, 1, 0, 0, 'item', 'Nightmare Shield', 'Nightmare Shield', 0),
(59, 6, 6433, 1, 0, 0, 'item', 'Necromancer Shield', 'Necromancer Shield', 0),
(60, 6, 18410, 1, 0, 0, 'item', 'Prismatic Shield', 'Prismatic Shield', 0),
(61, 5, 8918, 1, 0, 0, 'item', 'Spellbook of Dark Mysteries', 'Spellbook of Dark Mysteries', 0),
(62, 7, 18422, 20, 0, 0, 'item', '20x Minor Crystalline Token', '20x Minor Crystalline Token', 0),
(63, 10, 18423, 20, 0, 0, 'item', '20x Major Crystalline Token', '20x Major Crystalline Token', 0),
(64, 7, 8925, 1, 0, 0, 'item', 'Solar Axe', 'Solar Axe', 0),
(65, 4, 9777, 1, 0, 0, 'item', 'Yalahari Legs Piece', 'Yalahari Legs Piece', 0),
(66, 4, 9776, 1, 0, 0, 'item', 'Yalahari Armor', 'Yalahari Armor', 0),
(67, 4, 9778, 1, 0, 0, 'item', 'Yalahari Mask', 'Yalahari Mask', 0),
(68, 4, 10146, 10, 0, 0, 'item', '10 Blood Herb', '10 Blood Herb', 0),
(70, 8, 2504, 1, 0, 0, 'item', 'Dwarven Legs', 'Dwarven Legs', 0),
(71, 8, 2503, 1, 0, 0, 'item', 'Dwarven Armor', 'Dwarven Armor', 0),
(78, 5, 2366, 1, 0, 0, 'item', '1x Stamina Refill', '1x Stamina Refill', 0),
(79, 30, 16101, 1, 0, 0, 'item', 'vale 30 pontos.', 'Premium Scroll', 0),
(80, 30, 9693, 1, 0, 0, 'item', '1x Addon Doll use !addon nameofaddon', '1x Addon Doll', 0),
(81, 20, 9019, 1, 0, 0, 'item', '1x Mount Doll use !mount nameofmount', '1x Mount Doll', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `account_bans`
--
ALTER TABLE `account_bans`
 ADD PRIMARY KEY (`account_id`), ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
 ADD PRIMARY KEY (`id`), ADD KEY `account_id` (`account_id`), ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_viplist`
--
ALTER TABLE `account_viplist`
 ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`), ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Indexes for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
 ADD PRIMARY KEY (`id`), ADD KEY `warid` (`warid`);

--
-- Indexes for table `guild_invites`
--
ALTER TABLE `guild_invites`
 ADD PRIMARY KEY (`player_id`,`guild_id`), ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_membership`
--
ALTER TABLE `guild_membership`
 ADD PRIMARY KEY (`player_id`), ADD KEY `guild_id` (`guild_id`), ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
 ADD PRIMARY KEY (`id`), ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_wars`
--
ALTER TABLE `guild_wars`
 ADD PRIMARY KEY (`id`), ADD KEY `guild1` (`guild1`), ADD KEY `guild2` (`guild2`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
 ADD PRIMARY KEY (`id`), ADD KEY `owner` (`owner`), ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `house_lists`
--
ALTER TABLE `house_lists`
 ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `ip_bans`
--
ALTER TABLE `ip_bans`
 ADD PRIMARY KEY (`ip`), ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `market_history`
--
ALTER TABLE `market_history`
 ADD PRIMARY KEY (`id`), ADD KEY `player_id` (`player_id`,`sale`);

--
-- Indexes for table `market_offers`
--
ALTER TABLE `market_offers`
 ADD PRIMARY KEY (`id`), ADD KEY `sale` (`sale`,`itemtype`), ADD KEY `created` (`created`), ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `account_id` (`account_id`), ADD KEY `vocation` (`vocation`);

--
-- Indexes for table `players_online`
--
ALTER TABLE `players_online`
 ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_deaths`
--
ALTER TABLE `player_deaths`
 ADD KEY `player_id` (`player_id`), ADD KEY `killed_by` (`killed_by`), ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Indexes for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
 ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
 ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_items`
--
ALTER TABLE `player_items`
 ADD KEY `player_id` (`player_id`), ADD KEY `sid` (`sid`);

--
-- Indexes for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
 ADD PRIMARY KEY (`player_id`), ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Indexes for table `player_spells`
--
ALTER TABLE `player_spells`
 ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_storage`
--
ALTER TABLE `player_storage`
 ADD PRIMARY KEY (`player_id`,`key`);

--
-- Indexes for table `server_config`
--
ALTER TABLE `server_config`
 ADD PRIMARY KEY (`config`);

--
-- Indexes for table `tile_store`
--
ALTER TABLE `tile_store`
 ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `z_forum`
--
ALTER TABLE `z_forum`
 ADD PRIMARY KEY (`id`), ADD KEY `section` (`section`);

--
-- Indexes for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=448;
--
-- AUTO_INCREMENT for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guilds`
--
ALTER TABLE `guilds`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `guild_wars`
--
ALTER TABLE `guild_wars`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2423;
--
-- AUTO_INCREMENT for table `market_history`
--
ALTER TABLE `market_history`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `market_offers`
--
ALTER TABLE `market_offers`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=520;
--
-- AUTO_INCREMENT for table `z_forum`
--
ALTER TABLE `z_forum`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=82;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_bans`
--
ALTER TABLE `account_bans`
ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
ADD CONSTRAINT `account_ban_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_viplist`
--
ALTER TABLE `account_viplist`
ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guilds`
--
ALTER TABLE `guilds`
ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_invites`
--
ALTER TABLE `guild_invites`
ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_membership`
--
ALTER TABLE `guild_membership`
ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `house_lists`
--
ALTER TABLE `house_lists`
ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ip_bans`
--
ALTER TABLE `ip_bans`
ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `market_history`
--
ALTER TABLE `market_history`
ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `market_offers`
--
ALTER TABLE `market_offers`
ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_deaths`
--
ALTER TABLE `player_deaths`
ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_items`
--
ALTER TABLE `player_items`
ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_spells`
--
ALTER TABLE `player_spells`
ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_storage`
--
ALTER TABLE `player_storage`
ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tile_store`
--
ALTER TABLE `tile_store`
ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

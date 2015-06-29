-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 11, 2015 at 06:22 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `virikbinary`
--
CREATE DATABASE IF NOT EXISTS `virikbinary` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `virikbinary`;

-- --------------------------------------------------------

--
-- Table structure for table `account_titles`
--

CREATE TABLE IF NOT EXISTS `account_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `account_titles`
--

INSERT INTO `account_titles` (`id`, `title`) VALUES
(1, 'fuel'),
(2, 'oil'),
(3, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'virik', 'virik123');

-- --------------------------------------------------------

--
-- Table structure for table `carriage_contractors`
--

CREATE TABLE IF NOT EXISTS `carriage_contractors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `idCard` varchar(17) NOT NULL DEFAULT '0',
  `phone` varchar(15) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '0',
  `image` text NOT NULL,
  `entryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `carriage_contractors`
--

INSERT INTO `carriage_contractors` (`id`, `name`, `idCard`, `phone`, `email`, `address`, `image`, `entryDate`) VALUES
(1, 'IRFAN VIRK', '6789909876', 'VIRKOILCOMPANY@', 'VIRKOILCOMPANY@YAHOO.COM', 'SHEIKHUPURA', '0', '2014-12-02 15:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `cityName`) VALUES
(1, 'NRL'),
(2, 'MBT'),
(3, 'PMC'),
(4, 'CPI'),
(5, 'RBT'),
(6, 'MEHMODKOT'),
(7, 'TARUJABA');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `phone` varchar(15) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '0',
  `image` text NOT NULL,
  `entryDate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `phone`, `email`, `address`, `image`, `entryDate`) VALUES
(1, 'ATTOCK PETROLEUM LIMITED', '0515127250-54', '', 'MORGHA RAWALPINDI', '0', '2014-12-02'),
(2, 'shani', '', '', '', '0', '2015-01-01'),
(3, 'hahaha', '', '', '', '0', '2015-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `company_accounts`
--

CREATE TABLE IF NOT EXISTS `company_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `entryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contractor_accounts`
--

CREATE TABLE IF NOT EXISTS `contractor_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `contractor_id` int(11) NOT NULL,
  `payment_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` float NOT NULL DEFAULT '0',
  `entryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contractor_company_commissions`
--

CREATE TABLE IF NOT EXISTS `contractor_company_commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractor_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `commission_1` float NOT NULL,
  `commission_2` float NOT NULL,
  `commission_3` float NOT NULL,
  `wht` float NOT NULL DEFAULT '0',
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contractor_company_commissions`
--

INSERT INTO `contractor_company_commissions` (`id`, `contractor_id`, `company_id`, `commission_1`, `commission_2`, `commission_3`, `wht`, `entryDate`) VALUES
(1, 1, 1, 6, 2, 0, 0, '2014-12-02 15:43:21');

-- --------------------------------------------------------

--
-- Table structure for table `contractor_customer_commissions`
--

CREATE TABLE IF NOT EXISTS `contractor_customer_commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractor_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `freight_commission` float NOT NULL,
  `commission_1` float NOT NULL,
  `commission_2` float NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `contractor_customer_commissions`
--

INSERT INTO `contractor_customer_commissions` (`id`, `contractor_id`, `customer_id`, `freight_commission`, `commission_1`, `commission_2`, `entryDate`) VALUES
(1, 1, 1, 10, 0, 0, '2014-12-02 15:39:13'),
(2, 1, 2, 10, 0, 0, '2014-12-02 15:39:33'),
(3, 1, 9, 10, 0, 0, '2014-12-02 15:39:46'),
(4, 1, 8, 10, 0, 0, '2014-12-02 15:39:58'),
(5, 1, 7, 10, 0, 0, '2014-12-02 15:40:10'),
(6, 1, 6, 7, 0, 0, '2014-12-02 15:40:24'),
(7, 1, 5, 10, 0, 0, '2014-12-02 15:40:34'),
(8, 1, 4, 10, 0, 0, '2014-12-02 15:40:49'),
(9, 1, 3, 8, 0, 0, '2014-12-02 15:41:04'),
(10, 1, 10, 10, 0, 0, '2014-12-04 16:43:52'),
(11, 1, 13, 10, 0, 0, '2014-12-04 16:44:33'),
(12, 1, 14, 10, 0, 0, '2014-12-12 10:14:39'),
(13, 1, 15, 10, 0, 0, '2014-12-12 10:15:31'),
(14, 1, 16, 10, 0, 0, '2014-12-12 10:15:48'),
(15, 1, 17, 10, 0, 0, '2014-12-12 10:16:03'),
(16, 1, 12, 10, 0, 0, '2014-12-12 10:26:32'),
(17, 1, 11, 10, 0, 0, '2014-12-12 10:26:49'),
(18, 1, 18, 7, 0, 0, '2014-12-17 11:40:35'),
(19, 1, 19, 10, 0, 0, '2014-12-23 14:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `idCard` int(17) NOT NULL DEFAULT '0',
  `phone` varchar(15) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '0',
  `image` text,
  `entryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `idCard`, `phone`, `email`, `address`, `image`, `entryDate`) VALUES
(1, 'IRFAN VIRK', 35404, '03007769422', 'VIRKOILCOMPANY@YAHOO.COM', 'SHEIKHUPURA', '0', '2014-12-02 14:40:22'),
(2, 'JAMSHEED SARA', 0, '0321 4406636', '', 'SHEIKHUPURA', '0', '2014-12-02 14:42:08'),
(3, 'MAHER SHAHID', 0, '0300 8718078', '', 'GUJRANWALA', '0', '2014-12-02 14:43:30'),
(4, 'HAFIZ NAEEM / SAMMAD', 0, '0300 4006482', '', 'LAHORE', '0', '2014-12-02 14:44:36'),
(5, 'SHEIKH QASAM', 0, '0300 4234641', '', 'LAHORE', '0', '2014-12-02 14:45:40'),
(6, 'NASEER PASRURIA', 0, '0300 8741987', '', 'GUJRANWALA', '0', '2014-12-02 14:46:43'),
(7, 'HAFIZ AZAM', 0, '0300 8408300', '', 'LAHORE', '0', '2014-12-02 14:48:00'),
(8, 'HAJI NAZEER', 0, '0300 6440807', '', 'GUJRANWALA', '0', '2014-12-02 14:48:50'),
(9, 'KHALID SAILKOT', 0, '0300 7161500', '', 'SAILKOT', '0', '2014-12-02 14:49:53'),
(10, 'CH BASHRAT', 0, '0300 8470825', '', 'LHR', '0', '2014-12-02 19:18:35'),
(11, 'SAJAD OTCL', 1234, '0333 4422811', '', 'OTCL', '0', '2014-12-04 12:01:08'),
(12, 'IFTIKHAR SHAH', 123, '0321 6017487', '', 'SARGODHA', '0', '2014-12-04 13:11:54'),
(13, 'ARSLAN TRADERS', 98326, '0321  8463975', '', 'LAHORE', '0', '2014-12-04 16:32:26'),
(14, 'HIGHWAY F/S', 35202, '0302 6114775', '', 'GUJRANWALA', '0', '2014-12-04 17:03:23'),
(15, 'SAIF CHEEMA', 765432, '0300 8454403', '', 'SARGODHA', '0', '2014-12-06 14:50:08'),
(16, 'NAEEM GUJRAT', 34563, '0303 6955005', '', 'GUJRAT', '0', '2014-12-06 17:33:52'),
(17, 'HEAD MARALA GREAD', 146789, '0347 3408527', '', 'SAILKOT', '0', '2014-12-08 17:39:23'),
(18, 'NAWAB F/S', 67586, '0333 8606128', '', 'SAILKOT', '0', '2014-12-17 11:38:50'),
(19, 'DR.YOUNIS', 3678120, '', '', 'MACHIKEY', '0', '2014-12-23 14:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `customer_accounts`
--

CREATE TABLE IF NOT EXISTS `customer_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_detail_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` float NOT NULL DEFAULT '0',
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_accounts`
--

INSERT INTO `customer_accounts` (`id`, `trip_detail_id`, `customer_id`, `payment_date`, `amount`, `entryDate`) VALUES
(1, 132, 1, '2015-01-08', 243740, '2015-01-08 12:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE IF NOT EXISTS `drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `idCard` varchar(17) NOT NULL DEFAULT '0',
  `phone` varchar(15) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '0',
  `image` text,
  `entryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `idCard`, `phone`, `email`, `address`, `image`, `entryDate`) VALUES
(1, 'RANA ABID', '1', '', '', '', '0', '2014-12-04 16:19:47'),
(2, 'RANA ABID 786', '09876', '', '', '', '0', '2014-12-04 16:20:21'),
(3, 'M BAKHSH BLOUCH', '38202-1291218-9', '0300 7293018', '', 'SARGODHA', '0', '2014-12-04 16:55:31'),
(4, 'NAMIT ULLAHA', '11201-0313496-7', '0347 7065113', '', 'LAKI MARWAT', '0', '2014-12-04 17:52:00'),
(5, 'KHIZER HAYAT', '33202-2121254-3', '0345 6260993', '', 'JHANG', '0', '2014-12-04 18:10:14'),
(6, 'AHMAD ALI/ VAGRA', '33100-5080863-5', '0346 6628049', '', 'FAISALABAD', '0', '2014-12-04 18:11:36'),
(7, 'MUKHTAR HUSSAIN', '33202-2639419-9', '0300 8967422', '', 'JHANG', '0', '2014-12-04 18:13:26'),
(8, 'M NADEEM', '36304-8192996-1', '0301 4735592', '', 'MULTAN', '0', '2014-12-04 18:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `drivers_expenses`
--

CREATE TABLE IF NOT EXISTS `drivers_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `expense` float NOT NULL DEFAULT '0',
  `expense_date` date NOT NULL DEFAULT '0000-00-00',
  `entryDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `freights`
--

CREATE TABLE IF NOT EXISTS `freights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `freight` float NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `freights`
--

INSERT INTO `freights` (`id`, `route_id`, `freight`, `startDate`, `endDate`) VALUES
(1, 1, 0, '2014-12-02', '2014-12-13'),
(2, 2, 0, '2014-12-02', '2014-12-13'),
(3, 3, 0, '2014-12-02', '2014-12-13'),
(4, 4, 0, '2014-12-02', '2014-12-13'),
(5, 5, 0, '2014-12-02', '2014-12-13'),
(6, 3, 0, '2014-12-02', '2014-12-13'),
(7, 7, 0, '2014-12-02', '2014-12-13'),
(8, 8, 0, '2014-12-02', '2014-12-13'),
(9, 9, 0, '2014-12-02', '2014-12-13'),
(10, 10, 0, '2014-12-02', '2014-12-13'),
(11, 11, 0, '2014-12-02', '2014-12-13'),
(12, 6, 0, '2014-12-02', '2014-12-13'),
(13, 11, 2.09079, '2014-12-01', '2014-12-31'),
(14, 9, 1.34047, '2014-12-01', '2014-12-31'),
(15, 8, 0.64601, '2014-12-01', '2014-12-31'),
(16, 7, 0.64601, '2014-12-01', '2014-12-31'),
(17, 4, 6.03753, '2014-12-01', '2014-12-31'),
(18, 1, 5.41645, '2014-12-01', '2014-12-31'),
(19, 11, 2.09079, '2014-12-01', '2015-01-31'),
(20, 9, 1.34047, '2014-12-01', '2015-01-31'),
(21, 8, 0.64601, '2014-12-01', '2015-01-31'),
(22, 7, 0.64601, '2014-12-01', '2015-01-31'),
(23, 4, 6.03753, '2014-12-01', '2015-01-31'),
(24, 1, 5.41645, '2014-12-01', '2015-01-31'),
(25, 4, 6.03753, '2014-12-01', '2014-12-31'),
(26, 4, 8, '2015-01-01', '2015-01-03');

-- --------------------------------------------------------

--
-- Table structure for table `freight_history`
--

CREATE TABLE IF NOT EXISTS `freight_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `freight` float NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `freight_history`
--

INSERT INTO `freight_history` (`id`, `route_id`, `freight`, `entryDate`) VALUES
(1, 1, 5.41645, '2014-12-04 23:02:37'),
(2, 2, 5.41645, '2014-12-04 23:02:46'),
(3, 3, 6.03753, '2014-12-04 23:02:56'),
(4, 4, 6.03753, '2014-12-04 23:03:08'),
(5, 7, 0.64601, '2014-12-04 23:03:19'),
(6, 9, 1.34047, '2014-12-04 23:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `other_agents`
--

CREATE TABLE IF NOT EXISTS `other_agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `idCard` varchar(20) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `image` text NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `other_agents`
--

INSERT INTO `other_agents` (`id`, `name`, `idCard`, `phone`, `email`, `address`, `image`, `entryDate`) VALUES
(1, 'noman', '1234567', '', '', '', '0', '2015-01-01 17:53:23'),
(2, 'shani', '2345678', '', '', '', '0', '2015-01-01 18:13:33'),
(3, 'shani khan', '3456789', '', '', '', '0', '2015-01-01 18:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `other_tankers_expenses`
--

CREATE TABLE IF NOT EXISTS `other_tankers_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanker_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `expense_date` date NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `other_tankers_expenses`
--

INSERT INTO `other_tankers_expenses` (`id`, `tanker_id`, `description`, `amount`, `expense_date`, `entryDate`) VALUES
(1, 2, 'super buraj stone tire 2 addad (Tire no.1) dot 322 L3TY3714-y4m20565 (Tire no .2) dot 322L3TY3514-Y4U500129 (Meter reading) 236338', 81000, '2014-12-11', '2014-12-15 16:19:08'),
(2, 3, 'REMANING LIECSING', 750970, '2014-12-02', '2014-12-22 18:27:47'),
(3, 1, 'LIECSING DECEMBER ( KIST)', 219217, '2014-12-02', '2014-12-22 18:30:57'),
(4, 2, 'LIESING DECEMBER (KIST)', 219217, '2014-12-02', '2014-12-22 18:32:08'),
(5, 9, 'LIESING DECEMBER (KIST)', 157155, '2014-12-08', '2014-12-22 18:32:54'),
(6, 12, 'LIESING DECEMBER (KIST)', 156000, '2014-12-08', '2014-12-22 18:33:34'),
(7, 7, 'LIESING INSTALMENT DECEMBER', 213820, '2014-12-08', '2014-12-22 19:35:27'),
(8, 3, 'ORAX INSURENCE 15-12-2014 TO 14-12-2015', 167000, '2014-12-19', '2014-12-23 13:58:26'),
(9, 57, 'ORIX total amount gari 11982972 instalments 36 per instalment 287527 and advance payment to 1632000', 1632000, '2014-12-23', '2014-12-23 15:36:53'),
(10, 57, 'autocom tanker total ayment 2950000 advance pay 885000', 885000, '2014-12-23', '2014-12-23 15:38:27'),
(11, 58, 'ORIX total amount gari 11982972 instalments 36 per instalment 287527 and advance payment to 1632000', 1632000, '2014-12-23', '2014-12-23 15:46:58'),
(12, 58, 'autocom tanker total ayment 2950000 advance pay 885000', 885000, '2014-12-23', '2014-12-23 15:48:17'),
(13, 63, 'ORIX total amount gari 13605560 instalments 36 per instalment 326460 and advance payment to 1853000', 1853000, '2014-12-23', '2014-12-23 15:55:21'),
(14, 63, 'autocom tanker total ayment 2599000 advance pay 779700', 779700, '2014-12-23', '2014-12-23 15:56:38'),
(15, 64, 'ORIX total amount gari 13605560 instalments 36 per instalment 326460 and advance payment to 1853000', 1853000, '2014-12-23', '2014-12-23 15:58:24'),
(16, 64, 'autocom tanker total ayment 2599000 advance pay 779700', 779700, '2014-12-23', '2014-12-23 15:59:05'),
(17, 65, 'ORIX total amount gari 13605560 instalments 36 per instalment 326460 and advance payment to 1853000', 1853000, '2014-12-23', '2014-12-23 16:00:31'),
(18, 65, 'autocom tanker total ayment 2599000 advance pay 779700', 779700, '2014-12-23', '2014-12-23 16:01:20'),
(19, 66, 'ORIX total amount gari 13605560 instalments 36 per instalment 326460 and advance payment to 1853000', 1853000, '2014-12-23', '2014-12-23 16:02:10'),
(20, 66, 'autocom tanker total ayment 2599000 advance pay 779700', 779700, '2014-12-23', '2014-12-23 16:02:32'),
(21, 61, 'autocom tanker total ayment 2599000 advance pay 779700', 779700, '0014-02-12', '2014-12-23 16:04:17'),
(22, 61, 'autocom tanker total ayment 2599000 advance pay 779700', 779700, '2014-12-23', '2014-12-23 16:04:58'),
(23, 62, 'autocom tanker total ayment 2599000 advance pay 779700', 779700, '2014-12-23', '2014-12-23 16:05:55'),
(24, 59, 'autocom tanker total ayment 3170000 advance pay 951000', 951000, '2014-12-22', '2014-12-23 16:07:24'),
(25, 60, 'autocom tanker total ayment 3170000 advance pay 951000', 951000, '2014-12-23', '2014-12-23 16:12:27'),
(26, 21, 'title', 12345, '2014-12-29', '2014-12-29 21:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productName`) VALUES
(1, 'PMG'),
(2, 'HSD'),
(3, 'FARNES'),
(4, 'KAROCINE');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE IF NOT EXISTS `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `product` varchar(100) NOT NULL,
  `freight` float NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `source`, `destination`, `product`, `freight`, `entryDate`) VALUES
(1, '1', '2', '1', 0, '2014-12-02 15:20:10'),
(2, '3', '2', '1', 0, '2014-12-02 15:20:38'),
(3, '3', '4', '1', 0, '2014-12-02 15:21:25'),
(4, '1', '4', '1', 0, '2014-12-02 15:21:57'),
(5, '1', '5', '1', 0, '2014-12-02 15:22:52'),
(6, '3', '5', '1', 0, '2014-12-02 15:23:10'),
(7, '2', '4', '1', 0, '2014-12-02 15:23:28'),
(8, '2', '4', '2', 0, '2014-12-02 15:23:51'),
(9, '2', '5', '2', 0, '2014-12-02 15:24:41'),
(10, '1', '6', '1', 0, '2014-12-05 14:58:01'),
(11, '2', '7', '2', 0, '2014-12-05 14:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `tankers`
--

CREATE TABLE IF NOT EXISTS `tankers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `truck_number` varchar(20) NOT NULL,
  `engine_number` varchar(20) NOT NULL,
  `chase_number` varchar(30) NOT NULL,
  `fitness_certificate` tinyint(4) NOT NULL DEFAULT '0',
  `capacity` double NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `tankers`
--

INSERT INTO `tankers` (`id`, `customerId`, `truck_number`, `engine_number`, `chase_number`, `fitness_certificate`, `capacity`, `entryDate`) VALUES
(1, 1, 'TLV 239', 'JO8CTGM-15301', 'SG1JDPA-13035', 1, 0, '2014-12-02 14:55:16'),
(2, 1, 'TLV 238', 'JO8CTGM-15300', 'SG1JDPA-13034', 1, 0, '2014-12-02 14:56:59'),
(3, 1, 'TLU 670', 'JO8CTGM-15360', 'FMIJKPT-14388', 1, 0, '2014-12-02 15:00:19'),
(4, 1, 'TLV 163', 'JO8CFM-24321', 'FGIJDPT-12231', 1, 0, '2014-12-02 15:03:17'),
(5, 1, 'MNE 2725', '3328', '7826261', 1, 0, '2014-12-02 15:08:13'),
(6, 3, 'TLG 637', 'JO8CFM-26891', 'FGIJDPT-12478', 1, 50000, '2014-12-02 15:09:30'),
(7, 1, 'TLV 800', 'JO8CTGM-15903', 'FMIJKPT-14433', 1, 0, '2014-12-02 15:12:16'),
(8, 1, 'Z 7512', 'EH700213546', 'GT175H11086', 1, 0, '2014-12-02 15:14:11'),
(9, 1, 'LES 1454', 'JO8CFM-25343', 'FGIJDPT-12385', 1, 0, '2014-12-02 15:17:37'),
(10, 3, 'LXP 8317', 'HO7DH-41970', 'KLBFR61', 1, 40000, '2014-12-02 19:13:35'),
(11, 5, 'TLX 779', '26925', '12482', 1, 0, '2014-12-02 19:35:16'),
(12, 1, 'les 588', '26210', '12450', 1, 0, '2014-12-03 10:34:59'),
(13, 10, 'AKA-1378', 'HO6CTE-13966', 'FF174LA-12420', 1, 0, '2014-12-03 10:37:12'),
(14, 4, 'TLX-815', '26892', '12479', 1, 0, '2014-12-03 10:38:46'),
(15, 14, 'STC 5478', '6058761', 'J4G/6-204647', 1, 0, '2014-12-03 10:45:03'),
(16, 3, 'TLG 837', 'JO8CFM-26890', 'FGIJDPT-12477', 1, 50000, '2014-12-03 10:46:35'),
(17, 2, 'LRC 3327', '15175', 'AU176MA41047', 1, 0, '2014-12-03 10:49:20'),
(18, 10, 'TLX 921', '26989', '12498', 1, 0, '2014-12-03 19:42:57'),
(19, 2, 'TLW 687', 'JO8CTGM-15495', 'SG1JDPA-13037', 1, 0, '2014-12-03 19:44:15'),
(20, 2, 'les 687', '15939', '13043', 1, 0, '2014-12-04 10:43:56'),
(21, 6, 'TLG 487', '17051', '14334', 1, 0, '2014-12-04 10:45:31'),
(22, 10, 'LXC 7983', '004810', '3410436658073', 1, 0, '2014-12-04 10:57:52'),
(23, 8, 'K 6738', '6BGI-792160', '1645908', 1, 30000, '2014-12-04 13:24:29'),
(24, 4, 'TLF 814', '1970204', '4130030', 1, 0, '2014-12-04 13:31:18'),
(25, 9, 'SWA 065', 'HO7DH-45547', 'AK1JRKA-11336', 1, 30000, '2014-12-04 13:43:10'),
(26, 8, 'GAG 3078', 'EH700-171272', 'KR120-10031', 1, 15000, '2014-12-04 13:44:46'),
(27, 8, 'LR 6988', '5/J6-224069', 'J6LZ-56807339', 1, 10000, '2014-12-04 13:46:18'),
(28, 6, 'TUB 887', '58749', '10322', 1, 0, '2014-12-04 15:58:31'),
(29, 6, 'LRC 7787', '704543', 'CJQ3BZ0/T-601442', 1, 0, '2014-12-04 16:00:17'),
(30, 2, 'TLV 687', '24710', '12284', 1, 0, '2014-12-04 16:05:23'),
(31, 12, 'TLU  230', '344955-60094031', '9BM345306.MB909050', 1, 40000, '2014-12-04 16:53:36'),
(32, 13, 'TTA 068', 'H07D-AM-10534', '094726299474', 1, 0, '2014-12-04 17:49:00'),
(33, 11, 'C 8393', 'NE-6026309', 'CPB-12H-26666', 1, 0, '2014-12-05 14:27:22'),
(34, 6, 'GLT 8967', '184920', '16904', 1, 0, '2014-12-05 14:28:57'),
(35, 6, 'LS-6757', '393058', '2488108', 1, 0, '2014-12-05 14:29:34'),
(36, 8, 'TLU 678', 'JO8CTGM-15234', 'FMIJKPT-14322', 1, 50000, '2014-12-05 15:10:58'),
(37, 3, 'CH 237', '6BGI-713554', 'FTR 12K-3601615', 1, 27000, '2014-12-05 20:09:37'),
(38, 9, 'LRJ 5821', '16190', '41372', 1, 50000, '2014-12-06 13:53:44'),
(39, 2, 'TLU 187', 'JO8CFM-23915', 'FGIJDPT-12191', 1, 0, '2014-12-06 14:09:55'),
(40, 16, 'K 2565', '53651', '08334', 1, 0, '2014-12-06 17:40:18'),
(41, 15, 'LES-14-168', '52276968', 'AHFMB22P-4130176', 1, 0, '2014-12-08 15:49:12'),
(42, 3, 'TLV 037', '01877591', '6120009', 1, 50000, '2014-12-08 15:51:46'),
(43, 2, 'TLD-020', 'JO8CTGM-10261', 'SGIJDPA-10299', 1, 0, '2014-12-08 18:56:38'),
(44, 17, 'P 8129', '112852', '50330', 1, 25000, '2014-12-08 19:24:18'),
(45, 2, 'TLQ-087', 'JO8CFM-22253', 'FGIJDPT-12025', 1, 0, '2014-12-08 20:29:09'),
(46, 7, 'GLT-9888', 'EH700-54948', 'FF173-16331', 1, 0, '2014-12-09 18:15:31'),
(47, 8, 'JU-3727', 'JO8CJ-21939', 'AK176-43114', 1, 50000, '2014-12-10 16:29:43'),
(48, 7, 'C-8870', '10740', 'FF174-10487', 1, 25000, '2014-12-10 18:01:26'),
(49, 11, 'z-3475', '020268', '11123', 1, 40000, '2014-12-11 16:26:16'),
(50, 3, 'Les-2217', 'Jo8cfm 16410', 'FLIJRPA-10952', 1, 25000, '2014-12-12 10:36:44'),
(51, 7, 'LS-4317', '109370', '26817', 1, 40000, '2014-12-12 10:41:55'),
(52, 7, 'TTB-470', 'EH700-137914', 'FF173-13780', 1, 25000, '2014-12-15 21:09:43'),
(53, 2, 'RIN-7386', 'EH700-165627', 'FF174-10108', 1, 30000, '2014-12-17 10:03:08'),
(54, 18, 'RIS-13-1900', '6124092', '87881', 1, 50000, '2014-12-17 19:34:38'),
(55, 18, 'RIS 12-1900', '6128948', '87719', 1, 50000, '2014-12-20 16:48:58'),
(56, 11, 'TTD 247', '175366', '15808', 1, 15000, '2014-12-22 17:46:06'),
(57, 1, '1', '65378', '98312', 1, 40000, '2014-12-23 14:37:13'),
(58, 1, '2', '74363', '90183', 1, 40000, '2014-12-23 14:37:50'),
(59, 1, '3', '853610', '8436239', 1, 48000, '2014-12-23 15:02:20'),
(60, 19, '4', '631938', 'K8392173', 1, 48000, '2014-12-23 15:03:08'),
(61, 1, '5', '8912-31', '381883-1', 1, 50000, '2014-12-23 15:23:49'),
(62, 1, '6', '98765430', '665435', 1, 50000, '2014-12-23 15:24:48'),
(63, 1, '7', '987658', '665524', 1, 50000, '2014-12-23 15:27:07'),
(64, 1, '8', '987237', '66843', 1, 50000, '2014-12-23 15:27:40'),
(65, 1, '9', '876544', '45678', 1, 50000, '2014-12-23 15:30:00'),
(66, 1, '10', '878372', '455731', 1, 50000, '2014-12-23 15:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE IF NOT EXISTS `trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `contractor_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `tanker_id` int(11) NOT NULL,
  `contractor_commission` float NOT NULL,
  `contractor_commission_1` float NOT NULL DEFAULT '0',
  `contractor_commission_2` float NOT NULL DEFAULT '0',
  `company_commission_1` float NOT NULL DEFAULT '0',
  `company_commission_2` float NOT NULL DEFAULT '0',
  `company_commission_3` float NOT NULL DEFAULT '0',
  `company_wht` float NOT NULL DEFAULT '0',
  `other_taxes` float NOT NULL DEFAULT '0',
  `email_date` date NOT NULL DEFAULT '0000-00-00',
  `filling_date` date NOT NULL DEFAULT '0000-00-00',
  `receiving_date` date NOT NULL DEFAULT '0000-00-00',
  `stn_receiving_date` date NOT NULL DEFAULT '0000-00-00',
  `decanding_date` date NOT NULL DEFAULT '0000-00-00',
  `driver_id_1` int(11) NOT NULL,
  `driver_id_2` int(11) NOT NULL,
  `driver_id_3` int(11) NOT NULL,
  `invoice_date` date NOT NULL DEFAULT '0000-00-00',
  `invoice_number` varchar(20) NOT NULL,
  `entryDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=150 ;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `customer_id`, `contractor_id`, `company_id`, `tanker_id`, `contractor_commission`, `contractor_commission_1`, `contractor_commission_2`, `company_commission_1`, `company_commission_2`, `company_commission_3`, `company_wht`, `other_taxes`, `email_date`, `filling_date`, `receiving_date`, `stn_receiving_date`, `decanding_date`, `driver_id_1`, `driver_id_2`, `driver_id_3`, `invoice_date`, `invoice_number`, `entryDate`) VALUES
(1, 1, 1, 1, 3, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '2014-12-04', '2014-12-05', '2014-12-04', 4, 4, 4, '2014-12-04', '1040010099', '2014-12-01'),
(2, 1, 1, 1, 7, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '2014-12-04', '2014-12-05', '2014-12-04', 7, 7, 7, '2014-12-04', '1040010100', '2014-12-01'),
(3, 5, 1, 1, 11, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '2014-12-05', '2014-05-12', '2014-12-05', 8, 8, 8, '2014-05-12', '1040010201', '2014-12-02'),
(4, 3, 1, 1, 10, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '2014-12-06', '2014-12-08', '2014-12-06', 8, 8, 8, '2014-12-02', '1070002739', '2014-12-02'),
(5, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '2014-12-01', '2014-12-05', '2014-12-01', 8, 8, 8, '2014-12-01', '1040009725', '2014-12-01'),
(6, 2, 1, 1, 17, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '2014-12-03', '2014-12-04', '2014-12-03', 2, 2, 2, '0000-00-00', '', '2014-12-02'),
(7, 10, 1, 1, 13, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '2014-12-03', '2014-12-12', '2014-12-04', 8, 8, 8, '2014-12-03', '1030008239', '2014-12-02'),
(8, 3, 1, 1, 16, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '2014-12-03', '2014-12-08', '2014-12-03', 8, 8, 8, '2014-12-02', '1040009974', '2014-12-02'),
(9, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '2014-12-02', '2014-12-05', '2014-12-02', 8, 8, 8, '2014-12-02', '1040009881', '2014-12-02'),
(10, 10, 1, 1, 18, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-03', '2014-12-04', '2014-12-03', 2, 2, 2, '2014-12-03', '1040010069', '2014-12-03'),
(11, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '2014-12-01', '2014-12-03', '2014-12-01', 8, 8, 8, '2014-12-01', '1040009801', '2014-12-01'),
(12, 8, 1, 1, 23, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-06', '2014-12-06', '2014-12-06', 8, 8, 8, '2014-12-06', '1040010264', '2014-12-03'),
(13, 4, 1, 1, 24, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '2014-12-04', '2014-12-04', '2014-12-04', 8, 8, 8, '2014-12-04', '1040010101', '2014-12-01'),
(14, 6, 1, 1, 21, 7, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-04', '2014-12-04', '2014-12-04', 8, 8, 8, '2014-12-03', '1040010064', '2014-12-03'),
(15, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-03', '2014-12-04', '2014-12-03', 2, 2, 2, '2014-12-03', '1040010063', '2014-12-03'),
(16, 8, 1, 1, 26, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '2014-12-02', '2014-12-10', '2014-12-03', 8, 8, 8, '2014-12-01', '1040009832', '2014-12-01'),
(17, 9, 1, 1, 25, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '0004-12-01', '2014-12-05', '2014-12-01', 8, 8, 8, '2014-12-01', '1040009823', '2014-12-01'),
(18, 1, 1, 1, 9, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-04', '2014-12-04', '2014-12-08', '2014-12-08', '2014-12-08', 1, 1, 1, '2014-12-08', '1040010377', '2014-12-04'),
(19, 2, 1, 1, 30, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-04', '2014-12-04', '2014-12-08', '2014-12-08', '2014-12-08', 1, 1, 1, '2014-12-08', '1040010376', '2014-12-04'),
(20, 13, 1, 1, 32, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-04', '2014-12-04', '2014-12-05', '2014-12-08', '2014-12-05', 4, 4, 4, '2014-12-05', '1030008393', '2014-12-04'),
(21, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-04', '2014-12-04', '2014-12-04', '2014-05-12', '2014-12-05', 4, 4, 4, '2014-04-12', '1040010153', '2014-12-04'),
(22, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-03', '2014-12-05', '2014-12-03', 8, 8, 8, '2014-12-03', '1040009978', '2014-12-03'),
(23, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-05', '2014-12-05', '2014-12-06', '2014-12-08', '2014-12-06', 8, 8, 8, '2014-12-05', '1040010178', '2014-12-05'),
(24, 6, 1, 1, 28, 7, 0, 0, 6, 2, 0, 0, 0, '2014-12-04', '2014-12-04', '2014-12-04', '2014-05-12', '2014-12-04', 8, 8, 8, '2014-04-12', '1040010135', '2014-12-04'),
(25, 6, 1, 1, 29, 7, 0, 0, 6, 2, 0, 0, 0, '2014-12-04', '2014-12-04', '2014-12-04', '2014-12-06', '2014-12-04', 8, 8, 8, '2014-12-04', '1040010154', '2014-12-04'),
(26, 6, 1, 1, 35, 7, 0, 0, 6, 2, 0, 0, 0, '2014-12-04', '2014-12-04', '2014-12-04', '2014-12-06', '2014-12-04', 8, 8, 8, '2014-12-04', '1040010160', '2014-12-04'),
(27, 6, 1, 1, 34, 7, 0, 0, 6, 2, 0, 0, 0, '2014-12-04', '2014-12-04', '2014-12-04', '2014-12-06', '2014-12-04', 8, 8, 8, '2014-12-04', '1040010146', '2014-12-04'),
(28, 8, 1, 1, 36, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '2014-12-05', '2014-05-12', '2014-11-05', 8, 8, 8, '2014-12-05', '1040010193', '2014-12-01'),
(29, 1, 1, 1, 1, 10, 0, 0, 6, 2, 0, 0, 0, '2014-05-12', '2014-12-05', '2014-12-08', '2014-12-08', '2014-12-08', 8, 8, 8, '2014-12-08', '1040010386', '2014-12-05'),
(30, 1, 1, 1, 2, 10, 0, 0, 6, 2, 0, 0, 0, '2014-05-12', '2014-12-05', '2014-12-08', '2014-12-08', '2014-12-08', 8, 8, 8, '2014-12-08', '1040010387', '2014-12-05'),
(31, 1, 1, 1, 12, 10, 0, 0, 6, 2, 0, 0, 0, '2014-05-12', '2014-12-05', '2014-12-08', '2014-12-08', '2014-12-08', 8, 8, 8, '2014-12-08', '1040010378', '2014-12-05'),
(32, 4, 1, 1, 14, 10, 0, 0, 6, 2, 0, 0, 0, '2014-05-12', '2014-12-05', '2014-12-08', '2014-12-08', '2014-12-08', 8, 8, 8, '2014-12-08', '1040010404', '2014-12-05'),
(33, 11, 1, 1, 33, 10, 0, 0, 6, 2, 0, 0, 0, '2014-05-12', '2014-12-05', '2014-12-06', '2014-12-08', '2014-12-06', 8, 8, 8, '2014-12-08', '1110001367', '2014-12-05'),
(34, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-05-12', '2014-12-05', '2014-12-05', '2014-12-06', '2014-12-05', 8, 8, 8, '2014-12-05', '1040010242', '2014-12-05'),
(35, 8, 1, 1, 36, 10, 0, 0, 6, 2, 0, 0, 0, '2012-05-12', '2014-12-05', '2014-12-06', '2014-12-10', '2014-12-07', 8, 8, 8, '0000-00-00', '', '2014-12-05'),
(36, 5, 1, 1, 11, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-05', '2014-12-05', '2014-12-06', '2014-12-11', '2014-12-07', 8, 8, 8, '0000-00-00', '', '2014-12-05'),
(37, 9, 1, 1, 25, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-04', '2014-12-05', '2014-12-04', 8, 8, 8, '2014-12-03', '', '2014-12-03'),
(38, 9, 1, 1, 25, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-04', '2014-12-05', '2014-12-03', 8, 8, 8, '2014-12-03', '1040010038', '2014-12-03'),
(39, 9, 1, 1, 25, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-05', '2014-12-05', '2014-12-06', '2014-12-09', '2014-12-08', 8, 8, 8, '0000-00-00', '', '2014-12-05'),
(40, 3, 1, 1, 37, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-05', '2014-12-05', '2014-12-06', '2014-12-11', '2014-12-07', 8, 8, 8, '2014-12-05', '1040010189', '2014-12-05'),
(41, 2, 1, 1, 20, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-06', '2014-12-06', '2014-12-06', 8, 8, 8, '2014-12-06', '1040010297', '2014-12-03'),
(42, 9, 1, 1, 38, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-03', '2014-12-03', '2014-12-06', '2014-12-06', '2014-12-06', 8, 8, 8, '2014-12-06', '1040010268', '2014-12-03'),
(43, 1, 1, 1, 5, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-05', '2014-12-05', '2014-12-05', '2014-12-08', '2014-12-06', 8, 8, 8, '2014-12-05', '1040010172', '2014-12-05'),
(44, 16, 1, 1, 40, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '2014-12-02', '2014-12-06', '2014-02-03', 8, 8, 8, '2014-12-01', '1040009717', '2014-12-01'),
(45, 16, 1, 1, 40, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '2014-12-03', '2014-12-06', '2014-12-03', 8, 8, 8, '2014-12-02', '1040009930', '2014-12-02'),
(46, 16, 1, 1, 40, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '2014-12-02', '2014-12-06', '2014-12-03', 8, 8, 8, '2014-12-02', '', '2014-12-02'),
(47, 2, 1, 1, 19, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-06', '2014-12-06', '2014-12-09', '2014-12-09', '2014-12-09', 8, 8, 8, '2014-12-09', '1040010483', '2014-12-06'),
(48, 2, 1, 1, 39, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-06', '2014-12-06', '2014-12-09', '2014-12-09', '2014-12-09', 8, 8, 8, '2014-12-09', '1040010464', '2014-12-06'),
(49, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-06', '2014-12-06', '2014-12-08', '2014-12-08', '2014-12-08', 8, 8, 8, '2014-12-06', '1040010329', '2014-12-06'),
(50, 9, 1, 1, 38, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-06', '2014-12-06', '2014-12-06', '2014-12-09', '2014-12-08', 8, 8, 8, '0000-00-00', '', '2014-12-06'),
(51, 8, 1, 1, 23, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-06', '2014-12-06', '2014-12-08', '2014-12-10', '2014-12-09', 8, 8, 8, '0000-00-00', '', '2014-12-06'),
(52, 16, 1, 1, 40, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-06', '2014-12-06', '2014-12-08', '2014-12-12', '2014-12-09', 8, 8, 8, '2014-12-06', '1040010311', '2014-12-06'),
(53, 3, 1, 1, 16, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-06', '2014-12-06', '2014-12-10', '2014-12-11', '2014-12-10', 8, 8, 8, '2014-12-06', '1070002847', '2014-12-06'),
(54, 3, 1, 1, 42, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-12', '2014-12-17', '2014-12-12', 8, 8, 8, '2014-12-08', '1070002866', '2014-12-08'),
(55, 1, 1, 1, 3, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-11', '2014-12-11', '2014-12-11', 8, 8, 8, '2014-12-11', '1040010597', '2014-12-08'),
(56, 15, 1, 1, 41, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-11', '2014-12-11', '2014-12-11', 8, 8, 8, '2014-12-11', '1040010598', '2014-12-08'),
(57, 13, 1, 1, 32, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-09', '2014-12-10', '2014-12-10', 8, 8, 8, '2014-12-09', '1030008642', '2014-12-08'),
(58, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-08', '2014-12-13', '2014-12-09', 8, 8, 8, '2013-12-08', '1040010342', '2014-12-08'),
(59, 17, 1, 1, 44, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-09', '2014-12-12', '2014-12-10', 8, 8, 8, '0000-00-00', '', '2014-12-08'),
(60, 2, 1, 1, 43, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-09', '2014-12-13', '2014-12-10', 8, 8, 8, '2014-12-09', '1030008641', '2014-12-08'),
(61, 2, 1, 1, 45, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-09', '2014-12-13', '2014-12-10', 8, 8, 8, '2014-12-09', '1030008640', '2014-12-08'),
(62, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-09', '2014-12-09', '2014-12-10', '2014-12-10', '2014-12-10', 8, 8, 8, '2014-12-09', '1040010498', '2014-12-09'),
(63, 9, 1, 1, 25, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-09', '2014-12-09', '2014-12-10', '2014-12-13', '2014-12-11', 8, 8, 8, '2014-12-09', '1040010493', '2014-12-09'),
(64, 11, 1, 1, 33, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-09', '2014-12-09', '2014-12-10', '2014-12-13', '2014-12-10', 8, 8, 8, '2014-12-10', '1110001390', '2014-12-09'),
(65, 7, 1, 1, 46, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-09', '2014-12-09', '2014-12-10', '2014-12-12', '2014-12-11', 8, 8, 8, '2014-12-09', '1040010469', '2014-12-09'),
(66, 1, 1, 1, 7, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-09', '2014-12-09', '2014-12-12', '2014-12-12', '2014-12-12', 8, 8, 8, '2014-12-12', '1040010681', '2014-12-09'),
(67, 2, 1, 1, 20, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-09', '2014-12-09', '2014-12-12', '2014-12-12', '2014-12-12', 8, 8, 8, '2014-12-12', '1040010680', '2014-12-09'),
(68, 3, 1, 1, 10, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-10', '2014-12-10', '2014-12-15', '2014-12-16', '2014-12-16', 8, 8, 8, '2014-12-10', '1070002923', '2014-12-10'),
(69, 9, 1, 1, 38, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-10', '2014-12-10', '2014-12-13', '2014-12-13', '2014-12-13', 8, 8, 8, '2014-12-13', '1040010716', '2014-12-10'),
(70, 8, 1, 1, 47, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-10', '2014-12-10', '2014-12-15', '2014-12-15', '2014-12-15', 8, 8, 8, '2014-12-15', '1040010817', '2014-12-10'),
(71, 10, 1, 1, 18, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-10', '2014-12-10', '2014-12-11', '2014-12-11', '2014-12-11', 8, 8, 8, '2014-12-10', '1040010550', '2014-12-10'),
(72, 3, 1, 1, 37, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-08', '2014-12-08', '2014-12-09', '2014-12-10', '2014-12-10', 8, 8, 8, '2014-12-08', '1040010337', '2014-12-08'),
(73, 1, 1, 1, 9, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-13', '2014-12-13', '2014-12-13', 8, 8, 8, '2014-12-13', '1040010748', '2014-12-11'),
(74, 1, 1, 1, 2, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-13', '2014-12-13', '2014-12-13', 8, 8, 8, '2014-12-13', '1040010747', '2014-12-11'),
(75, 4, 1, 1, 14, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-13', '2014-12-13', '2014-12-13', 8, 8, 8, '2014-12-13', '1040010751', '2014-12-11'),
(76, 2, 1, 1, 30, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-15', '2014-12-15', '2014-12-15', 8, 8, 8, '2014-12-15', '1040010816', '2014-12-11'),
(77, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-12', '2014-12-12', '2014-12-12', 8, 8, 8, '2014-12-11', '1040010593', '2014-12-11'),
(78, 11, 1, 1, 49, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-12', '2014-12-22', '2014-12-13', 8, 8, 8, '2014-12-12', '1110001414', '2014-12-11'),
(79, 12, 1, 1, 31, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-15', '2014-12-15', '2014-12-15', 8, 8, 8, '2014-12-15', '1040010815', '2014-12-11'),
(80, 8, 1, 1, 36, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-17', '2014-12-17', '2014-12-17', 8, 8, 8, '2014-12-17', '1040010931', '2014-12-11'),
(81, 3, 1, 1, 50, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-13', '2014-12-13', '2014-12-13', 8, 8, 8, '2014-12-13', '1040010749', '2014-12-11'),
(82, 7, 1, 1, 51, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-12', '2014-12-17', '2014-12-13', 8, 8, 8, '2014-12-11', '1040010605', '2014-12-11'),
(83, 7, 1, 1, 46, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-09', '2014-12-09', '2014-12-10', '2014-12-12', '2014-12-11', 8, 8, 8, '2014-12-09', '', '2014-12-09'),
(84, 17, 1, 1, 44, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-12', '2014-12-12', '2014-12-12', '2014-12-15', '2014-12-12', 8, 8, 8, '0000-00-00', '', '2014-12-12'),
(85, 16, 1, 1, 40, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-12', '2014-12-12', '2014-12-13', '2014-12-16', '2014-12-14', 8, 8, 8, '2014-12-12', '1040010692', '2014-12-12'),
(86, 1, 1, 1, 1, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-13', '2014-12-13', '2014-12-16', '2014-12-16', '2014-12-16', 8, 8, 8, '2014-12-16', '1040010889', '2014-12-13'),
(87, 1, 1, 1, 12, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-13', '2014-12-13', '2014-12-16', '2014-12-16', '2014-12-16', 8, 8, 8, '2014-12-16', '1040010890', '2014-12-13'),
(88, 1, 1, 1, 3, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-13', '2014-12-13', '2014-12-16', '2014-12-16', '2014-12-16', 8, 8, 8, '2014-12-16', '1040010888', '2014-12-13'),
(89, 2, 1, 1, 19, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-13', '2014-12-13', '2014-12-16', '2014-12-16', '2014-12-16', 8, 8, 8, '2014-12-16', '1040010891', '2014-12-13'),
(90, 11, 1, 1, 33, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-13', '2014-12-13', '2014-12-15', '2014-12-17', '2014-12-16', 8, 8, 8, '2014-12-16', '1110001444', '2014-12-13'),
(91, 9, 1, 1, 38, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-13', '2014-12-13', '2014-12-13', '2014-12-18', '2014-12-13', 8, 8, 8, '0000-00-00', '', '2014-12-13'),
(92, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-13', '2014-12-13', '2014-12-15', '2014-12-15', '2014-12-15', 8, 8, 8, '2014-12-13', '1040010722', '2014-12-13'),
(93, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-13', '2014-12-13', '2014-12-15', '2014-12-15', '2014-12-16', 8, 8, 8, '2014-12-13', '1040010759', '2014-12-13'),
(94, 3, 1, 1, 16, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-19', '2014-12-22', '2014-12-19', 8, 8, 8, '2014-12-15', '1070003002', '2014-12-15'),
(95, 2, 1, 1, 39, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-17', '2014-12-22', '2014-12-17', 8, 8, 8, '2014-12-17', '1030009146', '2014-12-15'),
(96, 17, 1, 1, 44, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-15', '2014-12-16', '2014-12-16', 8, 8, 8, '2014-12-15', '1040010783', '2014-12-15'),
(97, 1, 1, 1, 2, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-18', '2014-12-18', '2014-12-18', 8, 8, 8, '2014-12-18', '1040010997', '2014-12-15'),
(98, 1, 1, 1, 9, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-18', '2014-12-18', '2014-12-18', 8, 8, 8, '2014-12-18', '1040010998', '2014-12-15'),
(99, 1, 1, 1, 7, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-18', '2014-12-18', '2014-12-18', 8, 8, 8, '2014-12-18', '1040010996', '2014-12-15'),
(100, 2, 1, 1, 20, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-19', '2014-12-19', '2014-12-19', 8, 8, 8, '2014-12-19', '1040011057', '2014-12-15'),
(101, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-16', '2014-12-16', '2014-12-16', 8, 8, 8, '2014-12-15', '1040010844', '2014-12-15'),
(102, 7, 1, 1, 52, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-16', '2014-12-17', '2014-12-16', 8, 8, 8, '2014-12-15', '1040010823', '2014-12-15'),
(103, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-16', '2014-12-17', '2014-12-16', 8, 8, 8, '2014-12-15', '1040010839', '2014-12-15'),
(104, 8, 1, 1, 47, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-16', '2014-12-17', '2014-12-16', 8, 8, 8, '0000-00-00', '', '2014-12-15'),
(105, 2, 1, 1, 45, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-16', '2014-12-16', '2014-12-18', '2014-12-22', '2014-12-18', 8, 8, 8, '2014-12-18', '1030009225', '2014-12-16'),
(106, 16, 1, 1, 40, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-16', '2014-12-16', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-12-16'),
(107, 2, 1, 1, 53, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-16', '2014-12-16', '2014-12-18', '2014-12-22', '2014-12-18', 8, 8, 8, '2014-12-18', '1030009224', '2014-12-16'),
(108, 3, 1, 1, 42, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-19', '2014-12-22', '2014-12-19', 8, 8, 8, '2014-12-15', '1070003003', '2014-12-15'),
(109, 7, 1, 1, 52, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-15', '2014-12-15', '2014-12-16', '2014-12-17', '2014-12-16', 8, 8, 8, '0000-00-00', '', '2014-12-15'),
(110, 7, 1, 1, 51, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-11', '2014-12-11', '2014-12-12', '2014-12-17', '2014-12-13', 8, 8, 8, '0000-00-00', '', '2014-12-11'),
(111, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-17', '2014-12-17', '2014-12-18', '2014-12-18', '2014-12-18', 8, 8, 8, '2014-12-17', '1040010923', '2014-12-17'),
(112, 17, 1, 1, 44, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-17', '2014-12-17', '2014-12-18', '2014-12-19', '2014-12-18', 8, 8, 8, '2014-12-17', '1040010927', '2014-12-17'),
(113, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-17', '2014-12-17', '2014-12-18', '2014-12-18', '2014-12-18', 8, 8, 8, '2014-12-17', '1040010940', '2014-12-17'),
(114, 11, 1, 1, 33, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-17', '2014-12-17', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-12-17'),
(115, 8, 1, 1, 36, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-17', '2014-12-17', '2014-12-18', '2014-12-22', '2014-12-18', 8, 8, 8, '0000-00-00', '', '2014-12-17'),
(116, 8, 1, 1, 26, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-17', '2014-12-17', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '2014-12-17', '1040010922', '2014-12-17'),
(117, 18, 1, 1, 54, 7, 0, 0, 6, 2, 0, 0, 0, '2014-12-17', '2014-12-17', '2014-12-20', '2014-12-20', '2014-12-20', 8, 8, 8, '2014-12-20', '1040011117', '2014-12-17'),
(118, 9, 1, 1, 38, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-17', '2014-12-17', '2014-12-22', '2014-12-22', '2014-12-22', 8, 8, 8, '2014-12-22', '1040011138', '2014-12-17'),
(119, 3, 1, 1, 10, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-18', '2014-12-18', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-12-18'),
(120, 3, 1, 1, 6, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-18', '2014-12-18', '2014-12-19', '2014-12-22', '2014-12-19', 8, 8, 8, '2014-12-18', '1040011007', '2014-12-18'),
(121, 1, 1, 1, 1, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-18', '2014-12-18', '2014-12-22', '2014-12-22', '2014-12-22', 8, 8, 8, '2014-12-22', '1040011161', '2014-12-18'),
(122, 1, 1, 1, 3, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-18', '2014-12-18', '2014-12-22', '2014-12-22', '2014-12-22', 8, 8, 8, '2014-12-22', '1040011159', '2014-12-18'),
(123, 1, 1, 1, 12, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-19', '2014-12-19', '2014-12-23', '2014-12-23', '2014-12-23', 8, 8, 8, '2014-12-23', '1040011217', '2014-12-19'),
(124, 2, 1, 1, 19, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-19', '2014-12-19', '2014-12-22', '2014-12-22', '2014-12-22', 8, 8, 8, '2014-12-22', '1040011158', '2014-12-19'),
(125, 4, 1, 1, 14, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-19', '2014-12-19', '2014-12-22', '2014-12-22', '2014-12-22', 8, 8, 8, '2014-12-22', '1040011162', '2014-12-19'),
(126, 4, 1, 1, 24, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-19', '2014-12-19', '2014-12-22', '2014-12-22', '2014-12-22', 8, 8, 8, '2014-12-22', '1040011160', '2014-12-19'),
(127, 5, 1, 1, 11, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-19', '2014-12-19', '2014-12-23', '2014-12-23', '2014-12-23', 8, 8, 8, '2014-12-23', '1040011215', '2014-12-19'),
(128, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-19', '2014-12-19', '2014-12-20', '2014-12-23', '2004-12-20', 8, 8, 8, '2014-12-19', '1040011048', '2014-12-19'),
(129, 17, 1, 1, 44, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-19', '2014-12-19', '2014-12-20', '2014-12-22', '2014-12-20', 8, 8, 8, '2014-12-19', '1040011064', '2014-12-19'),
(130, 12, 1, 1, 31, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-20', '2014-12-20', '2014-12-24', '2014-12-24', '2014-12-24', 8, 8, 8, '2014-12-24', '1040011288', '2014-12-20'),
(131, 1, 1, 1, 2, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-20', '2014-12-20', '2014-12-23', '2014-12-23', '2014-12-23', 8, 8, 8, '2014-12-23', '1040011216', '2014-12-20'),
(132, 1, 1, 1, 9, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-20', '2014-12-20', '2014-12-23', '2014-12-23', '2014-12-23', 8, 8, 8, '2014-12-23', '1040011214', '2014-12-20'),
(133, 8, 1, 1, 23, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-20', '2014-12-20', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '2014-12-20', '', '2014-12-20'),
(134, 2, 1, 1, 43, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-20', '2014-12-20', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-12-20'),
(135, 18, 1, 1, 55, 7, 0, 0, 6, 2, 0, 0, 0, '2014-12-20', '2014-12-20', '2014-12-24', '2014-12-24', '2014-12-24', 8, 8, 8, '2014-12-24', '1040011287', '2014-12-20'),
(136, 8, 1, 1, 47, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-22', '2014-12-22', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-12-22'),
(137, 3, 1, 1, 42, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-22', '2014-12-22', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '2014-12-22', '', '2014-12-22'),
(138, 3, 1, 1, 6, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-22', '2014-12-22', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '2014-12-22', '', '2014-12-22'),
(139, 3, 1, 1, 16, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-22', '2014-12-22', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '2014-12-22', '', '2014-12-22'),
(140, 10, 1, 1, 22, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-22', '2014-12-22', '2014-12-23', '2014-12-23', '2014-12-23', 8, 8, 8, '2014-12-22', '1040011183', '2014-12-22'),
(141, 9, 1, 1, 38, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-22', '2014-12-22', '2014-12-22', '0000-00-00', '2014-12-23', 8, 8, 8, '2014-12-22', '', '2014-12-22'),
(142, 11, 1, 1, 56, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-22', '2014-12-22', '2014-12-23', '2014-12-23', '2014-12-23', 8, 8, 8, '2014-12-22', '1040011152', '2014-12-22'),
(143, 17, 1, 1, 44, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-22', '2014-12-22', '0014-12-23', '0000-00-00', '2014-12-23', 8, 8, 8, '2014-12-22', '', '2014-12-22'),
(144, 14, 1, 1, 15, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-23', '2014-12-23', '2014-12-24', '0000-00-00', '2014-12-24', 8, 8, 8, '2014-12-23', '', '2014-12-23'),
(145, 2, 1, 1, 30, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-23', '2014-12-23', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-12-23'),
(146, 18, 1, 1, 54, 7, 0, 0, 6, 2, 0, 0, 0, '2014-12-23', '2014-12-23', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-12-23'),
(147, 11, 1, 1, 49, 10, 0, 0, 6, 2, 0, 0, 0, '0000-00-00', '2015-01-01', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2015-01-01'),
(148, 1, 1, 2, 1, 10, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '2014-09-04', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-11-06'),
(149, 1, 1, 2, 2, 10, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '2015-01-01', '0000-00-00', '0000-00-00', '0000-00-00', 8, 8, 8, '0000-00-00', '', '2014-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `trips_details`
--

CREATE TABLE IF NOT EXISTS `trips_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trip_id` bigint(20) NOT NULL,
  `source` int(11) NOT NULL,
  `destination` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `product_quantity` double NOT NULL,
  `qty_at_destination` double NOT NULL,
  `qty_after_decanding` double NOT NULL,
  `price_unit` float NOT NULL,
  `freight_unit` float NOT NULL DEFAULT '0',
  `company_freight_unit` float NOT NULL DEFAULT '0',
  `stn_number` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=151 ;

--
-- Dumping data for table `trips_details`
--

INSERT INTO `trips_details` (`id`, `trip_id`, `source`, `destination`, `product`, `product_quantity`, `qty_at_destination`, `qty_after_decanding`, `price_unit`, `freight_unit`, `company_freight_unit`, `stn_number`) VALUES
(1, 1, 1, 2, 1, 60000, 59248, 59345, 81.9376, 5.41645, 5.41645, '1070017812'),
(2, 2, 1, 2, 1, 60000, 59134, 59134, 81.9376, 5.41645, 5.41645, '1070017809'),
(3, 3, 3, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070018080'),
(4, 4, 1, 4, 1, 40000, 40000, 40000, 0, 6.03753, 6.03753, '1070018040'),
(5, 5, 2, 4, 2, 10000, 10000, 10000, 0, 0.6, 0.6, '1070017755'),
(6, 6, 2, 5, 2, 15000, 15000, 15000, 0, 1.34047, 1.34047, '1070018037'),
(7, 7, 2, 5, 2, 25000, 25000, 25000, 0, 1.34047, 1.34047, '1070018042'),
(8, 8, 2, 4, 2, 50000, 50000, 50000, 0, 0.6, 0.6, '1070018085'),
(9, 9, 2, 4, 2, 10000, 10000, 10000, 0, 0.6, 0.6, '1070017951'),
(10, 10, 2, 4, 2, 44000, 44000, 44000, 0, 0.6, 0.6, '1070018245'),
(11, 11, 2, 4, 2, 40000, 40000, 40000, 0, 0.6, 0.6, '1070017811'),
(12, 12, 1, 2, 1, 30000, 30000, 30000, 0, 5.41645, 5.41645, '1070018193'),
(13, 13, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070017857'),
(14, 14, 2, 4, 2, 54000, 54000, 54000, 0, 0.6, 0.6, '1070018240'),
(15, 15, 2, 4, 2, 40000, 40000, 40000, 0, 0.6, 0.6, '1070018236'),
(16, 16, 2, 4, 1, 15000, 15000, 15000, 0, 0.64601, 0.64601, '1070017859'),
(17, 17, 2, 4, 2, 30000, 30000, 30000, 0, 0.6, 0.6, '1070017850'),
(18, 18, 1, 2, 1, 50000, 49180, 49600, 81.9376, 5.41645, 5.41645, '1070018324'),
(19, 19, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070018335'),
(20, 20, 2, 5, 2, 24000, 24000, 24000, 0, 1.34047, 1.34047, '1070018322'),
(21, 21, 2, 4, 2, 40000, 40000, 40000, 0, 0.6, 0.6, '1070018364'),
(22, 22, 2, 4, 2, 10000, 10000, 10000, 0, 0.6, 0.6, '1070018130'),
(23, 23, 2, 4, 2, 10000, 10000, 10000, 0, 0.6, 0.6, '1070018423'),
(24, 24, 2, 4, 2, 16000, 16000, 16000, 0, 0.6, 0.6, '1070018349'),
(25, 25, 2, 4, 2, 16000, 16000, 16000, 0, 0.6, 0.6, '1070018365'),
(26, 26, 2, 4, 2, 16000, 16000, 16000, 0, 0.6, 0.6, '1070018368'),
(27, 27, 2, 4, 2, 25000, 25000, 25000, 0, 0.6, 0.6, '1070018361'),
(28, 28, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070017806'),
(29, 29, 1, 2, 1, 60000, 59177, 59600, 81.9376, 5.41645, 5.41645, '1070018512'),
(30, 30, 1, 2, 1, 60000, 59262, 59600, 81.9376, 5.41645, 5.41645, '1070018498'),
(31, 31, 1, 2, 1, 50000, 49219, 49219, 81.9376, 5.41645, 5.41645, '1070018494'),
(32, 32, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070018724'),
(33, 33, 2, 7, 2, 30000, 30000, 30000, 0, 2.09079, 2.09079, '1070018510'),
(34, 34, 2, 4, 2, 40000, 40000, 40000, 0, 0.6, 0.6, '1070018550'),
(35, 35, 2, 4, 1, 50000, 50000, 50000, 0, 0.64601, 0.64601, '1070018469'),
(36, 36, 2, 4, 1, 50000, 50000, 50000, 0, 0.64601, 0.64601, '1070018477'),
(37, 37, 2, 4, 2, 10000, 10000, 10000, 0, 0.6, 0.6, '1070018212'),
(38, 38, 2, 4, 1, 20000, 20000, 20000, 0, 0.64601, 0.64601, '1070018213'),
(39, 39, 2, 4, 2, 30000, 30000, 30000, 0, 0.6, 0.6, '1070018458'),
(40, 40, 2, 4, 2, 27000, 27000, 27000, 0, 0.6, 0.6, '1070018444'),
(41, 41, 1, 2, 1, 60000, 60000, 60000, 0, 5.41645, 5.41645, '1070018216'),
(42, 42, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070018200'),
(43, 43, 2, 4, 2, 15000, 15000, 15000, 0, 0.6, 0.6, '1070018412'),
(44, 44, 2, 4, 2, 15000, 15000, 15000, 0, 0.6, 0.6, '1070017750'),
(45, 45, 2, 4, 1, 10000, 10000, 10000, 0, 0.64601, 0.64601, '1070018010'),
(46, 46, 2, 4, 1, 5000, 5000, 5000, 0, 0.64601, 0.64601, '1070018011'),
(47, 47, 1, 2, 1, 60000, 60000, 60000, 0, 5.41645, 5.41645, '1070018665'),
(48, 48, 1, 2, 1, 40000, 40000, 40000, 0, 5.41645, 5.41645, '1070018666'),
(49, 49, 2, 4, 2, 40000, 40000, 40000, 0, 0.6, 0.6, '1070018660'),
(50, 50, 2, 4, 1, 50000, 50000, 50000, 0, 0.64601, 0.64601, '1070018587'),
(51, 51, 2, 4, 1, 30000, 30000, 30000, 0, 0.64601, 0.64601, '1070018577'),
(52, 52, 2, 4, 2, 15000, 15000, 15000, 0, 0.6, 0.6, '1070018650'),
(53, 53, 1, 4, 1, 50000, 50000, 50000, 0, 6.03753, 6.03753, '1070018683'),
(54, 54, 1, 4, 1, 50000, 50000, 50000, 0, 6.03753, 6.03753, '1070018791'),
(55, 55, 1, 2, 1, 60000, 58806, 59320, 81.9376, 5.41645, 5.41645, '1070018766'),
(56, 56, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070018765'),
(57, 57, 2, 5, 2, 24000, 24000, 24000, 0, 1.34047, 1.34047, '1070018745'),
(58, 58, 2, 4, 2, 10000, 10000, 10000, 0, 0.6, 0.6, '1070018710'),
(59, 59, 2, 4, 2, 25000, 25000, 25000, 0, 0.6, 0.6, '1070018742'),
(60, 60, 2, 5, 2, 40000, 40000, 40000, 0, 1.34047, 1.34047, '1070018726'),
(61, 61, 2, 5, 2, 40000, 40000, 40000, 0, 1.34047, 1.34047, '1070018727'),
(62, 62, 2, 4, 2, 40000, 40000, 40000, 0, 0.6, 0.6, '1070018994'),
(63, 63, 2, 4, 2, 30000, 30000, 30000, 0, 0.6, 0.6, '1070018992'),
(64, 64, 2, 7, 2, 30000, 30000, 30000, 0, 2.09079, 2.09079, '1070018903'),
(65, 65, 2, 4, 2, 15000, 15000, 15000, 0, 0.6, 0.6, '1070018939'),
(66, 66, 1, 2, 1, 60000, 58876, 58876, 81.9376, 5.41645, 5.41645, '1070019010'),
(67, 67, 1, 2, 1, 60000, 60000, 60000, 0, 5.41645, 5.41645, '1070019011'),
(68, 68, 1, 4, 1, 40000, 40000, 40000, 0, 6.03753, 6.03753, '1070019114'),
(69, 69, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070019108'),
(70, 70, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070019106'),
(71, 71, 2, 4, 2, 44000, 44000, 44000, 0, 0.6, 0.6, '1070019110'),
(72, 72, 2, 4, 2, 27000, 27000, 27000, 0, 0.64601, 0.64601, '1070018704'),
(73, 73, 1, 2, 1, 50000, 49063, 49415, 81.9376, 5.41645, 5.41645, '1070019198'),
(74, 74, 1, 2, 1, 60000, 58893, 59330, 81.9376, 5.41645, 5.41645, '1070019208'),
(75, 75, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070019201'),
(76, 76, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070019245'),
(77, 77, 2, 4, 1, 40000, 40000, 40000, 0, 0.64601, 0.64601, '1070019222'),
(78, 78, 2, 7, 2, 40000, 40000, 40000, 0, 2.09079, 2.09079, '1070019260'),
(79, 79, 1, 2, 1, 40000, 39534, 39534, 81.9376, 5.41645, 5.41645, '1070019290'),
(80, 80, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070019279'),
(81, 81, 1, 2, 1, 25000, 25000, 25000, 0, 5.41645, 5.41645, '1070019291'),
(82, 82, 2, 4, 2, 20000, 20000, 20000, 0, 0.64601, 0.64601, '1070019263'),
(83, 83, 2, 4, 1, 10000, 10000, 10000, 0, 0.64601, 0.64601, '1070018940'),
(84, 84, 2, 4, 2, 25000, 25000, 25000, 0, 0.64601, 0.64601, '1070019312'),
(85, 85, 2, 4, 2, 15000, 15000, 15000, 0, 0.64601, 0.64601, '1070019381'),
(86, 86, 1, 2, 1, 60000, 58897, 59330, 81.9376, 5.41645, 5.41645, '1070019494'),
(87, 87, 1, 2, 1, 50000, 49220, 49220, 81.9376, 5.41645, 5.41645, '1070019484'),
(88, 88, 1, 2, 1, 60000, 58954, 59335, 81.9376, 5.41645, 5.41645, '1070019512'),
(89, 89, 1, 2, 1, 60000, 60000, 60000, 0, 5.41645, 5.41645, '1070019499'),
(90, 90, 2, 7, 2, 30000, 30000, 30000, 0, 2.09079, 2.09079, '1070019452'),
(91, 91, 2, 4, 1, 50000, 50000, 50000, 0, 0.64601, 0.64601, '1070019434'),
(92, 92, 2, 4, 2, 40000, 40000, 40000, 0, 0.64601, 0.64601, '1070019449'),
(93, 93, 2, 4, 2, 10000, 10000, 10000, 0, 0.64601, 0.64601, '1070019493'),
(94, 94, 1, 4, 1, 50000, 50000, 50000, 0, 6.03753, 6.03753, '1070019644'),
(95, 95, 2, 5, 2, 40000, 40000, 40000, 0, 1.34047, 1.34047, '1070019602'),
(96, 96, 2, 4, 2, 25000, 25000, 25000, 0, 0.64601, 0.64601, '1070019571'),
(97, 97, 1, 2, 1, 60000, 58980, 59340, 81.9376, 5.41645, 5.41645, '1070019591'),
(98, 98, 1, 2, 1, 50000, 49098, 49300, 81.9376, 5.41645, 5.41645, '1070019590'),
(99, 99, 1, 2, 1, 60000, 58719, 58719, 81.9376, 5.41645, 5.41645, '1070019588'),
(100, 100, 1, 2, 1, 60000, 60000, 60000, 0, 5.41645, 5.41645, '1070019623'),
(101, 101, 2, 4, 2, 40000, 40000, 40000, 0, 0.64601, 0.64601, '1070019657'),
(102, 102, 2, 4, 2, 15000, 15000, 15000, 0, 0.64601, 0.64601, '1070019609'),
(103, 103, 2, 4, 2, 10000, 10000, 10000, 0, 0.64601, 0.64601, '1070019655'),
(104, 104, 2, 4, 1, 50000, 50000, 50000, 0, 0.64601, 0.64601, '1070019603'),
(105, 105, 2, 5, 2, 40000, 40000, 40000, 0, 1.34047, 1.34047, '1070019803'),
(106, 106, 2, 4, 2, 15000, 15000, 15000, 0, 0.64601, 0.64601, ''),
(107, 107, 2, 5, 2, 30000, 30000, 30000, 0, 1.34047, 1.34047, '1070019845'),
(108, 108, 1, 4, 1, 50000, 50000, 50000, 0, 6.03753, 6.03753, '1070019645'),
(109, 109, 2, 4, 1, 10000, 10000, 10000, 0, 0.64601, 0.64601, '1070019610'),
(110, 110, 2, 4, 1, 20000, 20000, 20000, 0, 0.64601, 0.64601, '1070019264'),
(111, 111, 2, 4, 2, 10000, 10000, 10000, 0, 0.64601, 0.64601, '1070019892'),
(112, 112, 2, 4, 2, 25000, 25000, 25000, 0, 0.64601, 0.64601, '1070019928'),
(113, 113, 2, 4, 2, 40000, 40000, 40000, 0, 0.64601, 0.64601, '1070019958'),
(114, 114, 2, 7, 2, 30000, 30000, 30000, 0, 2.09079, 2.09079, ''),
(115, 115, 2, 4, 1, 50000, 50000, 50000, 0, 0.64601, 0.64601, '1070019931'),
(116, 116, 2, 4, 2, 15000, 15000, 15000, 0, 0.64601, 0.64601, '1070019889'),
(117, 117, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070019961'),
(118, 118, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070019978'),
(119, 119, 1, 4, 1, 40000, 40000, 40000, 0, 6.03753, 6.03753, ''),
(120, 120, 2, 4, 2, 50000, 50000, 50000, 0, 0.64601, 0.64601, '1070020165'),
(121, 121, 1, 2, 1, 60000, 58877, 58877, 81.9376, 5.41645, 5.41645, '1070020188'),
(122, 122, 1, 2, 1, 60000, 58655, 58655, 81.9376, 5.41645, 5.41645, '1070020185'),
(123, 123, 1, 2, 1, 50000, 49124, 0, 81.9376, 5.41645, 5.41645, '1070020290'),
(124, 124, 1, 2, 1, 60000, 60000, 60000, 0, 5.41645, 5.41645, '1070020291'),
(125, 125, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070020257'),
(126, 126, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070020261'),
(127, 127, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070020304'),
(128, 128, 2, 4, 2, 10000, 10000, 10000, 0, 0.64601, 0.64601, '1070020244'),
(129, 129, 2, 4, 2, 25000, 25000, 25000, 0, 0.64601, 0.64601, '1070020287'),
(130, 130, 1, 2, 1, 40000, 39360, 39360, 81.9376, 5.41645, 5.41645, '1070020397'),
(131, 131, 1, 2, 1, 60000, 59024, 59024, 81.9376, 5.41645, 5.41645, '1070020415'),
(132, 132, 1, 2, 1, 50000, 49109, 49109, 81.9376, 5.41645, 5.41645, '1070020429'),
(133, 133, 1, 4, 1, 30000, 30000, 30000, 0, 6.03753, 6.03753, ''),
(134, 134, 2, 5, 2, 40000, 40000, 40000, 0, 1.34047, 1.34047, ''),
(135, 135, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, '1070020398'),
(136, 136, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, ''),
(137, 137, 1, 4, 1, 50000, 50000, 50000, 0, 6.03753, 6.03753, ''),
(138, 138, 1, 4, 1, 50000, 50000, 50000, 0, 6.03753, 6.03753, ''),
(139, 139, 1, 4, 1, 50000, 50000, 50000, 0, 6.03753, 6.03753, ''),
(140, 140, 2, 4, 2, 40000, 40000, 40000, 0, 0.64601, 0.64601, '1070020577'),
(141, 141, 2, 4, 1, 50000, 50000, 50000, 0, 0.64601, 0.64601, ''),
(142, 142, 2, 4, 2, 15000, 15000, 15000, 0, 0.64601, 0.64601, '1070020544'),
(143, 143, 2, 4, 1, 25000, 25000, 25000, 0, 0.64601, 0.64601, ''),
(144, 144, 2, 4, 2, 10000, 10000, 10000, 0, 0.64601, 0.64601, ''),
(145, 145, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, ''),
(146, 146, 1, 2, 1, 50000, 50000, 50000, 0, 5.41645, 5.41645, ''),
(147, 147, 1, 1, 1, 0, 0, 0, 0, 0, 0, ''),
(148, 148, 1, 4, 1, 0, 0, 0, 0, 6.03753, 6.03753, ''),
(149, 149, 1, 4, 1, 0, 0, 0, 0, 6.03753, 15.0375, ''),
(150, 149, 1, 1, 1, 0, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `trips_drivers_expenses`
--

CREATE TABLE IF NOT EXISTS `trips_drivers_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `expense_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `trips_drivers_expenses`
--

INSERT INTO `trips_drivers_expenses` (`id`, `driver_id`, `trip_id`, `expense_date`, `description`, `amount`, `entryDate`) VALUES
(1, 8, 3, '2014-12-29', 'title title', 23456, '2014-12-29 22:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `trips_tankers_expenses`
--

CREATE TABLE IF NOT EXISTS `trips_tankers_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanker_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `expense_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=234 ;

--
-- Dumping data for table `trips_tankers_expenses`
--

INSERT INTO `trips_tankers_expenses` (`id`, `tanker_id`, `trip_id`, `expense_date`, `description`, `amount`, `entryDate`) VALUES
(1, 3, 1, '2014-12-01', 'Tool plaza', 9240, '2014-12-05 12:00:49'),
(2, 3, 1, '2014-12-05', 'service grees', 1500, '2014-12-05 12:01:42'),
(3, 3, 1, '2014-12-05', 'dipu exp', 1300, '2014-12-05 12:02:22'),
(4, 3, 1, '2014-12-05', 'oil chang sabin sootar', 400, '2014-12-05 12:03:10'),
(5, 3, 1, '2014-12-05', 'roti exp', 7000, '2014-12-05 12:03:42'),
(6, 3, 1, '2014-12-05', 'bistray', 2000, '2014-12-05 12:04:33'),
(7, 3, 1, '2014-12-05', 'pankchar', 400, '2014-12-05 12:05:03'),
(8, 3, 1, '2014-12-05', 'weel garees 22', 18650, '2014-12-05 12:05:50'),
(9, 3, 1, '2014-12-05', 'hsd 830 ltr', 84245, '2014-12-05 12:06:35'),
(10, 3, 1, '2014-12-05', 'mobil oil 14 ltr', 5334, '2014-12-05 12:07:26'),
(11, 7, 2, '2014-12-04', 'tool palaza', 9240, '2014-12-05 12:11:08'),
(12, 7, 2, '2014-12-04', 'service grees', 1500, '2014-12-05 12:11:42'),
(13, 7, 2, '2014-12-05', 'dipu exp', 1300, '2014-12-05 12:12:05'),
(14, 7, 2, '2014-12-05', 'oil chang sabin sootar', 400, '2014-12-05 12:12:30'),
(15, 7, 2, '2014-12-05', 'roti exp', 10000, '2014-12-05 12:13:32'),
(16, 7, 2, '2014-12-05', 'bistray', 2000, '2014-12-05 12:13:56'),
(17, 7, 2, '2014-12-05', 'tape exp', 500, '2014-12-05 12:14:30'),
(18, 7, 2, '2014-12-05', 'hsd 810 ltr', 82216, '2014-12-05 12:15:37'),
(19, 7, 2, '2014-12-05', 'mobil oil 14 ltr', 5334, '2014-12-05 12:16:04'),
(20, 12, 31, '2014-12-06', 'Tool plaza', 9240, '2014-12-08 11:45:12'),
(22, 12, 31, '2014-12-06', 'dipu exp', 1300, '2014-12-08 11:46:02'),
(23, 12, 31, '2014-12-06', 'service grees', 1500, '2014-12-08 11:46:28'),
(24, 12, 31, '2014-12-06', 'saban soutar', 400, '2014-12-08 11:47:01'),
(25, 12, 31, '2014-12-06', 'jali air kalinder', 1490, '2014-12-08 11:47:53'),
(26, 12, 31, '2014-12-06', 'roti exp', 6000, '2014-12-08 11:48:19'),
(27, 12, 31, '2014-12-06', 'hsd 733 ltr', 69195, '2014-12-08 11:49:02'),
(28, 12, 31, '2014-12-06', 'mobil oil 14 ltr', 5334, '2014-12-08 11:49:28'),
(29, 9, 18, '2014-12-06', 'Tool plaza', 9240, '2014-12-08 11:53:31'),
(30, 9, 18, '2014-12-06', 'dipu exp', 1300, '2014-12-08 11:54:11'),
(31, 9, 18, '2014-12-06', 'service grees', 1500, '2014-12-08 11:54:51'),
(32, 9, 18, '2014-12-06', 'saban soutar', 400, '2014-12-08 11:55:25'),
(33, 9, 18, '2014-12-06', 'roti exp', 7000, '2014-12-08 11:56:04'),
(34, 9, 18, '2014-12-06', 'tuob lengoder', 3000, '2014-12-08 11:57:43'),
(35, 9, 18, '2014-12-06', 'bill oil filter disel', 1350, '2014-12-08 11:58:40'),
(36, 9, 18, '2014-12-06', '1 addad tire', 150, '2014-12-08 12:00:27'),
(37, 9, 18, '2014-12-06', 'hsd 834 ltr', 78730, '2014-12-08 12:04:08'),
(38, 9, 18, '2014-12-06', 'mobil oil 14 ltr', 5334, '2014-12-08 12:04:48'),
(39, 1, 29, '2014-12-06', 'Tool plaza', 9240, '2014-12-08 19:44:36'),
(40, 1, 29, '2014-12-06', 'service grees', 1500, '2014-12-08 19:45:17'),
(41, 1, 29, '2014-12-06', 'dipu exp', 1300, '2014-12-08 19:45:51'),
(42, 1, 29, '2014-12-06', 'saban soutar', 400, '2014-12-08 19:46:26'),
(43, 1, 29, '2014-12-06', 'roti exp', 6000, '2014-12-08 19:46:59'),
(44, 1, 29, '2014-12-06', 'Tire banwai', 500, '2014-12-08 19:47:49'),
(45, 1, 29, '2014-12-06', 'hsd 767 ltr', 72404, '2014-12-08 19:48:55'),
(46, 1, 29, '2014-12-06', 'mobil oil 14 ltr', 5334, '2014-12-08 19:49:33'),
(47, 2, 30, '2014-12-06', 'Tool plaza', 9240, '2014-12-08 20:35:21'),
(48, 2, 30, '2014-12-06', 'service grees', 1500, '2014-12-08 20:36:07'),
(49, 2, 30, '2014-12-06', 'dipu exp', 1300, '2014-12-08 20:36:41'),
(50, 2, 30, '2014-12-06', 'saban soutar', 400, '2014-12-08 20:37:20'),
(51, 2, 30, '2014-12-06', 'roti exp', 6000, '2014-12-08 20:37:54'),
(52, 2, 30, '2014-12-06', 'lakri gutka', 500, '2014-12-08 20:38:52'),
(53, 2, 30, '2014-12-06', 'tanker welding engal', 500, '2014-12-08 20:39:46'),
(54, 2, 30, '2014-12-06', 'bistar talai', 500, '2014-12-08 20:40:26'),
(55, 2, 30, '2014-12-06', 'sammad + seli kon+jugi rabar', 400, '2014-12-08 20:41:43'),
(56, 2, 30, '2014-12-06', 'hsd 772 ltr', 72876, '2014-12-08 20:42:51'),
(57, 2, 30, '2014-12-06', 'mobil oil 14 ltr', 5334, '2014-12-08 20:43:27'),
(58, 12, 31, '2014-12-09', 'hsd 8ml 82 ltr short', 7535, '2014-12-09 16:44:44'),
(59, 1, 29, '2014-11-05', 'shortage fdk', 100000, '2014-12-11 17:08:45'),
(60, 12, 31, '2014-12-05', 'shortage', 95000, '2014-12-11 17:12:05'),
(61, 9, 18, '2014-12-05', 's', 98250, '2014-12-11 17:13:12'),
(62, 3, 1, '2014-12-03', 'shortage fdk', 105000, '2014-12-11 17:15:11'),
(63, 2, 30, '2014-12-06', 'shortage fdk', 92112, '2014-12-11 17:17:14'),
(64, 7, 2, '2014-12-04', 's', 108000, '2014-12-11 17:26:34'),
(65, 3, 55, '2014-12-08', 'Tool plaza', 9240, '2014-12-11 17:58:05'),
(66, 3, 55, '2014-12-08', 'service grees', 1500, '2014-12-11 18:00:50'),
(67, 3, 55, '2014-12-08', 'dipu exp', 1300, '2014-12-11 18:01:44'),
(68, 3, 55, '2014-12-08', 'saban soutar', 400, '2014-12-11 18:02:18'),
(69, 3, 55, '2014-12-08', 'roti exp', 7000, '2014-12-11 18:02:52'),
(70, 3, 55, '2014-12-08', 'filter', 1100, '2014-12-11 18:04:27'),
(71, 3, 55, '2014-12-08', 'hsd 822 ltr', 77596, '2014-12-11 18:05:42'),
(72, 3, 55, '2014-12-08', 'mobil oil 14 ltr', 5334, '2014-12-11 18:08:25'),
(73, 7, 66, '2014-12-10', 'Tool plaza', 9240, '2014-12-12 16:28:38'),
(74, 7, 66, '2014-12-10', 'service grees', 1500, '2014-12-12 16:29:09'),
(75, 7, 66, '2014-12-10', 'dipu exp', 1300, '2014-12-12 16:29:44'),
(76, 7, 66, '2014-12-10', 'saban soutar', 400, '2014-12-12 16:30:15'),
(77, 7, 66, '2014-12-10', 'roti exp', 8000, '2014-12-12 16:30:42'),
(78, 7, 66, '2014-12-10', 'pankchar', 300, '2014-12-12 16:31:40'),
(79, 7, 66, '2014-12-10', 'filter', 1190, '2014-12-12 16:32:10'),
(80, 7, 66, '2014-12-10', 'wheel kon+repair', 935, '2014-12-12 16:55:20'),
(81, 7, 66, '2014-12-10', 'hsd 786 ltr', 74198, '2014-12-12 16:56:18'),
(82, 7, 66, '2014-12-10', 'mobil oil 14 ltr', 5334, '2014-12-12 16:56:44'),
(83, 3, 55, '1014-12-09', 'shortage fdk', 99200, '2014-12-13 10:19:52'),
(84, 7, 66, '2014-12-10', 'shortage fdk', 94300, '2014-12-13 10:24:44'),
(85, 2, 74, '2014-12-11', 'Tool plaza', 9240, '2014-12-15 15:46:36'),
(86, 2, 74, '2014-12-11', 'service grees', 1500, '2014-12-15 15:47:17'),
(87, 2, 74, '2014-12-11', 'dipu exp', 1300, '2014-12-15 15:47:49'),
(88, 2, 74, '2014-12-11', 'oil chang sabin sootar', 400, '2014-12-15 15:48:25'),
(89, 2, 74, '2014-12-11', 'roti exp', 5000, '2014-12-15 15:48:55'),
(90, 2, 74, '2014-12-11', 'Tire rent + badli', 900, '2014-12-15 15:50:21'),
(91, 2, 74, '2014-12-11', 'chalan motorway', 800, '2014-12-15 15:51:05'),
(92, 2, 74, '2014-12-11', 'air calendar jali', 1500, '2014-12-15 15:51:43'),
(93, 2, 74, '2014-12-11', 'filter', 1100, '2014-12-15 15:52:14'),
(94, 2, 74, '2014-12-11', 'hsd 786 ltr', 74199, '2014-12-15 15:53:19'),
(95, 2, 74, '2014-12-11', 'mobil oil 14 ltr', 5334, '2014-12-15 15:53:56'),
(96, 9, 73, '2014-12-11', 'Tool plaza', 9240, '2014-12-15 15:59:44'),
(97, 9, 73, '2014-12-11', 'service grees', 1500, '2014-12-15 16:00:15'),
(98, 9, 73, '2014-12-11', 'dipu exp', 1300, '2014-12-15 16:00:44'),
(99, 9, 73, '2014-12-11', 'oil chang sabin sootar', 400, '2014-12-15 16:01:12'),
(100, 9, 73, '2014-12-11', 'roti exp', 5000, '2014-12-15 16:01:47'),
(101, 9, 73, '2014-12-11', 'bumpar beem 2 addad', 850, '2014-12-15 16:02:50'),
(102, 9, 73, '2014-12-11', 'bettri tezab +polish', 770, '2014-12-15 16:05:03'),
(103, 9, 73, '2014-12-11', 'hsd 722 ltr', 68156, '2014-12-15 16:07:47'),
(104, 9, 73, '2014-12-11', 'mobil oil 14 ltr', 5334, '2014-12-15 16:08:13'),
(105, 31, 79, '2014-12-11', 'Tool plaza', 8790, '2014-12-15 16:54:17'),
(106, 31, 79, '2014-12-11', 'roti exp', 9100, '2014-12-15 16:54:46'),
(107, 31, 79, '2014-12-11', 'service grees', 450, '2014-12-15 16:56:15'),
(108, 31, 79, '2014-12-11', 'police exp', 1000, '2014-12-15 16:57:06'),
(109, 31, 79, '2014-12-11', 'filter + garees balti', 860, '2014-12-15 16:57:52'),
(110, 31, 79, '2014-12-11', 'hawa chak+saban +pinktchar+chowkidar', 600, '2014-12-15 16:59:21'),
(111, 31, 79, '2014-12-11', 'mobile balance + karaya', 500, '2014-12-15 17:00:31'),
(112, 31, 79, '2014-12-11', 'hsd 800 ltr', 75520, '2014-12-15 17:01:18'),
(113, 9, 73, '2014-12-13', 'shortage fdk', 93200, '2014-12-16 10:17:11'),
(114, 2, 74, '2014-12-13', 'shortage fdk', 99120, '2014-12-16 10:19:13'),
(115, 12, 87, '2014-12-12', 'Tool plaza', 9240, '2014-12-16 11:37:37'),
(116, 12, 87, '2014-12-12', 'service grees', 1500, '2014-12-16 11:40:25'),
(117, 12, 87, '2014-12-12', 'dipu exp', 1300, '2014-12-16 11:41:14'),
(118, 12, 87, '2014-12-12', 'oil chang sabin sootar', 400, '2014-12-16 11:42:29'),
(119, 12, 87, '2014-12-12', 'oil filter hsd', 1350, '2014-12-16 11:43:40'),
(120, 12, 87, '2014-12-12', 'light beem 2 addad', 700, '2014-12-16 11:44:40'),
(121, 12, 87, '2014-12-12', 'rad shesha welding', 150, '2014-12-16 11:45:32'),
(122, 12, 87, '2014-12-12', 'fitness banwai', 500, '2014-12-16 11:46:16'),
(123, 12, 87, '2014-12-12', 'roti exp', 8000, '2014-12-16 11:46:58'),
(124, 12, 87, '2014-12-12', 'hsd 710 ltr', 67024, '2014-12-16 11:47:54'),
(125, 12, 87, '2014-12-12', 'mobil oil 14 ltr', 5334, '2014-12-16 11:48:24'),
(126, 1, 86, '2014-12-12', 'Tool plaza', 9240, '2014-12-16 11:51:11'),
(127, 1, 86, '2014-12-12', 'service grees', 1500, '2014-12-16 11:54:05'),
(128, 1, 86, '2014-12-12', 'dipu exp', 1300, '2014-12-16 11:54:37'),
(129, 1, 86, '2014-12-12', 'oil chang sabin sootar', 400, '2014-12-16 11:55:23'),
(130, 1, 86, '2014-12-12', 'roti exp', 8000, '2014-12-16 11:56:01'),
(131, 1, 86, '2014-12-12', 'hsd 780 ltr', 73632, '2014-12-16 11:57:05'),
(132, 1, 86, '2014-12-12', 'mobil oil 14 ltr', 5334, '2014-12-16 11:57:37'),
(133, 3, 88, '2014-12-12', 'Tool plaza', 9240, '2014-12-16 12:00:00'),
(134, 3, 88, '2014-12-12', 'service grees', 1500, '2014-12-16 12:00:35'),
(135, 3, 88, '2014-12-12', 'dipu exp', 1300, '2014-12-16 12:01:08'),
(136, 3, 88, '2014-12-12', 'oil chang sabin sootar', 400, '2014-12-16 12:01:39'),
(137, 3, 88, '2014-12-12', 'teuob 110020', 2200, '2014-12-16 12:02:41'),
(138, 3, 88, '2014-12-12', 'hsd 833 ltr', 78635, '2014-12-16 12:03:35'),
(139, 3, 88, '2014-12-12', 'mobil oil 14 ltr', 5334, '2014-12-16 12:03:59'),
(140, 1, 86, '2014-12-16', 'shortage fdk', 102200, '2014-12-16 14:54:45'),
(141, 3, 88, '2014-12-16', 'shortage fdk', 102200, '2014-12-16 14:55:58'),
(142, 12, 87, '2014-12-16', 'shortage fdk', 92400, '2014-12-16 14:57:04'),
(143, 2, 97, '2014-12-16', 'Tool plaza', 9240, '2014-12-18 19:19:51'),
(144, 2, 97, '2014-12-16', 'service grees', 1500, '2014-12-18 19:20:29'),
(145, 2, 97, '2014-12-16', 'dipu exp', 1300, '2014-12-18 19:21:42'),
(146, 2, 97, '2014-12-16', 'oil chang sabin sootar', 400, '2014-12-18 19:22:49'),
(147, 2, 97, '2014-12-16', 'rakab rabar', 400, '2014-12-18 19:23:21'),
(148, 2, 97, '2014-12-16', 'tire badli+pincture+gets', 1100, '2014-12-18 19:24:58'),
(149, 2, 97, '2014-12-16', 'roti exp', 5000, '2014-12-18 19:25:24'),
(150, 2, 97, '2014-12-16', 'hsd 779 ltr', 73537, '2014-12-18 19:26:15'),
(151, 2, 97, '2014-12-16', 'mobil oil 14 ltr', 5334, '2014-12-18 19:29:04'),
(152, 9, 98, '2014-12-16', 'Tool plaza', 9240, '2014-12-18 19:32:00'),
(153, 9, 98, '2014-12-16', 'service grees', 1500, '2014-12-18 19:32:28'),
(154, 9, 98, '2014-12-16', 'dipu exp', 1300, '2014-12-18 19:33:01'),
(155, 9, 98, '2014-12-16', 'oil chang sabin sootar', 400, '2014-12-18 19:33:26'),
(156, 9, 98, '2014-12-16', 'roti exp', 5000, '2014-12-18 19:33:54'),
(157, 9, 98, '2014-12-16', 'electriation exp', 190, '2014-12-18 19:34:49'),
(158, 9, 98, '2014-12-16', 'hsd 718 ltr', 67780, '2014-12-18 19:35:36'),
(159, 9, 98, '2014-12-16', 'mobil oil 14 ltr', 5334, '2014-12-18 19:35:55'),
(160, 7, 99, '2014-12-16', 'Tool plaza', 9240, '2014-12-18 20:09:50'),
(161, 7, 99, '2014-12-16', 'service grees', 1500, '2014-12-18 20:10:16'),
(162, 7, 99, '2014-12-16', 'dipu exp', 1300, '2014-12-18 20:10:43'),
(163, 7, 99, '2014-12-16', 'oil chang sabin sootar', 400, '2014-12-18 20:11:14'),
(164, 7, 99, '2014-12-16', 'roti exp', 6000, '2014-12-18 20:11:43'),
(165, 7, 99, '2014-12-16', 'faront bumpar repair', 1000, '2014-12-18 20:12:43'),
(166, 7, 99, '2014-12-16', 'hsd 851 ltr', 80334, '2014-12-18 20:13:24'),
(167, 7, 99, '2014-12-16', 'mobil oil 14 ltr', 5334, '2014-12-18 20:13:45'),
(168, 2, 97, '2014-12-19', 'shortage fdk', 98120, '2014-12-19 10:32:41'),
(169, 7, 99, '2014-12-19', 'shortage fdk', 99520, '2014-12-19 10:34:17'),
(170, 9, 98, '2014-12-19', 'shortage fdk', 88230, '2014-12-19 10:35:29'),
(171, 1, 121, '2014-12-20', 'Tool plaza', 9240, '2014-12-22 13:41:28'),
(172, 1, 121, '2014-12-20', 'service grees', 1500, '2014-12-22 13:41:58'),
(173, 1, 121, '2014-12-20', 'dipu exp', 1300, '2014-12-22 13:42:29'),
(174, 1, 121, '2014-12-20', 'oil chang sabin sootar', 400, '2014-12-22 13:42:55'),
(175, 1, 121, '2014-12-20', 'chalan motorway', 1000, '2014-12-22 13:43:30'),
(176, 1, 121, '2014-12-20', 'oil filter', 580, '2014-12-22 13:44:11'),
(177, 1, 121, '2014-12-20', 'roti exp', 6000, '2014-12-22 13:44:40'),
(178, 1, 121, '2014-12-20', 'hsd 785 ltr', 74104, '2014-12-22 13:45:58'),
(179, 1, 121, '2014-12-20', 'mobil oil 14 ltr', 5334, '2014-12-22 13:47:23'),
(180, 3, 122, '2014-12-20', 'Tool plaza', 9240, '2014-12-22 13:49:17'),
(181, 3, 122, '2014-12-20', 'service grees', 1500, '2014-12-22 13:52:21'),
(182, 3, 122, '2014-12-20', 'dipu exp', 1300, '2014-12-22 13:53:03'),
(183, 3, 122, '2014-12-20', 'oil chang sabin sootar', 400, '2014-12-22 13:53:31'),
(184, 3, 122, '2014-12-20', 'roti exp', 6000, '2014-12-22 13:54:00'),
(185, 3, 122, '2014-12-20', 'air calendar jali', 1050, '2014-12-22 13:54:33'),
(186, 3, 122, '2014-12-20', 'filter Set', 1100, '2014-12-22 13:55:13'),
(187, 3, 122, '2014-12-20', 'weel kable 8 add+garees +mazdori', 6250, '2014-12-22 14:02:53'),
(188, 3, 122, '2014-12-20', 'hsd 849 ltr', 80145, '2014-12-22 14:03:55'),
(189, 3, 122, '2014-12-20', 'mobil oil 14 ltr', 5334, '2014-12-22 14:04:33'),
(190, 1, 121, '2014-12-22', 'shortage fdk', 104200, '2014-12-22 15:22:09'),
(191, 3, 122, '2014-12-22', 'shortage fdk', 106920, '2014-12-22 15:23:11'),
(192, 3, 1, '2014-12-09', 'HSD SHORT 82 LTR KHALID BLOUCH@90.609', 7430, '2014-12-23 10:36:03'),
(193, 9, 132, '2014-12-20', 'Tool plaza', 9240, '2014-12-23 19:47:35'),
(194, 9, 132, '2014-12-20', 'service grees', 1500, '2014-12-23 19:48:13'),
(195, 9, 132, '2014-12-20', 'depo exp', 1300, '2014-12-23 19:48:47'),
(196, 9, 132, '2014-12-20', 'oil chang saban soutar', 400, '2014-12-23 19:49:42'),
(197, 9, 132, '2014-12-20', 'roti exp', 5000, '2014-12-23 19:50:09'),
(198, 9, 132, '2014-12-20', 'hsd filter', 450, '2014-12-23 19:50:39'),
(199, 9, 132, '2014-12-20', 'hsd 735 ltr', 69384, '2014-12-23 19:51:27'),
(200, 9, 132, '2014-12-20', 'mobal oil 14 ltr', 5334, '2014-12-23 19:52:54'),
(201, 2, 131, '2014-12-20', 'Tool plaza', 9240, '2014-12-23 19:54:37'),
(202, 2, 131, '2014-12-20', 'service grees', 1500, '2014-12-23 19:54:59'),
(203, 2, 131, '2014-12-20', 'depo exp', 1300, '2014-12-23 19:55:26'),
(204, 2, 131, '2014-12-20', 'oil chang saban soutar', 400, '2014-12-23 19:55:49'),
(205, 2, 131, '2014-12-20', 'roti exp', 5000, '2014-12-23 19:56:12'),
(206, 2, 131, '2014-12-20', 'razai cambal', 1000, '2014-12-23 19:56:53'),
(207, 2, 131, '2014-12-20', 'hsd 783 ltr', 73915, '2014-12-23 19:57:32'),
(208, 2, 131, '2014-12-20', 'mobal oil 14 ltr', 5334, '2014-12-23 19:57:50'),
(209, 12, 123, '2014-12-20', 'Tool plaza', 9240, '2014-12-24 18:37:33'),
(210, 12, 123, '2014-12-20', 'service grees', 1500, '2014-12-24 18:38:00'),
(211, 12, 123, '2014-12-20', 'depo exp', 1300, '2014-12-24 18:38:29'),
(212, 12, 123, '2014-12-20', 'oil chang saban soutar', 400, '2014-12-24 18:38:55'),
(213, 12, 123, '2014-12-20', 'Stairing cover', 200, '2014-12-24 18:40:03'),
(214, 12, 123, '2014-12-20', 'bettri tazab', 200, '2014-12-24 18:40:36'),
(215, 12, 123, '2014-12-20', '2 wheel chal niklwi', 200, '2014-12-24 18:41:13'),
(216, 12, 123, '2014-12-20', 'roti exp', 7000, '2014-12-24 18:41:38'),
(217, 12, 123, '2014-12-20', 'hsd 761 ltr', 71838, '2014-12-24 18:42:32'),
(218, 12, 123, '2014-12-20', 'mobil oil 14 ltr', 5334, '2014-12-24 18:43:13'),
(219, 31, 130, '2014-12-20', 'Tool plaza', 9200, '2014-12-24 19:08:23'),
(220, 31, 130, '2014-12-20', 'service grees', 1500, '2014-12-24 19:08:59'),
(221, 31, 130, '2014-12-20', 'depo exp', 1350, '2014-12-24 19:09:26'),
(222, 31, 130, '2014-12-20', 'filter', 1000, '2014-12-24 19:10:05'),
(223, 31, 130, '2014-12-20', 'roti exp', 9000, '2014-12-24 19:10:28'),
(224, 31, 130, '2014-12-20', 'thrmostate wall', 1000, '2014-12-24 19:11:08'),
(225, 31, 130, '2014-12-20', 'braik oil', 950, '2014-12-24 19:11:47'),
(226, 31, 130, '2014-12-20', 'pinctur', 1500, '2014-12-24 19:12:22'),
(227, 31, 130, '2014-12-20', 'kaluch batton haron repair', 400, '2014-12-24 19:13:03'),
(228, 31, 130, '2014-12-20', 'kaluch repair', 850, '2014-12-24 19:13:45'),
(229, 31, 130, '2014-12-20', 'haron +electration', 850, '2014-12-24 19:14:43'),
(230, 31, 130, '2014-12-20', 'braik switch+tar', 670, '2014-12-24 19:15:28'),
(231, 31, 130, '2014-12-20', 'hsd 773 ltr', 72971, '2014-12-24 19:16:59'),
(232, 31, 130, '2014-12-20', 'mobil oil 14 ltr', 5400, '2014-12-24 19:17:41'),
(233, 21, 14, '2014-12-29', 'some title', 1200, '2014-12-29 21:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_entry`
--

CREATE TABLE IF NOT EXISTS `voucher_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_type` varchar(20) NOT NULL,
  `account_title_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `related_other_agent` int(11) NOT NULL DEFAULT '0',
  `related_customer` int(11) NOT NULL,
  `related_contractor` int(11) NOT NULL,
  `credit_amount` double NOT NULL,
  `debit_amount` double NOT NULL,
  `dr_cr` tinyint(4) NOT NULL,
  `journal_voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `voucher_entry`
--

INSERT INTO `voucher_entry` (`id`, `ac_type`, `account_title_id`, `description`, `related_other_agent`, `related_customer`, `related_contractor`, `credit_amount`, `debit_amount`, `dr_cr`, `journal_voucher_id`) VALUES
(102, 'expense', 2, '', 0, 19, 0, 0, 50000, 1, 37),
(103, 'owner_equity', 1, '', 0, 0, 0, 20000, 0, 0, 37),
(104, 'bank', 1, '', 0, 0, 0, 30000, 0, 0, 37),
(105, 'cash', 1, '', 1, 0, 0, 0, 200000, 1, 38),
(106, 'revenue', 1, 'Freight', 2, 0, 0, 200000, 0, 0, 38),
(107, 'liability', 1, '', 3, 0, 0, 0, 19000, 1, 39),
(108, 'payable', 1, '', 3, 0, 0, 19000, 0, 0, 39),
(109, 'expense', 2, '', 3, 0, 0, 0, 0, 1, 42),
(110, 'expense', 2, '', 3, 0, 0, 0, 0, 1, 42),
(111, 'expense', 1, '', 0, 0, 0, 0, 0, 1, 43),
(112, 'expense', 1, '', 0, 0, 0, 0, 0, 1, 43),
(113, 'expense', 1, '', 0, 19, 0, 0, 0, 1, 44),
(114, 'expense', 1, '', 0, 0, 0, 0, 0, 1, 44),
(115, 'expense', 1, '', 0, 0, 0, 0, 2000, 1, 45),
(116, 'expense', 1, '', 0, 0, 1, 2000, 0, 0, 45),
(117, 'expense', 1, '', 0, 17, 0, 0, 0, 0, 46),
(118, 'expense', 1, '', 3, 0, 0, 0, 0, 1, 46),
(119, 'expense', 1, '', 0, 19, 0, 0, 14000, 1, 47),
(120, 'bank', 3, '', 0, 0, 0, 14000, 0, 0, 47),
(121, 'expense', 1, '', 0, 0, 0, 0, 33000, 1, 48),
(122, 'payable', 3, '', 1, 0, 0, 33000, 0, 0, 48),
(123, 'expense', 2, '', 0, 0, 0, 0, 200000000, 1, 49),
(124, 'bank', 3, '', 1, 0, 0, 150000000, 0, 0, 49),
(125, 'payable', 3, '', 0, 0, 1, 50000000, 0, 0, 49);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_journal`
--

CREATE TABLE IF NOT EXISTS `voucher_journal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_date` date NOT NULL,
  `detail` text NOT NULL,
  `person_tid` varchar(30) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `tanker_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `other_tid` varchar(30) NOT NULL,
  `entryDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `voucher_journal`
--

INSERT INTO `voucher_journal` (`id`, `voucher_date`, `detail`, `person_tid`, `trip_id`, `tanker_id`, `driver_id`, `other_tid`, `entryDate`, `active`) VALUES
(37, '2015-01-07', 'Expense of a tanker', 'customers.1', 1, 3, 0, '', '2015-01-07 10:14:42', 1),
(38, '2015-02-07', 'Attok patrolium company', 'customers.1', 0, 0, 0, '', '2015-01-07 10:23:13', 1),
(39, '2015-01-08', '', 'customers.1', 0, 66, 0, '', '2015-01-08 07:05:48', 1),
(40, '2015-01-09', '', 'customers.', 8, 0, 0, '', '2015-01-09 21:31:22', 1),
(41, '2015-01-09', '', 'customers.14', 93, 15, 0, '', '2015-01-09 21:34:53', 1),
(42, '2015-01-09', '', 'customers.1', 0, 66, 0, '', '2015-01-09 21:40:06', 1),
(43, '2015-01-10', '', 'customers.1', 0, 66, 0, '', '2015-01-10 05:13:25', 1),
(44, '2015-01-10', '', 'customers.1', 0, 66, 0, '', '2015-01-10 05:31:44', 1),
(45, '2015-01-10', '', 'customers.1', 0, 66, 0, '', '2015-01-10 05:33:04', 1),
(46, '2015-01-10', '', 'customers.1', 0, 66, 0, '', '2015-01-10 05:48:12', 1),
(47, '2015-01-10', '', 'customers.11', 147, 49, 0, '', '2015-01-10 06:08:01', 1),
(48, '2015-01-10', 'this voucher is for tanker expense', 'customers.11', 147, 49, 0, '', '2015-01-10 06:09:55', 1),
(49, '2015-01-10', 'Noman ne pay kia', 'customers.1', 123, 12, 0, '', '2015-01-10 07:13:59', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

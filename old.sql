-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 09, 2014 at 05:55 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `petrol`
--
CREATE DATABASE IF NOT EXISTS `petrol` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `petrol`;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `phone`, `email`, `address`, `image`, `entryDate`) VALUES
(1, 'ATTOCK PETROLEUM LIMITED', '0515127250-54', '', 'MORGHA RAWALPINDI', '0', '2014-12-02');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company_accounts`
--

INSERT INTO `company_accounts` (`id`, `trip_id`, `company_id`, `payment_date`, `amount`, `entryDate`) VALUES
(1, 11, 1, '2014-12-05', 1200, '2014-12-05 09:13:47');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

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
(9, 1, 3, 8, 0, 0, '2014-12-02 15:41:04');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

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
(10, 'CH BASHRAT', 0, '0300 8470825', '', 'LHR', '0', '2014-12-02 19:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer_accounts`
--

CREATE TABLE IF NOT EXISTS `customer_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` float NOT NULL DEFAULT '0',
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_accounts`
--

INSERT INTO `customer_accounts` (`id`, `trip_id`, `customer_id`, `payment_date`, `amount`, `entryDate`) VALUES
(1, 2, 1, '2014-12-02', 297000, '2014-12-02 19:47:29');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `idCard`, `phone`, `email`, `address`, `image`, `entryDate`) VALUES
(2, 'Amjad', '', '', '', '', '0', '2014-12-04 14:51:12');

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
-- Table structure for table `freight_history`
--

CREATE TABLE IF NOT EXISTS `freight_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `freight` float NOT NULL,
  `entryDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `freight_history`
--

INSERT INTO `freight_history` (`id`, `route_id`, `freight`, `entryDate`) VALUES
(1, 1, 3.3, '2014-12-04 08:01:10'),
(2, 0, 5.6, '2014-12-04 22:25:35'),
(3, 0, 5.7, '2014-12-04 22:28:36'),
(4, 0, 5.8, '2014-12-04 22:31:37'),
(5, 0, 5.9, '2014-12-04 22:33:59'),
(6, 0, 7, '2014-12-04 22:37:09'),
(7, 0, 12, '2014-12-04 22:38:28'),
(8, 1, 3, '2014-12-04 22:41:26'),
(9, 1, 3.45455, '2014-12-04 22:51:33');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `other_tankers_expenses`
--

INSERT INTO `other_tankers_expenses` (`id`, `tanker_id`, `description`, `amount`, `expense_date`, `entryDate`) VALUES
(1, 7, 'dfjdjf', 6767, '2014-12-05', '2014-12-05 11:34:13'),
(2, 1, 'other expense', 36, '2014-12-07', '2014-12-07 11:58:52'),
(3, 1, 'kdjfkdjf', 12345700, '2014-12-07', '2014-12-07 12:10:34');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `source`, `destination`, `product`, `freight`, `entryDate`) VALUES
(1, 'N', 'MBT', 'PMG', 3.45455, '2014-12-02 15:20:10'),
(2, 'abc', 'MBT', 'PMG', 5.8, '2014-12-02 15:20:38'),
(3, 'NRL', 'MBT', 'PMG', 5.8, '2014-12-02 15:21:25'),
(4, 'NRL', 'MBT', 'PMG', 5.8, '2014-12-02 15:21:57'),
(5, 'mm', 'm', 'm', 5.8, '2014-12-02 15:22:52'),
(6, 'NRL', 'MBT', 'PMG', 5.8, '2014-12-02 15:23:10'),
(7, 'NRL', 'MBT', 'PMG', 5.8, '2014-12-02 15:23:28'),
(8, 'NRL', 'MBT', 'PMG', 5.8, '2014-12-02 15:23:51'),
(9, 'RL', 'MBT', 'PMG', 5.8, '2014-12-02 15:24:41'),
(10, 'NRL', 'MBT', 'PMG', 5.8, '2014-12-04 22:24:16'),
(11, 'NRL', 'MBT', 'PMG', 5.8, '2014-12-04 22:25:26'),
(12, 'NR', 'MBT', 'PMG', 5.8, '2014-12-04 22:32:06'),
(13, 'some', 'thing', 'thing', 5.4, '2014-12-04 22:36:25'),
(14, 'lahore', 'karachi', 'oil', 3.4, '2014-12-08 11:36:08');

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
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tankers`
--

INSERT INTO `tankers` (`id`, `customerId`, `truck_number`, `engine_number`, `chase_number`, `fitness_certificate`, `entryDate`) VALUES
(1, 1, 'TLV 239', 'JO8CTGM-15301', 'SG1JDPA-13035', 1, '2014-12-02 14:55:16'),
(2, 1, 'TLV 238', 'JO8CTGM-15300', 'SG1JDPA-13034', 1, '2014-12-02 14:56:59'),
(3, 1, 'TLU 670', 'JO8CTGM-15360', 'FMIJKPT-14388', 1, '2014-12-02 15:00:19'),
(4, 1, 'TLV 163', 'JO8CFM-24321', 'FGIJDPT-12231', 1, '2014-12-02 15:03:17'),
(5, 1, 'MNE 2725', '3328', '7826261', 1, '2014-12-02 15:08:13'),
(6, 3, 'TLG 637', 'JO8CFM-26891', 'FGIJDPT-12478', 1, '2014-12-02 15:09:30'),
(7, 1, 'TLV 800', 'JO8CTGM-15903', 'FMIJKPT-14433', 1, '2014-12-02 15:12:16'),
(8, 1, 'Z 7512', 'EH700213546', 'GT175H11086', 1, '2014-12-02 15:14:11'),
(9, 1, 'LES 1454', 'JO8CFM-25343', 'FGIJDPT-12385', 1, '2014-12-02 15:17:37'),
(10, 3, 'LXP 8317', 'HO7DH-41970', 'KLBFR61', 1, '2014-12-02 19:13:35'),
(11, 5, 'TLX 779', '26925', '12482', 1, '2014-12-02 19:35:16');

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
  `route_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT '0',
  `final_quantity` float NOT NULL DEFAULT '0',
  `price_unit` float NOT NULL DEFAULT '0',
  `freight_unit` float NOT NULL DEFAULT '0',
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
  `stn_number` varchar(100) NOT NULL,
  `entryDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `customer_id`, `contractor_id`, `company_id`, `tanker_id`, `route_id`, `product_quantity`, `final_quantity`, `price_unit`, `freight_unit`, `contractor_commission`, `contractor_commission_1`, `contractor_commission_2`, `company_commission_1`, `company_commission_2`, `company_commission_3`, `company_wht`, `other_taxes`, `email_date`, `filling_date`, `receiving_date`, `stn_receiving_date`, `decanding_date`, `driver_id_1`, `driver_id_2`, `driver_id_3`, `invoice_date`, `invoice_number`, `stn_number`, `entryDate`) VALUES
(1, 1, 1, 1, 3, 1, 60000, 0, 0, 5.5, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '', '2014-12-02'),
(2, 1, 1, 1, 7, 1, 60000, 0, 0, 5.5, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-01', '2014-12-01', '0000-00-00', '0000-00-00', '2014-12-31', 2, 2, 2, '0000-00-00', '', '', '2014-12-03'),
(3, 5, 1, 1, 11, 2, 50000, 0, 0, 5.5, 10, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '', '2014-12-02'),
(4, 3, 1, 1, 10, 4, 40000, 0, 0, 6.2, 8, 0, 0, 6, 2, 0, 0, 0, '2014-12-02', '2014-12-02', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '2014-12-02', '', '12345', '2014-12-02'),
(6, 1, 1, 1, 9, 9, 23000, 0, 0, 1.3, 10, 0, 0, 6, 2, 0, 0, 0, '0000-00-00', '2014-12-04', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '', '2014-12-04'),
(7, 1, 1, 1, 9, 9, 23000, 0, 0, 1.3, 10, 0, 0, 6, 2, 0, 0, 0, '0000-00-00', '2014-12-04', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '', '2014-12-04'),
(8, 1, 1, 1, 9, 9, 23000, 0, 0, 1.3, 10, 0, 0, 6, 2, 0, 0, 0, '0000-00-00', '2014-12-04', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '', '2014-12-04'),
(9, 1, 1, 1, 9, 9, 23000, 0, 0, 1.3, 10, 0, 0, 6, 2, 0, 0, 0, '0000-00-00', '2014-12-04', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '', '2014-12-04'),
(10, 1, 1, 1, 9, 9, 23000, 0, 0, 1.3, 10, 0, 0, 6, 2, 0, 0, 0, '0000-00-00', '2014-12-04', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '1245', '2014-12-04'),
(11, 1, 1, 1, 8, 9, 123447, 0, 0, 1.3, 10, 0, 0, 6, 2, 0, 0, 0, '0000-00-00', '2014-12-04', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '12456', '2014-12-04'),
(12, 1, 1, 1, 1, 13, 33000, 0, 0, 5.4, 10, 0, 0, 6, 2, 0, 0, 0, '0000-00-00', '2014-12-05', '0000-00-00', '0000-00-00', '0000-00-00', 2, 2, 2, '0000-00-00', '', '', '2014-12-05');

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
  `amount` double NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `trips_drivers_expenses`
--

INSERT INTO `trips_drivers_expenses` (`id`, `driver_id`, `trip_id`, `expense_date`, `description`, `amount`, `entryDate`) VALUES
(1, 1, 4, '2014-12-04', 'tire', 1200, '2014-12-04 12:31:12'),
(2, 2, 2, '2014-12-05', 'heheh', 1234567.875, '2014-12-05 11:27:25'),
(3, 2, 1, '2014-12-05', 'hehehe', 12345.677734375, '2014-12-05 11:28:00'),
(4, 2, 1, '2014-12-05', 'dfdfdfd', 1111111168, '2014-12-05 11:28:37'),
(5, 2, 1, '2014-12-05', 'lolololo', 1234567.89, '2014-12-05 11:30:08');

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
  `amount` double NOT NULL,
  `entryDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `trips_tankers_expenses`
--

INSERT INTO `trips_tankers_expenses` (`id`, `tanker_id`, `trip_id`, `expense_date`, `description`, `amount`, `entryDate`) VALUES
(1, 10, 4, '2014-12-04', 'blast', 12000, '2014-12-04 13:56:15'),
(2, 7, 2, '2014-12-05', 'tire pata', 3300, '2014-12-05 09:52:28'),
(3, 9, 10, '2014-12-05', 'some title', 12345678, '2014-12-05 11:26:37'),
(4, 1, 12, '2014-12-05', 'hehehe', 1234567, '2014-12-05 20:04:16');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

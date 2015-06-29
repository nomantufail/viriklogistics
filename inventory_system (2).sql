-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2015 at 08:34 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `inventory_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `name`, `role`) VALUES
(1, 'virik', 'virik123', 'viriklogistics', 2),
(2, 'test', '123', 'Test User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE IF NOT EXISTS `agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `name`, `phone`, `address`, `type`, `inserted_at`, `updated_at`) VALUES
(1, 'arshad', '', '', 1, '2015-04-10 12:24:42', '0000-00-00 00:00:00'),
(2, 'akram', '', '', 2, '2015-04-10 12:25:00', '0000-00-00 00:00:00'),
(3, 'noman', '', '', 2, '2015-04-10 14:27:07', '0000-00-00 00:00:00'),
(4, 'shahid', '', '', 2, '2015-04-10 14:28:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `inserted_at`, `updated_at`) VALUES
(1, 'some', '', '2015-04-10 12:38:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoices`
--

CREATE TABLE IF NOT EXISTS `purchase_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `transaction_type` tinyint(4) NOT NULL DEFAULT '1',
  `paid` double NOT NULL,
  `extra_info` text NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_invoice_items`
--

CREATE TABLE IF NOT EXISTS `purchase_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `cost_per_item` double NOT NULL DEFAULT '0',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `router`
--

CREATE TABLE IF NOT EXISTS `router` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(100) NOT NULL,
  `function` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `router`
--

INSERT INTO `router` (`id`, `controller`, `function`) VALUES
(1, 'agents', 'customers'),
(2, 'products', 'index'),
(3, 'purchases', 'credit_purchase'),
(4, 'sales', 'credit_sale'),
(5, 'stock', 'index'),
(6, 'accounts', 'index'),
(7, 'reports', 'index');

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoices`
--

CREATE TABLE IF NOT EXISTS `sale_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `transaction_type` tinyint(4) NOT NULL DEFAULT '1',
  `recieved` double NOT NULL,
  `extra_info` text NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sale_invoices`
--

INSERT INTO `sale_invoices` (`id`, `invoice_date`, `customer_id`, `transaction_type`, `recieved`, `extra_info`, `inserted_at`, `updated_at`, `deleted_at`, `deleted`) VALUES
(1, '2015-04-10', 3, 0, 4, '', '2015-04-10 14:28:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, '2015-04-10', 4, 0, 4, '', '2015-04-10 14:29:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sale_invoice_items`
--

CREATE TABLE IF NOT EXISTS `sale_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `sale_price_per_item` double NOT NULL DEFAULT '0',
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sale_invoice_items`
--

INSERT INTO `sale_invoice_items` (`id`, `invoice_id`, `product_id`, `quantity`, `sale_price_per_item`, `inserted_at`, `updated_at`, `deleted_at`, `deleted`) VALUES
(1, 1, 1, 3, 4, '2015-04-10 14:28:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(2, 2, 1, 3, 4, '2015-04-10 14:29:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` double NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `product_id`, `quantity`, `updated_at`) VALUES
(1, 1, -6, '2015-04-10 04:29:02');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

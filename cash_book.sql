-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 25, 2023 at 03:18 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cash_book`
--
CREATE DATABASE IF NOT EXISTS `cash_book` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cash_book`;

-- --------------------------------------------------------

--
-- Table structure for table `daily_income`
--

CREATE TABLE IF NOT EXISTS `daily_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_income` varchar(40) NOT NULL,
  `total_expense` varchar(40) NOT NULL,
  `closing_balance` varchar(40) NOT NULL,
  `opening_balance` varchar(40) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `daily_income`
--

INSERT INTO `daily_income` (`id`, `total_income`, `total_expense`, `closing_balance`, `opening_balance`, `date`) VALUES
(3, '5000.0', '1000.0', '4000.0', '0.0', '23/07/2023');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE IF NOT EXISTS `expense` (
  `expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_date` varchar(40) NOT NULL,
  `ehead_id` varchar(40) NOT NULL,
  `expense_amount` varchar(40) NOT NULL,
  `expense_description` varchar(100) NOT NULL,
  PRIMARY KEY (`expense_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`expense_id`, `expense_date`, `ehead_id`, `expense_amount`, `expense_description`) VALUES
(1, '19/07/2023', '7', '5000', 'Paying for emp1'),
(2, '19/07/2023', '8', '1000', 'Books & Pens'),
(3, '19/07/2023', '7', '5000', 'Employee 2'),
(4, '21/07/2023', '3', '5000', 'Bike'),
(5, '21/07/2023', '8', '1000', 'books'),
(6, '23/07/2023', '3', '1000', 'bike emi'),
(7, '24/07/2023', '1', '15000.00', 'Paid rent toward APJAK Block flat no 2103 ');

-- --------------------------------------------------------

--
-- Table structure for table `expense_heads`
--

CREATE TABLE IF NOT EXISTS `expense_heads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ehead` varchar(20) NOT NULL,
  `edesc` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `expense_heads`
--

INSERT INTO `expense_heads` (`id`, `ehead`, `edesc`) VALUES
(1, 'Rent', ''),
(2, 'Bill', ''),
(3, 'EMI', ''),
(4, 'Tax', ''),
(5, 'Fees', ''),
(6, 'Interest', ''),
(7, 'Salary', ''),
(8, 'Stationary', ''),
(9, 'Printing', ''),
(10, 'ADs', ''),
(11, 'Investment', 'Investment');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE IF NOT EXISTS `income` (
  `income_id` int(11) NOT NULL AUTO_INCREMENT,
  `income_date` varchar(40) NOT NULL,
  `ihead_id` varchar(40) NOT NULL,
  `income_amount` varchar(40) NOT NULL,
  `income_description` varchar(100) NOT NULL,
  PRIMARY KEY (`income_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`income_id`, `income_date`, `ihead_id`, `income_amount`, `income_description`) VALUES
(1, '19/07/2023', '3', '4000', 'Petty'),
(2, '19/07/2023', '2', '10000', 'Rent for 2bhk flat in hyd'),
(3, '19/07/2023', '1', '20000', 'SR  Feee'),
(4, '20/07/2023', '3', '4000', 'Softwayz Solutions'),
(11, '23/07/2023', '2', '5000', 'room rent'),
(12, '23/07/2023', '3', '2000', 'hackathon'),
(13, '23/07/2023', '3', '5000', ''),
(14, '23/07/2023', '3', '5000', ''),
(15, '24/07/2023', '10', '5000.00', 'Rakesh paid online class fee towards Django');

-- --------------------------------------------------------

--
-- Table structure for table `income_heads`
--

CREATE TABLE IF NOT EXISTS `income_heads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ihead` varchar(20) NOT NULL,
  `idesc` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `income_heads`
--

INSERT INTO `income_heads` (`id`, `ihead`, `idesc`) VALUES
(1, 'Fee Receipt', ''),
(2, 'Rent', ''),
(7, 'project', ''),
(8, 'Biometric Fee', ''),
(9, 'Library Fee', ''),
(10, 'Online class', 'Online classes');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

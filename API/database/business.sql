-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2023 at 08:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `business`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `uname` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `password`) VALUES
(1, 'Altaiyp', '2001');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `assignment_name` text NOT NULL,
  `assignment_price` double NOT NULL,
  `assignment_person` text NOT NULL,
  `assignment_date` text NOT NULL,
  `assignment_number` int(11) NOT NULL,
  `my_share` double NOT NULL,
  `person_phone` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `businees_work`
--

CREATE TABLE `businees_work` (
  `work_id` int(11) NOT NULL,
  `work_name` text NOT NULL,
  `price` double NOT NULL,
  `rdate` date NOT NULL,
  `customers_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `request` double NOT NULL,
  `ddate` date NOT NULL,
  `number` int(11) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `businees_work`
--

INSERT INTO `businees_work` (`work_id`, `work_name`, `price`, `rdate`, `customers_id`, `type`, `request`, `ddate`, `number`, `note`) VALUES
(15, '2 power point', 30, '2023-04-01', 3, 'assginmets', 0, '0000-00-00', 0, ''),
(55, 'e2eee', 30, '0000-00-00', 3, 'assginmets', 23, '0000-00-00', 2, 'fddf'),
(56, '1', 200, '2023-06-12', 4, 'assginmets', 1000, '2023-06-12', 3, '-'),
(57, 'dvdav', 0, '0000-00-00', 4, 'test', 0, '0000-00-00', 4, 'xdcsdv'),
(58, 'dsaf', 33, '0000-00-00', 4, 'test', 2, '0000-00-00', 1, 'vsdvdv'),
(59, 'lkjlkfbfd', 23, '2023-06-06', 3, 'test', 2, '2023-06-06', 3, 'fges'),
(60, 'hhhhhhhhhhhhhhhh', 120000, '2023-06-12', 4, 'exam', 120, '2023-06-13', 3, 'llknvdadf bfea'),
(61, 'كتكمثصب', 200, '2023-06-07', 5, 'exam', 100, '2023-06-19', 3, '1'),
(62, ',sjnmncsldnv', 300, '2023-06-22', 4, 'project', 200, '2023-06-12', 3, 'knlknv;kdsv'),
(63, 'lknknsv', 300, '2023-06-16', 5, 'quiz', 10, '2023-06-11', 3, 'ljlkn;dlbsd');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` varchar(12) NOT NULL,
  `image` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `phone`, `image`) VALUES
(3, 'صلاح محمد سعيد', '772017524', ''),
(4, 'اسامة محمد سعيد', '771612001', ''),
(5, 'عمر عبدالرحمن', '776194932', '');

-- --------------------------------------------------------

--
-- Table structure for table `total_request`
--

CREATE TABLE `total_request` (
  `id` int(11) NOT NULL,
  `to_total` double NOT NULL,
  `to_request` double NOT NULL,
  `residual` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `total_request`
--

INSERT INTO `total_request` (`id`, `to_total`, `to_request`, `residual`) VALUES
(1, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `businees_work`
--
ALTER TABLE `businees_work`
  ADD PRIMARY KEY (`work_id`),
  ADD KEY `customer_work` (`customers_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `total_request`
--
ALTER TABLE `total_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `businees_work`
--
ALTER TABLE `businees_work`
  MODIFY `work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `total_request`
--
ALTER TABLE `total_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `businees_work`
--
ALTER TABLE `businees_work`
  ADD CONSTRAINT `customer_work` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

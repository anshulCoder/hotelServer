-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2018 at 10:37 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `rid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `room_category_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`rid`, `user_id`, `checkin_date`, `checkout_date`, `room_category_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-08-24', '2018-08-28', 1, 'Booked', '2018-08-22 15:34:01', '2018-08-22 15:34:01'),
(2, 2, '2018-08-07', '2018-08-10', 2, 'Booked', '2018-08-22 15:34:01', '2018-08-22 15:34:01'),
(3, 3, '2018-08-06', '2018-08-09', 3, 'Booked', '2018-08-22 15:34:54', '2018-08-22 15:34:54'),
(4, 3, '2018-08-04', '2018-08-06', 11, 'Booked', '2018-08-22 15:34:54', '2018-08-22 15:34:54'),
(5, 1, '2018-08-23', '2018-08-25', 15, 'Booked', '2018-08-23 13:33:26', '2018-08-23 13:33:26'),
(6, 1, '2018-08-27', '2018-08-30', 18, 'Booked', '2018-08-23 13:36:17', '2018-08-23 13:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `roomcategories`
--

CREATE TABLE `roomcategories` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `isActive` int(1) NOT NULL COMMENT '0-no, 1-yes',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomcategories`
--

INSERT INTO `roomcategories` (`id`, `room_id`, `room_number`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 1, 'A01', 1, '2018-08-22 00:26:03', '2018-08-22 00:26:03'),
(2, 1, 'A02', 1, '2018-08-22 00:26:47', '2018-08-22 00:26:47'),
(3, 1, 'A03', 1, '2018-08-22 00:26:47', '2018-08-22 00:26:47'),
(4, 1, 'A04', 1, '2018-08-22 00:26:47', '2018-08-22 00:26:47'),
(5, 1, 'A05', 1, '2018-08-22 00:26:47', '2018-08-22 00:26:47'),
(6, 2, 'A06', 1, '2018-08-22 00:27:23', '2018-08-22 00:27:23'),
(7, 2, 'A07', 1, '2018-08-22 00:27:23', '2018-08-22 00:27:23'),
(8, 2, 'A08', 1, '2018-08-22 00:27:24', '2018-08-22 00:27:24'),
(9, 2, 'A09', 1, '2018-08-22 00:27:24', '2018-08-22 00:27:24'),
(10, 2, 'A10', 1, '2018-08-22 00:27:24', '2018-08-22 00:27:24'),
(11, 1, 'B01', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(12, 1, 'B02', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(13, 1, 'B03', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(14, 1, 'B04', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(15, 1, 'B05', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(16, 2, 'B06', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(17, 2, 'B07', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(18, 2, 'B08', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(19, 2, 'B09', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(20, 2, 'B10', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(21, 1, 'C01', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(22, 1, 'C02', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(23, 1, 'C03', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(24, 1, 'C04', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(25, 1, 'C05', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(26, 2, 'C06', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(27, 2, 'C07', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(28, 2, 'C08', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(29, 2, 'C09', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(30, 2, 'C10', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(31, 1, 'D01', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(32, 1, 'D02', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(33, 1, 'D03', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(34, 1, 'D04', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(35, 1, 'D05', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(36, 2, 'D06', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(37, 2, 'D07', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(38, 2, 'D08', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(39, 2, 'D09', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(40, 2, 'D10', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(41, 3, 'D11', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(42, 3, 'D12', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(43, 3, 'D13', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(44, 3, 'D14', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(45, 3, 'D15', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(46, 3, 'D16', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(47, 3, 'D17', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(48, 3, 'D18', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(49, 3, 'D19', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(50, 3, 'D20', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(52, 3, 'E01', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(53, 3, 'E02', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(54, 4, 'E03', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(55, 4, 'E04', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(56, 4, 'E05', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(57, 4, 'E06', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(58, 4, 'E07', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(59, 4, 'E08', 1, '2018-08-22 00:27:51', '2018-08-22 00:27:51'),
(60, 4, 'E09', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52'),
(61, 4, 'E10', 1, '2018-08-22 00:27:52', '2018-08-22 00:27:52');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `id` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL,
  `room_description` text NOT NULL,
  `room_price` double NOT NULL,
  `isActive` int(1) NOT NULL COMMENT '1-yes,0-no',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`id`, `room_name`, `room_description`, `room_price`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'Deluxe Room', 'Queen Size Bed', 7000, 1, '2018-08-22 00:23:37', '2018-08-22 00:23:37'),
(2, 'Luxury Room', 'Queen Size Bed and Pool Facing', 8500, 1, '2018-08-22 00:24:05', '2018-08-22 00:24:05'),
(3, 'Luxury Suite', 'King Size Bed and Pool Facing', 12000, 1, '2018-08-22 00:24:40', '2018-08-22 00:24:40'),
(4, 'Presidential Suite', 'King Size Bed, Pool Facing with a Gym', 20000, 1, '2018-08-22 00:25:15', '2018-08-22 00:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `isActive` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`id`, `email`, `password`, `isActive`, `created_at`, `updated_at`) VALUES
(1, 'anshulg4620@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '2018-08-23 13:33:26', '2018-08-23 13:33:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `roomcategories`
--
ALTER TABLE `roomcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roomcategories`
--
ALTER TABLE `roomcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

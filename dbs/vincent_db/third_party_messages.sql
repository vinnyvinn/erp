-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2017 at 07:23 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pro_kazi`
--

-- --------------------------------------------------------

--
-- Table structure for table `third_party_messages`
--

CREATE TABLE `third_party_messages` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `third_p_id` int(100) NOT NULL,
  `sender_id` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `third_party_messages`
--

INSERT INTO `third_party_messages` (`id`, `message`, `third_p_id`, `sender_id`, `created_at`, `updated_at`) VALUES
(1, 'efrr', 1, 5, '2017-12-14 14:19:44', NULL),
(2, 'dsdsff', 1, 5, '2017-12-15 05:47:59', NULL),
(3, 'fvf', 1, 5, '2017-12-15 06:00:09', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `third_party_messages`
--
ALTER TABLE `third_party_messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `third_party_messages`
--
ALTER TABLE `third_party_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2018 at 08:21 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 5.6.34-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prokazi`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(100) NOT NULL,
  `job_service_id` int(100) DEFAULT NULL,
  `job_type_id` int(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `vehicle_no` int(100) DEFAULT NULL,
  `completion_date` timestamp NULL DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `km_reading` double DEFAULT NULL,
  `fuel_balance` double DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `application_data` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `job_service_id`, `job_type_id`, `description`, `vehicle_no`, `completion_date`, `time_in`, `km_reading`, `fuel_balance`, `card_no`, `application_data`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 2, 2, 'desct', 37, '2018-03-20 21:00:00', '01:00:00', 7890, 700, 'ESL-1-KCA 001G', '[{"items":{"inspection_id":"2","user":"6","satus":"1"}},{"items":{"inspection_id":"4","user":"8","satus":"2"}},{"items":{"inspection_id":"3","user":"9","satus":"3"}},{"items":{"inspection_id":"6","user":"10","satus":"2"}},{"items":{"inspection_id":"2","user":"7","satus":"1"}}]', '2018-03-27 06:09:12', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

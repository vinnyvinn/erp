-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2017 at 10:59 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.23

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
-- Table structure for table `tbl_case_procedures`
--

CREATE TABLE `tbl_case_procedures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_case_procedures`
--

INSERT INTO `tbl_case_procedures` (`id`, `name`, `deleted`) VALUES
(1, 'First procedure', 0),
(2, 'Second Procedure', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_case_status`
--

CREATE TABLE `tbl_case_status` (
  `id` int(50) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_case_status`
--

INSERT INTO `tbl_case_status` (`id`, `status`) VALUES
(1, 'active/opened'),
(2, 'inactive/closed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_case_type`
--

CREATE TABLE `tbl_case_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_case_type`
--

INSERT INTO `tbl_case_type` (`id`, `name`, `deleted`) VALUES
(1, 'Incomming', 0),
(2, 'OutGoing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legal_documents`
--

CREATE TABLE `tbl_legal_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `document_type` int(10) UNSIGNED NOT NULL,
  `user_responsible` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `covered_from` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `covered_to` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_legal_documents`
--

INSERT INTO `tbl_legal_documents` (`id`, `name`, `document_type`, `user_responsible`, `status`, `covered_from`, `covered_to`, `deleted`, `created_at`, `updated_at`) VALUES
(5, 'ewwewe', 2, 90, 1, '2017-12-05 21:00:00', '2017-12-04 21:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legal_document_types`
--

CREATE TABLE `tbl_legal_document_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_legal_document_types`
--

INSERT INTO `tbl_legal_document_types` (`id`, `name`, `deleted`) VALUES
(1, 'Policy', 0),
(2, 'Insuarance', 0),
(3, 'Permits', 0),
(4, 'test1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_case_procedures`
--
ALTER TABLE `tbl_case_procedures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_case_status`
--
ALTER TABLE `tbl_case_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_case_type`
--
ALTER TABLE `tbl_case_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_legal_documents`
--
ALTER TABLE `tbl_legal_documents`
  ADD PRIMARY KEY (`id`,`document_type`),
  ADD KEY `fk_doc_type` (`document_type`),
  ADD KEY `fk_status` (`status`);

--
-- Indexes for table `tbl_legal_document_types`
--
ALTER TABLE `tbl_legal_document_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_case_procedures`
--
ALTER TABLE `tbl_case_procedures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_case_status`
--
ALTER TABLE `tbl_case_status`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_case_type`
--
ALTER TABLE `tbl_case_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_legal_documents`
--
ALTER TABLE `tbl_legal_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_legal_document_types`
--
ALTER TABLE `tbl_legal_document_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_legal_documents`
--
ALTER TABLE `tbl_legal_documents`
  ADD CONSTRAINT `fk_doc_type` FOREIGN KEY (`document_type`) REFERENCES `tbl_legal_document_types` (`id`),
  ADD CONSTRAINT `fk_status` FOREIGN KEY (`status`) REFERENCES `tbl_case_status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

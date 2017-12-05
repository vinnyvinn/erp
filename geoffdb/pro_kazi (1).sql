-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2017 at 06:42 PM
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
-- Table structure for table `tbl_cases`
--

CREATE TABLE `tbl_cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `procedure` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_case_procedures`
--

CREATE TABLE `tbl_case_procedures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'Active'),
(2, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_case_type`
--

CREATE TABLE `tbl_case_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doc_escalation_n_reminders`
--

CREATE TABLE `tbl_doc_escalation_n_reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `doc_type` int(10) UNSIGNED NOT NULL,
  `reminder_to` int(11) NOT NULL,
  `duration_before` int(10) UNSIGNED NOT NULL,
  `reminder_every` int(10) UNSIGNED NOT NULL,
  `reminder_for` int(10) UNSIGNED NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_doc_escalation_n_reminders`
--

INSERT INTO `tbl_doc_escalation_n_reminders` (`id`, `name`, `doc_type`, `reminder_to`, `duration_before`, `reminder_every`, `reminder_for`, `deleted`) VALUES
(1, 'test reminder', 1, 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_escalation_matrix`
--

CREATE TABLE `tbl_escalation_matrix` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `users` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legal_documents`
--

CREATE TABLE `tbl_legal_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `document_type` int(10) UNSIGNED NOT NULL,
  `file_document` text NOT NULL,
  `user_responsible` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `covered_from` text NOT NULL,
  `covered_to` text NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `reminder` int(11) NOT NULL DEFAULT '0',
  `reminder_sent` int(11) NOT NULL DEFAULT '0',
  `completed_escalations` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_legal_documents`
--

INSERT INTO `tbl_legal_documents` (`id`, `name`, `document_type`, `file_document`, `user_responsible`, `status`, `covered_from`, `covered_to`, `deleted`, `reminder`, `reminder_sent`, `completed_escalations`, `created_at`, `updated_at`) VALUES
(2, 'New s', 2, 'a:0:{}', 90, 1, '2017-12-05', '2017-12-13', 0, 0, 0, 0, '2017-12-04 16:46:53', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legal_document_types`
--

CREATE TABLE `tbl_legal_document_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `has_expiry` int(11) NOT NULL DEFAULT '0',
  `can_upload` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_legal_document_types`
--

INSERT INTO `tbl_legal_document_types` (`id`, `name`, `has_expiry`, `can_upload`, `deleted`) VALUES
(1, 'Legal', 1, 0, 0),
(2, 'Gazzete Notices', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migartions`
--

CREATE TABLE `tbl_migartions` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_migartions`
--

INSERT INTO `tbl_migartions` (`version`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_time_durations`
--

CREATE TABLE `tbl_time_durations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `seconds` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_time_durations`
--

INSERT INTO `tbl_time_durations` (`id`, `name`, `seconds`, `deleted`) VALUES
(1, '1 day', 2723623, 0),
(2, '2 days', 487348, 0),
(3, '1 Week', 120000, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cases`
--
ALTER TABLE `tbl_cases`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tbl_doc_escalation_n_reminders`
--
ALTER TABLE `tbl_doc_escalation_n_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doc_esc_rem_type` (`doc_type`),
  ADD KEY `fk_esc_rem_esc_to` (`reminder_to`),
  ADD KEY `fk_esc_rem_rem_every` (`reminder_every`),
  ADD KEY `fk_esc_rem_reminder_for` (`reminder_for`),
  ADD KEY `fk_esc_rem_duration_before` (`duration_before`);

--
-- Indexes for table `tbl_escalation_matrix`
--
ALTER TABLE `tbl_escalation_matrix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_legal_documents`
--
ALTER TABLE `tbl_legal_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doc_type` (`document_type`),
  ADD KEY `fk_status` (`status`);

--
-- Indexes for table `tbl_legal_document_types`
--
ALTER TABLE `tbl_legal_document_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_time_durations`
--
ALTER TABLE `tbl_time_durations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cases`
--
ALTER TABLE `tbl_cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_case_procedures`
--
ALTER TABLE `tbl_case_procedures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_case_status`
--
ALTER TABLE `tbl_case_status`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_case_type`
--
ALTER TABLE `tbl_case_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_doc_escalation_n_reminders`
--
ALTER TABLE `tbl_doc_escalation_n_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_escalation_matrix`
--
ALTER TABLE `tbl_escalation_matrix`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_legal_documents`
--
ALTER TABLE `tbl_legal_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_legal_document_types`
--
ALTER TABLE `tbl_legal_document_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_time_durations`
--
ALTER TABLE `tbl_time_durations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_doc_escalation_n_reminders`
--
ALTER TABLE `tbl_doc_escalation_n_reminders`
  ADD CONSTRAINT `fk_doc_esc_rem_type` FOREIGN KEY (`doc_type`) REFERENCES `tbl_legal_document_types` (`id`),
  ADD CONSTRAINT `fk_esc_rem_duration_before` FOREIGN KEY (`duration_before`) REFERENCES `tbl_time_durations` (`id`),
  ADD CONSTRAINT `fk_esc_rem_esc_to` FOREIGN KEY (`reminder_to`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `fk_esc_rem_rem_every` FOREIGN KEY (`reminder_every`) REFERENCES `tbl_time_durations` (`id`),
  ADD CONSTRAINT `fk_esc_rem_reminder_for` FOREIGN KEY (`reminder_for`) REFERENCES `tbl_time_durations` (`id`);

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

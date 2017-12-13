-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2017 at 02:24 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

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
  `status` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `case_procedure` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `case_type` int(11) NOT NULL DEFAULT '0',
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_cases`
--

INSERT INTO `tbl_cases` (`id`, `name`, `status`, `deleted`, `case_procedure`, `description`, `case_type`, `comment`) VALUES
(5, 'new case', 1, 0, 0, 'new case here', 1, 'bdyrfcuybtfytug'),
(6, 'demo case', 0, 0, 23, 'demo case', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_case_procedures`
--

CREATE TABLE `tbl_case_procedures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_case_procedures`
--

INSERT INTO `tbl_case_procedures` (`id`, `name`, `deleted`) VALUES
(1, 'Hearing', 0),
(2, 'mentioning', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_case_status`
--

CREATE TABLE `tbl_case_status` (
  `id` int(50) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_case_type`
--

INSERT INTO `tbl_case_type` (`id`, `name`, `deleted`) VALUES
(1, 'InWards', 0),
(2, 'Out Wards', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_supplier_checks`
--

CREATE TABLE `tbl_cust_supplier_checks` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 customer, 2 supplier',
  `cust_supp_id` int(11) NOT NULL,
  `checked_on` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 for subitted 1 for partially',
  `checked_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cust_supplier_checks`
--

INSERT INTO `tbl_cust_supplier_checks` (`id`, `type`, `cust_supp_id`, `checked_on`, `status`, `checked_by`, `deleted`) VALUES
(4, 1, 1, 2017, 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_supplier_specific_checks`
--

CREATE TABLE `tbl_cust_supplier_specific_checks` (
  `id` int(11) NOT NULL,
  `check_item` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 for subitted 1 for partially',
  `comment` text,
  `expiry_date` text,
  `customer_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cust_supplier_specific_checks`
--

INSERT INTO `tbl_cust_supplier_specific_checks` (`id`, `check_item`, `status`, `comment`, `expiry_date`, `customer_id`, `deleted`) VALUES
(23, 12, 0, NULL, NULL, 4, 0),
(24, 13, 0, 'test comment new', '2017-12-12T13:18:00.000Z', 4, 0),
(25, 15, 0, NULL, NULL, 4, 0),
(26, 17, 0, NULL, NULL, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_supp_checkitems`
--

CREATE TABLE `tbl_cust_supp_checkitems` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `performed_on` text NOT NULL COMMENT '1 customer and 2 suppliers'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cust_supp_checkitems`
--

INSERT INTO `tbl_cust_supp_checkitems` (`id`, `name`, `deleted`, `performed_on`) VALUES
(12, 'DSKSDM', 1, '1,2'),
(13, 'Neema Licence', 1, '1,2'),
(14, 'kmsdksd', 1, ''),
(15, 'Government certificates', 1, '1,2'),
(16, 'test first certificate', 1, '2'),
(17, 'Legal laws', 0, '1,2'),
(18, 'Kra pin', 0, '2');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_supp_status`
--

CREATE TABLE `tbl_cust_supp_status` (
  `id` int(11) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cust_supp_status`
--

INSERT INTO `tbl_cust_supp_status` (`id`, `status`) VALUES
(1, 'Submitted'),
(2, 'Partially Submitted');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_doc_escalation_n_reminders`
--

INSERT INTO `tbl_doc_escalation_n_reminders` (`id`, `name`, `doc_type`, `reminder_to`, `duration_before`, `reminder_every`, `reminder_for`, `deleted`) VALUES
(1, 'test reminder', 3, 1, 3, 2, 3, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_knowledge_base`
--

CREATE TABLE `tbl_knowledge_base` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `solution` longtext,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_knowledge_base`
--

INSERT INTO `tbl_knowledge_base` (`id`, `type_id`, `title`, `solution`, `created_by`, `created_at`, `updated_at`, `deleted`) VALUES
(10, 1, 'demo ticket 1', 'trojan', 113, '2017-12-07 12:54:18', NULL, 0),
(11, 2, 'dgfdgd', 'cxvcxvcxv', 5, '2017-12-07 13:21:33', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_knowledge_base_ticket`
--

CREATE TABLE `tbl_knowledge_base_ticket` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `solution_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_knowledge_base_ticket`
--

INSERT INTO `tbl_knowledge_base_ticket` (`id`, `ticket_id`, `solution_id`, `created_by`, `created_at`, `updated_at`, `deleted`) VALUES
(9, 4, 10, 113, '2017-12-07 12:54:18', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_knowledge_base_types`
--

CREATE TABLE `tbl_knowledge_base_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_knowledge_base_types`
--

INSERT INTO `tbl_knowledge_base_types` (`id`, `name`, `deleted`) VALUES
(1, 'bug', 0),
(2, 'improvement', 0),
(3, 'recomendation', 0),
(4, 'development', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legal_case_procedures`
--

CREATE TABLE `tbl_legal_case_procedures` (
  `id` int(11) NOT NULL,
  `legal_case` int(11) NOT NULL,
  `date` text NOT NULL,
  `assigned` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `procedure_val` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_legal_case_procedures`
--

INSERT INTO `tbl_legal_case_procedures` (`id`, `legal_case`, `date`, `assigned`, `deleted`, `procedure_val`) VALUES
(1, 5, '2017-12-07', 5, 0, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_legal_documents`
--

INSERT INTO `tbl_legal_documents` (`id`, `name`, `document_type`, `file_document`, `user_responsible`, `status`, `covered_from`, `covered_to`, `deleted`, `reminder`, `reminder_sent`, `completed_escalations`, `created_at`, `updated_at`) VALUES
(2, 'New s', 2, 'a:0:{}', 89, 1, '2017-12-05', '2017-12-13', 0, 0, 0, 0, '2017-12-05 07:09:31', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_legal_document_types`
--

INSERT INTO `tbl_legal_document_types` (`id`, `name`, `has_expiry`, `can_upload`, `deleted`) VALUES
(1, 'Legal', 1, 0, 0),
(2, 'Gazzete Notices', 1, 0, 0),
(3, 'Insuarance', 1, 1, 0),
(4, 'Policy', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migartions`
--

CREATE TABLE `tbl_migartions` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_time_durations`
--

INSERT INTO `tbl_time_durations` (`id`, `name`, `seconds`, `deleted`) VALUES
(1, '1 day', 2723623, 0),
(2, '3 days', 487348, 0),
(3, '1 Week', 120000, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cases`
--
ALTER TABLE `tbl_cases`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_case_procedures`
--
ALTER TABLE `tbl_case_procedures`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_case_status`
--
ALTER TABLE `tbl_case_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_case_type`
--
ALTER TABLE `tbl_case_type`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_cust_supplier_checks`
--
ALTER TABLE `tbl_cust_supplier_checks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `cust_supp_id` (`cust_supp_id`);

--
-- Indexes for table `tbl_cust_supplier_specific_checks`
--
ALTER TABLE `tbl_cust_supplier_specific_checks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cust_supp_checkitems`
--
ALTER TABLE `tbl_cust_supp_checkitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cust_supp_status`
--
ALTER TABLE `tbl_cust_supp_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_doc_escalation_n_reminders`
--
ALTER TABLE `tbl_doc_escalation_n_reminders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_doc_esc_rem_type` (`doc_type`) USING BTREE,
  ADD KEY `fk_esc_rem_esc_to` (`reminder_to`) USING BTREE,
  ADD KEY `fk_esc_rem_rem_every` (`reminder_every`) USING BTREE,
  ADD KEY `fk_esc_rem_reminder_for` (`reminder_for`) USING BTREE,
  ADD KEY `fk_esc_rem_duration_before` (`duration_before`) USING BTREE;

--
-- Indexes for table `tbl_escalation_matrix`
--
ALTER TABLE `tbl_escalation_matrix`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_knowledge_base`
--
ALTER TABLE `tbl_knowledge_base`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `type_id` (`type_id`) USING BTREE,
  ADD KEY `created_by` (`created_by`) USING BTREE;

--
-- Indexes for table `tbl_knowledge_base_ticket`
--
ALTER TABLE `tbl_knowledge_base_ticket`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ticket_id` (`ticket_id`) USING BTREE,
  ADD KEY `created_by` (`created_by`) USING BTREE,
  ADD KEY `solution_id` (`solution_id`) USING BTREE;

--
-- Indexes for table `tbl_knowledge_base_types`
--
ALTER TABLE `tbl_knowledge_base_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_legal_case_procedures`
--
ALTER TABLE `tbl_legal_case_procedures`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_legal_documents`
--
ALTER TABLE `tbl_legal_documents`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_doc_type` (`document_type`) USING BTREE,
  ADD KEY `fk_status` (`status`) USING BTREE;

--
-- Indexes for table `tbl_legal_document_types`
--
ALTER TABLE `tbl_legal_document_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_time_durations`
--
ALTER TABLE `tbl_time_durations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cases`
--
ALTER TABLE `tbl_cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
-- AUTO_INCREMENT for table `tbl_cust_supplier_checks`
--
ALTER TABLE `tbl_cust_supplier_checks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_cust_supplier_specific_checks`
--
ALTER TABLE `tbl_cust_supplier_specific_checks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tbl_cust_supp_checkitems`
--
ALTER TABLE `tbl_cust_supp_checkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tbl_cust_supp_status`
--
ALTER TABLE `tbl_cust_supp_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
-- AUTO_INCREMENT for table `tbl_knowledge_base`
--
ALTER TABLE `tbl_knowledge_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_knowledge_base_ticket`
--
ALTER TABLE `tbl_knowledge_base_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_knowledge_base_types`
--
ALTER TABLE `tbl_knowledge_base_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_legal_case_procedures`
--
ALTER TABLE `tbl_legal_case_procedures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_legal_documents`
--
ALTER TABLE `tbl_legal_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_legal_document_types`
--
ALTER TABLE `tbl_legal_document_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
-- Constraints for table `tbl_knowledge_base`
--
ALTER TABLE `tbl_knowledge_base`
  ADD CONSTRAINT `tbl_knowledge_base_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tbl_knowledge_base_types` (`id`),
  ADD CONSTRAINT `tbl_knowledge_base_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `tbl_knowledge_base_ticket`
--
ALTER TABLE `tbl_knowledge_base_ticket`
  ADD CONSTRAINT `tbl_knowledge_base_ticket_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `tbl_knowledge_base_ticket_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tbl_knowledge_base_ticket_ibfk_4` FOREIGN KEY (`solution_id`) REFERENCES `tbl_knowledge_base` (`id`);

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

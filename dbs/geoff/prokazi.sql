-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 31, 2018 at 09:02 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

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
-- Table structure for table `tbl_cases`
--

DROP TABLE IF EXISTS `tbl_cases`;
CREATE TABLE IF NOT EXISTS `tbl_cases` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `case_procedure` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `case_type` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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

DROP TABLE IF EXISTS `tbl_case_procedures`;
CREATE TABLE IF NOT EXISTS `tbl_case_procedures` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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

DROP TABLE IF EXISTS `tbl_case_status`;
CREATE TABLE IF NOT EXISTS `tbl_case_status` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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

DROP TABLE IF EXISTS `tbl_case_type`;
CREATE TABLE IF NOT EXISTS `tbl_case_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_case_type`
--

INSERT INTO `tbl_case_type` (`id`, `name`, `deleted`) VALUES
(1, 'InWards', 0),
(2, 'Out Wards', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checklists`
--

DROP TABLE IF EXISTS `tbl_checklists`;
CREATE TABLE IF NOT EXISTS `tbl_checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL,
  `performed_on` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_checklists`
--

INSERT INTO `tbl_checklists` (`id`, `name`, `deleted`, `performed_on`, `comment`) VALUES
(7, 'sddssd', 1, 1, 'sddssd'),
(8, 'Check ICT router', 0, 1, 'The router should be good'),
(9, 'new order here', 0, 2, 'ddfdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checklist_performed_on`
--

DROP TABLE IF EXISTS `tbl_checklist_performed_on`;
CREATE TABLE IF NOT EXISTS `tbl_checklist_performed_on` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_checklist_performed_on`
--

INSERT INTO `tbl_checklist_performed_on` (`id`, `name`, `deleted`) VALUES
(1, 'ICT', 0),
(2, 'Maintenance', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checklist_status`
--

DROP TABLE IF EXISTS `tbl_checklist_status`;
CREATE TABLE IF NOT EXISTS `tbl_checklist_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_checklist_status`
--

INSERT INTO `tbl_checklist_status` (`id`, `name`, `deleted`) VALUES
(1, 'Submitted', 0),
(2, 'Escalated', 0),
(3, 'Closed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checklist_tasks`
--

DROP TABLE IF EXISTS `tbl_checklist_tasks`;
CREATE TABLE IF NOT EXISTS `tbl_checklist_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` text NOT NULL,
  `status` int(11) NOT NULL,
  `performed_by` int(11) NOT NULL,
  `performed_on` date NOT NULL,
  `escalate_to` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_checklist_tasks`
--

INSERT INTO `tbl_checklist_tasks` (`id`, `ref_no`, `status`, `performed_by`, `performed_on`, `escalate_to`, `deleted`) VALUES
(7, '1513304821', 2, 5, '2017-12-15', 114, 0),
(8, '1513316522', 2, 5, '2017-12-15', 113, 0),
(9, '1513318031', 1, 5, '2017-12-15', 0, 0),
(10, '1513318081', 2, 5, '2017-12-15', 114, 0),
(11, '1513318093', 1, 5, '2017-12-15', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checklist_task_checks`
--

DROP TABLE IF EXISTS `tbl_checklist_task_checks`;
CREATE TABLE IF NOT EXISTS `tbl_checklist_task_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_item` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 passed 0 failed',
  `comment` text,
  `checklist_task` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_checklist_task_checks`
--

INSERT INTO `tbl_checklist_task_checks` (`id`, `check_item`, `status`, `comment`, `checklist_task`) VALUES
(7, 8, 1, NULL, 7),
(8, 9, 0, 'ksdkmsdk', 7),
(9, 8, 1, '', 8),
(10, 9, 0, '', 8),
(11, 8, 1, '', 9),
(12, 9, 1, '', 9),
(13, 8, 1, '', 10),
(14, 9, 0, '', 10),
(15, 8, 1, '', 11),
(16, 9, 1, '', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_checklist_types`
--

DROP TABLE IF EXISTS `tbl_checklist_types`;
CREATE TABLE IF NOT EXISTS `tbl_checklist_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_checklist_types`
--

INSERT INTO `tbl_checklist_types` (`id`, `type`, `deleted`) VALUES
(1, 'Daily', 0),
(2, 'Weekly', 1),
(3, 'Monthly', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_supplier_checks`
--

DROP TABLE IF EXISTS `tbl_cust_supplier_checks`;
CREATE TABLE IF NOT EXISTS `tbl_cust_supplier_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '1 customer, 2 supplier',
  `cust_supp_id` int(11) NOT NULL,
  `checked_on` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 for subitted 1 for partially',
  `checked_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `cust_supp_id` (`cust_supp_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_cust_supplier_checks`
--

INSERT INTO `tbl_cust_supplier_checks` (`id`, `type`, `cust_supp_id`, `checked_on`, `status`, `checked_by`, `deleted`) VALUES
(33, 2, 1, 2017, 0, 5, 0),
(34, 1, 16, 2017, 0, 5, 0),
(35, 1, 17, 2017, 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_supplier_specific_checks`
--

DROP TABLE IF EXISTS `tbl_cust_supplier_specific_checks`;
CREATE TABLE IF NOT EXISTS `tbl_cust_supplier_specific_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_item` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 for subitted 1 for partially',
  `comment` text,
  `expiry_date` text,
  `customer_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_cust_supplier_specific_checks`
--

INSERT INTO `tbl_cust_supplier_specific_checks` (`id`, `check_item`, `status`, `comment`, `expiry_date`, `customer_id`, `deleted`) VALUES
(382, 24, 0, '', '', 32, 0),
(404, 21, 1, '', '', 35, 0),
(405, 22, 1, '', '', 35, 0),
(407, 21, 0, '', '', 33, 0),
(408, 22, 0, NULL, '', 33, 0),
(409, 21, 0, 'New comment here', '2017-12-04', 34, 0),
(410, 22, 0, '', '2017-12-11', 34, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_supp_checkitems`
--

DROP TABLE IF EXISTS `tbl_cust_supp_checkitems`;
CREATE TABLE IF NOT EXISTS `tbl_cust_supp_checkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `performed_on` text NOT NULL COMMENT '1 customer and 2 suppliers',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_cust_supp_checkitems`
--

INSERT INTO `tbl_cust_supp_checkitems` (`id`, `name`, `deleted`, `performed_on`) VALUES
(21, 'Kra Pin', 0, '1,2'),
(22, 'Account opening form', 0, '1,2'),
(23, 'New item', 1, '1,'),
(24, 'National Identity', 1, '1,2'),
(25, 'First item', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cust_supp_status`
--

DROP TABLE IF EXISTS `tbl_cust_supp_status`;
CREATE TABLE IF NOT EXISTS `tbl_cust_supp_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

DROP TABLE IF EXISTS `tbl_doc_escalation_n_reminders`;
CREATE TABLE IF NOT EXISTS `tbl_doc_escalation_n_reminders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `doc_type` int(10) UNSIGNED NOT NULL,
  `reminder_to` int(11) NOT NULL,
  `duration_before` int(10) UNSIGNED NOT NULL,
  `reminder_every` int(10) UNSIGNED NOT NULL,
  `reminder_for` int(10) UNSIGNED NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_doc_esc_rem_type` (`doc_type`) USING BTREE,
  KEY `fk_esc_rem_esc_to` (`reminder_to`) USING BTREE,
  KEY `fk_esc_rem_rem_every` (`reminder_every`) USING BTREE,
  KEY `fk_esc_rem_reminder_for` (`reminder_for`) USING BTREE,
  KEY `fk_esc_rem_duration_before` (`duration_before`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_doc_escalation_n_reminders`
--

INSERT INTO `tbl_doc_escalation_n_reminders` (`id`, `name`, `doc_type`, `reminder_to`, `duration_before`, `reminder_every`, `reminder_for`, `deleted`) VALUES
(1, 'test reminder', 3, 1, 3, 2, 3, 0),
(2, 'Weekly reminder', 3, 2, 2, 2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_escalation_matrix`
--

DROP TABLE IF EXISTS `tbl_escalation_matrix`;
CREATE TABLE IF NOT EXISTS `tbl_escalation_matrix` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_knowledge_base`
--

DROP TABLE IF EXISTS `tbl_knowledge_base`;
CREATE TABLE IF NOT EXISTS `tbl_knowledge_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `solution` longtext,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `created_by` (`created_by`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

DROP TABLE IF EXISTS `tbl_knowledge_base_ticket`;
CREATE TABLE IF NOT EXISTS `tbl_knowledge_base_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `solution_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ticket_id` (`ticket_id`) USING BTREE,
  KEY `created_by` (`created_by`) USING BTREE,
  KEY `solution_id` (`solution_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_knowledge_base_ticket`
--

INSERT INTO `tbl_knowledge_base_ticket` (`id`, `ticket_id`, `solution_id`, `created_by`, `created_at`, `updated_at`, `deleted`) VALUES
(9, 4, 10, 113, '2017-12-07 12:54:18', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_knowledge_base_types`
--

DROP TABLE IF EXISTS `tbl_knowledge_base_types`;
CREATE TABLE IF NOT EXISTS `tbl_knowledge_base_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

DROP TABLE IF EXISTS `tbl_legal_case_procedures`;
CREATE TABLE IF NOT EXISTS `tbl_legal_case_procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legal_case` int(11) NOT NULL,
  `date` text NOT NULL,
  `assigned` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `procedure_val` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_legal_case_procedures`
--

INSERT INTO `tbl_legal_case_procedures` (`id`, `legal_case`, `date`, `assigned`, `deleted`, `procedure_val`) VALUES
(1, 5, '2017-12-07', 5, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legal_docs_items`
--

DROP TABLE IF EXISTS `tbl_legal_docs_items`;
CREATE TABLE IF NOT EXISTS `tbl_legal_docs_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sage_item_id` int(11) NOT NULL,
  `legal_doc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_legal_docs_items`
--

INSERT INTO `tbl_legal_docs_items` (`id`, `sage_item_id`, `legal_doc_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legal_documents`
--

DROP TABLE IF EXISTS `tbl_legal_documents`;
CREATE TABLE IF NOT EXISTS `tbl_legal_documents` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_doc_type` (`document_type`) USING BTREE,
  KEY `fk_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_legal_documents`
--

INSERT INTO `tbl_legal_documents` (`id`, `name`, `document_type`, `file_document`, `user_responsible`, `status`, `covered_from`, `covered_to`, `deleted`, `reminder`, `reminder_sent`, `completed_escalations`, `created_at`, `updated_at`) VALUES
(2, 'New s', 2, 'a:0:{}', 89, 1, '2017-12-05', '2017-12-13', 0, 0, 0, 0, '2017-12-05 07:09:31', '0000-00-00 00:00:00'),
(3, 'terest', 2, 'a:0:{}', 115, 1, '2017-12-15', '2017-12-22', 0, 0, 0, 0, '2017-12-14 12:28:42', '0000-00-00 00:00:00'),
(4, 'sasas', 3, 'a:0:{}', 5, 1, '2018-01-31', '2018-01-31', 0, 0, 0, 0, '2018-01-30 04:36:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legal_document_types`
--

DROP TABLE IF EXISTS `tbl_legal_document_types`;
CREATE TABLE IF NOT EXISTS `tbl_legal_document_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `has_expiry` int(11) NOT NULL DEFAULT '0',
  `can_upload` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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

DROP TABLE IF EXISTS `tbl_migartions`;
CREATE TABLE IF NOT EXISTS `tbl_migartions` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_migartions`
--

INSERT INTO `tbl_migartions` (`version`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_third_party`
--

DROP TABLE IF EXISTS `tbl_third_party`;
CREATE TABLE IF NOT EXISTS `tbl_third_party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_third_party`
--

INSERT INTO `tbl_third_party` (`id`, `username`, `phone`, `email`, `created_at`, `updated_at`, `deleted`) VALUES
(4, 'demo', '0700000000', 'admin@teamkazi.com', '2017-12-15 07:12:46', NULL, 0),
(5, 'montanabay39', '4131523', 'gfdgfd@gf.com', '2017-12-15 07:19:30', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_time_durations`
--

DROP TABLE IF EXISTS `tbl_time_durations`;
CREATE TABLE IF NOT EXISTS `tbl_time_durations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `seconds` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_time_durations`
--

INSERT INTO `tbl_time_durations` (`id`, `name`, `seconds`, `deleted`) VALUES
(1, '1 day', 2723623, 0),
(2, '3 days', 487348, 0),
(3, '1 Week', 120000, 0);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

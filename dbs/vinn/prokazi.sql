-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2018 at 09:14 AM
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
-- Database: `prokazi`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `action` enum('created','updated','deleted') COLLATE utf8_unicode_ci NOT NULL,
  `log_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `log_type_title` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `log_type_id` int(11) NOT NULL DEFAULT '0',
  `changes` mediumtext COLLATE utf8_unicode_ci,
  `log_for` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int(11) NOT NULL DEFAULT '0',
  `log_for2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_for_id2` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `created_at`, `created_by`, `action`, `log_type`, `log_type_title`, `log_type_id`, `changes`, `log_for`, `log_for_id`, `log_for2`, `log_for_id2`, `deleted`) VALUES
(1, '2018-03-23 12:03:03', 5, 'created', 'task', 'Other', 1, NULL, 'project', 1, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `share_with` mediumtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `read_by` mediumtext COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(100) NOT NULL,
  `asset_no` varchar(255) DEFAULT NULL,
  `code` mediumtext,
  `description` mediumtext,
  `track_by` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `warranty` varchar(255) DEFAULT NULL,
  `next_time` timestamp NULL DEFAULT NULL,
  `km_reading` float NOT NULL,
  `machine_hours` int(100) DEFAULT '0',
  `driver_id` int(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `year_of_make` varchar(255) DEFAULT NULL,
  `engine_no` varchar(255) DEFAULT NULL,
  `year_of_reg` varchar(255) DEFAULT NULL,
  `chasis_no` varchar(255) DEFAULT NULL,
  `code_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `asset_no`, `code`, `description`, `track_by`, `make`, `deleted`, `created`, `warranty`, `next_time`, `km_reading`, `machine_hours`, `driver_id`, `updated_at`, `year_of_make`, `engine_no`, `year_of_reg`, `chasis_no`, `code_type`) VALUES
(1, '189', 'AGY/015/ESL', 'HOPPER SPREADER', 'HRS', 'new', 0, '2018-04-19 13:32:04', '2020-06-25', '0000-00-00 00:00:00', 0, 4567, 9, '2018-04-19 13:26:40', '2017-07-18', 'E10', '2018-02-14', 'C10', 'MC'),
(2, '425', 'ESL/MSA//MV/2712', 'CARTRACK GARGETS - GALOOLI', 'KMS', 'new', 0, '2018-04-19 13:32:04', '2019-08-28', '2019-09-25 21:00:00', 0, 200, 8, '2018-04-19 13:30:41', '2017-05-17', 'E11', '2017-09-12', 'C11', 'MC'),
(3, '426', 'KHMA 276C', 'CAT 938G WHEEL LOADER I', 'KMS', 'range', 0, '2018-04-19 13:32:04', '2019-06-20', '2019-06-20 21:00:00', 0, 444, 9, '2018-04-19 13:32:01', '2020-01-24', 'E12', '2017-07-11', 'C12', 'MC'),
(4, '427', 'KCA 001G', 'LAND ROVER VOGUE 3.6TDV 8', 'KMS', 'modern', 0, '2018-04-19 13:32:04', '2019-02-21', '2018-12-26 21:00:00', 1000, 213, 6, '2018-04-19 13:41:06', '2016-10-18', 'W13', '2017-06-20', 'C13', 'MC'),
(5, '428', 'KCB 363Y', 'TOYOTA HILUX DOUBLE CAB', 'KMS', 'new', 0, '2018-04-19 13:32:04', '2018-06-15', '0000-00-00 00:00:00', 22223, 4567, 7, '2018-04-19 14:01:03', '2017-07-26', 'E14', '2016-11-22', 'C14', 'MC'),
(6, '429', 'KCC 694T', 'TOYOTA SUCCEED', 'KMS', 'new', 0, '2018-04-19 13:32:04', '2019-05-24', '0000-00-00 00:00:00', 2400, 2000, 8, '2018-04-19 14:00:15', '2017-08-16', 'E15', '2017-07-11', 'C15', 'MC'),
(7, '430', 'KCC 168Z', 'TOYOTA FIELDER', 'KMS', 'new', 0, '2018-04-19 13:32:04', '2019-11-20', '0000-00-00 00:00:00', 60000, 3342, 6, '2018-04-19 13:41:24', '2017-07-05', 'C18', '2017-07-18', 'C18', 'MC'),
(8, '431', 'KCC 169Z', 'TOYOTA VOXY', 'KMS', 'old', 0, '2018-04-19 13:32:04', '2019-01-23', '2019-05-29 21:00:00', 7650, 232334, 8, '2018-04-19 13:37:01', '2017-05-24', 'E19', '2018-04-19', 'C19', 'MC'),
(9, '432', 'KHMA 812G', 'CAT 938G WHEELLOADER II', 'KMS', 'old', 0, '2018-04-19 13:32:04', '2019-01-24', '2019-02-20 21:00:00', 333, 222, 8, '2018-04-19 13:35:46', '2017-06-20', 'E20', '2017-06-20', 'C20', 'MC');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `status` enum('incomplete','pending','approved','rejected','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `in_time` datetime NOT NULL,
  `out_time` datetime DEFAULT NULL,
  `difference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `checked_by` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `checked_at` datetime DEFAULT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `business_types`
--

CREATE TABLE `business_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `business_types`
--

INSERT INTO `business_types` (`id`, `title`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'New', '2018-01-22 21:05:34', '2018-02-13 03:55:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `call_types`
--

CREATE TABLE `call_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `call_types`
--

INSERT INTO `call_types` (`id`, `title`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Visit', '2018-01-22 18:38:42', NULL, 0),
(2, 'Phone Call', '2018-01-22 18:38:56', NULL, 0),
(3, 'Email', '2018-01-22 18:39:02', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `company_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date NOT NULL,
  `website` text COLLATE utf8_unicode_ci,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `vat_number` text COLLATE utf8_unicode_ci,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable_online_payment` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `attend_1st_meeting` int(11) NOT NULL DEFAULT '0',
  `status` enum('Pending','Approved','Disapproved','') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `cOurRef` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` text COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `title`, `placeholder`, `options`, `field_type`, `related_to`, `sort`, `required`, `deleted`) VALUES
(1, 'Service', 'Service', 'Consulting,New Business,Recruitment', 'multi_select', 'estimate_form-1', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL,
  `related_to_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` text COLLATE utf8_unicode_ci NOT NULL,
  `default_message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_message` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `deleted`) VALUES
(1, 'login_info', 'Login details', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\">\n  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"PRO-KAZI\">\n  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', 0),
(2, 'reset_password', 'Reset password', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"PRO-KAZI\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', 0),
(3, 'team_member_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', 0),
(4, 'send_invoice', 'New invoice', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', 0),
(5, 'signature', 'Signature', '<p>Â© Pro-Kazi. Powered By: <a href=\"https://wizag.biz/\" target=\"_blank\">Wise &amp; Agile Solutions Limited. </a></p>', '<p>Â© Pro-Kazi. Powered By: <a href=\"https://wizag.biz/\" target=\"_blank\">Wise &amp; Agile Solutions Limited. </a></p>', 0),
(6, 'client_contact_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', 0),
(7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>', 0),
(8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>', 0),
(9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>', 0),
(10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>', 1),
(11, 'general_notification', '{EVENT_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>', 1),
(12, 'petty_cash', 'Petty Cash', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>PETTY CASH #{PETTY_CASH_ID}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Petty Cash Refund Claim Amounting To {PETTY_CASH_AMOUNT}, For {PETTY_CASH_NAME} Requested On {PETTY_CASH_REQUEST_DATE} Has Been Received And {PETTY_CASH_STATUS}. {PETTY_CASH_COMMENT}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>PETTY CASH #{PETTY_CASH_ID}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Petty Cash Refund Claim Amounting To {PETTY_CASH_AMOUNT}, For {PETTY_CASH_NAME} Requested On {PETTY_CASH_REQUEST_DATE} Has Been Received And {PETTY_CASH_STATUS}. {PETTY_CASH_COMMENT}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', 0),
(13, 'inventory_requisitions', 'Inventory Requisitions', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>INVENTORY REQUISITIONS #{INVENTORY_REQUISITIONS_ID}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Inventory Requisite For {INVENTORY_REQUISITIONS_QUANTITY} Out Of The Available {INVENTORY_REQUISITIONS_AVAILABLE} {INVENTORY_REQUISITIONS_NAME} Requested On {INVENTORY_REQUISITIONS_REQUEST_DATE} has been {INVENTORY_REQUISITIONS_STATUS}. {INVENTORY_REQUISITIONS_COMMENT}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>INVENTORY REQUISITIONS #{INVENTORY_REQUISITIONS_ID}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Inventory Requisite For {INVENTORY_REQUISITIONS_QUANTITY} Out Of The Available {INVENTORY_REQUISITIONS_AVAILABLE} {INVENTORY_REQUISITIONS_NAME} Requested On {INVENTORY_REQUISITIONS_REQUEST_DATE} has been {INVENTORY_REQUISITIONS_STATUS}. {INVENTORY_REQUISITIONS_COMMENT}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', 0),
(14, 'legal_notification', 'Prokazi Cases', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">\r\n    <div style=\"max-width:640px; margin:0 auto; \">\r\n        <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\r\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\">\r\n            <h1>Pro Kazi Case: # {CASE_TITLE}</h1></div>\r\n        <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">Hi {USER_NAME} </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">You have been added to a legal case </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">The case is scheduled on  {CASE_DATE}</span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p>\r\n            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>\r\n            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div>\r\n        </div>\r\n    </div>\r\n</div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">\r\n    <div style=\"max-width:640px; margin:0 auto; \">\r\n        <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\r\n            <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\">\r\n            <h1>Pro Kazi Case: # {CASE_TITLE}</h1></div>\r\n        <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">Hi {USER_NAME} </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">You have been added to a legal case </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">The case is scheduled on  {CASE_DATE}</span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p>\r\n            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>\r\n            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div>\r\n        </div>\r\n    </div>\r\n</div>', 0),
(15, 'next_maintenance_date', 'Technical ', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>VEHICLE #{VEHICLE_NO}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {TITLE} {USER_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Vehicle No.&nbsp; {VEHICLE_NO},&nbsp; next maintenance date will be {NEXT_DATE}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>VEHICLE #{VEHICLE_NO}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {TITLE} {USER_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Vehicle No.&nbsp; {VEHICLE_NO},&nbsp; next maintenance date will be {NEXT_DATE}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(100) NOT NULL,
  `code_no` varchar(255) DEFAULT NULL,
  `name` mediumtext,
  `title` mediumtext,
  `join_date` timestamp NULL DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `code_no`, `name`, `title`, `join_date`, `email`, `deleted`, `created`) VALUES
(6, 'E00008', 'ISAAC BABU WATKINS', 'Mr', '2011-04-03 21:00:00', 'watkins@esl-eastafrica.com', 0, '2018-03-19 08:05:35'),
(7, 'E00009', 'CHRISPUS MAINGI KILEI', 'Mr', '2011-07-03 21:00:00', 'chrispus.kilei@esl-east africa.co', 0, '2018-03-19 08:05:35'),
(8, 'E00016', 'DANIEL LUKORITO WANIKINA', 'Mr', '2015-08-04 21:00:00', '3transport@esl-eastafrica.com', 0, '2018-03-19 08:05:35'),
(9, 'E00018', 'JUSTUS KALII MUTHEMBWA', 'Mr', '2015-08-31 21:00:00', '2transport@esl-eastafrica.com', 0, '2018-03-19 08:05:35'),
(10, 'E00044', 'ERICKSON MWANIKI NGELE', 'Mr', '2013-04-30 21:00:00', '1transport@esl-eastafrica.com', 0, '2018-03-19 08:05:35');

-- --------------------------------------------------------

--
-- Table structure for table `equipments`
--

CREATE TABLE `equipments` (
  `id` int(100) NOT NULL,
  `code` varchar(255) NOT NULL,
  `asset_no` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `purchase_price` float DEFAULT NULL,
  `for_hire` int(100) NOT NULL DEFAULT '0',
  `forhire_group` tinyint(1) NOT NULL DEFAULT '0',
  `source` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `equipments`
--

INSERT INTO `equipments` (`id`, `code`, `asset_no`, `description`, `purchase_price`, `for_hire`, `forhire_group`, `source`, `created`, `deleted`) VALUES
(1, 'G009', 'E009', 'Hoppers', 50, 0, 0, 'inhouse', '2018-04-20 10:15:41', 0),
(2, 'G002', 'H008', 'Grabs', 60, 0, 0, 'inhouse', '2018-04-20 10:16:19', 0),
(3, 'T001', 'T008', 'Trimmers', 60, 0, 0, 'inhouse', '2018-04-20 10:16:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `escalation_matrix`
--

CREATE TABLE `escalation_matrix` (
  `id` int(11) NOT NULL,
  `escalation_matrix` varchar(255) NOT NULL,
  `agent_name` varchar(255) NOT NULL,
  `escalation` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `assigned_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `escalation_matrix`
--

INSERT INTO `escalation_matrix` (`id`, `escalation_matrix`, `agent_name`, `escalation`, `created_by`, `assigned_date`, `updated_date`, `deleted`) VALUES
(1, 'kkk', '83', '45', NULL, '2018-04-16 07:10:26', NULL, 0),
(2, 'prof', 'agento', '45', NULL, '2018-04-16 07:26:48', NULL, 0),
(3, 'vinny', 'vinn', '45', NULL, '2018-04-16 07:45:25', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL DEFAULT '0',
  `estimate_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `tax_id2` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_forms`
--

CREATE TABLE `estimate_forms` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `estimate_forms`
--

INSERT INTO `estimate_forms` (`id`, `title`, `description`, `status`, `deleted`) VALUES
(1, 'H - Test Estimate form', '', 'active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

CREATE TABLE `estimate_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_requests`
--

CREATE TABLE `estimate_requests` (
  `id` int(11) NOT NULL,
  `estimate_form_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `status` enum('new','processing','hold','canceled','estimated') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `location` mediumtext COLLATE utf8_unicode_ci,
  `share_with` mediumtext COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `color` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `prospector_id` int(11) DEFAULT NULL,
  `business_type` int(11) NOT NULL,
  `call_type` int(11) NOT NULL,
  `objective_type` int(11) NOT NULL,
  `pipeline_stage` int(11) NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `event_comments`
--

CREATE TABLE `event_comments` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `event_id` int(11) NOT NULL,
  `share_with` text COLLATE utf8_unicode_ci,
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `event_notes`
--

CREATE TABLE `event_notes` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `event_id` int(11) NOT NULL DEFAULT '0',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expense_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `amount` double NOT NULL,
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `title`, `deleted`) VALUES
(1, 'Miscellaneous expense', 0);

-- --------------------------------------------------------

--
-- Table structure for table `extended_services`
--

CREATE TABLE `extended_services` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `extended_services`
--

INSERT INTO `extended_services` (`id`, `name`, `created`, `deleted`) VALUES
(1, 'External Parts Service', '2018-03-22 09:19:40', 0),
(2, 'Fuel', '2018-03-22 09:19:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `external_services`
--

CREATE TABLE `external_services` (
  `id` int(100) NOT NULL,
  `job_card_id` varchar(255) NOT NULL,
  `supplier_id` int(100) DEFAULT NULL,
  `service_provider_id` varchar(255) DEFAULT NULL,
  `service_type` varchar(255) NOT NULL,
  `start_date` varchar(255) DEFAULT '0000-00-00 00:00:00',
  `end_date` varchar(255) DEFAULT '0000-00-00 00:00:00',
  `total_service` double DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `amount` float DEFAULT NULL,
  `quantity` int(100) DEFAULT NULL,
  `total_fuel` float DEFAULT NULL,
  `service_no` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `stock_id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `external_services`
--

INSERT INTO `external_services` (`id`, `job_card_id`, `supplier_id`, `service_provider_id`, `service_type`, `start_date`, `end_date`, `total_service`, `created`, `deleted`, `amount`, `quantity`, `total_fuel`, `service_no`, `description`, `stock_id`) VALUES
(1, '2', NULL, '3', 'labour', '04/19/2018', '04/26/2018', 5600, '2018-04-18 07:41:10', 0, NULL, NULL, NULL, 'ES-001', NULL, NULL),
(2, '6', 18, NULL, 'parts', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2018-04-18 07:55:38', 0, 5000, 200, 1000000, 'ES-002', NULL, NULL),
(3, '3', NULL, '3', 'labour', '04/25/2018', '04/27/2018', 1600, '2018-04-21 07:03:12', 0, NULL, NULL, NULL, 'ES-003', NULL, NULL),
(4, '3', 16, NULL, 'parts', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2018-04-21 07:05:35', 0, 150, 3, 450, 'ES-004', NULL, 3),
(5, '3', NULL, '14', 'labour', '04/26/2018', '05/28/2018', 25600, '2018-04-21 07:12:13', 0, NULL, NULL, NULL, 'ES-005', NULL, NULL),
(6, '12', NULL, '5', 'labour', '04/25/2018', '04/28/2018', 2400, '2018-04-21 07:27:20', 0, NULL, NULL, NULL, 'ES-006', NULL, NULL),
(7, '3', 19, '', 'parts', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2018-04-21 07:32:29', 0, 400, 6, 2400, 'ES-007', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `fuels`
--

CREATE TABLE `fuels` (
  `id` int(100) NOT NULL,
  `litres` mediumtext,
  `price` mediumtext,
  `total` mediumtext,
  `supplier_id` int(100) DEFAULT NULL,
  `staff_id` int(100) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `expense_id` double DEFAULT NULL,
  `expense_cost` double DEFAULT NULL,
  `km_reading` int(100) DEFAULT NULL,
  `vehicle_id` int(100) DEFAULT NULL,
  `done_on` timestamp NULL DEFAULT NULL,
  `mileage` double DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fuels`
--

INSERT INTO `fuels` (`id`, `litres`, `price`, `total`, `supplier_id`, `staff_id`, `invoice_no`, `expense_id`, `expense_cost`, `km_reading`, `vehicle_id`, `done_on`, `mileage`, `created`, `updated_at`, `deleted`) VALUES
(3, '343123', '85', '29165455', 4, 6, 'dw322543', 3, 400, 1267888, 38, '2018-04-12 21:00:00', 1155565, '2018-04-19 04:37:44', NULL, 0),
(4, '23123', '85', '1965455', 5, 6, '5634sddsf', 3, 400, 43333330, 33, '2018-04-11 21:00:00', 10000030, '2018-04-19 04:38:29', '2018-04-19 03:48:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuel_balances`
--

CREATE TABLE `fuel_balances` (
  `id` int(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fuel_balances`
--

INSERT INTO `fuel_balances` (`id`, `description`, `created`, `updated_at`, `deleted`) VALUES
(1, 'full', '2018-04-17 09:19:58', NULL, 0),
(2, '3/4', '2018-04-17 09:19:58', NULL, 0),
(3, '1/2', '2018-04-17 09:20:17', NULL, 0),
(4, '1/4', '2018-04-17 09:20:17', NULL, 0),
(5, 'close to empty', '2018-04-17 09:20:38', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuel_prices`
--

CREATE TABLE `fuel_prices` (
  `id` int(100) NOT NULL,
  `price` double NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fuel_prices`
--

INSERT INTO `fuel_prices` (`id`, `price`, `created`, `updated_at`, `deleted`) VALUES
(1, 85, '2018-04-18 01:12:23', '2018-04-18 00:12:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fuel_suppliers`
--

CREATE TABLE `fuel_suppliers` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `price` mediumint(9) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fuel_suppliers`
--

INSERT INTO `fuel_suppliers` (`id`, `name`, `code`, `phone_no`, `price`, `created`, `deleted`) VALUES
(1, 'Totals', 'T007', '098325435', 200, '2018-04-10 05:43:32', 0),
(3, 'KenGen', 'K9090', '08923543', 110, '2018-04-10 05:46:34', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hire_assets`
--

CREATE TABLE `hire_assets` (
  `id` int(100) NOT NULL,
  `asset_outsourced` varchar(255) NOT NULL,
  `asset_inhouse` varchar(255) NOT NULL DEFAULT '',
  `staff_id` int(100) DEFAULT NULL,
  `client_id` int(100) DEFAULT NULL,
  `supplier_id` varchar(255) DEFAULT NULL,
  `rate` double NOT NULL,
  `tonnes` mediumtext NOT NULL,
  `total_tonnage` double DEFAULT NULL,
  `total_hours` double DEFAULT NULL,
  `measurement` varchar(255) DEFAULT NULL,
  `hours` longtext,
  `currency` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `hire_assets`
--

INSERT INTO `hire_assets` (`id`, `asset_outsourced`, `asset_inhouse`, `staff_id`, `client_id`, `supplier_id`, `rate`, `tonnes`, `total_tonnage`, `total_hours`, `measurement`, `hours`, `currency`, `source`, `created`, `updated_at`, `deleted`) VALUES
(1, '1', '', 8, 5, '4', 534422, '2', 1068844, 0, 'tonnes', '', 'KSH', 'outsourced', '2018-04-10 13:04:46', '2018-04-20 10:48:39', 0),
(3, '3', '', 8, 357, '6', 21000, '100', 2100000, NULL, NULL, NULL, NULL, NULL, '2018-04-10 13:11:14', '2018-04-18 06:25:24', 0),
(4, '2', '', 8, 4, '4', 60, '', 0, 6000, 'hours', '100', 'KSH', 'outsourced', '2018-04-19 05:22:17', '2018-04-20 10:49:46', 0),
(5, '8', '', 9, 6, '6', 20, '', 0, 900, 'hours', '45', 'KSH', NULL, '2018-04-19 06:31:01', NULL, 0),
(6, '9', '', 10, 6, '7', 90, '50', 4500, 0, 'tonnes', '', '400', NULL, '2018-04-19 06:32:04', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_requisitions`
--

CREATE TABLE `inventory_requisitions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_quantity` varchar(255) NOT NULL,
  `StkItem_id` int(11) DEFAULT NULL,
  `sage_project_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `approver_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `inventory_requisitions`
--

INSERT INTO `inventory_requisitions` (`id`, `user_id`, `item_id`, `item_name`, `item_quantity`, `StkItem_id`, `sage_project_id`, `description`, `created_at`, `updated_at`, `status`, `approver_id`, `deleted`) VALUES
(1, 5, 135, 'A3 Envelope', '5', 135, 2, 'only', '2018-04-17 10:20:38', '2018-04-17 10:20:38', 'Approved', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','not_paid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `tax_id2` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_id` tinytext COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(100) NOT NULL,
  `job_type_id` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `vehicle_no` int(100) DEFAULT NULL,
  `completion_date` timestamp NULL DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `km_reading` double DEFAULT NULL,
  `fuel_balance` double DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `supplier_id` int(100) DEFAULT NULL,
  `service_type_id` int(100) DEFAULT NULL,
  `job_service_id` int(100) DEFAULT NULL,
  `application_data` longtext,
  `picture` mediumtext,
  `reactive` tinyint(1) NOT NULL DEFAULT '0',
  `hours` mediumtext,
  `time_out` varchar(255) DEFAULT NULL,
  `actual_date` varchar(255) DEFAULT NULL,
  `track_by` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'In Progress',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `job_type_id`, `description`, `vehicle_no`, `completion_date`, `time_in`, `km_reading`, `fuel_balance`, `card_no`, `supplier_id`, `service_type_id`, `job_service_id`, `application_data`, `picture`, `reactive`, `hours`, `time_out`, `actual_date`, `track_by`, `status`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'lubrication', 'demo', 4, '2018-04-22 21:00:00', '01:00:00', 1000, 1, 'ESL-1-KCA 001G', 8, 1, NULL, '[{\"items\":{\"inspection_id\":\"2\",\"user\":\"6\",\"satus\":\"3\"}},{\"items\":{\"inspection_id\":\"3\",\"user\":\"10\",\"satus\":\"3\"}}]', '', 0, '', '02:00', '2018-04-28', 'kilometer', 'In Progress', '2018-04-19 23:38:47', NULL, 0),
(2, 'repairing', 'wheels', 6, '2018-04-23 21:00:00', '14:00:00', 2400, 3, 'ESL-2-KCC 694T', 1, 2, NULL, '[{\"items\":{\"inspection_id\":\"2\",\"user\":\"6\",\"satus\":\"1\"}}]', '', 0, '', '16:00', '2018-04-30', 'kilometer', 'In Progress', '2018-04-19 23:42:05', NULL, 0),
(3, 'blabla', 'qssa', 3, '2018-04-23 21:00:00', '01:00:00', 0, 2, 'ESL-3-KHMA 276C', 4, 1, NULL, '[{\"items\":{\"inspection_id\":\"2\",\"user\":\"6\",\"satus\":\"1\"}}]', '1_January_Job_Cards_2017.xlsx', 0, '500', '01:00', '2018-04-25', 'hours', 'Completed', '2018-04-20 03:45:47', NULL, 0),
(11, 'maintenance', 'quick one', 2, '2018-04-24 21:00:00', '01:00:00', 0, 4, 'ESL-11-ESL/MSA//MV/2', 7, 3, NULL, NULL, NULL, 0, '300', '02:00', '2018-04-24', 'hours', 'In Progress', '2018-04-20 05:37:14', NULL, 0),
(12, 'servicing', 'servicing', 7, '2018-04-24 21:00:00', '01:00:00', 60000, 3, 'ESL-12-KCC 168Z', 535, 2, NULL, '[{\"items\":{\"inspection_id\":null,\"user\":null,\"satus\":null}},{\"items\":{\"inspection_id\":\"2\",\"user\":\"8\",\"satus\":\"3\"}}]', '', 1, '', '02:00', '2018-04-28', 'kilometer', 'Completed', '2018-04-20 07:00:18', NULL, 0),
(13, 'testing', 'dasdsad', 3, '2018-04-24 21:00:00', '01:00:00', 0, 3, 'ESL-13-KHMA 276C', 7, 2, NULL, NULL, NULL, 1, '500', '14:00', '2018-04-26', 'hours', 'In Progress', '2018-04-20 07:10:40', NULL, 0),
(14, 'demo data', 'demo d', 5, '2018-04-23 21:00:00', '01:00:00', 22223, 4, 'ESL-14-KCB 363Y', 4, 1, NULL, '[{\"items\":{\"inspection_id\":\"2\",\"user\":\"6\",\"satus\":\"1\"}}]', '', 1, '', '02:00', '2018-04-26', 'kilometer', 'Completed', '2018-04-20 07:20:23', NULL, 0),
(15, 'test test', 'qwass', 1, '2018-04-24 21:00:00', '16:55:00', 0, 4, 'ESL-15-AGY/015/ESL', 269, 2, NULL, '[{\"items\":{\"inspection_id\":\"3\",\"user\":\"9\",\"satus\":\"1\"}}]', '', 1, '45311', '03:00', '2018-04-27', 'hours', 'Completed', '2018-04-20 07:26:17', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_status`
--

CREATE TABLE `jobs_status` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jobs_status`
--

INSERT INTO `jobs_status` (`id`, `name`, `deleted`) VALUES
(1, 'Not Started', 0),
(3, 'Completed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_inspections`
--

CREATE TABLE `job_inspections` (
  `id` int(100) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_inspections`
--

INSERT INTO `job_inspections` (`id`, `type`, `created_at`, `updated_at`, `deleted`) VALUES
(2, 'Internal', '2018-02-23 18:08:23', NULL, 0),
(3, 'External', '2018-02-23 18:09:14', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_services`
--

CREATE TABLE `job_services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_services`
--

INSERT INTO `job_services` (`id`, `service_name`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Normal Job', '2018-02-21 22:32:19', NULL, 0),
(2, 'Service Job', '2018-02-21 22:32:19', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_tasks`
--

CREATE TABLE `job_tasks` (
  `id` int(100) NOT NULL,
  `service_type_id` int(100) DEFAULT NULL,
  `assigned_to` int(100) NOT NULL,
  `tasks` varchar(255) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `job_time_in` time DEFAULT NULL,
  `jobs_type_id` int(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_tasks`
--

INSERT INTO `job_tasks` (`id`, `service_type_id`, `assigned_to`, `tasks`, `start_date`, `job_time_in`, `jobs_type_id`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 2, 6, 'complete', '2018-03-27 21:00:00', '01:59:00', 5, '2018-03-23 04:05:37', NULL, 0),
(2, 2, 9, 'great', '2018-03-20 21:00:00', '01:00:00', 6, '2018-03-23 04:05:58', NULL, 0),
(3, 2, 8, 'great task', '2018-03-27 21:00:00', '01:00:00', 2, '2018-03-23 04:07:31', NULL, 0),
(4, 1, 6, 'test 1', '0000-00-00 00:00:00', '00:00:00', 1, '2018-03-23 15:29:05', NULL, 0),
(5, 2, 0, 'test 1', '2018-03-20 21:00:00', '09:00:00', 0, '2018-03-23 15:30:07', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

CREATE TABLE `job_types` (
  `id` int(100) NOT NULL,
  `job_type_name` varchar(255) NOT NULL,
  `service_type` int(100) DEFAULT NULL,
  `job_id` int(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_types`
--

INSERT INTO `job_types` (`id`, `job_type_name`, `service_type`, `job_id`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'oiling', 1, 2, '2018-03-23 04:00:28', NULL, 0),
(2, 'replacing tyre', 1, 2, '2018-03-23 04:00:59', NULL, 0),
(3, 'servicing', 2, 2, '2018-03-23 04:01:46', NULL, 0),
(4, 'pooling', 3, 2, '2018-03-23 04:02:05', NULL, 0),
(5, 'washing', 3, 1, '2018-03-23 04:02:32', NULL, 0),
(6, 'cleaning', 2, 1, '2018-03-23 04:02:53', NULL, 0),
(7, 'trenching', 2, 1, '2018-03-23 04:03:05', NULL, 0),
(8, 'Wheel Balance', 2, 2, '2018-03-23 14:43:21', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_hours` decimal(7,2) NOT NULL,
  `total_days` decimal(5,2) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `reason` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `checked_at` datetime DEFAULT NULL,
  `checked_by` int(11) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `title`, `status`, `color`, `description`, `deleted`) VALUES
(1, 'Casual Leave', 'active', '#83c340', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `main_tasks`
--

CREATE TABLE `main_tasks` (
  `id` int(11) NOT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` enum('unread','read') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `message_id` int(11) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted_by_users` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE `milestones` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `notify_to` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `read_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `project_comment_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `ticket_comment_id` int(11) NOT NULL,
  `project_file_id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_payment_id` int(11) NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `description`, `created_at`, `notify_to`, `read_by`, `event`, `project_id`, `task_id`, `project_comment_id`, `ticket_id`, `ticket_comment_id`, `project_file_id`, `leave_id`, `post_id`, `to_user_id`, `activity_log_id`, `client_id`, `invoice_payment_id`, `estimate_id`, `estimate_request_id`, `deleted`) VALUES
(1, 5, '', '2018-03-23 12:03:03', '219,241', '', 'project_task_created', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` int(11) NOT NULL,
  `event` varchar(250) NOT NULL,
  `category` varchar(50) NOT NULL,
  `enable_email` int(1) NOT NULL DEFAULT '0',
  `enable_web` int(1) NOT NULL DEFAULT '0',
  `notify_to_team` text NOT NULL,
  `notify_to_team_members` text NOT NULL,
  `notify_to_terms` text NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `event`, `category`, `enable_email`, `enable_web`, `notify_to_team`, `notify_to_team_members`, `notify_to_terms`, `sort`, `deleted`) VALUES
(1, 'project_created', 'project', 0, 0, '', '', '', 1, 0),
(2, 'project_deleted', 'project', 0, 0, '', '', '', 2, 0),
(3, 'project_task_created', 'project', 1, 1, '', '', 'project_members,task_assignee', 3, 0),
(4, 'project_task_updated', 'project', 0, 1, '', '', 'task_assignee', 4, 0),
(5, 'project_task_assigned', 'project', 0, 1, '', '', 'task_assignee', 5, 0),
(7, 'project_task_started', 'project', 0, 0, '', '', '', 7, 0),
(8, 'project_task_finished', 'project', 0, 0, '', '', '', 8, 0),
(9, 'project_task_reopened', 'project', 0, 0, '', '', '', 9, 0),
(10, 'project_task_deleted', 'project', 0, 1, '', '', 'task_assignee', 10, 0),
(11, 'project_task_commented', 'project', 0, 1, '', '', 'task_assignee', 11, 0),
(12, 'project_member_added', 'project', 0, 1, '', '', 'project_members', 12, 0),
(13, 'project_member_deleted', 'project', 0, 1, '', '', 'project_members', 13, 0),
(14, 'project_file_added', 'project', 0, 1, '', '', 'project_members', 14, 0),
(15, 'project_file_deleted', 'project', 0, 1, '', '', 'project_members', 15, 0),
(16, 'project_file_commented', 'project', 0, 1, '', '', 'project_members', 16, 0),
(17, 'project_comment_added', 'project', 0, 1, '', '', 'project_members', 17, 0),
(18, 'project_comment_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 18, 0),
(19, 'project_customer_feedback_added', 'project', 0, 1, '', '', 'project_members', 19, 0),
(20, 'project_customer_feedback_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 20, 0),
(21, 'client_signup', 'client', 0, 1, '1', '5', '', 21, 0),
(22, 'invoice_online_payment_received', 'invoice', 0, 0, '', '', '', 22, 0),
(23, 'leave_application_submitted', 'leave', 0, 0, '', '', '', 23, 0),
(24, 'leave_approved', 'leave', 0, 1, '', '', 'leave_applicant', 24, 0),
(25, 'leave_assigned', 'leave', 0, 1, '', '', 'leave_applicant', 25, 0),
(26, 'leave_rejected', 'leave', 0, 1, '', '', 'leave_applicant', 26, 0),
(27, 'leave_canceled', 'leave', 0, 0, '', '', '', 27, 0),
(28, 'ticket_created', 'ticket', 1, 1, '', '', 'ticket_assignee', 28, 0),
(29, 'ticket_commented', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 29, 0),
(30, 'ticket_closed', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 30, 0),
(31, 'ticket_reopened', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 31, 0),
(32, 'estimate_request_received', 'estimate', 0, 0, '', '', '', 32, 0),
(33, 'estimate_sent', 'estimate', 0, 0, '', '', '', 33, 0),
(34, 'estimate_accepted', 'estimate', 0, 0, '', '', '', 34, 0),
(35, 'estimate_rejected', 'estimate', 0, 0, '', '', '', 35, 0);

-- --------------------------------------------------------

--
-- Table structure for table `objective_types`
--

CREATE TABLE `objective_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `objective_types`
--

INSERT INTO `objective_types` (`id`, `title`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Debt Collection', '2018-01-22 18:51:46', NULL, 0),
(2, 'Development', '2018-01-22 18:51:57', NULL, 0),
(3, 'Maintenance', '2018-01-22 18:52:08', NULL, 0),
(4, 'Acquisition', '2018-01-22 18:52:20', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `other_expenses`
--

CREATE TABLE `other_expenses` (
  `id` int(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cost` double NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `other_expenses`
--

INSERT INTO `other_expenses` (`id`, `name`, `description`, `cost`, `created`, `deleted`) VALUES
(1, 'car wash', 'done weekly', 5000, '2018-04-12 06:30:13', 0),
(3, 'Lubricating', 'To be done frequently', 400, '2018-04-12 06:40:01', 0),
(4, 'fine', 'reckless driving', 4000, '2018-04-12 06:40:47', 0);

-- --------------------------------------------------------

--
-- Table structure for table `parts_suppliers`
--

CREATE TABLE `parts_suppliers` (
  `id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `tax_no` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `parts_suppliers`
--

INSERT INTO `parts_suppliers` (`id`, `name`, `account`, `phone`, `tax_no`, `created`, `deleted`) VALUES
(1, 'kinde eng.', 'k0934423', '096554333386', '4567', '2018-03-15 14:04:50', 0),
(2, 'kenGen', 'kg45890', '903432535', '89022', '2018-03-15 14:05:20', 0),
(3, 'A.B.M.C International Ltd', 'A0033', '+ 254 20 40 31 000', 'P051390953D', '2018-03-15 14:54:12', 0),
(4, 'A.D. Design Architects', 'A0039', '041-2220500', 'A002299132T', '2018-03-15 14:54:12', 0),
(5, 'AAR Health Care', 'A0001', '020 271 531 9', '', '2018-03-15 14:54:12', 0),
(6, 'Abercrombie & Kent Kenya Ltd', 'A0041', '', 'P000592730P', '2018-03-15 14:54:12', 0),
(7, 'Abetrans Logistics Ltd', 'A0023', '+972-3-795-8888', '', '2018-03-15 14:54:12', 0),
(8, 'Accesskenya Group Ltd', 'A0003', '020 360 000 0', 'P051193029R', '2018-03-15 14:54:12', 0),
(9, 'African Cargo Handling Ltd', 'A0004', '328 230 00', 'P051118655F', '2018-03-15 14:54:12', 0),
(10, 'African eDevelopment House', 'A0042', '', 'P051185021Z', '2018-03-15 14:54:12', 0),
(11, 'African Marine and General Engineering Co. Ltd', 'A0029', '+254 722 203 455', '', '2018-03-15 14:54:12', 0),
(12, 'Agents One', 'A0016', '', '', '2018-03-15 14:54:12', 0),
(13, 'Ahlers India Private Ltd-India', 'A0022', '', '', '2018-03-15 14:54:12', 0),
(14, 'AIG Kenya Insurance Co.Ltd', 'A0025', '', '', '2018-03-15 14:54:12', 0),
(15, 'Airgo Consultants Ltd', 'A0011', '', '', '2018-03-15 14:54:12', 0),
(16, 'Alba Petroleum Ltd', 'A0040', '+254 20 2107990', 'P000621140B', '2018-03-15 14:54:12', 0),
(17, 'ALFOSS ENERGY LIMITED', 'A0026', '+254722871853', '', '2018-03-15 14:54:12', 0),
(18, 'Alicom Systems Ltd', 'A0006', '44 1628 554650', '', '2018-03-15 14:54:12', 0),
(19, 'Alicom Systems Ltd', 'A0014', '', '', '2018-03-15 14:54:12', 0),
(20, 'All World Investment Ltd', 'A0044', '+256701778001', '', '2018-03-15 14:54:12', 0),
(21, 'Amirali Transporters', 'A0032', '0710-786000', '', '2018-03-15 14:54:12', 0),
(22, 'Anderson Human Capital Ltd', 'A0043', '020-2633926', 'P051391837Z', '2018-03-15 14:54:12', 0),
(23, 'Antarc Ltd', 'A0036', '', '', '2018-03-15 14:54:12', 0),
(24, 'Anwarali & Brothers Ltd', 'A0007', '020-8017615', 'P000620847Q', '2018-03-15 14:54:12', 0),
(25, 'Aon Kenya Insurance Brokers Ltd', 'A0005', '473135/38/898', '', '2018-03-15 14:54:12', 0),
(26, 'APA Insurance Ltd', 'A0028', '041-2226770', '', '2018-03-15 14:54:12', 0),
(27, 'Apex Steel Ltd', 'A0027', '', '', '2018-03-15 14:54:12', 0),
(28, 'Aquisana Ltd', 'A0002', '020 243 510 8', '', '2018-03-15 14:54:12', 0),
(29, 'Aramex Kenya Ltd', 'A0038', '+254 20 5158000', 'P051139805Z', '2018-03-15 14:54:12', 0),
(30, 'Ashbury & Fletcher Ltd', 'A0030', '+ 254 20 2014684', '', '2018-03-15 14:54:12', 0),
(31, 'Athi Kay Ltd', 'A0035', '0700 117257', '', '2018-03-15 14:54:12', 0),
(32, 'Auto Movers Ltd', 'A0045', '', 'P051412589J', '2018-03-15 14:54:12', 0),
(33, 'Automobile Association of Kenya', 'A0034', '020 2612300', '', '2018-03-15 14:54:12', 0),
(34, 'AutoXpress Ltd', 'A0017', '', '', '2018-03-15 14:54:12', 0),
(35, 'Aviation Cargo Support Ltd', 'A0037', '+254-20-822917/8', 'P051215067C', '2018-03-15 14:54:12', 0),
(36, 'Baileys Plant Hire Ltd', 'B0014', '0722 411128', '', '2018-03-15 14:54:12', 0),
(37, 'Baltic International Maritime Council', 'B0003', '45 4436 6800', '', '2018-03-15 14:54:12', 0),
(38, 'BANADARINI SHIP CHANDLERS', 'B0009', '', '', '2018-03-15 14:54:12', 0),
(39, 'BANDARINI SHIPCHANDALERS & GENERAL AGENCIS LTD', 'B0008', '', '', '2018-03-15 14:54:12', 0),
(40, 'Baobab Beach Resort Mombasa Ltd', 'B0020', '020 2057093-8', 'P000619188N', '2018-03-15 14:54:12', 0),
(41, 'Baraka Fm Ltd', 'B0025', '0790955955', 'P051529971y', '2018-03-15 14:54:12', 0),
(42, 'Bati Nakliyat ve Ticaret A.S.', 'B0012', '', '', '2018-03-15 14:54:12', 0),
(43, 'Beca Auto Ltd', 'B0015', '0723 922 199', '', '2018-03-15 14:54:12', 0),
(44, 'BEST BUYS TECHNOLOGIES LTD', 'B0006', '0412313225', '', '2018-03-15 14:54:12', 0),
(45, 'Best Western Plus Creekside Hotel', 'B0022', '+254733888746', 'P051228052C', '2018-03-15 14:54:12', 0),
(46, 'Bill investments ltd', 'B0002', '556459/', 'P000601105W', '2018-03-15 14:54:12', 0),
(47, 'BIMCO', 'B0010', ' +45 44 36 68 0', '', '2018-03-15 14:54:12', 0),
(48, 'Blue wave Company Ltd', 'B0001', '2227818/2230331', 'P051124454T', '2018-03-15 14:54:12', 0),
(49, 'Bollore Africa Logistics Kenya Ltd', 'B0018', '', '', '2018-03-15 14:54:12', 0),
(50, 'Boma Travel Services Ltd', 'B0016', '+254 41 2319796', '', '2018-03-15 14:54:12', 0),
(51, 'Boma Travel Services Ltd (Usd)', 'B0017', '+254 41 2319796', '', '2018-03-15 14:54:12', 0),
(52, 'Bounty Hotel', 'B0005', '', '', '2018-03-15 14:54:12', 0),
(53, 'Brains Tours & Car Hire', 'B0004', '', '', '2018-03-15 14:54:12', 0),
(54, 'Bribramo General Contractors Ltd', 'B0011', '', '', '2018-03-15 14:54:12', 0),
(55, 'BrighterMonday.com Ltd', 'B0023', '0703 026117', 'P051208319X', '2018-03-15 14:54:12', 0),
(56, 'Brookside Dairy Ltd', 'B0019', '+254 20 3542480', '', '2018-03-15 14:54:12', 0),
(57, 'Burudika Holdings Ltd', 'B0027', '0707271757', 'P051559331L', '2018-03-15 14:54:12', 0),
(58, 'Busara Logistics Ltd-KES', 'B0024', '0722472240', 'P051402002E', '2018-03-15 14:54:12', 0),
(59, 'Business Motivation Seminars Ltd', 'B0021', '+44 20 8669, 5222', 'GB 407 3323 81', '2018-03-15 14:54:12', 0),
(60, 'Butterfly For Weddings', 'B0026', '0726420119', '', '2018-03-15 14:54:12', 0),
(61, 'Buzeki Dairy Ltd', 'B0013', '', '', '2018-03-15 14:54:12', 0),
(62, 'Canopy  Solutions (K) Limited', 'C0036', '+254712923254', 'P051558306I', '2018-03-15 14:54:12', 0),
(63, 'Car & General (trading)Ltd', 'C0009', '', '', '2018-03-15 14:54:12', 0),
(64, 'Car Track', 'C0023', '', '', '2018-03-15 14:54:12', 0),
(65, 'Cargo Service Centre', 'C0005', '', '', '2018-03-15 14:54:12', 0),
(66, 'Castle Royal Hotel', 'C0027', '041 2228780', 'P000595575K', '2018-03-15 14:54:12', 0),
(67, 'Cellnet Ltd', 'C0020', '041 2222239', 'P000619916A', '2018-03-15 14:54:12', 0),
(68, 'Cemtec Eng. Ltd XXXXXXXXXX', 'C0010', '', '', '2018-03-15 14:54:12', 0),
(69, 'Cemtec Engineering Ltd', 'C0006', '+254 041 24 90 310', '', '2018-03-15 14:54:12', 0),
(70, 'Centre for Corporate Governance', 'C0028', '+254 20 3745915', '', '2018-03-15 14:54:12', 0),
(71, 'Chandaria Industries Ltd', 'C0025', '+254 20 8563252-4', '', '2018-03-15 14:54:12', 0),
(72, 'Chartis Kenya Insurance Co. Ltd  ', 'C0021', '', '', '2018-03-15 14:54:12', 0),
(73, 'Chartis Kenya Insurance Co. Ltd (Ksh)', 'C0026', '020  3676 000  3751 800', '', '2018-03-15 14:54:12', 0),
(74, 'CITY COUNCIL OF NAIROBI', 'C0014', '', '', '2018-03-15 14:54:12', 0),
(75, 'CMA CGM Kenya Ltd', 'C0002', ' 25441435263', 'P051171485W', '2018-03-15 14:54:12', 0),
(76, 'CMC MOTORS GROUP LTD', 'C0013', '', '', '2018-03-15 14:54:12', 0),
(77, 'Coast Lamps Ltd (Ksh)', 'C0024', '(041)2311 411', '', '2018-03-15 14:54:12', 0),
(78, 'Coco Vita Ltd', 'C0030', '0728-604471', '', '2018-03-15 14:54:12', 0),
(79, 'College of Insurance, Mombasa', 'C0031', '020 2348328', '', '2018-03-15 14:54:12', 0),
(80, 'Communications Authority of Kenya', 'C0029', '254-020-4242000', '', '2018-03-15 14:54:12', 0),
(81, 'Communications Commission of Kenya', 'C0008', '254 020 424 2000', '', '2018-03-15 14:54:12', 0),
(82, 'COMPUTECH LIMITED', 'C0015', '0733666661', '', '2018-03-15 14:54:12', 0),
(83, 'Computech Ltd', 'C0017', '', '', '2018-03-15 14:54:12', 0),
(84, 'Computech Ltd', 'C0019', '0733 666 666', 'P000599855R', '2018-03-15 14:54:12', 0),
(85, 'Conquest Capital Ltd', 'C0034', '+254 020 2363559', 'P051220252M', '2018-03-15 14:54:12', 0),
(86, 'Cory Logistics', 'C0007', '', '', '2018-03-15 14:54:12', 0),
(87, 'Crater Automobiles (NBI) Ltd', 'C0033', '+254 020 8068901', 'P000606000F', '2018-03-15 14:54:12', 0),
(88, 'Creative Concepts Ltd', 'C0032', '+254 41 2000169', '', '2018-03-15 14:54:12', 0),
(89, 'Cross Freight GMBH', 'C0022', '', '', '2018-03-15 14:54:12', 0),
(90, 'Crown Petroleum (K) Ltd', 'C0037', '0722 203 898', 'P051149445E', '2018-03-15 14:54:12', 0),
(91, 'Crowne Plaza, Nairobi', 'C0035', '020 2746000', 'P051192432Z', '2018-03-15 14:54:12', 0),
(92, 'Crystal Rims & Accessories Ltd', 'C0016', '', '', '2018-03-15 14:54:12', 0),
(93, 'Crystal Rims & Accessories Ltd', 'C0018', '', '', '2018-03-15 14:54:12', 0),
(94, 'Darajani hotel co.ltd', 'D0003', '041 2494692', 'P051200631H', '2018-03-15 14:54:12', 0),
(95, 'David & Sons ', 'D0016', '', '', '2018-03-15 14:54:12', 0),
(96, 'Davis & Shirtliff Ltd ', 'D0024', '+254 41 249 5920', 'P000591252N', '2018-03-15 14:54:12', 0),
(97, 'Deans Travel Centre ltd', 'D0001', '041 2317211', 'P051165502Z', '2018-03-15 14:54:12', 0),
(98, 'Deans Travel Centre Ltd (USD)', 'D0004', '041 2317211', 'P051165502Z', '2018-03-15 14:54:12', 0),
(99, 'Delta Handling Services', 'D0026', '', 'P051340954Z', '2018-03-15 14:54:12', 0),
(100, 'DENTECH ENTERPRISES', 'D0014', '', '', '2018-03-15 14:54:12', 0),
(101, 'Dev Enterprises Ltd', 'D0002', '041 2222378', 'P000621269R', '2018-03-15 14:54:12', 0),
(102, 'DHL Worldwide Express Kenya', 'D0005', '+254 (041) 223933 ', 'P000613307I', '2018-03-15 14:54:12', 0),
(103, 'Digital Edge', 'D0021', '+254 729 265 020', '', '2018-03-15 14:54:12', 0),
(104, 'Digital Hub', 'D0022', '+254 (20) 2112220', '', '2018-03-15 14:54:12', 0),
(105, 'Dimensional Computer Backups', 'D0009', '', '', '2018-03-15 14:54:12', 0),
(106, 'DIMENSIONAL SERVICES LTD', 'D0015', '020-2068790', '', '2018-03-15 14:54:12', 0),
(107, 'Distance Car Hire, Tours & Travel Ltd', 'D0006', '', '', '2018-03-15 14:54:12', 0),
(108, 'DN Freight', 'D0007', '', '', '2018-03-15 14:54:12', 0),
(109, 'Document Consulting Ltd', 'D0013', '+254206005545/8', '', '2018-03-15 14:54:12', 0),
(110, 'DODWELL and COMPANY (East Africa) Limited', 'D0019', '+254 11 230060', '', '2018-03-15 14:54:12', 0),
(111, 'Dolphins Training & Consultants Ltd', 'D0025', '+254 20 2211362/4/5/382', 'P051219950K', '2018-03-15 14:54:12', 0),
(112, 'Dorbe Leit Solutions Ltd', 'D0023', '0701 561 919', 'P051305505S', '2018-03-15 14:54:12', 0),
(113, 'Dove Business Enterprise', 'D0017', '020-551239', 'A004023720Y', '2018-03-15 14:54:12', 0),
(114, 'Dream Works Technologies ', 'D0008', '', '', '2018-03-15 14:54:12', 0),
(115, 'DSM Corridor Group Ltd', 'D0020', '+255 (0) 75 4632827', '', '2018-03-15 14:54:12', 0),
(116, 'DSTV Supersport', 'D0010', '', '', '2018-03-15 14:54:12', 0),
(117, 'DSV Belgium N.V', 'D0018', '03/238 25 15', '', '2018-03-15 14:54:12', 0),
(118, 'Eagle Africa Insurance Brokers Kenya Ltd', 'E0004', '041 2003051', 'P000591465U', '2018-03-15 14:54:12', 0),
(119, 'East African Commercial & Shipping ', 'E0018', '254 707 032 148', 'P000618644C', '2018-03-15 14:54:12', 0),
(120, 'Easternpioneers Limited', 'E0020', '', '', '2018-03-15 14:54:12', 0),
(121, 'EBB  Alliance  Ltd (HK)', 'E0012', '', '', '2018-03-15 14:54:12', 0),
(122, 'Eculine Kenya Ltd', 'E0005', '', '', '2018-03-15 14:54:12', 0),
(123, 'Elegance Technology Ltd', 'E0023', '+254708198586', '', '2018-03-15 14:54:12', 0),
(124, 'Elegance Technology Ltd', 'E0024', '+254 735248000', 'P051373020N', '2018-03-15 14:54:12', 0),
(125, 'Elite Digital ', 'E0006', '', '', '2018-03-15 14:54:12', 0),
(126, 'Elite Digital Mombasa Ltd', 'E0001', '020-8046262/63', 'P05131329G', '2018-03-15 14:54:12', 0),
(127, 'Emirates Shipping EA Limited', 'E0007', '', '', '2018-03-15 14:54:12', 0),
(128, 'Enforcer Alarms Ltd', 'E0003', '2222882/', 'P051091186X', '2018-03-15 14:54:12', 0),
(129, 'Enhanced Performance & Innovation Centre (Ksh)', 'E0011', '020-2022156', '', '2018-03-15 14:54:12', 0),
(130, 'EON Maritime Services', 'E0013', '', '', '2018-03-15 14:54:12', 0),
(131, 'Equitorial Secretaries & Registrars', 'E0021', '2226422/3', 'P051146810Z', '2018-03-15 14:54:12', 0),
(132, 'Euro Models (K) Ltd', 'E0022', '+254 0722 354532', 'P051552846H', '2018-03-15 14:54:12', 0),
(133, 'Euromax Africa Investment Company Ltd', 'E0016', '+254724755296', '', '2018-03-15 14:54:12', 0),
(134, 'Euromax Africa Investment Company Ltd', 'E0017', '041 2319447', '', '2018-03-15 14:54:12', 0),
(135, 'Evergreen Logistics Corp.', 'E0010', '+886-02-2508369', '', '2018-03-15 14:54:12', 0),
(136, 'Evergreen Logistics Corp.**************', 'E0009', '+886-02-25083969', '', '2018-03-15 14:54:12', 0),
(137, 'Everlloyd Container Lines PVT Ltd', 'E0008', '', '', '2018-03-15 14:54:12', 0),
(138, 'Expolanka Freight Dubai', 'E0002', '+971-4-2990111', '', '2018-03-15 14:54:12', 0),
(139, 'Export Trading Company Ltd', 'E0025', '', '', '2018-03-15 14:54:12', 0),
(140, 'Export UK Motors Limited', 'E0019', '+44 20 8986 1254', '', '2018-03-15 14:54:12', 0),
(141, 'Express Chartering & Shipping Ltd', 'E0015', '', '', '2018-03-15 14:54:12', 0),
(142, 'Eyecatchers  Ltd', 'E0014', '2224033', 'P051116426S', '2018-03-15 14:54:12', 0),
(143, 'Fahmi Said Basalim', 'F0021', '+254 722 414918', '', '2018-03-15 14:54:12', 0),
(144, 'Fairdeal  Superstores  Ltd', 'F0015', '0720 107033', 'P061148499S', '2018-03-15 14:54:12', 0),
(145, 'Fairdeal Furniture Ltd', 'F0023', '020 829051/2/3', 'P051340082U', '2018-03-15 14:54:12', 0),
(146, 'Faiz Gym', 'F0019', '0722 692961', '', '2018-03-15 14:54:12', 0),
(147, 'Fapbod Ships & General contractors', 'F0001', '041 2230841/', 'P051102553N', '2018-03-15 14:54:12', 0),
(148, 'Farouk Adam & Company Advocates', 'F0017', '2220210', 'A000140451V', '2018-03-15 14:54:12', 0),
(149, 'Fast tTruck Int. limited', 'F0004', '2229784/6', '', '2018-03-15 14:54:12', 0),
(150, 'Federation of Kenya Employers', 'F0013', '2721929/48/49/52', '', '2018-03-15 14:54:12', 0),
(151, 'FinanMark Africa Ltd', 'F0024', '+254 020 3510610', 'P051201170K', '2018-03-15 14:54:12', 0),
(152, 'Fire fox xxxxxxxxxxxxxx', 'F0008', '', '', '2018-03-15 14:54:12', 0),
(153, 'Firefox Kenya Ltd', 'F0014', '', '', '2018-03-15 14:54:12', 0),
(154, 'First Computers Ltd ', 'F0002', '+254 733 666 661', 'P051113453P', '2018-03-15 14:54:12', 0),
(155, 'Flag Business Systems', 'F0011', '0723938719', '', '2018-03-15 14:54:12', 0),
(156, 'Flamingo Beach Resort & Spa', 'F0020', '+254 41 5480034/5/6/7', 'VAT 0513633691', '2018-03-15 14:54:12', 0),
(157, 'Floor Solutions', 'F0022', '', 'A007102667M', '2018-03-15 14:54:12', 0),
(158, 'Fones Direct Ltd', 'F0018', '+254 (20) 300 1117', '', '2018-03-15 14:54:12', 0),
(159, 'Fracoline Marketing Africa', 'F0009', '', '', '2018-03-15 14:54:12', 0),
(160, 'Freight in Time Limited', 'F0012', '', '', '2018-03-15 14:54:12', 0),
(161, 'Freightwell Express Limited-USD', 'F0005', '2224822/', 'P051153405J', '2018-03-15 14:54:12', 0),
(162, 'Freightwell Express Ltd -KES', 'F0006', '+254-412229784', '', '2018-03-15 14:54:12', 0),
(163, 'Furniture Palace International (K) Ltd', 'F0016', '0721 554 073', 'P051141705E', '2018-03-15 14:54:12', 0),
(164, 'Furniturerama Ltd', 'F0003', '2494759-60', 'P 051133096Y', '2018-03-15 14:54:12', 0),
(165, 'FUTURE KENYA (USD)', 'F0010', '', '', '2018-03-15 14:54:12', 0),
(166, 'Future Kenya Ltd ', 'F0007', '', '', '2018-03-15 14:54:12', 0),
(167, 'Galaxy Ventures Services', 'G0010', '', 'A005140848H', '2018-03-15 14:54:12', 0),
(168, 'Ganador Investments', 'G0003', '', '', '2018-03-15 14:54:12', 0),
(169, 'George Philip Muhugu Ngomo', 'G0001', '0734 790 410', 'A001754984K', '2018-03-15 14:54:12', 0),
(170, 'Global Business Commanders Ltd', 'G0008', '041 2229381', '0130204X', '2018-03-15 14:54:12', 0),
(171, 'Grantoh Logistics Ltd', 'G0009', '+254 723457084', 'P051530778K', '2018-03-15 14:54:12', 0),
(172, 'Graphic World Ltd', 'G0005', '0721 241 052', 'P051376336G', '2018-03-15 14:54:12', 0),
(173, 'Grayson Consulting Ltd', 'G0007', '020 261 7718', 'P051413941X', '2018-03-15 14:54:12', 0),
(174, 'Green Island Ship Chandlers K Ltd', 'G0002', '', '', '2018-03-15 14:54:12', 0),
(175, 'Green Island Shipping Services Ltd', 'G0006', '+254 20 2683940/2', '', '2018-03-15 14:54:12', 0),
(176, 'Habib Boats', 'H0005', '0733895987', '', '2018-03-15 14:54:12', 0),
(177, 'Hammond Tutu & Gunther Kenya Ltd', 'H0001', '020-2340347/', 'P051216709Z', '2018-03-15 14:54:12', 0),
(178, 'Hammond Tutu & Guntherxxxxxxxx', 'H0007', '', '', '2018-03-15 14:54:12', 0),
(179, 'Harbour Agency Limited', 'H0012', '', '', '2018-03-15 14:54:12', 0),
(180, 'Heritage Insurance Company Ltd', 'H0004', '2224724', 'P000591465U', '2018-03-15 14:54:12', 0),
(181, 'Hi-Tech Radiocall Services', 'H0003', '', '', '2018-03-15 14:54:12', 0),
(182, 'Hot Point Appliances Ltd', 'H0011', '0770299361/2', 'P000597694S', '2018-03-15 14:54:12', 0),
(183, 'Hotel English Point', 'H0009', '041 2147000', 'P051092905R', '2018-03-15 14:54:12', 0),
(184, 'Hotel English Point - USD', 'H0013', '041 2147000', 'P051092905R', '2018-03-15 14:54:12', 0),
(185, 'Hotel Rio', 'H0008', '+254 020 2300152', 'P051197219Y', '2018-03-15 14:54:12', 0),
(186, 'Hull Marine Enterprises', 'H0010', '', '', '2018-03-15 14:54:12', 0),
(187, 'HUSSEIN AUTO SPARES LTD', 'H0006', '0722820392', '', '2018-03-15 14:54:12', 0),
(188, 'I. Messina (K) Ltd', 'I0016', '+254 41 2319640/1/2', '', '2018-03-15 14:54:12', 0),
(189, 'IBC JAPAN', 'I0005', '', '', '2018-03-15 14:54:12', 0),
(190, 'ICPAK', 'I0025', '020 2304226/7', '', '2018-03-15 14:54:12', 0),
(191, 'IFA- Gelders Forwarding B.V', 'G0004', '', '', '2018-03-15 14:54:12', 0),
(192, 'IFA Secretariat', 'I0002', '', '', '2018-03-15 14:54:12', 0),
(193, 'IFA-Haiko Logistics India PVT Ltd', 'H0002', ' 00 9122 2857 7354/32', '', '2018-03-15 14:54:12', 0),
(194, 'Imer Investments Ltd', 'I0014', '0722 403 049', 'P051405318U', '2018-03-15 14:54:12', 0),
(195, 'Immaculate initial Services', 'I0033', '+254 721 217 110', '', '2018-03-15 14:54:12', 0),
(196, 'Inchcape Shipping  Services Kenya Ltd', 'I0024', '+254 41 2314245', '', '2018-03-15 14:54:12', 0),
(197, 'Indesols Ltd', 'I0022', '020 2573956', '', '2018-03-15 14:54:12', 0),
(198, 'Industrial & Maritime Surveyors Ltd', 'I0006', '', '', '2018-03-15 14:54:12', 0),
(199, 'Infinite  Horizon', 'I0008', '', '', '2018-03-15 14:54:12', 0),
(200, 'Inspectorate E.A Ltd', 'I0017', '0722 305 872', 'P051173300F', '2018-03-15 14:54:12', 0),
(201, 'Inspectorate E.A Ltd. (Kshs)', 'I0021', '', '', '2018-03-15 14:54:12', 0),
(202, 'Institute of Certified Public Secretaries of Kenya', 'I0026', '', '', '2018-03-15 14:54:12', 0),
(203, 'Institute Of Chartered Shipbrokers', 'I0010', '', '', '2018-03-15 14:54:13', 0),
(204, 'Institute of Chartered Shipbrokers ICS', 'I0013', '', '', '2018-03-15 14:54:13', 0),
(205, 'Institute of Directors (Kenya)', 'I0029', '+254-020-2190131', 'P051180293W', '2018-03-15 14:54:13', 0),
(206, 'Institute of Human Resource Management', 'I0018', '+254 (0) 20 2213745', 'P051222543Q', '2018-03-15 14:54:13', 0),
(207, 'Institute of Internal Auditors', 'I0020', '2731246', '', '2018-03-15 14:54:13', 0),
(208, 'Insurance Institute of East Africa', 'I0030', '+254 20 6530128', 'P051609555U', '2018-03-15 14:54:13', 0),
(209, 'Intermark Services', 'I0027', '', '', '2018-03-15 14:54:13', 0),
(210, 'International Maritime & Aviation', 'I0011', '', '', '2018-03-15 14:54:13', 0),
(211, 'International Maritime & Aviation (Ksh)', 'I0004', '', '', '2018-03-15 14:54:13', 0),
(212, 'International Maritime Aviation (Inactive)', 'I0009', '04 398 7117', '', '2018-03-15 14:54:13', 0),
(213, 'International Register of Certified Auditors', 'I0028', '+44 0 20 7245 6833', '', '2018-03-15 14:54:13', 0),
(214, 'Isinya Resorts Limited', 'I0023', '+254202310980', 'P051342232O', '2018-03-15 14:54:13', 0),
(215, 'Island Auto Works', 'I0019', '0719 786 786', 'P051444842C', '2018-03-15 14:54:13', 0),
(216, 'Island Tyres & Automart Ltd', 'I0001', '041 2494980', 'P051166177H', '2018-03-15 14:54:13', 0),
(217, 'IVK Manuport Logistics LLC-USD', 'I0031', '', '', '2018-03-15 14:54:13', 0),
(218, 'Ivory Software Ltd-Usd', 'I0032', '0720 224918', '', '2018-03-15 14:54:13', 0),
(219, 'Ivory Technologies', 'I0015', '0734 391762', '', '2018-03-15 14:54:13', 0),
(220, 'iWay Africa Kenya Ltd', 'I0012', '', '', '2018-03-15 14:54:13', 0),
(221, 'JAAMBO FREIGHT', 'J0005', '', '', '2018-03-15 14:54:13', 0),
(222, 'Jaffery Motors', 'J0012', '2226604', '', '2018-03-15 14:54:13', 0),
(223, 'Jafftek Computer Solutions usd', 'J0006', '', '', '2018-03-15 14:54:13', 0),
(224, 'Jans Trading Japan', 'J0003', '', '', '2018-03-15 14:54:13', 0),
(225, 'Jathii Enterprises ', 'J0001', '', '', '2018-03-15 14:54:13', 0),
(226, 'Jetvin Ltd', 'J0014', '0724 879270', 'P051530415N', '2018-03-15 14:54:13', 0),
(227, 'Jihan Freighters Ltd', 'J0013', '2227093', 'P051099809K', '2018-03-15 14:54:13', 0),
(228, 'JIWANI IMPEX LIMITED', 'J0004', '', '', '2018-03-15 14:54:13', 0),
(229, 'Joash M . Orina', 'J0010', '', '', '2018-03-15 14:54:13', 0),
(230, 'Jobs Connection Limited', 'J0008', '', '', '2018-03-15 14:54:13', 0),
(231, 'Jomki  Enterprises Ship Contractors', 'J0002', '', '', '2018-03-15 14:54:13', 0),
(232, 'Jona Pestcon', 'J0007', '', '', '2018-03-15 14:54:13', 0),
(233, 'Josim Agencies Limited', 'J0011', '0725283299', '', '2018-03-15 14:54:13', 0),
(234, 'Joweb Graphic Designers', 'J0016', '+254-20-2302017', 'A003648695T', '2018-03-15 14:54:13', 0),
(235, 'Joyden Enterprises', 'J0009', '2495325', '', '2018-03-15 14:54:13', 0),
(236, 'Julius Okoth Francis', 'J0015', '', 'A001279816U', '2018-03-15 14:54:13', 0),
(237, 'Karigithu Kinyua & Co. Advocates', 'K0001', '2220909/', 'P051184901P', '2018-03-15 14:54:13', 0),
(238, 'KASL', 'K0010', '', '', '2018-03-15 14:54:13', 0),
(239, 'KAWSAR AUTO SPARES LTD', 'K0009', '', '', '2018-03-15 14:54:13', 0),
(240, 'Kebba Holdings Ltd', 'K0028', '0706 223153', 'P051437328G', '2018-03-15 14:54:13', 0),
(241, 'Keldex Enterprises Ltd', 'K0014', '+254727247137', 'P051427327E', '2018-03-15 14:54:13', 0),
(242, 'KEMA (E.A) Ltd', 'K0019', '041 2492837', 'P051095678P', '2018-03-15 14:54:13', 0),
(243, 'Kenya Airways Ltd(KAHL)', 'K0005', '', '', '2018-03-15 14:54:13', 0),
(244, 'Kenya Ferry Services Ltd', 'K0004', '2226220/', '', '2018-03-15 14:54:13', 0),
(245, 'Kenya Institute of Management', 'K0021', '020 2445555', '', '2018-03-15 14:54:13', 0),
(246, 'Kenya Marine Contractors (EPZ) Ltd ', 'K0002', '+254 20 2381040', '', '2018-03-15 14:54:13', 0),
(247, 'Kenya Maritime Authority', 'K0013', '', '', '2018-03-15 14:54:13', 0),
(248, 'Kenya National Chamber of Commerce & Industry', 'K0030', '0721373373', 'P051453668U', '2018-03-15 14:54:13', 0),
(249, 'Kenya National Shipping Line Ltd', 'K0006', '', '', '2018-03-15 14:54:13', 0),
(250, 'Kenya Orient Insurance Ltd', 'K0029', '', 'P000609360C', '2018-03-15 14:54:13', 0),
(251, 'Kenya port Authority', 'K0003', '+254 11 312211', 'P051094522S', '2018-03-15 14:54:13', 0),
(252, 'Kenya Ports Authority', 'K0012', '254 11 312211', 'P051094522S', '2018-03-15 14:54:13', 0),
(253, 'Kenya Red cross Society EMS ', 'K0020', '0725 292 000', 'P051111931F', '2018-03-15 14:54:13', 0),
(254, 'Kenya Shippers Council', 'K0018', '+254 20 2684799/801', '', '2018-03-15 14:54:13', 0),
(255, 'KENYA SHIPS AGENT ASSOCIATION', 'K0011', '', '', '2018-03-15 14:54:13', 0),
(256, 'KenyaWeb.Com Limited', 'K0007', '', '', '2018-03-15 14:54:13', 0),
(257, 'Ketty Tours', 'K0015', '', '', '2018-03-15 14:54:13', 0),
(258, 'Ketty Tours, Travels & Safaris Ltd', 'K0016', '', '', '2018-03-15 14:54:13', 0),
(259, 'Keyun Hauliers Ltd', 'K0026', '0729 643448', 'P051565294U', '2018-03-15 14:54:13', 0),
(260, 'Kimlan Management Ltd', 'K0024', '+254 0721 234013', '', '2018-03-15 14:54:13', 0),
(261, 'Kingsway Tyres Ltd', 'K0022', '041 2491013', '', '2018-03-15 14:54:13', 0),
(262, 'Kiragu & Mwangi Ltd ', 'K0017', '4452581/2/3', 'P051094719W', '2018-03-15 14:54:13', 0),
(263, 'Kismart Aluminium Fabrications', 'K0025', '+254 020 8053119', '', '2018-03-15 14:54:13', 0),
(264, 'Kivunzi (K) Ltd', 'K0023', '0708 898735', 'P051407674O', '2018-03-15 14:54:13', 0),
(265, 'KK Facilities Management Ltd', 'K0027', '', 'P051119652E', '2018-03-15 14:54:13', 0),
(266, 'KW Design', 'K0008', '', '', '2018-03-15 14:54:13', 0),
(267, 'L L & L Enterprises', 'L0006', '', '', '2018-03-15 14:54:13', 0),
(268, 'Laminate and Interiors Masters', 'L0015', '0795 502697', 'A003709706B', '2018-03-15 14:54:13', 0),
(269, 'Lamwo General Engineering Works Ltd', 'L0012', '+254 0726 741201', '168884J', '2018-03-15 14:54:13', 0),
(270, 'Land & Marine Publications Ltd', 'L0010', '+44(0)1206752902', '', '2018-03-15 14:54:13', 0),
(271, 'Lantech Data Services Ltd', 'L0013', '+254 020 243 5477', '', '2018-03-15 14:54:13', 0),
(272, 'Lan-X Africa Ltd', 'L0007', '020 2166058', '', '2018-03-15 14:54:13', 0),
(273, 'Lapid Logistics Limited', 'L0002', '', '', '2018-03-15 14:54:13', 0),
(274, 'Lapid Logistics Ltd Usd', 'L0004', '', '', '2018-03-15 14:54:13', 0),
(275, 'Lenga Afri Ltd - KES', 'L0018', '+254 716 304 680', 'P051667772Z', '2018-03-15 14:54:13', 0),
(276, 'Lenga Afri Ltd - USD', 'L0017', '+254 716 304 680', 'P051667772Z', '2018-03-15 14:54:13', 0),
(277, 'Leopard Beach Resort & Spa', 'L0011', '+254-20 2692844', '', '2018-03-15 14:54:13', 0),
(278, 'Lesus Executive Ltd', 'L0016', '0718708771', 'P051569349W', '2018-03-15 14:54:13', 0),
(279, 'Lexis Guest House', 'L0003', '0723268332', '', '2018-03-15 14:54:13', 0),
(280, 'Lifting Equipment Co. Ltd', 'L0001', ' (254-41)2220267', 'P000619655J', '2018-03-15 14:54:13', 0),
(281, 'Logistics Three Sixty Five Ltd', 'L0009', '+254 (20) 50572/3/4', '', '2018-03-15 14:54:13', 0),
(282, 'Louise Dreyfus Commodities K. Ltd C/O Baba Shippin', 'L0008', '+254722897006', '', '2018-03-15 14:54:13', 0),
(283, 'Loxera Advisory Services Ltd', 'L0014', '0700-310906', 'P051368522F', '2018-03-15 14:54:13', 0),
(284, 'Mac & More Solutions Ltd', 'M0050', '+254 20 4452088', 'P051213088B', '2018-03-15 14:54:13', 0),
(285, 'Mali World Ltd', 'M0045', '', '', '2018-03-15 14:54:13', 0),
(286, 'Manken Geohydrotech Consultants', 'M0016', '0722796171', 'A001285084W', '2018-03-15 14:54:13', 0),
(287, 'MANPOWER SERVICES (K) LTD', 'M0040', '2710550', 'P051111229E', '2018-03-15 14:54:13', 0),
(288, 'Manson Hotel', 'M0014', '', '', '2018-03-15 14:54:13', 0),
(289, 'Mantrac  Kenya  Ltd (Ksh)', 'M0034', '041 2223442', 'P000591111Y', '2018-03-15 14:54:13', 0),
(290, 'Mantrac Kenya Ltd (Usd)', 'M0032', '041 2223442', 'P000591111Y', '2018-03-15 14:54:13', 0),
(291, 'Manuchar Kenya Ltd', 'M0024', '+254 20 6005282', 'P051334120M', '2018-03-15 14:54:13', 0),
(292, 'Manuchar...........', 'M0015', '', '', '2018-03-15 14:54:13', 0),
(293, 'ManucharMNV', 'M0004', '', '', '2018-03-15 14:54:13', 0),
(294, 'Marajani Communications Tours and Assistance Ltd', 'M0043', '+254 733 954949', 'P051149812A', '2018-03-15 14:54:13', 0),
(295, 'Marine Spectrum Inspection Company', 'M0035', '020 8187211', '', '2018-03-15 14:54:13', 0),
(296, 'Marines Car Hire Ltd', 'M0048', '0722410354', 'P051342568F', '2018-03-15 14:54:13', 0),
(297, 'MASTERPIECE COURIER SERVICES LTD', 'M0018', '020-2640240', '', '2018-03-15 14:54:13', 0),
(298, 'MaxSmith Group Ltd', 'M0036', '+254-718-860-470', '', '2018-03-15 14:54:13', 0),
(299, 'Mbukoni Logistics Limited', 'M0023', '', '', '2018-03-15 14:54:13', 0),
(300, 'Metalic Ship and General Contractors', 'M0028', '', '', '2018-03-15 14:54:13', 0),
(301, 'Michimedia Limited', 'M0037', '020 8077180', 'P051158326Z', '2018-03-15 14:54:13', 0),
(302, 'Milele Beach Resort', 'M0008', '0729403649', 'P051099353L', '2018-03-15 14:54:13', 0),
(303, 'MISSION TO SEA MEN XXXXXXXXXXX', 'M0021', '', '', '2018-03-15 14:54:13', 0),
(304, 'Mission to seamen Entertainment ', 'M0005', '', '', '2018-03-15 14:54:13', 0),
(305, 'Mivumoni Secondary School', 'M0026', '', '', '2018-03-15 14:54:13', 0),
(306, 'Mjshabiby Enterprises', 'M0010', '0723-598038', 'A002754982J', '2018-03-15 14:54:13', 0),
(307, 'Modern Fitness Gym, Nyali Centre', 'M0039', '+254 708 748 474', 'P051525790R', '2018-03-15 14:54:13', 0),
(308, 'Mohammed Ahmed Abdalla', 'M0013', '', '', '2018-03-15 14:54:13', 0),
(309, 'Mombasa Canvas', 'M0019', '2315640', 'P000621116Y', '2018-03-15 14:54:13', 0),
(310, 'Mombasa Continental Resort', 'M0031', '', '', '2018-03-15 14:54:13', 0),
(311, 'Mombasa Fresh Water Supplier', 'M0006', '', '', '2018-03-15 14:54:13', 0),
(312, 'Mombasa Shipchandlers Ltd', 'M0049', '', 'P051137078G', '2018-03-15 14:54:13', 0),
(313, 'Mombasa Sports Club', 'M0027', '', 'P051092224N', '2018-03-15 14:54:13', 0),
(314, 'Motown Engineering Works Limited', 'M0022', '', '', '2018-03-15 14:54:13', 0),
(315, 'MOTOWN ENGINEERING WORKS LTD', 'M0020', '', '', '2018-03-15 14:54:13', 0),
(316, 'mozart Business Solution', 'M0017', '', '', '2018-03-15 14:54:13', 0),
(317, 'MTN Business (K) Ltd', 'M0001', '+254 (20)698-8000', 'P051138876Z', '2018-03-15 14:54:13', 0),
(318, 'Multiple ICD (Kenya) Limited', 'M0038', '020 231 77 82', 'P051232338S', '2018-03-15 14:54:13', 0),
(319, 'Multiple Solutions Ltd', 'M0029', '+254 20 8017584', '', '2018-03-15 14:54:13', 0),
(320, 'Muthaiga Golf Club', 'M0047', '020-2368440/1', 'P000606864F', '2018-03-15 14:54:13', 0),
(321, 'Muturi Gakuo & Kibara Advocates', 'M0042', '041-2313418', 'P051123447Q', '2018-03-15 14:54:13', 0),
(322, 'Mvita  Freight  Ltd', 'M0030', '041 2315844', 'P051232751V', '2018-03-15 14:54:13', 0),
(323, 'Mvita Freight Ltd', 'M0025', '254 41 2315844', '', '2018-03-15 14:54:13', 0),
(324, 'Mvuli House, Nairobi', 'M0033', '+254 20 600 8052', '', '2018-03-15 14:54:13', 0),
(325, 'MWACHEO SHIP CONTRACTORS', 'M0041', '0724 174 180', '', '2018-03-15 14:54:13', 0),
(326, 'Mwacheo Ship Contractors', 'M0044', '', '', '2018-03-15 14:54:13', 0),
(327, 'MYSSA General Suppliers & Contractors', 'M0002', ' 0721 400 824', '', '2018-03-15 14:54:13', 0),
(328, 'Myssa General Suppliers & Contractors', 'M0007', '', '', '2018-03-15 14:54:13', 0),
(329, 'MZ Radiators (MSA) Ltd', 'M0046', '', 'P051650227W', '2018-03-15 14:54:13', 0),
(330, 'Nairobi Serena Hotel', 'N0015', '+254 20 2822000', '', '2018-03-15 14:54:13', 0),
(331, 'Najmi Clearing & Forwarding ', 'N0013', '', '', '2018-03-15 14:54:13', 0),
(332, 'Nat Fire Company', 'N0009', '', '', '2018-03-15 14:54:13', 0),
(333, 'Nation Media Group LTD', 'N0001', '+2540412225479', '', '2018-03-15 14:54:13', 0),
(334, 'Nation Media Group Ltd', 'N0011', '32088000/1/2/3', '', '2018-03-15 14:54:13', 0),
(335, 'Navcom Ltd', 'N0018', '+254 (020) 3873510', 'P000614755Y', '2018-03-15 14:54:13', 0),
(336, 'Neptune Ship Contractors', 'N0012', '', '', '2018-03-15 14:54:13', 0),
(337, 'Next Level Valuers & Property Consultants', 'N0005', '0722764636', '', '2018-03-15 14:54:13', 0),
(338, 'NIBEATO AUTO WORKS LTD', 'N0004', '0723691295', '', '2018-03-15 14:54:13', 0),
(339, 'NICHOLAS SHIPPING SA', 'N0006', '', '', '2018-03-15 14:54:13', 0),
(340, 'Nicholson Shipping SA', 'N0007', '', '', '2018-03-15 14:54:13', 0),
(341, 'Nine One One Group Ltd', 'N0014', '+ 254 20 4911000', 'P051099772S', '2018-03-15 14:54:13', 0),
(342, 'Nisomar Ltd', 'N0019', '', 'P051627477X', '2018-03-15 14:54:13', 0),
(343, 'North Coast Beach Hotel ', 'N0010', '020 2037784', '', '2018-03-15 14:54:13', 0),
(344, 'November Sixty Two Ltd', 'N0017', '+254 0725095056', '', '2018-03-15 14:54:13', 0),
(345, 'Nueva  Direction', 'N0008', '', '', '2018-03-15 14:54:13', 0),
(346, 'Nyali Airconditioning & Refrigration services Ltd', 'N0003', '231 5503', '', '2018-03-15 14:54:13', 0),
(347, 'NYALI GOLF AND COUNTRY CLUB', 'N0002', '', '', '2018-03-15 14:54:13', 0),
(348, 'Nyali International Beach Hotel', 'N0016', '', '', '2018-03-15 14:54:13', 0),
(349, 'OAKWOOD Consulting-KES', 'O0018', '0723726694', 'N/A', '2018-03-15 14:54:13', 0),
(350, 'OAKWOOD Consulting-USD', 'O0017', '0723726694', 'N/A', '2018-03-15 14:54:13', 0),
(351, 'Occupational Safety and Health Fund', 'O0013', '+ 254 (041) 2312031', '', '2018-03-15 14:54:13', 0),
(352, 'Oceanfreight E.A Ltd', 'O0001', ' 2223446', 'P000621296U', '2018-03-15 14:54:13', 0),
(353, 'Oceanfreight EA Limited', 'O0002', '', '', '2018-03-15 14:54:13', 0),
(354, 'Office Mart Ltd', 'O0007', '', '', '2018-03-15 14:54:13', 0),
(355, 'Officeline Trading', 'O0006', '', '', '2018-03-15 14:54:13', 0),
(356, 'Ole-Sereni Hotel', 'O0008', '+254 203901000', '', '2018-03-15 14:54:13', 0),
(357, 'Olunzi Marine services', 'O0009', '+254 725 141 864', '', '2018-03-15 14:54:13', 0),
(358, 'Opal Asia Line India PVT Ltd', 'O0016', '', 'N/A', '2018-03-15 14:54:13', 0),
(359, 'Oriel Limited', 'O0003', '041 470753', 'P051096223W', '2018-03-15 14:54:13', 0),
(360, 'Oriental Business Paradise', 'O0004', '0726 675 904', 'P051115801L', '2018-03-15 14:54:13', 0),
(361, 'Orima & Company Advocates', 'O0014', '+256 (0) 392 179 040', '', '2018-03-15 14:54:13', 0),
(362, 'Orway Maritime ', 'O0011', '35482011', '', '2018-03-15 14:54:13', 0),
(363, 'Orway Maritime Services - USD', 'O0010', '35482011', '', '2018-03-15 14:54:13', 0),
(364, 'Orway Maritime Services - USD', 'O0019', '+254723942023', '', '2018-03-15 14:54:13', 0),
(365, 'Otieno-Adede Associates', 'O0015', '+254 41 2225172', 'A001197447T', '2018-03-15 14:54:13', 0),
(366, 'Overdrive Consultants Ltd', 'O0012', '+ 254 41 2226647/6403', 'P051520042Z', '2018-03-15 14:54:13', 0),
(367, 'P.N MASHRU LIMITED', 'P0019', '020 - 2040526/7', '', '2018-03-15 14:54:13', 0),
(368, 'Pacco Motors', 'P0015', '0722-803 849', '', '2018-03-15 14:54:13', 0),
(369, 'Pan Africa Express Transport Ltd', 'P0016', '+254 20 3907000', '', '2018-03-15 14:54:13', 0),
(370, 'Panal Freighters Limited-USD', 'P0012', '+254 538 015 353', 'P051148463G', '2018-03-15 14:54:13', 0),
(371, 'Panal Freighters Ltd-KES', 'P0026', '+254 538 015 353', 'P051148463G', '2018-03-15 14:54:13', 0),
(372, 'Panca Anggerik SDN BHD', 'P0010', '', '', '2018-03-15 14:54:13', 0),
(373, 'Parkerflash Creations Ltd', 'P0027', '254721797643', '', '2018-03-15 14:54:13', 0),
(374, 'PAUL NKOLA', 'P0007', '', '', '2018-03-15 14:54:13', 0),
(375, 'Pepe Art', 'P0013', '+254 725 088285', '', '2018-03-15 14:54:13', 0),
(376, 'Perfect Scan ltd', 'P0005', '020 2648286', 'P051176232U', '2018-03-15 14:54:13', 0),
(377, 'Personal Systems Nairobi Ltd', 'P0004', '0737333470', 'P051173268A', '2018-03-15 14:54:13', 0),
(378, 'Petro Oil Kenya Ltd', 'P0001', '041-2315461/', 'P051135956F', '2018-03-15 14:54:13', 0),
(379, 'PG Bison Kenya Ltd', 'P0024', '+254 20 2378902', '', '2018-03-15 14:54:13', 0),
(380, 'Phanry Enterprises', 'P0008', '', '', '2018-03-15 14:54:13', 0),
(381, 'Philomu Mapping Services', 'P0017', '0720 279 960', 'A003841632N', '2018-03-15 14:54:13', 0),
(382, 'PIL K Limited', 'P0011', '', '', '2018-03-15 14:54:13', 0),
(383, 'PKF Kenya', 'P0003', '+254 41 2226422/3', 'P051130467R', '2018-03-15 14:54:13', 0),
(384, 'Polimax Services Limited', 'P0021', '0727 618869', 'P051389997I', '2018-03-15 14:54:13', 0),
(385, 'Polucon Services (Kenya) Ltd', 'P0020', '254-41-4470777/3/4', '', '2018-03-15 14:54:13', 0),
(386, 'Port Management Association of Eastern & Southern ', 'P0023', '+254 20 238 1184', '', '2018-03-15 14:54:13', 0),
(387, 'Postal Corporation of Kenya', 'P0025', '', 'P051128734A', '2018-03-15 14:54:13', 0),
(388, 'PowerPoint Systems East Africa Ltd ', 'P0022', '020 6530260', '', '2018-03-15 14:54:13', 0),
(389, 'Prideinn Hotels & Investments Ltd', 'P0018', '+ 254 41 2317895', '', '2018-03-15 14:54:13', 0),
(390, 'Probranding Ventures', 'P0002', '254 721 100178', '', '2018-03-15 14:54:13', 0),
(391, 'Process Express International', 'P0009', '', '', '2018-03-15 14:54:13', 0),
(392, 'Project Cargo Network', 'P0014', '+44 2392 425204', '', '2018-03-15 14:54:13', 0),
(393, 'Protecting & Indemnity K Ltd', 'P0006', '', '', '2018-03-15 14:54:13', 0),
(394, 'Rabaria Communications', 'R0015', '', '', '2018-03-15 14:54:13', 0),
(395, 'Radisson Blu Hotels & Resorts', 'R0008', '', 'P051179504Z', '2018-03-15 14:54:13', 0),
(396, 'Raphael Logistics T Ltd', 'R0010', '', '', '2018-03-15 14:54:13', 0),
(397, 'Rapid Kate Services Ltd', 'R0009', '020 551896/897', '', '2018-03-15 14:54:13', 0),
(398, 'Ree J\'s  Ltd (Usd)', 'R0012', '0728 445688', '', '2018-03-15 14:54:13', 0),
(399, 'Ree J\'s Ltd', 'R0002', '0728-445688', 'P051146293G', '2018-03-15 14:54:13', 0),
(400, 'Ree Js Ltd XXXXXXXXXXXXXXXXXXX', 'R0013', '', '', '2018-03-15 14:54:13', 0),
(401, 'Reed Events Management (PTY) Ltd', 'R0016', '011 549 8300', '1983/008778/07', '2018-03-15 14:54:13', 0),
(402, 'Reflex Printers Ltd', 'R0018', '', '', '2018-03-15 14:54:13', 0),
(403, 'Resolution Insurance Company Ltd', 'R0011', '+254 20 2894 000', 'P051150885Z', '2018-03-15 14:54:13', 0),
(404, 'Roanna Marine Services', 'R0003', '(254-020)354201', 'A 00127652N', '2018-03-15 14:54:13', 0),
(405, 'Roanna Marine Services (Usd)', 'R0014', '+254 020 354201', '', '2018-03-15 14:54:13', 0),
(406, 'Rollard Tours & Car Rental Ltd', 'R0020', '+ 254-041-2221657', '', '2018-03-15 14:54:13', 0),
(407, 'Romageco K Ltd', 'R0005', '', '', '2018-03-15 14:54:13', 0),
(408, 'Royal Court Hotel (Ksh)', 'R0001', '041 222379', 'P051106160S', '2018-03-15 14:54:13', 0),
(409, 'ROYAL COURT HOTEL(Ksh) XXXXXXXXXXXX', 'R0007', '2223379', '', '2018-03-15 14:54:13', 0),
(410, 'RSM (Eastern Africa) Consulting Ltd', 'R0017', '+256 (0) 414 342 780/9', '1005172863', '2018-03-15 14:54:13', 0),
(411, 'Ruman Shipcontractors (USD)', 'R0004', '020 354820', 'P051183732S', '2018-03-15 14:54:13', 0),
(412, 'Ruman shipcontractors Limited', 'R0006', '0254-020-3548201', '', '2018-03-15 14:54:13', 0),
(413, 'Sadena Agencies Ltd', 'S0002', '020 2039108', 'P051245190F', '2018-03-15 14:54:13', 0),
(414, 'Safaricom Limited', 'S0005', '041 2223911', '', '2018-03-15 14:54:13', 0),
(415, 'Safetrac Ltd', 'S0059', '0716 291 813', 'P051597426P', '2018-03-15 14:54:13', 0),
(416, 'Safmarine Kenya Limited', 'S0025', '', '', '2018-03-15 14:54:13', 0),
(417, 'Samco Holdings Ltd T/A EKA Hotel', 'S0045', '0719 045 000', 'PO51097146E', '2018-03-15 14:54:13', 0),
(418, 'San Valencia Ltd', 'S0049', '0412312399', 'P051189925J', '2018-03-15 14:54:13', 0),
(419, 'SAROVA WHITE SANDS HOTEL', 'S0022', '+254412128000', 'P000608996S', '2018-03-15 14:54:13', 0),
(420, 'Satguru Travels & Tours Services', 'S0050', '', 'P000599474Q', '2018-03-15 14:54:13', 0),
(421, 'Satguru Travels & Tours Services Ltd (Usd)', 'S0051', '+254-41-2220337/8/9', 'P000599474Q', '2018-03-15 14:54:13', 0),
(422, 'Scanwell Logistics (china)co. ltd(Guangzhou Branch', 'S0015', '', '', '2018-03-15 14:54:13', 0),
(423, 'Scanwell Logistics (CMH)', 'S0006', '', '', '2018-03-15 14:54:13', 0),
(424, 'Scanwell Logistics HK Ltd', 'S0007', '', '', '2018-03-15 14:54:13', 0),
(425, 'Scanwell Logistics India PVT Ltd-Bangalore ', 'S0033', '', '', '2018-03-15 14:54:13', 0),
(426, 'Scanwell Logistics NYC inc', 'S0029', '', '', '2018-03-15 14:54:13', 0),
(427, 'Scanwell Logistics Pakistan (PVT) Ltd', 'S0030', '', '', '2018-03-15 14:54:13', 0),
(428, 'Scanwell Logistics Spain', 'S0008', '', '', '2018-03-15 14:54:13', 0),
(429, 'Sea-Bulk Shipping Services Ltd', 'S0041', '+254-412222972 ', 'P051096086L', '2018-03-15 14:54:13', 0),
(430, 'Seaforth Shipping (Kenya) Ltd', 'S0031', '', '', '2018-03-15 14:54:13', 0),
(431, 'Seaforth Shipping (Kenya) Ltd', 'S0035', '+254 41 231 3776', '', '2018-03-15 14:54:13', 0),
(432, 'Seatrade Agencies Ltd', 'S0053', '+254 41 2311491', '', '2018-03-15 14:54:13', 0),
(433, 'Send It Africa Logistics', 'S0028', '', '', '2018-03-15 14:54:13', 0),
(434, 'Sentrim Hotels & Lodges', 'S0037', '020 315680', '', '2018-03-15 14:54:13', 0),
(435, 'Serena Beach Hotel & Spar', 'S0039', '+ 254 41 5485721/2/3/4', '', '2018-03-15 14:54:13', 0),
(436, 'SGL Universal (Guangzhou) Co Ltd', 'S0032', '', '', '2018-03-15 14:54:13', 0),
(437, 'SGS Kenya Limited-KES', 'S0038', '020 2733693/99/90', 'P000618406U', '2018-03-15 14:54:13', 0),
(438, 'SGS Kenya Ltd (Usd)', 'S0048', '020 2733693/99/90', '', '2018-03-15 14:54:13', 0),
(439, 'Shake Distributors Ltd', 'S0055', '043-30047', 'P051194701Z', '2018-03-15 14:54:13', 0),
(440, 'Shanghai Janus Grab Company Ltd (Usd)', 'S0056', '+86-21-68855558', '', '2018-03-15 14:54:13', 0),
(441, 'Shanghai Janus Grab Company LtdXXXXXXXXXXXXXXX', 'S0054', '+86-21-68855558', '', '2018-03-15 14:54:13', 0),
(442, 'Shanghai Qifan Co.Ltd', 'S0016', '', '', '2018-03-15 14:54:13', 0),
(443, 'Shanifreight Logistics ', 'S0042', '', '', '2018-03-15 14:54:13', 0),
(444, 'Shankar Electronics Ltd', 'S0052', '', '', '2018-03-15 14:54:13', 0),
(445, 'Shikara Limited ', 'S0044', '041 2224333', 'P051184035Q', '2018-03-15 14:54:13', 0),
(446, 'Shine Travels & Cargo PVT Ltd', 'S0009', '', '', '2018-03-15 14:54:13', 0),
(447, 'Shipbrokers Register', 'S0010', '', '', '2018-03-15 14:54:13', 0),
(448, 'Signon Freight Ltd', 'S0021', '', '', '2018-03-15 14:54:13', 0),
(449, 'Six Eighty Hotel', 'S0003', '(02) 315000', 'P000595575K', '2018-03-15 14:54:13', 0),
(450, 'Smart Force Trade Ltd', 'S0004', '2495754', 'P051203411E', '2018-03-15 14:54:13', 0),
(451, 'Smart Skills Trainers Ltd', 'S0043', '020-2538634', '', '2018-03-15 14:54:13', 0),
(452, 'Snow Desert (EA) Ltd', 'S0057', '020 2612558', 'P051400822M', '2018-03-15 14:54:13', 0),
(453, 'Somco Books & Stationers', 'S0036', '0722 847921', '', '2018-03-15 14:54:13', 0),
(454, 'Soundboard Consulting Associates', 'S0060', '', 'P051355715Y', '2018-03-15 14:54:13', 0),
(455, 'Sovereign Logistics Ltd-KES', 'S0023', '041 2229784', 'P051372811P', '2018-03-15 14:54:13', 0),
(456, 'Sovereign Logistics Ltd-USD', 'S0046', '+254 41 2229784', '', '2018-03-15 14:54:13', 0),
(457, 'Spaceman Information Technology', 'S0013', '0700111499', 'P051585201Z', '2018-03-15 14:54:13', 0),
(458, 'Stan consulting Group Ltd (Ksh)', 'S0034', '', '', '2018-03-15 14:54:13', 0),
(459, 'Stan Equipment & Logistics Services Ltd', 'S0001', '2223186/7', 'P051172959E', '2018-03-15 14:54:13', 0),
(460, 'Starwis ship contractors& eng.ltd', 'S0017', '', '', '2018-03-15 14:54:13', 0),
(461, 'Summerdale Inn', 'S0047', '', 'P051215355B', '2018-03-15 14:54:13', 0),
(462, 'Sun Fire & Safety Supplies Ltd', 'S0040', '', '', '2018-03-15 14:54:13', 0),
(463, 'SUNRISE RESORT', 'S0027', '', '', '2018-03-15 14:54:13', 0),
(464, 'Super First Forwarders', 'S0011', '', '', '2018-03-15 14:54:13', 0),
(465, 'Superstar Parcels Ltd', 'S0058', '020 353 5465', 'P051234295G', '2018-03-15 14:54:13', 0),
(466, 'Suppliers Magnate', 'S0012', '', '', '2018-03-15 14:54:13', 0),
(467, 'Swissport Cargo Services', 'S0014', '', '', '2018-03-15 14:54:13', 0),
(468, 'Tanzania Ports Authority ', 'T0025', '', '', '2018-03-15 14:54:13', 0),
(469, 'Tariq Khan & Associates Advocates', 'T0032', '+254 0200727724494', '', '2018-03-15 14:54:13', 0),
(470, 'Taxwise Africa Consulting LLP', 'T0038', '', 'P051574842J', '2018-03-15 14:54:13', 0),
(471, 'Techbiz  Ltd (usd)', 'T0024', '', '', '2018-03-15 14:54:13', 0),
(472, 'Techbiz Ltd  (Ksh)', 'T0022', '', '', '2018-03-15 14:54:13', 0),
(473, 'Techbiz Ltd XXXXXXXXXXXX', 'T0021', '', '', '2018-03-15 14:54:13', 0),
(474, 'Telkom Kenya', 'T0006', '+254 20 4952001/2', 'P051128176G', '2018-03-15 14:54:13', 0),
(475, 'Telwise Networks Systems Ltd', 'T0040', '0723 903737', '', '2018-03-15 14:54:13', 0),
(476, 'Texas Alarms Kenya Ltd ;2011', 'T0007', '472222/', 'P051118168F', '2018-03-15 14:54:13', 0),
(477, 'The Aga Khan Hospital XXXXXXXXXXXX', 'T0016', '', '', '2018-03-15 14:54:13', 0),
(478, 'The Aga Khan Hospital,Mombasa', 'T0018', '231 2953 / 4 / 5', '', '2018-03-15 14:54:13', 0),
(479, 'The Co-operative Insurance Co. (K) Ltd', 'T0003', '2823000', '', '2018-03-15 14:54:13', 0),
(480, 'The Copy Cat Ltd Msa', 'T0002', '020-226701', 'P00597676Q', '2018-03-15 14:54:13', 0),
(481, 'The Docucare Agencies', 'T0001', '020 2171069', 'P051217587P', '2018-03-15 14:54:13', 0),
(482, 'The Grind Group Ltd', 'T0037', '+254 732 885035', 'P051330218I', '2018-03-15 14:54:13', 0),
(483, 'The Institute of Certified Public Secretaries of K', 'T0034', '+ 254 20 3597840/2', '', '2018-03-15 14:54:13', 0),
(484, 'The Kenya Institute of Management', 'T0027', '', '', '2018-03-15 14:54:13', 0),
(485, 'The KK Group of Companies', 'T0039', '+254 20 4245000', 'P051119652E', '2018-03-15 14:54:13', 0),
(486, 'The Mission to Seamen  - KES', 'T0013', '', 'P051092074X', '2018-03-15 14:54:13', 0),
(487, 'The Mission to Seamen (usd)', 'T0014', '', '', '2018-03-15 14:54:13', 0),
(488, 'The Panari Hotel Nairobi', 'T0026', '3946000', '', '2018-03-15 14:54:13', 0),
(489, 'The Ship Brokers\' Register', 'T0017', '', '', '2018-03-15 14:54:13', 0),
(490, 'Tiensi Enterprises ', 'T0045', '+254 720 711057', 'A004813216L', '2018-03-15 14:54:13', 0),
(491, 'Tikone Solutions Ltd', 'T0041', '+254735599509', 'P051585371Q', '2018-03-15 14:54:13', 0),
(492, 'Timcage Enterprises(Msa)', 'T0033', '020 2138050', 'P051370570Y', '2018-03-15 14:54:13', 0),
(493, 'TNT Express Worldwide (K) Ltd', 'T0043', '', 'P051202136L', '2018-03-15 14:54:13', 0),
(494, 'TOYOTA KENYA', 'T0019', '', '', '2018-03-15 14:54:13', 0),
(495, 'Traceble Measurement Centre Ltd', 'T0042', '020 2188235', 'P051434315Q', '2018-03-15 14:54:13', 0),
(496, 'Trade Magnate Limited', 'T0004', '041 2022457/8', 'P051152374V', '2018-03-15 14:54:13', 0),
(497, 'Trainconsult Ltd', 'T0046', '', 'P051454913W', '2018-03-15 14:54:13', 0),
(498, 'Training and Consultancy Associates Ltd', 'T0031', '+254 20 2714206/08', '', '2018-03-15 14:54:13', 0),
(499, 'Transglobal Cargo Centre Ltd', 'T0008', ' +254-(020)827069', '', '2018-03-15 14:54:13', 0),
(500, 'TRANSGLOBAL CARGO CENTRE LTD', 'T0020', '2929000', '', '2018-03-15 14:54:13', 0),
(501, 'Translink Logistics Ltd', 'T0028', '', '', '2018-03-15 14:54:13', 0),
(502, 'Translink Logistics Ltd (Usd)', 'T0029', '', '', '2018-03-15 14:54:13', 0),
(503, 'Transocean Marine Surveyors', 'T0005', '3548201', 'A002059560V', '2018-03-15 14:54:13', 0),
(504, 'Transport Events Management Ltd', 'T0036', '', '', '2018-03-15 14:54:13', 0),
(505, 'Travellers Beach Hotel', 'T0023', '', '', '2018-03-15 14:54:13', 0),
(506, 'Tripple M & Associates ', 'T0035', '041 2319770', '', '2018-03-15 14:54:13', 0),
(507, 'Trubrand Solutions Ltd', 'T0012', '', '', '2018-03-15 14:54:13', 0),
(508, 'Trubrand Solutions Ltd', 'T0015', '', '', '2018-03-15 14:54:13', 0),
(509, 'Tuskys Mattresses Ltd', 'T0044', '+254-20-355-5318', 'P051091887F', '2018-03-15 14:54:13', 0),
(510, 'Two Dots Business Systems', 'T0030', '0723 938719', '', '2018-03-15 14:54:13', 0),
(511, 'Tysons Limited', 'T0010', '', '', '2018-03-15 14:54:13', 0),
(512, 'UK Roadrunner Ltd', 'U0006', '0044 7850064725', '', '2018-03-15 14:54:13', 0),
(513, 'Umma University Trust', 'U0001', '020 2469381/2', 'P051137878Z', '2018-03-15 14:54:13', 0),
(514, 'UNDERWATER ENGINEERING & HARBOURS SERVICES CONT', 'U0003', '', 'A002677774P', '2018-03-15 14:54:13', 0),
(515, 'Unifilters Kenya Ltd', 'U0007', '+254 20 6536418/9', 'P051095256F', '2018-03-15 14:54:13', 0),
(516, 'United Cargo Logistics S.R.L', 'U0004', '', '', '2018-03-15 14:54:13', 0),
(517, 'Universal Forwarding International Freight Specialists', 'U0008', '+44 191 214 0800', '', '2018-03-15 14:54:13', 0),
(518, 'URBAN CARGO NETWORKS', 'U0002', '', '', '2018-03-15 14:54:13', 0),
(519, 'Usafi Services Ltd', 'U0005', '', '', '2018-03-15 14:54:13', 0),
(520, 'UUNET Kenya Ltd', 'W0001', '+2542069 88000', 'P051138876Z', '2018-03-15 14:54:13', 0),
(521, 'Vectocorn Pest Control', 'V0001', '2491531', 'P000621010R', '2018-03-15 14:54:13', 0),
(522, 'Victoria Furnitures Ltd', 'V0005', '020 2650989', 'P000593928Z', '2018-03-15 14:54:13', 0),
(523, 'VIJAY OPTICIANS', 'V0002', '2223813', '', '2018-03-15 14:54:13', 0),
(524, 'Vision Institute of Professionals', 'V0004', '041-2230295', '', '2018-03-15 14:54:13', 0),
(525, 'Visualtech Communication Technologies', 'V0007', '041-2008814', '', '2018-03-15 14:54:13', 0),
(526, 'Vmax Insurance Agencies', 'V0003', '041 - 2226770', '', '2018-03-15 14:54:13', 0),
(527, 'Volcan Holdings Ltd', 'V0006', '+254 020 8087305', 'P051211097V', '2018-03-15 14:54:13', 0),
(528, 'Wamu Hardware & Electrical', 'W0006', '', '', '2018-03-15 14:54:13', 0),
(529, 'Whitesands Beach Resort & Spa', 'W0005', '', 'P000607761D', '2018-03-15 14:54:13', 0),
(530, 'Wilhelmsen Ships Service Ltd', 'W0009', '', '', '2018-03-15 14:54:13', 0),
(531, 'Wilke International Ltd', 'W0003', '', 'P051147656H', '2018-03-15 14:54:13', 0),
(532, 'Wilken Wireless (K)  Ltd', 'W0007', '+254 20 6006030/7', '', '2018-03-15 14:54:13', 0),
(533, 'wilking enterprises ltd', 'W0004', '', '', '2018-03-15 14:54:13', 0),
(534, 'Wilson Kazeni Mkanza', 'W0011', '', 'TIN 112-165-789', '2018-03-15 14:54:13', 0),
(535, 'Woodtex Kenya Ltd', 'W0002', '8076224', 'P000613037L', '2018-03-15 14:54:13', 0),
(536, 'Wylde International Ltd', 'W0008', '+254 701 560 203', '', '2018-03-15 14:54:13', 0),
(537, 'xxxxx', 'K001', '', '', '2018-03-15 14:54:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'custom',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `online_payable` tinyint(1) NOT NULL DEFAULT '0',
  `available_on_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_payment_amount` double NOT NULL DEFAULT '0',
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `type`, `description`, `online_payable`, `available_on_invoice`, `minimum_payment_amount`, `settings`, `deleted`) VALUES
(1, 'Cash', 'custom', 'Cash payments', 0, 0, 0, '', 0),
(2, 'Stripe', 'stripe', 'Stripe online payments', 1, 0, 0, 'a:3:{s:15:\"pay_button_text\";s:6:\"Stripe\";s:10:\"secret_key\";s:6:\"\";s:15:\"publishable_key\";s:6:\"\";}', 0),
(3, 'PayPal Payments Standard', 'paypal_payments_standard', 'PayPal Payments Standard Online Payments', 1, 0, 0, 'a:4:{s:15:\"pay_button_text\";s:6:\"PayPal\";s:5:\"email\";s:4:\"\";s:11:\"paypal_live\";s:1:\"0\";s:5:\"debug\";s:1:\"0\";}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL,
  `transaction_id` tinytext COLLATE utf8_unicode_ci,
  `ipn_hash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ipn_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash`
--

CREATE TABLE `petty_cash` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `petty_cash` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `sage_project_id` int(11) NOT NULL,
  `sage_project` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `petty_cash_types`
--

CREATE TABLE `petty_cash_types` (
  `id` int(11) NOT NULL,
  `name_type` varchar(255) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
<br />
<b>Fatal error</b>:  Maximum execution time of 300 seconds exceeded in <b>C:\xampp\phpMyAdmin\libraries\dbi\DBIMysqli.php</b> on line <b>184</b><br />

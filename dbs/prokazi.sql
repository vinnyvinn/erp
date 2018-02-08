-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 07, 2018 at 01:50 PM
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
(1, '2017-11-30 06:07:19', 5, 'created', 'task', 'time', 8, NULL, 'project', 10, '', 0, 0),
(2, '2017-12-06 09:11:30', 113, 'created', 'task', 'demo bug', 9, NULL, 'project', 11, '', 0, 0),
(3, '2017-12-07 07:41:30', 5, 'created', 'task', 'hgfghgfhgf', 10, NULL, 'project', 11, '', 0, 0);

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

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `status`, `user_id`, `task_id`, `project_id`, `in_time`, `out_time`, `difference`, `checked_by`, `note`, `checked_at`, `reject_reason`, `deleted`) VALUES
(3, 'pending', 5, 3, 8, '2017-11-08 22:00:00', '2017-11-09 10:00:00', '43200', NULL, NULL, NULL, NULL, 0),
(4, 'pending', 89, 3, 8, '2017-11-08 22:00:00', '2017-11-09 06:00:00', '28800', NULL, NULL, NULL, NULL, 0),
(5, 'pending', 89, 3, 8, '2017-11-13 22:00:00', '2017-11-13 23:00:00', '3600', NULL, NULL, NULL, NULL, 0),
(6, 'pending', 5, 6, 10, '2017-11-13 23:00:00', '2017-11-13 21:00:00', '7200', NULL, NULL, NULL, NULL, 0),
(7, 'pending', 89, 6, 10, '2017-11-14 11:00:00', '2017-11-14 08:00:00', '10800', NULL, NULL, NULL, NULL, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_types`
--

INSERT INTO `business_types` (`id`, `title`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Useless', '2018-01-22 10:05:34', NULL, 0),
(2, 'Not Profitable', '2018-01-22 10:05:48', NULL, 0),
(3, 'Good for Nothing', '2018-01-22 10:06:01', NULL, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `call_types`
--

INSERT INTO `call_types` (`id`, `title`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Visit', '2018-01-22 07:38:42', NULL, 0),
(2, 'Phone Call', '2018-01-22 07:38:56', NULL, 0),
(3, 'Email', '2018-01-22 07:39:02', NULL, 0);

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
  `status` enum('Pending','Approved','Disapproved','') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `cOurRef` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `company_name`, `address`, `city`, `state`, `zip`, `country`, `created_date`, `website`, `phone`, `currency_symbol`, `deleted`, `vat_number`, `currency`, `disable_online_payment`, `created_by`, `status`, `description`, `cOurRef`) VALUES
(36, 'mhub', '10100 Nyeri, KE.', 'Nyeri', 'Central', '10100', 'Kenya', '2018-02-06', 'http://www.waguramaurice.cf/', '718837808', '', 0, '', '', 0, 5, 'Approved', 'Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Pellentesque in ipsum id orci porta dapibus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta.', 'IR000005');

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
(1, 'login_info', 'Login details', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi">\n  <h1>Login Details</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style="color: rgb(85, 85, 85); font-size: 14px;"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style="color: rgb(85, 85, 85); font-size: 14px;"> Please use the following info to login your dashboard:</p>            <hr>            <p style="color: rgb(85, 85, 85); font-size: 14px;">Dashboard URL:&nbsp;<a href="{DASHBOARD_URL}" target="_blank">{DASHBOARD_URL}</a></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;"></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style="color: rgb(85, 85, 85);"><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="PRO-KAZI">\n  <h1>Login Details</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style="color: rgb(85, 85, 85); font-size: 14px;"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style="color: rgb(85, 85, 85); font-size: 14px;"> Please use the following info to login your dashboard:</p>            <hr>            <p style="color: rgb(85, 85, 85); font-size: 14px;">Dashboard URL:&nbsp;<a href="{DASHBOARD_URL}" target="_blank">{DASHBOARD_URL}</a></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;"></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style="color: rgb(85, 85, 85);"><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', 0),
(2, 'reset_password', 'Reset password', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Reset Password</h1>\n </div>\n <div style="padding: 20px; background-color: rgb(255, 255, 255); color:#555;">                    <p style="font-size: 14px;"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style="font-size: 14px;"> To initiate the password reset process, please click on the following link:</p>\n                    <p style="font-size: 14px;"><a href="{RESET_PASSWORD_URL}" target="_blank">Reset Password</a></p>\n                    <p style="font-size: 14px;"></p>\n                    <p style=""><span style="font-size: 14px; line-height: 20px;"><br></span></p>\n<p style=""><span style="font-size: 14px; line-height: 20px;">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=""><span style="font-size: 14px; line-height: 20px;">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style="font-size: 14px;"><br></p>\n<p style="font-size: 14px;">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="PRO-KAZI"><h1>Reset Password</h1>\n </div>\n <div style="padding: 20px; background-color: rgb(255, 255, 255); color:#555;">                    <p style="font-size: 14px;"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style="font-size: 14px;"> To initiate the password reset process, please click on the following link:</p>\n                    <p style="font-size: 14px;"><a href="{RESET_PASSWORD_URL}" target="_blank">Reset Password</a></p>\n                    <p style="font-size: 14px;"></p>\n                    <p style=""><span style="font-size: 14px; line-height: 20px;"><br></span></p>\n<p style=""><span style="font-size: 14px; line-height: 20px;">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=""><span style="font-size: 14px; line-height: 20px;">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style="font-size: 14px;"><br></p>\n<p style="font-size: 14px;">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', 0),
(3, 'team_member_invitation', 'You are invited', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Account Invitation</h1>   </div>  <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;"><br></span></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVITATION_URL}" target="_blank">Accept this Invitation</a></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Account Invitation</h1>   </div>  <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;"><br></span></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVITATION_URL}" target="_blank">Accept this Invitation</a></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', 0),
(4, 'send_invoice', 'New invoice', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">  <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=""><span style="font-size: 14px; line-height: 20px;">Thank you for your business cooperation.</span><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=""><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVOICE_URL}" target="_blank">Show Invoice</a></span></p><p style=""><span style="font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="font-size: 14px; line-height: 20px;">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>  </div> </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">  <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=""><span style="font-size: 14px; line-height: 20px;">Thank you for your business cooperation.</span><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=""><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVOICE_URL}" target="_blank">Show Invoice</a></span></p><p style=""><span style="font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="font-size: 14px; line-height: 20px;">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>  </div> </div></div>', 0),
(5, 'signature', 'Signature', '<p>Â© Pro-Kazi. Powered By: <a href="https://wizag.biz/" target="_blank">Wise &amp; Agile Solutions Limited. </a></p>', '<p>Â© Pro-Kazi. Powered By: <a href="https://wizag.biz/" target="_blank">Wise &amp; Agile Solutions Limited. </a></p>', 0),
(6, 'client_contact_invitation', 'You are invited', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Account Invitation</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;"><br></span></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVITATION_URL}" target="_blank">Accept this Invitation</a></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Account Invitation</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;"><br></span></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVITATION_URL}" target="_blank">Accept this Invitation</a></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', 0),
(7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px; font-weight: bold;">Title: {TICKET_TITLE}</span><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;">{TICKET_CONTENT}</span><br></p> <p style=""><br></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p> <p style=""><br></p><p style="">Regards,</p><p style=""><span style="line-height: 18.5714px;">{USER_NAME}</span><br></p>   </div>  </div> </div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px; font-weight: bold;">Title: {TICKET_TITLE}</span><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;">{TICKET_CONTENT}</span><br></p> <p style=""><br></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p> <p style=""><br></p><p style="">Regards,</p><p style=""><span style="line-height: 18.5714px;">{USER_NAME}</span><br></p>   </div>  </div> </div>', 0),
(8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px; font-weight: bold;">Title: {TICKET_TITLE}</span><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;">{TICKET_CONTENT}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p></div></div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px; font-weight: bold;">Title: {TICKET_TITLE}</span><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;">{TICKET_CONTENT}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p></div></div></div>', 0),
(9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Ticket #{TICKET_ID}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style="line-height: 18.5714px;">{USER_NAME}</span></p> <p style=""><br></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p>   </div>  </div> </div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Ticket #{TICKET_ID}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style="line-height: 18.5714px;">{USER_NAME}</span></p> <p style=""><br></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p>   </div>  </div> </div>', 0),
(10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Ticket #{TICKET_ID}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style="line-height: 18.5714px;">{USER_NAME}</span></p><p style=""><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p>  </div> </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>Ticket #{TICKET_ID}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style="line-height: 18.5714px;">{USER_NAME}</span></p><p style=""><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p>  </div> </div></div>', 1),
(11, 'general_notification', '{EVENT_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>{APP_TITLE}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">{EVENT_TITLE}</span></p><p style=""><span style="line-height: 18.5714px;">{EVENT_DETAILS}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;"></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #4f0158; padding: 10px 15px; color: #ffffff;" href="{NOTIFICATION_URL}" target="_blank">View Details</a></span></p>  </div> </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"><h1>{APP_TITLE}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">{EVENT_TITLE}</span></p><p style=""><span style="line-height: 18.5714px;">{EVENT_DETAILS}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;"></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #4f0158; padding: 10px 15px; color: #ffffff;" href="{NOTIFICATION_URL}" target="_blank">View Details</a></span></p>  </div> </div></div>', 1),
(12, 'petty_cash', 'Petty Cash', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;"> <img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"> <h1>PETTY CASH #{PETTY_CASH_ID}</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);"> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=""> <span style="font-size: 14px; line-height: 20px;"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Your Petty Cash Refund Claim Amounting To {PETTY_CASH_AMOUNT}, For {PETTY_CASH_NAME} Requested On {PETTY_CASH_REQUEST_DATE} Has Been Received And {PETTY_CASH_STATUS}. {PETTY_CASH_COMMENT}</span></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p> <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p> </div> </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;"> <img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"> <h1>PETTY CASH #{PETTY_CASH_ID}</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);"> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=""> <span style="font-size: 14px; line-height: 20px;"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Your Petty Cash Refund Claim Amounting To {PETTY_CASH_AMOUNT}, For {PETTY_CASH_NAME} Requested On {PETTY_CASH_REQUEST_DATE} Has Been Received And {PETTY_CASH_STATUS}. {PETTY_CASH_COMMENT}</span></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p> <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p> </div> </div></div>', 0),
(13, 'inventory_requisitions', 'Inventory Requisitions', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;"> <img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"> <h1>INVENTORY REQUISITIONS #{INVENTORY_REQUISITIONS_ID}</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);"> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=""> <span style="font-size: 14px; line-height: 20px;"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Your Inventory Requisite For {INVENTORY_REQUISITIONS_QUANTITY} Out Of The Available {INVENTORY_REQUISITIONS_AVAILABLE} {INVENTORY_REQUISITIONS_NAME} Requested On {INVENTORY_REQUISITIONS_REQUEST_DATE} has been {INVENTORY_REQUISITIONS_STATUS}. {INVENTORY_REQUISITIONS_COMMENT}</span></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p> <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p> </div> </div></div>', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;"> <img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi"> <h1>INVENTORY REQUISITIONS #{INVENTORY_REQUISITIONS_ID}</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);"> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=""> <span style="font-size: 14px; line-height: 20px;"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Your Inventory Requisite For {INVENTORY_REQUISITIONS_QUANTITY} Out Of The Available {INVENTORY_REQUISITIONS_AVAILABLE} {INVENTORY_REQUISITIONS_NAME} Requested On {INVENTORY_REQUISITIONS_REQUEST_DATE} has been {INVENTORY_REQUISITIONS_STATUS}. {INVENTORY_REQUISITIONS_COMMENT}</span></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p> <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p> </div> </div></div>', 0),
(14, 'legal_notification', 'Prokazi Cases', '<div style="background-color: #eeeeef; padding: 50px 0; ">\r\n    <div style="max-width:640px; margin:0 auto; ">\r\n        <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\r\n<img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi">\r\n            <h1>Pro Kazi Case: # {CASE_TITLE}</h1></div>\r\n        <div style="padding: 20px; background-color: rgb(255, 255, 255);">\r\n            <p style=""><span style="line-height: 18.5714px;">Hi {USER_NAME} </span></p>\r\n            <p style=""><span style="line-height: 18.5714px;">You have been added to a legal case </span></p>\r\n            <p style=""><span style="line-height: 18.5714px;">The case is scheduled on  {CASE_DATE}</span></p>\r\n            <p style=""><span style="line-height: 18.5714px;"><br></span></p>\r\n            <p style=""><span style="line-height: 18.5714px;"></span></p>\r\n            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #4f0158; padding: 10px 15px; color: #ffffff;" href="{NOTIFICATION_URL}" target="_blank">View Details</a></span></p>\r\n            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p> </div>\r\n        </div>\r\n    </div>\r\n</div>', '<div style="background-color: #eeeeef; padding: 50px 0; ">\r\n    <div style="max-width:640px; margin:0 auto; ">\r\n        <div style="color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;">\r\n            <img src="http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png" alt="Pro-Kazi">\r\n            <h1>Pro Kazi Case: # {CASE_TITLE}</h1></div>\r\n        <div style="padding: 20px; background-color: rgb(255, 255, 255);">\r\n            <p style=""><span style="line-height: 18.5714px;">Hi {USER_NAME} </span></p>\r\n            <p style=""><span style="line-height: 18.5714px;">You have been added to a legal case </span></p>\r\n            <p style=""><span style="line-height: 18.5714px;">The case is scheduled on  {CASE_DATE}</span></p>\r\n            <p style=""><span style="line-height: 18.5714px;"><br></span></p>\r\n            <p style=""><span style="line-height: 18.5714px;"></span></p>\r\n            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #4f0158; padding: 10px 15px; color: #ffffff;" href="{NOTIFICATION_URL}" target="_blank">View Details</a></span></p>\r\n            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p> </div>\r\n        </div>\r\n    </div>\r\n</div>', 0);

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
(1, 'exiting', '114,113,5,89', '30', NULL, '2017-12-03 13:40:15', NULL, 0),
(2, 'UberX', '114,113,5,89', '30', NULL, '2017-12-03 14:16:12', NULL, 0),
(3, 'test', '114', '30', NULL, '2017-12-03 14:17:54', NULL, 0),
(4, 'test', '5', '30', NULL, '2017-12-03 14:19:01', NULL, 0),
(5, 'y', '5', '30', NULL, '2017-12-03 14:19:45', NULL, 0),
(6, 'UberX', '115', '30', NULL, '2017-12-06 05:56:57', NULL, 0),
(7, 'etdty', '136', '30', NULL, '2017-12-11 00:22:06', NULL, 0),
(8, 'ict team', '115,113,135', '45', NULL, '2017-12-11 15:38:12', NULL, 0);

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

--
-- Dumping data for table `estimates`
--

INSERT INTO `estimates` (`id`, `client_id`, `estimate_request_id`, `estimate_date`, `valid_until`, `note`, `last_email_sent_date`, `status`, `tax_id`, `tax_id2`, `deleted`) VALUES
(1, 1, 0, '2017-03-01', '2017-03-01', '300000', NULL, 'draft', 1, 0, 0);

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
  `client_id` int(11) NOT NULL,
  `prospector_id` int(11) NOT NULL,
  `business_type` int(11) NOT NULL,
  `call_type` int(11) NOT NULL,
  `objective_type` int(11) NOT NULL,
  `pipeline_stage` int(11) NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `start_date`, `end_date`, `start_time`, `end_time`, `created_by`, `location`, `share_with`, `deleted`, `color`, `client_id`, `prospector_id`, `business_type`, `call_type`, `objective_type`, `pipeline_stage`, `files`) VALUES
(22, 'demo', 'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla quis lorem ut libero malesuada feugiat. Donec sollicitudin molestie malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt. Donec sollicitudin molestie malesuada. Proin eget tortor risus. Curabitur aliquet quam id dui posuere blandit. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.', '2018-01-29', '2018-01-29', '01:00:00', '01:00:00', 5, 'Mogadishu', '', 0, '#83c340', 1, 0, 2, 2, 2, 3, 'a:0:{}'),
(23, 'Visit', 'Nulla porttitor accumsan tincidunt. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Cras ultricies ligula sed magna dictum porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat. Quisque velit nisi, pretium ut lacinia in, elementum id enim.', '2018-01-30', '2018-01-30', '01:00:00', '01:00:00', 5, 'Mogadishu', '', 0, '#e74c3c', 2, 0, 2, 2, 2, 6, 'a:2:{i:0;a:2:{s:9:"file_name";s:65:"event_file5a7158f4abd4b-BarHarborCave_ROW9345444229_1920x1080.jpg";s:9:"file_size";s:6:"323434";}i:1;a:2:{s:9:"file_name";s:30:"event_file5a7158f4ac040-fb.jpg";s:9:"file_size";s:5:"12801";}}'),
(24, 'employees', 'fcdvfvfvf', '2018-01-31', '2018-01-31', '13:00:00', '01:05:00', 5, 'Mogadishu', '', 0, '#2d9cdb', 3, 0, 1, 2, 1, 6, 'a:0:{}');

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

--
-- Dumping data for table `event_notes`
--

INSERT INTO `event_notes` (`id`, `created_by`, `created_at`, `title`, `description`, `event_id`, `client_id`, `user_id`, `labels`, `deleted`) VALUES
(7, 5, '2018-01-29 07:46:10', 'demo', 'dxzv cx vcx vcx cx', 21, 0, 0, 'Important', 1),
(8, 5, '2018-01-29 07:46:37', 'employees', 'v cxzvfdsbvfdxsb fd bfcxz', 21, 0, 0, 'Important', 1),
(9, 5, '2018-01-29 13:37:32', 'demo', 'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec rutrum congue leo eget malesuada. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.', 22, 0, 0, 'Important', 1),
(10, 5, '2018-01-29 13:37:50', 'Visit', 'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec rutrum congue leo eget malesuada. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.', 22, 0, 0, 'Important,high', 1),
(11, 5, '2018-01-29 16:18:22', 'Visit', 'ewgefgfedvfedvfdvfdvfdvd', 22, 0, 0, 'Important', 1),
(12, 5, '2018-01-31 05:50:16', 'Visit', 'Nulla porttitor accumsan tincidunt. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Cras ultricies ligula sed magna dictum porta. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat. Quisque velit nisi, pretium ut lacinia in, elementum id enim.', 23, 0, 0, 'Important', 0);

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
-- Table structure for table `inventory_requisitions`
--

CREATE TABLE `inventory_requisitions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_quantity` varchar(255) NOT NULL,
  `StkItem_id` int(11) DEFAULT NULL,
  `item_cost` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `approver_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `inventory_requisitions`
--

INSERT INTO `inventory_requisitions` (`id`, `user_id`, `item_id`, `item_name`, `item_quantity`, `StkItem_id`, `item_cost`, `created_at`, `updated_at`, `status`, `approver_id`, `deleted`) VALUES
(24, 113, 2, 'Mouse', '20', 2, '750', '2017-12-07 18:53:28', '2017-12-07 18:53:28', 'Approved', 0, 0),
(25, 113, 2, 'Mouse', '45', 2, '11250', '2017-12-13 15:06:44', '2017-12-13 15:06:44', 'Disapproved', 0, 0),
(26, 113, 2, 'Mouse', '4', 2, '1000', '2017-12-13 15:08:47', '2017-12-13 15:08:47', 'Disapproved', 0, 0),
(27, 5, 2, 'Mouse', '34', 2, '8500', '2017-12-13 16:21:12', '2017-12-13 16:21:12', 'Disapproved', 0, 0),
(28, 5, 2, 'Mouse', '4', 2, '1000', '2017-12-15 07:07:44', '2017-12-15 07:07:44', 'Disapproved', 0, 0),
(29, 5, 2, 'Blue Ball Point Pen', '34', 2, '0', '2018-02-06 21:00:00', NULL, 'Pending', 0, 0);

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

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `title`, `description`, `quantity`, `unit_type`, `rate`, `total`, `invoice_id`, `deleted`) VALUES
(1, 'hdhjdj', '', 10, 'ets', 5000, 50000, 3, 0);

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

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `leave_type_id`, `start_date`, `end_date`, `total_hours`, `total_days`, `applicant_id`, `reason`, `status`, `created_at`, `created_by`, `checked_at`, `checked_by`, `deleted`) VALUES
(3, 1, '2018-02-14', '2018-03-02', '136.00', '17.00', 146, 'trvhtrvhtrvtr', 'pending', '2018-02-05 12:57:29', 0, '2018-02-05 13:01:07', 146, 0);

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

--
-- Dumping data for table `main_tasks`
--

INSERT INTO `main_tasks` (`id`, `serial`, `title`, `description`, `project_id`, `deleted`) VALUES
(9, 'SN0000', 'demo main task', 'gfy', 14, 0),
(10, 'SN0001', 'employees', 'ugyu', 14, 0),
(11, 'SN0002', 'demo project', 'fd', 15, 0),
(12, 'SN0003', 'demo main 3', 'fd68', 14, 0);

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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `subject`, `message`, `created_at`, `from_user_id`, `to_user_id`, `status`, `message_id`, `deleted`, `files`, `deleted_by_users`) VALUES
(1, 'Project hours', 'My total hours is 0 . how is that possible?', '2017-01-01 10:33:09', 3, 2, 'read', 0, 0, 'a:0:{}', ''),
(2, 'Edit timecard', 'Could you please edit my time cards, \n1. The ones that ended at 05:00 need to end at 17:00\n2. And the one ending at 13:52 was on bulk editing', '2017-01-17 12:42:19', 10, 2, 'read', 0, 0, 'a:0:{}', ''),
(3, 'check tuesday message', 'check tuesday message', '2017-04-18 09:43:42', 7, 2, 'read', 0, 0, 'a:0:{}', ''),
(4, 'test', 'test', '2017-04-22 04:05:31', 6, 2, 'unread', 0, 0, 'a:0:{}', ''),
(5, 'Testing Email', 'rrr', '2017-04-22 04:05:52', 6, 7, 'read', 0, 0, 'a:0:{}', ',7'),
(6, 'status', 'cckvkt', '2017-10-07 08:28:03', 5, 13, 'unread', 0, 0, 'a:0:{}', ''),
(7, 'ok', 'testing', '2017-10-26 18:18:31', 28, 27, 'read', 0, 0, 'a:0:{}', ''),
(8, '', 'ok', '2017-10-26 18:19:04', 27, 28, 'unread', 7, 0, 'a:0:{}', ''),
(9, 'you in', '????????', '2017-10-26 18:19:26', 27, 5, 'read', 0, 0, 'a:0:{}', ''),
(10, 'kiuyt6', 'hi', '2017-10-26 19:31:27', 29, 5, 'read', 0, 0, 'a:0:{}', ''),
(11, '', 'oh now', '2017-10-26 19:31:50', 5, 29, 'unread', 10, 0, 'a:0:{}', ''),
(12, 'kiuyt6', 'poiuyhgf', '2017-10-28 21:10:40', 30, 27, 'unread', 0, 0, 'a:0:{}', ''),
(13, 'kiuyt6', 'poiuyhgf', '2017-10-28 21:10:40', 30, 5, 'read', 0, 0, 'a:0:{}', ''),
(14, '', 'ok', '2017-10-28 21:11:05', 5, 30, 'read', 13, 0, 'a:0:{}', ''),
(15, '', 'demo now', '2017-11-01 08:08:09', 5, 30, 'read', 13, 0, 'a:0:{}', ''),
(16, '', 'ok', '2017-11-01 08:08:35', 30, 5, 'read', 13, 0, 'a:0:{}', '');

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

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `title`, `project_id`, `due_date`, `deleted`) VALUES
(2, 'demo', 11, '2017-11-03', 0);

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

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `created_by`, `created_at`, `title`, `description`, `project_id`, `client_id`, `user_id`, `labels`, `deleted`) VALUES
(1, 7, '2017-01-17 06:51:10', 'Competitor Products', 'We need to check the features available in following major products.\nhttps://www.appfolio.com/features\n\nhttps://www.buildium.com/features/\n\nhttps://www.rentecdirect.com/features\n\nhttps://www.storedge.com/\n\nhttps://www.rentmanager.com/\n\nhttp://www.propertyware.com/\n\nhttp://www.mrisoftware.com/\n\nhttp://www.totalmanagement.com/\n\nhttp://propertyboulevard.com/\n\nhttps://rentpost.com/\n\nhttps://propertymanagercloud.com/\n\nhttp://soft4realestate.com/\n\nhttps://valencepm.com/\n\nhttp://www.softwareadvice.com/property/\n\n\n', 2, 0, 0, '', 0),
(2, 7, '2017-01-17 08:32:28', 'Competitor Products', 'Study the features from following products and compare:\n\nhttp://www.eposnow.com/us/software\n\nhttps://www.lightspeedhq.com/pos/onsite/features/\n\nhttps://www.technology4retailers.com/t-aimsi.aspx\n\nhttps://breadcrumb.com/ipad-point-of-sale-features/\n\nhttp://www.amberpos.com/#\n\nhttp://www.touchbistro.com/features/\n\nhttp://revelsystems.com/features/for-retail/\n\nhttps://www.springboardretail.com/products/\n\nhttps://pos.toasttab.com/pos-system\n\nhttp://www.marketstall.com/edgepos/\n', 4, 0, 0, '', 0),
(3, 6, '2017-03-23 12:43:30', 'Project A', 'Step by step debugging process', 0, 0, 0, 'Debugging', 0),
(4, 7, '2017-04-18 09:42:45', 'test notes tuesday', '', 0, 0, 0, '', 1),
(5, 6, '2017-04-22 04:04:08', 'Meeting Minutes', 'We all met and unmet', 0, 0, 0, 'Notes', 0),
(6, 27, '2017-10-26 18:46:58', 'owaa', 'AF', 10, 0, 0, 'Important', 0);

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
(50, 137, '', '2017-12-11 00:22:33', '', '', 'ticket_created', 0, 0, 0, 5, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 113, '', '2017-12-11 07:17:02', '5', '', 'ticket_created', 0, 0, 0, 6, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 5, '', '2017-12-11 15:35:08', '115', '', 'ticket_created', 0, 0, 0, 7, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 5, '', '2017-12-13 16:32:07', '113', '', 'ticket_created', 0, 0, 0, 8, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 5, '', '2017-12-15 07:09:23', '113', '', 'ticket_created', 0, 0, 0, 9, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `objective_types`
--

INSERT INTO `objective_types` (`id`, `title`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Debt Collection', '2018-01-22 07:51:46', NULL, 0),
(2, 'Development', '2018-01-22 07:51:57', NULL, 0),
(3, 'Maintenance', '2018-01-22 07:52:08', NULL, 0),
(4, 'Acquisition', '2018-01-22 07:52:20', NULL, 0);

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
(2, 'Stripe', 'stripe', 'Stripe online payments', 1, 0, 0, 'a:3:{s:15:"pay_button_text";s:6:"Stripe";s:10:"secret_key";s:6:"";s:15:"publishable_key";s:6:"";}', 0),
(3, 'PayPal Payments Standard', 'paypal_payments_standard', 'PayPal Payments Standard Online Payments', 1, 0, 0, 'a:4:{s:15:"pay_button_text";s:6:"PayPal";s:5:"email";s:4:"";s:11:"paypal_live";s:1:"0";s:5:"debug";s:1:"0";}', 0);

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

--
-- Dumping data for table `petty_cash`
--

INSERT INTO `petty_cash` (`id`, `user_id`, `type_id`, `petty_cash`, `description`, `amount`, `sage_project_id`, `sage_project`, `created_at`, `updated_at`, `status`, `deleted`) VALUES
(10, 113, 7, 'Transport', 'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. Proin eget tortor risus. Donec sollicitudin molestie malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit ', '1200', 21, '01 : Petty Cash', '2017-12-04', '2017-12-15 07:06:11', 'Approved', 0),
(11, 113, 7, 'Transport', '232refew', '1243', 21, '01 : Petty Cash', '2017-12-04', '2017-12-06 08:31:45', 'Disapproved', 0),
(12, 113, 7, 'Transport', 'fgdgfdgfdg', '12121', 22, '00056 : inventory', '2017-12-05', '2017-12-13 16:36:22', 'Approved', 0),
(13, 113, 5, 'demo', 'jhggfjgfj', '465', 12, 'PJG0008 : project one', '2017-12-13', '2017-12-13 17:09:11', 'Approved', 0),
(14, 5, 5, 'demo', '434343', '4', 12, 'PJG0008 : project one', '2017-12-14', NULL, 'Pending', 0),
(15, 5, 5, 'demo', 'vsfdvfds', '32', 16, 'PJG0010 : project two', '2017-12-15', NULL, 'Pending', 0);

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

--
-- Dumping data for table `petty_cash_types`
--

INSERT INTO `petty_cash_types` (`id`, `name_type`, `admin_id`, `created_at`, `update_date`, `deleted`) VALUES
(5, 'demo', 5, '2017-12-03 21:00:00', '2017-12-04 17:32:14', 0),
(6, 'demo', 5, '2017-12-03 21:00:00', '2017-12-04 17:32:17', 0),
(7, 'Transport', 5, '2017-12-03 21:00:00', '2017-12-04 17:32:18', 0),
(8, 'phone bill', 5, '2017-12-03 21:00:00', '2017-12-04 17:32:19', 0),
(9, ' vcbb', 5, '2017-12-03 21:00:00', '2017-12-04 17:32:24', 0),
(10, '3432432', 5, '2017-12-04 21:00:00', NULL, 0),
(11, 'demo petty', 5, '2017-12-14 21:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `share_with` text COLLATE utf8_unicode_ci,
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `created_by`, `created_at`, `description`, `post_id`, `share_with`, `files`, `deleted`) VALUES
(1, 5, '2018-01-29 07:21:54', 'gjhkmhgmgmhgmg', 0, '', 'a:0:{}', 0),
(2, 5, '2018-01-29 07:21:58', 'ghmhgmnghmg', 1, '', 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `status` enum('open','completed','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text COLLATE utf8_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `description`, `start_date`, `deadline`, `client_id`, `created_date`, `status`, `labels`, `price`, `deleted`) VALUES
(14, 'demo project one', 'demo', '2017-12-11', '2017-12-27', 30, '2017-12-10', 'open', 'high', 5435, 0),
(15, 'demo project two', 'demo', '2017-12-11', '2017-12-27', 30, '2017-12-10', 'open', 'high', 5435, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_comments`
--

CREATE TABLE `project_comments` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `customer_feedback_id` int(11) NOT NULL DEFAULT '0',
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` int(11) NOT NULL,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `project_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_leader` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `project_members`
--

INSERT INTO `project_members` (`id`, `user_id`, `project_id`, `is_leader`, `deleted`) VALUES
(41, 5, 14, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_time`
--

CREATE TABLE `project_time` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` enum('open','logged','approved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'logged',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `permissions`, `deleted`) VALUES
(1, 'Administrators', 'a:24:{s:5:"leave";s:3:"all";s:14:"leave_specific";s:0:"";s:10:"attendance";s:3:"all";s:19:"attendance_specific";s:0:"";s:7:"invoice";s:3:"all";s:8:"estimate";s:3:"all";s:7:"expense";s:3:"all";s:6:"client";s:3:"all";s:6:"ticket";s:3:"all";s:12:"announcement";s:3:"all";s:19:"can_create_projects";s:1:"1";s:17:"can_edit_projects";s:1:"1";s:19:"can_delete_projects";s:1:"1";s:30:"can_add_remove_project_members";s:1:"1";s:16:"can_create_tasks";s:1:"1";s:14:"can_edit_tasks";s:1:"1";s:16:"can_delete_tasks";s:1:"1";s:20:"can_comment_on_tasks";s:1:"1";s:21:"can_create_milestones";s:1:"1";s:19:"can_edit_milestones";s:1:"1";s:21:"can_delete_milestones";s:1:"1";s:16:"can_delete_files";s:1:"1";s:34:"can_view_team_members_contact_info";s:1:"1";s:34:"can_view_team_members_social_links";s:1:"1";}', 0),
(2, 'developer', 'a:24:{s:5:"leave";s:3:"all";s:14:"leave_specific";s:0:"";s:10:"attendance";s:3:"all";s:19:"attendance_specific";s:0:"";s:7:"invoice";s:3:"all";s:8:"estimate";s:3:"all";s:7:"expense";s:3:"all";s:6:"client";s:3:"all";s:6:"ticket";s:3:"all";s:12:"announcement";s:3:"all";s:19:"can_create_projects";s:1:"1";s:17:"can_edit_projects";s:1:"1";s:19:"can_delete_projects";s:1:"1";s:30:"can_add_remove_project_members";s:1:"1";s:16:"can_create_tasks";s:1:"1";s:14:"can_edit_tasks";s:1:"1";s:16:"can_delete_tasks";s:1:"1";s:20:"can_comment_on_tasks";s:1:"1";s:21:"can_create_milestones";s:1:"1";s:19:"can_edit_milestones";s:1:"1";s:21:"can_delete_milestones";s:1:"1";s:16:"can_delete_files";s:1:"1";s:34:"can_view_team_members_contact_info";s:1:"1";s:34:"can_view_team_members_social_links";s:1:"1";}', 0),
(3, 'HR', 'a:24:{s:5:"leave";s:3:"all";s:14:"leave_specific";s:0:"";s:10:"attendance";s:3:"all";s:19:"attendance_specific";s:0:"";s:7:"invoice";s:3:"all";s:8:"estimate";s:3:"all";s:7:"expense";s:3:"all";s:6:"client";s:3:"all";s:6:"ticket";s:3:"all";s:12:"announcement";s:3:"all";s:19:"can_create_projects";s:1:"1";s:17:"can_edit_projects";s:1:"1";s:19:"can_delete_projects";s:1:"1";s:30:"can_add_remove_project_members";s:1:"1";s:16:"can_create_tasks";s:1:"1";s:14:"can_edit_tasks";s:1:"1";s:16:"can_delete_tasks";s:1:"1";s:20:"can_comment_on_tasks";s:1:"1";s:21:"can_create_milestones";s:1:"1";s:19:"can_edit_milestones";s:1:"1";s:21:"can_delete_milestones";s:1:"1";s:16:"can_delete_files";s:1:"1";s:34:"can_view_team_members_contact_info";s:1:"1";s:34:"can_view_team_members_social_links";s:1:"1";}', 0),
(4, 'Site Administrator', NULL, 0),
(5, 'Supervisor ', 'a:24:{s:5:"leave";N;s:14:"leave_specific";s:0:"";s:10:"attendance";s:3:"all";s:19:"attendance_specific";s:0:"";s:7:"invoice";N;s:8:"estimate";N;s:7:"expense";N;s:6:"client";N;s:6:"ticket";s:3:"all";s:12:"announcement";N;s:19:"can_create_projects";N;s:17:"can_edit_projects";N;s:19:"can_delete_projects";N;s:30:"can_add_remove_project_members";N;s:16:"can_create_tasks";s:1:"1";s:14:"can_edit_tasks";s:1:"1";s:16:"can_delete_tasks";s:1:"1";s:20:"can_comment_on_tasks";s:1:"1";s:21:"can_create_milestones";s:1:"1";s:19:"can_edit_milestones";s:1:"1";s:21:"can_delete_milestones";s:1:"1";s:16:"can_delete_files";s:1:"1";s:34:"can_view_team_members_contact_info";N;s:34:"can_view_team_members_social_links";N;}', 0),
(6, 'Manual worker', NULL, 0),
(7, 'Project Manager', 'a:24:{s:5:"leave";s:3:"all";s:14:"leave_specific";s:0:"";s:10:"attendance";s:3:"all";s:19:"attendance_specific";s:0:"";s:7:"invoice";s:3:"all";s:8:"estimate";s:3:"all";s:7:"expense";s:3:"all";s:6:"client";s:3:"all";s:6:"ticket";s:3:"all";s:12:"announcement";s:3:"all";s:19:"can_create_projects";s:1:"1";s:17:"can_edit_projects";s:1:"1";s:19:"can_delete_projects";s:1:"1";s:30:"can_add_remove_project_members";s:1:"1";s:16:"can_create_tasks";s:1:"1";s:14:"can_edit_tasks";s:1:"1";s:16:"can_delete_tasks";s:1:"1";s:20:"can_comment_on_tasks";s:1:"1";s:21:"can_create_milestones";s:1:"1";s:19:"can_edit_milestones";s:1:"1";s:21:"can_delete_milestones";s:1:"1";s:16:"can_delete_files";s:1:"1";s:34:"can_view_team_members_contact_info";s:1:"1";s:34:"can_view_team_members_social_links";s:1:"1";}', 0),
(8, 'Client', 'a:24:{s:5:"leave";N;s:14:"leave_specific";s:0:"";s:10:"attendance";N;s:19:"attendance_specific";s:0:"";s:7:"invoice";N;s:8:"estimate";N;s:7:"expense";N;s:6:"client";s:3:"all";s:6:"ticket";s:3:"all";s:12:"announcement";s:3:"all";s:19:"can_create_projects";N;s:17:"can_edit_projects";N;s:19:"can_delete_projects";N;s:30:"can_add_remove_project_members";N;s:16:"can_create_tasks";N;s:14:"can_edit_tasks";N;s:16:"can_delete_tasks";N;s:20:"can_comment_on_tasks";s:1:"1";s:21:"can_create_milestones";N;s:19:"can_edit_milestones";N;s:21:"can_delete_milestones";N;s:16:"can_delete_files";N;s:34:"can_view_team_members_contact_info";N;s:34:"can_view_team_members_social_links";N;}', 0),
(9, 'Contractor', NULL, 0),
(10, 'Normal Employees', 'a:24:{s:5:"leave";s:3:"all";s:14:"leave_specific";s:0:"";s:10:"attendance";s:3:"all";s:19:"attendance_specific";s:0:"";s:7:"invoice";s:3:"all";s:8:"estimate";s:3:"all";s:7:"expense";s:3:"all";s:6:"client";s:3:"all";s:6:"ticket";s:3:"all";s:12:"announcement";s:3:"all";s:19:"can_create_projects";s:1:"1";s:17:"can_edit_projects";s:1:"1";s:19:"can_delete_projects";s:1:"1";s:30:"can_add_remove_project_members";s:1:"1";s:16:"can_create_tasks";s:1:"1";s:14:"can_edit_tasks";s:1:"1";s:16:"can_delete_tasks";s:1:"1";s:20:"can_comment_on_tasks";s:1:"1";s:21:"can_create_milestones";s:1:"1";s:19:"can_edit_milestones";s:1:"1";s:21:"can_delete_milestones";s:1:"1";s:16:"can_delete_files";s:1:"1";s:34:"can_view_team_members_contact_info";s:1:"1";s:34:"can_view_team_members_social_links";s:1:"1";}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_name`, `setting_value`, `deleted`) VALUES
('', '', 0),
('accepted_file_formats', 'jpg,jpeg,doc,png,gif,pdf,docx', 0),
('add_projects_from_excel', 'YES', 0),
('admin_costs', '436587', 0),
('allowed_ip_addresses', '', 0),
('app_title', 'PRO-KAZI', 0),
('client_can_add_project_files', '1', 0),
('client_can_comment_on_files', '1', 0),
('client_can_comment_on_tasks', '1', 0),
('client_can_create_tasks', '', 0),
('client_can_edit_tasks', '1', 0),
('client_can_view_project_files', '1', 0),
('client_can_view_tasks', '1', 0),
('client_message_users', '5,27,28', 0),
('company_address', '10100 Nyeri, KE.', 0),
('company_email', 'wagura465@gmail.com', 0),
('company_name', 'mhub', 0),
('company_phone', '718837808', 0),
('company_website', 'WaguraMaurice', 0),
('currency_symbol', 'Ksh', 0),
('date_format', 'd/m/Y', 0),
('decimal_separator', '.', 0),
('default_currency', 'KES', 0),
('disable_client_login', '1', 0),
('disable_client_signup', '1', 0),
('email_protocol', 'smtp', 0),
('email_sent_from_address', 'wagura465@gmail.com', 0),
('email_sent_from_name', 'Wise & Agile Solutions Limited', 0),
('email_smtp_host', 'in.mailjet.com', 0),
('email_smtp_pass', '8b49011a29bba60a1e89774b6aa01a95', 0),
('email_smtp_port', '465', 0),
('email_smtp_security_type', 'ssl', 0),
('email_smtp_user', 'ac746108f48ffb16045549bb3fbab8d9', 0),
('escalation_duration', '45', 0),
('escalation_via_email', '1', 0),
('escalation_via_sms', '1', 0),
('first_day_of_week', '0', 0),
('HR', '', 0),
('HR_sync', 'off', 0),
('invoice_logo', 'default-invoice-logo.png', 0),
('item_purchase_code', 'ITEM-PURCHASE-CODE', 0),
('language', 'english', 0),
('module_admin', '1', 0),
('module_announcement', '1', 0),
('module_attendance', '1', 0),
('module_clients', '1', 0),
('module_escalation_matrix', '1', 0),
('module_estimate', '1', 0),
('module_estimate_request', '1', 0),
('module_event', '1', 0),
('module_expense', '1', 0),
('module_invoice', '1', 0),
('module_leave', '1', 0),
('module_message', '1', 0),
('module_note', '1', 0),
('module_sage', '1', 0),
('module_ticket', '1', 0),
('module_timeline', '1', 0),
('opening_hours', '1:00 AM', 0),
('order_project_tasks', 'title', 0),
('Payroll', 'on', 0),
('Payroll_sync', 'on', 0),
('product_serial', 'auto', 0),
('rows_per_page', '50', 0),
('sage_IDInvJrBatches', '1', 0),
('sage_Inventory_Project', '22', 0),
('sage_petty_cash_account_id', '94', 0),
('sage_petty_cash_batches_id', '3', 0),
('sage_TrCode', '37', 0),
('sage_WarehouseID', '1', 0),
('scrollbar', 'native', 0),
('serial_prefix', 'SN', 0),
('show_background_image_in_signin_page', 'yes', 0),
('show_logo_in_signin_page', 'yes', 0),
('site_logo', 'default-stie-logo.png', 0),
('time_format', 'capital', 0),
('timezone', 'Africa/Nairobi', 0),
('working_hours', '560', 0),
('xlsx_logo', 'excel_logo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook` text COLLATE utf8_unicode_ci,
  `twitter` text COLLATE utf8_unicode_ci,
  `linkedin` text COLLATE utf8_unicode_ci,
  `googleplus` text COLLATE utf8_unicode_ci,
  `digg` text COLLATE utf8_unicode_ci,
  `youtube` text COLLATE utf8_unicode_ci,
  `pinterest` text COLLATE utf8_unicode_ci,
  `instagram` text COLLATE utf8_unicode_ci,
  `github` text COLLATE utf8_unicode_ci,
  `tumblr` text COLLATE utf8_unicode_ci,
  `vine` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `project_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `ticket_id` int(11) DEFAULT NULL,
  `milestone_id` int(11) NOT NULL DEFAULT '0',
  `assigned_to` int(11) NOT NULL,
  `deadline` date DEFAULT NULL,
  `labels` text COLLATE utf8_unicode_ci,
  `max_hours` int(11) NOT NULL DEFAULT '0',
  `points` tinyint(4) NOT NULL DEFAULT '1',
  `status` enum('to_do - 0%','in_progress - 25%','in_progress - 50%','in_progress - 75%','done - 100%') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to_do - 0%',
  `hesabu` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `collaborators` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT '0',
  `priority` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Normal',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `deleted`) VALUES
(1, 'Tax (16%)', 16, 0);

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
-- Table structure for table `tbl_checklists`
--

CREATE TABLE `tbl_checklists` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL,
  `performed_on` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_checklist_performed_on` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_checklist_status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_checklist_tasks` (
  `id` int(11) NOT NULL,
  `ref_no` text NOT NULL,
  `status` int(11) NOT NULL,
  `performed_by` int(11) NOT NULL,
  `performed_on` date NOT NULL,
  `escalate_to` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_checklist_task_checks` (
  `id` int(11) NOT NULL,
  `check_item` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 passed 0 failed',
  `comment` text,
  `checklist_task` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_checklist_types` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_cust_supplier_checks` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 customer, 2 supplier',
  `cust_supp_id` int(11) NOT NULL,
  `checked_on` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 for subitted 1 for partially',
  `checked_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_cust_supplier_specific_checks` (
  `id` int(11) NOT NULL,
  `check_item` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 for subitted 1 for partially',
  `comment` text,
  `expiry_date` text,
  `customer_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_cust_supp_checkitems` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `performed_on` text NOT NULL COMMENT '1 customer and 2 suppliers'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

CREATE TABLE `tbl_cust_supp_status` (
  `id` int(11) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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
(1, 'test reminder', 3, 1, 3, 2, 3, 0),
(2, 'Weekly reminder', 3, 2, 2, 2, 2, 0);

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
  `deleted` int(11) DEFAULT '0',
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_knowledge_base`
--

INSERT INTO `tbl_knowledge_base` (`id`, `type_id`, `title`, `solution`, `created_by`, `created_at`, `updated_at`, `deleted`, `image`) VALUES
(24, 1, 'Printer error fixation', '	\nI have a setup like this:\n\napplication\nsystem\nassets\njs\nimgs\ncss\nI then have a helper function that simply returns the full path to this depending on my setup, something similar to:\n\napplication/helpers/utility_helper.php:\n\n', 5, '2018-02-06 15:07:19', '2018-02-06 16:28:20', 0, '1517933239.png'),
(25, 1, 'dkndfkQ', 'DKSMDFK', 5, '2018-02-06 16:00:13', NULL, 0, '1517936413.jpg');

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
(9, 4, 10, 113, '2017-12-07 12:54:18', NULL, 0),
(10, 9, 18, 5, '2018-02-06 13:37:42', NULL, 0);

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
-- Table structure for table `tbl_legal_docs_items`
--

CREATE TABLE `tbl_legal_docs_items` (
  `id` int(11) NOT NULL,
  `sage_item_id` int(11) NOT NULL,
  `legal_doc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_legal_docs_items`
--

INSERT INTO `tbl_legal_docs_items` (`id`, `sage_item_id`, `legal_doc_id`) VALUES
(1, 1, 2);

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
(2, 'New s', 2, 'a:0:{}', 89, 1, '2017-12-05', '2017-12-13', 0, 0, 0, 0, '2017-12-05 07:09:31', '0000-00-00 00:00:00'),
(3, 'terest', 2, 'a:0:{}', 115, 1, '2017-12-15', '2017-12-22', 0, 0, 0, 0, '2017-12-14 12:28:42', '0000-00-00 00:00:00'),
(4, 'sasas', 3, 'a:0:{}', 5, 1, '2018-01-31', '2018-01-31', 0, 0, 0, 0, '2018-01-30 04:36:15', '0000-00-00 00:00:00');

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
-- Table structure for table `tbl_third_party`
--

CREATE TABLE `tbl_third_party` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

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

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `members` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `title`, `members`, `deleted`) VALUES
(1, 'HR TEAM', '2,3,9', 0),
(2, 'PAYROLL', '2,6,8', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_member_job_info`
--

CREATE TABLE `team_member_job_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_hire` date NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `salary` double NOT NULL DEFAULT '0',
  `working_hours` double NOT NULL DEFAULT '1',
  `hourly_rate` double NOT NULL DEFAULT '1',
  `salary_term` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `team_member_job_info`
--

INSERT INTO `team_member_job_info` (`id`, `user_id`, `date_of_hire`, `deleted`, `salary`, `working_hours`, `hourly_rate`, `salary_term`) VALUES
(4, 5, '2016-09-16', 0, 15000, 176, 85.227272727273, 'Monthly'),
(38, 141, '2001-05-01', 0, 0, 560, 0, 'Contract'),
(39, 142, '2007-04-01', 0, 0, 560, 0, 'Contract'),
(40, 143, '2009-12-10', 0, 0, 560, 0, 'Contract'),
(41, 144, '2010-05-24', 0, 0, 560, 0, 'Contract'),
(42, 145, '2011-01-03', 0, 0, 560, 0, 'Contract'),
(43, 146, '2011-11-01', 0, 0, 560, 0, 'Contract'),
(44, 147, '2011-10-01', 0, 0, 560, 0, 'Contract'),
(45, 148, '2011-04-04', 0, 0, 560, 0, 'Contract'),
(46, 149, '2011-07-04', 0, 0, 560, 0, 'Contract'),
(47, 150, '2011-12-19', 0, 0, 560, 0, 'Contract'),
(48, 151, '2011-12-20', 0, 0, 560, 0, 'Contract'),
(49, 152, '2011-12-29', 0, 0, 560, 0, 'Contract'),
(50, 153, '2013-11-10', 0, 0, 560, 0, 'Contract'),
(51, 154, '2014-10-07', 0, 0, 560, 0, 'Contract'),
(52, 155, '2015-07-01', 0, 0, 560, 0, 'Contract'),
(53, 156, '2015-08-05', 0, 0, 560, 0, 'Contract'),
(54, 157, '2015-06-16', 0, 0, 560, 0, 'Contract'),
(55, 158, '2014-08-17', 0, 0, 560, 0, 'Contract'),
(56, 159, '2016-01-07', 0, 0, 560, 0, 'Contract'),
(57, 160, '2016-01-10', 0, 0, 560, 0, 'Contract'),
(58, 161, '2012-03-15', 0, 0, 560, 0, 'Contract'),
(59, 162, '2016-02-16', 0, 0, 560, 0, 'Contract'),
(60, 163, '2014-07-14', 0, 0, 560, 0, 'Contract'),
(61, 164, '2015-11-09', 0, 0, 560, 0, 'Contract'),
(62, 165, '2007-11-26', 0, 0, 560, 0, 'Contract'),
(63, 166, '2017-01-26', 0, 0, 560, 0, 'Contract'),
(64, 167, '2016-06-02', 0, 0, 560, 0, 'Contract'),
(65, 168, '2012-06-04', 0, 0, 560, 0, 'Contract'),
(66, 169, '2012-04-02', 0, 0, 560, 0, 'Contract'),
(67, 170, '2015-01-02', 0, 0, 560, 0, 'Contract'),
(68, 171, '2017-07-01', 0, 0, 560, 0, 'Contract'),
(69, 172, '2017-08-14', 0, 0, 560, 0, 'Contract'),
(70, 173, '2017-10-13', 0, 0, 560, 0, 'Contract'),
(71, 174, '2017-11-20', 0, 0, 560, 0, 'Contract');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `third_party_messages`
--

INSERT INTO `third_party_messages` (`id`, `message`, `third_p_id`, `sender_id`, `created_at`, `updated_at`) VALUES
(1, 'efrr', 1, 5, '2017-12-14 14:19:44', NULL),
(2, 'dsdsff', 1, 5, '2017-12-15 05:47:59', NULL),
(3, 'fvf', 1, 5, '2017-12-15 06:00:09', NULL),
(4, 'fedgfdwfvds', 1, 5, '2017-12-15 07:11:39', NULL),
(5, 'csfs ds da', 1, 5, '2017-12-15 07:19:42', NULL),
(6, 'vxnvxn', 1, 5, '2017-12-15 07:21:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `external_reference` text COLLATE utf8_unicode_ci NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('new','client_replied','open','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `last_activity_at` datetime DEFAULT NULL,
  `assigned_to` int(11) NOT NULL DEFAULT '0',
  `escalation_matrix` int(11) NOT NULL,
  `labels` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `project_id`, `external_reference`, `ticket_type_id`, `title`, `created_by`, `created_at`, `status`, `last_activity_at`, `assigned_to`, `escalation_matrix`, `labels`, `deleted`) VALUES
(5, 14, 'ufifuii', 1, 'ety', 137, '2017-12-11 00:22:33', 'new', '2017-12-11 00:22:33', 0, 2, NULL, 0),
(6, 14, ' fdfd', 1, 'employees', 113, '2017-12-11 07:17:02', 'closed', '2017-12-11 07:17:02', 5, 7, '', 0),
(7, 15, '', 2, 'trytery', 5, '2017-12-11 15:35:08', 'closed', '2017-12-11 15:40:26', 115, 6, 'hgfgfh', 0),
(8, 14, '', 2, 'employees', 5, '2017-12-13 16:32:07', 'open', '2017-12-13 16:32:28', 113, 1, 'hgfgfh', 0),
(9, 14, '', 1, 'ertgter', 5, '2017-12-15 07:09:22', 'new', '2017-12-15 07:09:22', 113, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ticket_comments`
--

INSERT INTO `ticket_comments` (`id`, `created_by`, `created_at`, `description`, `ticket_id`, `files`, `deleted`) VALUES
(18, 5, '2017-11-30 10:39:05', 'maintain-ace ', 15, 'a:0:{}', 0),
(19, 5, '2017-11-30 14:58:49', 'klhcdsdgcysdgvcysdgcvsdy', 16, 'a:0:{}', 0),
(20, 5, '2017-12-04 09:11:20', 'gsgfdgfdgfdsxg', 1, 'a:0:{}', 0),
(21, 5, '2017-12-04 09:41:28', 'fd xcfd', 2, 'a:0:{}', 0),
(22, 5, '2017-12-06 07:36:20', 'TRFHGFHGFHNGFJNHGFN', 4, 'a:0:{}', 0),
(23, 113, '2017-12-07 06:39:26', 'bvvcbvcxbvcxbvcxbvcx', 4, 'a:0:{}', 0),
(24, 137, '2017-12-11 00:22:33', 'fiy', 5, 'a:0:{}', 0),
(25, 113, '2017-12-11 07:17:02', 'gfdsbsfd', 6, 'a:0:{}', 0),
(26, 5, '2017-12-11 15:35:08', ' bvbmnghnghn', 7, 'a:0:{}', 0),
(27, 5, '2017-12-11 15:40:26', 'm,ghm', 7, 'a:0:{}', 0),
(28, 5, '2017-12-13 16:32:07', 'safgdagdsf', 8, 'a:0:{}', 0),
(29, 5, '2017-12-13 16:32:28', '8itu0[u9o', 8, 'a:0:{}', 0),
(30, 5, '2017-12-15 07:09:22', ' cxvcvcx vcx ', 9, 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `title`, `deleted`) VALUES
(1, 'System', 0),
(2, 'Email', 0),
(3, 'Call', 0),
(5, 'gftrvr', 0),
(6, 'Visit', 0),
(7, 'Phone', 0),
(8, 'Visit', 0),
(9, 'demo', 0),
(10, 'gfdsg', 0),
(11, '54', 0),
(12, 'hg', 0),
(13, 'demo report', 0),
(14, 'Visit', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('staff','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'client',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `message_checked_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `notification_checked_at` datetime NOT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `job_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `disable_login` tinyint(1) NOT NULL DEFAULT '0',
  `note` mediumtext COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `alternative_address` text COLLATE utf8_unicode_ci,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ssn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `sticky_note` mediumtext COLLATE utf8_unicode_ci,
  `skype` text COLLATE utf8_unicode_ci,
  `enable_web_notification` tinyint(1) NOT NULL DEFAULT '1',
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `landing_page` varchar(255) COLLATE utf8_unicode_ci DEFAULT '/dashboard',
  `created_at` datetime NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_type`, `is_admin`, `role_id`, `email`, `password`, `image`, `status`, `message_checked_at`, `client_id`, `notification_checked_at`, `is_primary_contact`, `job_title`, `disable_login`, `note`, `address`, `alternative_address`, `phone`, `alternative_phone`, `dob`, `ssn`, `gender`, `sticky_note`, `skype`, `enable_web_notification`, `enable_email_notification`, `landing_page`, `created_at`, `deleted`) VALUES
(5, 'Admin', 'User', 'staff', 1, 1, 'admin@teamkazi.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '2017-11-30 10:53:08', 0, '2017-12-13 16:31:14', 0, 'Developer', 0, NULL, '', '', '0700000000', '', '1900-12-21', '', 'male', NULL, '', 1, 1, '/dashboard', '2016-12-07 09:48:20', 0),
(141, 'SILVESTER', 'KUTUTA', 'staff', 0, 2, 'silvester@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : MD/CEO', 0, NULL, NULL, NULL, '', NULL, '1966-01-10', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(142, 'CATHERINE', 'LEWA', 'staff', 0, 2, 'catherine.lewa@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accountant Receivable', 0, NULL, NULL, NULL, '', NULL, '1980-07-06', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(143, 'MOURINE', 'MAGERO', 'staff', 0, 2, 'mourine.magero@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Administration Officer', 0, NULL, NULL, NULL, '', NULL, '1984-01-24', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(144, 'FRANCISCA', 'NZIOKA', 'staff', 0, 2, 'francisca@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR&Admin Officer', 0, NULL, NULL, NULL, '', NULL, '1974-04-16', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(145, 'WILLINGTONE', 'WARIO', 'staff', 0, 2, 'wario@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Payables', 0, NULL, NULL, NULL, '', NULL, '1985-05-05', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(146, 'ALOICE', 'KUTUTA', 'staff', 0, 2, 'aloice@esl-eastfarica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Legal Manager', 0, NULL, NULL, NULL, '', NULL, '1981-01-06', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(147, 'MAUREEN', 'OPIYO', 'staff', 0, 2, 'maurine.atieno@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Country Operations Manager', 0, NULL, NULL, NULL, '', NULL, '1984-06-26', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(148, 'ISAAC', 'WATKINS', 'staff', 0, 2, 'watkins@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Technical Manager', 0, NULL, NULL, NULL, '', NULL, '1961-08-16', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(149, 'CHRISPUS', 'KILEI', 'staff', 0, 2, 'chrispus.kilei@esl-east africa.co', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Technical Supervisor', 0, NULL, NULL, NULL, '', NULL, '1970-04-24', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(150, 'EVANS', 'CHIBUNGU', 'staff', 0, 2, 'evans.ngala@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : ICT Manager', 0, NULL, NULL, NULL, '', NULL, '1985-09-22', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(151, 'LEONARD', 'BAYA', 'staff', 0, 2, 'bayamleonard@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Supervisor', 0, NULL, NULL, NULL, '', NULL, '1974-03-06', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(152, 'MARTIN', 'IKIARA', 'staff', 0, 2, 'martin.karani@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Group Chief Finance Officer', 0, NULL, NULL, NULL, '', NULL, '1979-06-05', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(153, 'LENROD', 'MGENDI', 'staff', 0, 2, 'lenrod.mwamburi@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Audit, Risk and Compliance : Group Internal Audit Risk & Compliance Officer', 0, NULL, NULL, NULL, '', NULL, '1979-06-13', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(154, 'JOHN', 'LAGAT', 'staff', 0, 2, 'it.support@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : ICT Assistant', 0, NULL, NULL, NULL, '', NULL, '1981-11-27', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(155, 'JOYLINAH', 'NJERI', 'staff', 0, 2, 'joylinah.nduta@esl-eastafica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Procurement Officer', 0, NULL, NULL, NULL, '', NULL, '1986-10-20', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(156, 'DANIEL', 'WANIKINA', 'staff', 0, 2, 'transport@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Machine Operator', 0, NULL, NULL, NULL, '', NULL, '1988-06-22', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(157, 'STEPHEN', 'OMONDI', 'staff', 0, 2, 'stephen.okiki@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR Assistant', 0, NULL, NULL, NULL, '', NULL, '1988-03-20', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(158, 'PATRICK', 'MBUGUA', 'staff', 0, 2, 'patrick.mbugua.esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Credit Controller', 0, NULL, NULL, NULL, '', NULL, '1987-08-11', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(159, 'RAYMOND', 'WANGUNDA', 'staff', 0, 2, 'ops@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Boarding Clerk', 0, NULL, NULL, NULL, '', NULL, '1987-08-07', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(160, 'FLORENCE', 'TUEI', 'staff', 0, 2, 'florence.tuei@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Country Sales & Marketing Manager', 0, NULL, NULL, NULL, '', NULL, '1977-08-20', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(161, 'KENNEDY', 'KIVUVANI', 'staff', 0, 2, 'kennedy.kivuvani@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Business Development Manager', 0, NULL, NULL, NULL, '', NULL, '1966-12-23', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(162, 'ERIC OLENSI', 'OSINYA', 'staff', 0, 2, 'erick.osinya@esl', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Transport Clerk', 0, NULL, NULL, NULL, '', NULL, '1994-03-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(163, 'CATHERINE', 'THUO', 'staff', 0, 2, 'catherine.thuo@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Administration Officer', 0, NULL, NULL, NULL, '', NULL, '1976-01-11', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(164, 'GRACE', 'MPOYA', 'staff', 0, 2, 'grace.mpoya@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Customer Service Executive - Ops', 0, NULL, NULL, NULL, '', NULL, '1977-12-12', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(165, 'PATRICK', 'MAGIRI', 'staff', 0, 2, 'patrick.magiri@sovereignlog.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Business Development Manager', 0, NULL, NULL, NULL, '', NULL, '1977-12-01', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(166, 'ERIC', 'KYALO', 'staff', 0, 2, 'audit@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Audit, Risk and Compliance : Audit Assistant', 0, NULL, NULL, NULL, '', NULL, '1994-01-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(167, 'IRENE', 'OTIENO', 'staff', 0, 2, 'irene.atieno@esl-eastarica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Payales', 0, NULL, NULL, NULL, '', NULL, '1987-05-28', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(168, 'MERCYLINE', 'MUTUA', 'staff', 0, 2, 'mercyline.mutua@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accountant Payable', 0, NULL, NULL, NULL, '', NULL, '1987-12-14', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(169, 'ARSHUR', 'OWANE', 'staff', 0, 2, 'lomo.owane@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Sales Support Executive', 0, NULL, NULL, NULL, '', NULL, '1985-10-15', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(170, 'COLLINS', 'PAMBA', 'staff', 0, 2, 'collinspamba@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Receivables', 0, NULL, NULL, NULL, '', NULL, '1986-04-02', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(171, 'FRANCIS', 'OPALO', 'staff', 0, 2, 'francis.opalo@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Port Agency Manager', 0, NULL, NULL, NULL, '', NULL, '1972-06-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(172, 'PETER', 'MANGA', 'staff', 0, 2, 'peter.manga@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR Clerk', 0, NULL, NULL, NULL, '', NULL, '1994-10-30', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(173, 'LAWRENCE', 'AMENYA', 'staff', 0, 2, 'lawrence.amenya@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Officer', 0, NULL, NULL, NULL, '', NULL, '1991-02-27', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(174, 'MOUREEN', 'KIAMA', 'staff', 0, 2, 'mourine.kiama@esl-eastafrica', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Key Accounts Executive', 0, NULL, NULL, NULL, '', NULL, '1991-09-18', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-05 00:00:00', 0),
(179, 'Maurice', 'Wagura', 'client', 0, 0, 'wagura465@gmail.com', '7b24afc8bc80e548d66c4e7ff72171c5', NULL, 'active', '0000-00-00 00:00:00', 36, '0000-00-00 00:00:00', 1, 'DevOps', 0, NULL, NULL, NULL, '718837808', NULL, NULL, NULL, 'male', NULL, '', 1, 1, '/dashboard', '2018-02-06 06:33:58', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `created_by` (`created_by`) USING BTREE;

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `checked_by` (`checked_by`) USING BTREE;

--
-- Indexes for table `business_types`
--
ALTER TABLE `business_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_types`
--
ALTER TABLE `call_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`) USING BTREE;

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `escalation_matrix`
--
ALTER TABLE `escalation_matrix`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `created_by` (`created_by`) USING BTREE;

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `estimate_forms`
--
ALTER TABLE `estimate_forms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `estimate_requests`
--
ALTER TABLE `estimate_requests`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `created_by` (`created_by`) USING BTREE;

--
-- Indexes for table `event_comments`
--
ALTER TABLE `event_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `event_notes`
--
ALTER TABLE `event_notes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `inventory_requisitions`
--
ALTER TABLE `inventory_requisitions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `id_2` (`id`) USING BTREE;

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `leave_type_id` (`leave_type_id`) USING BTREE,
  ADD KEY `user_id` (`applicant_id`) USING BTREE,
  ADD KEY `checked_by` (`checked_by`) USING BTREE;

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `main_tasks`
--
ALTER TABLE `main_tasks`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `PROJECTS_FK` (`project_id`) USING BTREE;

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `message_from` (`from_user_id`) USING BTREE,
  ADD KEY `message_to` (`to_user_id`) USING BTREE;

--
-- Indexes for table `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `event` (`event`) USING BTREE;

--
-- Indexes for table `objective_types`
--
ALTER TABLE `objective_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `petty_cash`
--
ALTER TABLE `petty_cash`
  ADD PRIMARY KEY (`id`,`sage_project_id`) USING BTREE,
  ADD KEY `type_id` (`type_id`) USING BTREE;

--
-- Indexes for table `petty_cash_types`
--
ALTER TABLE `petty_cash_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `project_comments`
--
ALTER TABLE `project_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `project_time`
--
ALTER TABLE `project_time`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD UNIQUE KEY `setting_name` (`setting_name`) USING BTREE;

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`) USING BTREE;

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
-- Indexes for table `tbl_checklists`
--
ALTER TABLE `tbl_checklists`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_checklist_performed_on`
--
ALTER TABLE `tbl_checklist_performed_on`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_checklist_status`
--
ALTER TABLE `tbl_checklist_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_checklist_tasks`
--
ALTER TABLE `tbl_checklist_tasks`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_checklist_task_checks`
--
ALTER TABLE `tbl_checklist_task_checks`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_checklist_types`
--
ALTER TABLE `tbl_checklist_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_cust_supplier_checks`
--
ALTER TABLE `tbl_cust_supplier_checks`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `cust_supp_id` (`cust_supp_id`) USING BTREE;

--
-- Indexes for table `tbl_cust_supplier_specific_checks`
--
ALTER TABLE `tbl_cust_supplier_specific_checks`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_cust_supp_checkitems`
--
ALTER TABLE `tbl_cust_supp_checkitems`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_cust_supp_status`
--
ALTER TABLE `tbl_cust_supp_status`
  ADD PRIMARY KEY (`id`) USING BTREE;

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
-- Indexes for table `tbl_legal_docs_items`
--
ALTER TABLE `tbl_legal_docs_items`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tbl_third_party`
--
ALTER TABLE `tbl_third_party`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_time_durations`
--
ALTER TABLE `tbl_time_durations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `team_member_job_info`
--
ALTER TABLE `team_member_job_info`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `third_party_messages`
--
ALTER TABLE `third_party_messages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_type` (`user_type`) USING BTREE,
  ADD KEY `email` (`email`) USING BTREE,
  ADD KEY `client_id` (`client_id`) USING BTREE,
  ADD KEY `deleted` (`deleted`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `business_types`
--
ALTER TABLE `business_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `call_types`
--
ALTER TABLE `call_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `escalation_matrix`
--
ALTER TABLE `escalation_matrix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `estimate_forms`
--
ALTER TABLE `estimate_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `estimate_items`
--
ALTER TABLE `estimate_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `estimate_requests`
--
ALTER TABLE `estimate_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `event_comments`
--
ALTER TABLE `event_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_notes`
--
ALTER TABLE `event_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `inventory_requisitions`
--
ALTER TABLE `inventory_requisitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `main_tasks`
--
ALTER TABLE `main_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `objective_types`
--
ALTER TABLE `objective_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `petty_cash`
--
ALTER TABLE `petty_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `petty_cash_types`
--
ALTER TABLE `petty_cash_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `project_comments`
--
ALTER TABLE `project_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `project_time`
--
ALTER TABLE `project_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT for table `tbl_checklists`
--
ALTER TABLE `tbl_checklists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_checklist_performed_on`
--
ALTER TABLE `tbl_checklist_performed_on`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_checklist_status`
--
ALTER TABLE `tbl_checklist_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_checklist_tasks`
--
ALTER TABLE `tbl_checklist_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_checklist_task_checks`
--
ALTER TABLE `tbl_checklist_task_checks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tbl_checklist_types`
--
ALTER TABLE `tbl_checklist_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_cust_supplier_checks`
--
ALTER TABLE `tbl_cust_supplier_checks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `tbl_cust_supplier_specific_checks`
--
ALTER TABLE `tbl_cust_supplier_specific_checks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;
--
-- AUTO_INCREMENT for table `tbl_cust_supp_checkitems`
--
ALTER TABLE `tbl_cust_supp_checkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_cust_supp_status`
--
ALTER TABLE `tbl_cust_supp_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_doc_escalation_n_reminders`
--
ALTER TABLE `tbl_doc_escalation_n_reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_escalation_matrix`
--
ALTER TABLE `tbl_escalation_matrix`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_knowledge_base`
--
ALTER TABLE `tbl_knowledge_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_knowledge_base_ticket`
--
ALTER TABLE `tbl_knowledge_base_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
-- AUTO_INCREMENT for table `tbl_legal_docs_items`
--
ALTER TABLE `tbl_legal_docs_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_legal_documents`
--
ALTER TABLE `tbl_legal_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_legal_document_types`
--
ALTER TABLE `tbl_legal_document_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_third_party`
--
ALTER TABLE `tbl_third_party`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_time_durations`
--
ALTER TABLE `tbl_time_durations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `team_member_job_info`
--
ALTER TABLE `team_member_job_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `third_party_messages`
--
ALTER TABLE `third_party_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `escalation_matrix`
--
ALTER TABLE `escalation_matrix`
  ADD CONSTRAINT `escalation_matrix_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `main_tasks`
--
ALTER TABLE `main_tasks`
  ADD CONSTRAINT `PROJECTS_FK` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petty_cash`
--
ALTER TABLE `petty_cash`
  ADD CONSTRAINT `petty_cash_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `petty_cash_types` (`id`);

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

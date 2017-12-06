-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2017 at 02:51 PM
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
(12, 'legal_notification', 'Prokazi Cases', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">\r\n    <div style=\"max-width:640px; margin:0 auto; \">\r\n        <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\r\n            <img src=\"http://teamkazi.com/files/system/default-stie-logo.png\" alt=\"TeamKazi\">\r\n            <h1>Pro Kazi Case: # {CASE_TITLE}</h1></div>\r\n        <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">\r\n\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">Hi {USER_NAME} </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">You have been added to a legal case </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">The case is scheduled on  {CASE_DATE}</span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p>\r\n            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a\r\n                            style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\"\r\n                            href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p></div>\r\n    </div>\r\n</div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">\r\n    <div style=\"max-width:640px; margin:0 auto; \">\r\n        <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\r\n            <img src=\"http://teamkazi.com/files/system/default-stie-logo.png\" alt=\"TeamKazi\">\r\n            <h1>Pro Kazi Case: # {CASE_TITLE}</h1></div>\r\n        <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">\r\n\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">Hi {USER_NAME} </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">You have been added to a legal case </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">The case is scheduled on  {CASE_DATE}</span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p>\r\n            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a\r\n                            style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\"\r\n                            href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p></div>\r\n    </div>\r\n</div>', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

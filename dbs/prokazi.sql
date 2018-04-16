/*
 Navicat Premium Data Transfer

 Source Server         : Local MySQL
 Source Server Type    : MySQL
 Source Server Version : 100125
 Source Host           : localhost:3306
 Source Schema         : prokazi

 Target Server Type    : MySQL
 Target Server Version : 100125
 File Encoding         : 65001

 Date: 16/04/2018 09:16:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_logs
-- ----------------------------
DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE `activity_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(0) NOT NULL,
  `created_by` int(11) NOT NULL,
  `action` enum('created','updated','deleted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `log_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `log_type_title` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `log_type_id` int(11) NOT NULL DEFAULT 0,
  `changes` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `log_for` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int(11) NOT NULL DEFAULT 0,
  `log_for2` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `log_for_id2` int(11) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of activity_logs
-- ----------------------------
INSERT INTO `activity_logs` VALUES (1, '2018-03-23 12:03:03', 5, 'created', 'task', 'Other', 1, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (2, '2018-04-12 08:01:46', 5, 'created', 'milestone', 'Fencing Complete', 1, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (3, '2018-04-12 08:01:50', 5, 'created', 'task', 'Purchase of fencing materials', 1, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (4, '2018-04-12 08:06:15', 5, 'created', 'task', 'FEncing', 2, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (5, '2018-04-12 08:08:23', 94, 'updated', 'task', 'FEncing', 2, 'a:2:{s:6:\"status\";a:2:{s:4:\"from\";s:17:\"in_progress - 25%\";s:2:\"to\";s:17:\"in_progress - 50%\";}s:6:\"hesabu\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";i:50;}}', 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (6, '2018-04-12 08:14:22', 100, 'created', 'task_comment', 'Fencing complete as of now', 1, NULL, 'project', 1, 'task', 1, 0);
INSERT INTO `activity_logs` VALUES (7, '2018-04-12 08:14:42', 100, 'updated', 'task', 'Purchase of fencing materials', 1, 'a:2:{s:6:\"status\";a:2:{s:4:\"from\";s:10:\"to_do - 0%\";s:2:\"to\";s:17:\"in_progress - 50%\";}s:6:\"hesabu\";a:2:{s:4:\"from\";s:1:\"0\";s:2:\"to\";i:50;}}', 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (8, '2018-04-12 08:24:58', 5, 'created', 'project_comment', 'Test Comment', 2, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (9, '2018-04-12 08:28:48', 100, 'created', 'task_comment', 'all materials supplied', 3, NULL, 'project', 1, 'task', 1, 0);
INSERT INTO `activity_logs` VALUES (10, '2018-04-12 08:29:33', 5, 'created', 'task_comment', 'thanks', 4, NULL, 'project', 1, 'task', 1, 0);
INSERT INTO `activity_logs` VALUES (11, '2018-04-12 08:33:07', 100, 'updated', 'task', 'Purchase of fencing materials', 1, 'a:2:{s:6:\"status\";a:2:{s:4:\"from\";s:17:\"in_progress - 50%\";s:2:\"to\";s:11:\"done - 100%\";}s:6:\"hesabu\";a:2:{s:4:\"from\";s:2:\"50\";s:2:\"to\";i:100;}}', 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (12, '2018-04-12 08:38:58', 5, 'updated', 'task', 'Purchase of fencing materials', 1, 'a:2:{s:6:\"status\";a:2:{s:4:\"from\";s:11:\"done - 100%\";s:2:\"to\";s:10:\"to_do - 0%\";}s:6:\"hesabu\";a:2:{s:4:\"from\";s:3:\"100\";s:2:\"to\";i:0;}}', 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (13, '2018-04-12 08:46:59', 5, 'created', 'project_comment', 'AR', 5, NULL, 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (14, '2018-04-12 11:59:44', 5, 'created', 'task', 'demo task', 3, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (15, '2018-04-12 12:09:58', 5, 'created', 'task', 'demo 3', 4, NULL, 'project', 2, '', 0, 0);
INSERT INTO `activity_logs` VALUES (16, '2018-04-12 13:49:26', 100, 'updated', 'task', 'FEncing', 2, 'a:2:{s:6:\"status\";a:2:{s:4:\"from\";s:17:\"in_progress - 50%\";s:2:\"to\";s:11:\"done - 100%\";}s:6:\"hesabu\";a:2:{s:4:\"from\";s:2:\"50\";s:2:\"to\";i:100;}}', 'project', 1, '', 0, 0);
INSERT INTO `activity_logs` VALUES (17, '2018-04-13 12:17:14', 5, 'updated', 'task', 'FEncing', 2, 'a:2:{s:6:\"status\";a:2:{s:4:\"from\";s:11:\"done - 100%\";s:2:\"to\";s:10:\"to_do - 0%\";}s:6:\"hesabu\";a:2:{s:4:\"from\";s:3:\"100\";s:2:\"to\";i:0;}}', 'project', 2, '', 0, 0);

-- ----------------------------
-- Table structure for announcements
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `share_with` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_at` datetime(0) NOT NULL,
  `read_by` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `asset_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `description` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `location` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `purchased_date` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `warranty` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `next_time` timestamp(0) NULL DEFAULT NULL,
  `km_reading` float NOT NULL,
  `driver_id` int(100) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `year_of_make` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `engine_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `year_of_reg` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `chasis_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `service_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `asset_no`(`asset_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of assets
-- ----------------------------
INSERT INTO `assets` VALUES (33, '426', 'ESL/MSA//MV/2712', 'CARTRACK GARGETS - GALOOLI', 'mombasa', '2012-11-07 11:00:00', 0, '2018-03-03 21:17:12', '2016-03-10', '2018-04-19 00:00:00', 10000, 9, '2018-04-09 13:16:01', '2018-04-21', '78904', '2018-04-26', '45324213', 'Service B');
INSERT INTO `assets` VALUES (36, '427', 'KHMA 276C', 'CAT 938G WHEEL LOADER I', 'outside', '2018-01-22 11:00:00', 0, '2018-03-05 02:52:39', '2018-03-17', '2018-11-16 00:00:00', 4560, 10, '2018-04-09 13:23:14', '2018-04-14', '65432', '2018-04-20', '53454', 'Service A');
INSERT INTO `assets` VALUES (37, '428', 'KCA 001G', 'LAND ROVER VOGUE 3.6TDV 8', '0', '2014-02-09 11:00:00', 0, '2018-03-05 02:52:39', '2017-06-16', '2018-09-21 00:00:00', 4000, 8, '2018-04-09 13:25:39', '2018-04-22', '66666', '2018-04-18', '54136', 'Service A');
INSERT INTO `assets` VALUES (38, '429', 'KCB 363Y', 'TOYOTA HILUX DOUBLE CAB', 'inside', '2018-01-22 11:00:00', 0, '2018-03-05 02:52:39', '2018-03-21', '2019-02-21 00:00:00', 10000, 8, '2018-04-09 13:26:02', '2018-04-20', '678990', '2018-04-12', '23435', 'Service B');
INSERT INTO `assets` VALUES (39, '430', 'KCC 694T', 'TOYOTA SUCCEED', '0', '2018-01-22 11:00:00', 0, '2018-03-05 02:52:39', '2018-08-16', '2018-06-20 00:00:00', 1000000, 10, '2018-04-09 13:26:28', '2018-04-16', '4534', '2018-04-11', '5432323', 'Service C');
INSERT INTO `assets` VALUES (46, '7645', '3e34d', 'toyota', 'nai', NULL, 0, '2018-03-08 22:14:16', '2018-01-31', '2018-08-17 00:00:00', 4000000, 7, '2018-04-09 13:26:56', '2018-04-12', '', '', '', 'Service C');
INSERT INTO `assets` VALUES (47, '431', 'KCC 168Z', 'TOYOTA FIELDER', '0', '2018-01-22 00:00:00', 0, '2018-03-15 18:04:47', '2017-02-02', '2019-08-30 00:00:00', 7000, 6, '2018-04-09 13:27:47', '', 're44323', '2018-04-02', '324123', 'Service B');
INSERT INTO `assets` VALUES (48, '432', 'KCC 169Z', 'TOYOTA VOXY', '0', '2018-01-22 00:00:00', 0, '2018-03-16 16:13:17', '2018-05-01', '2018-09-25 00:00:00', 30000, 6, '2018-04-09 13:28:08', '2018-04-17', '6543', '2018-04-19', '345234', 'Service C');
INSERT INTO `assets` VALUES (50, '433', 'KHMA 812G', 'CAT 938G WHEELLOADER II', '0', '2018-01-22 00:00:00', 0, '2018-03-19 10:05:05', '2018-01-31', '2018-04-11 00:00:00', 1000, 8, '2018-04-09 13:29:07', '2016-12-13', '34838', '2018-04-26', '43324123', 'Service A');

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('incomplete','pending','approved','rejected','deleted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `in_time` datetime(0) NOT NULL,
  `out_time` datetime(0) NULL DEFAULT NULL,
  `difference` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `checked_by` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `checked_at` datetime(0) NULL DEFAULT NULL,
  `reject_reason` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `checked_by`(`checked_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for business_types
-- ----------------------------
DROP TABLE IF EXISTS `business_types`;
CREATE TABLE `business_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of business_types
-- ----------------------------
INSERT INTO `business_types` VALUES (1, 'New', '2018-01-23 00:05:34', '2018-02-13 06:55:25', 0);

-- ----------------------------
-- Table structure for call_types
-- ----------------------------
DROP TABLE IF EXISTS `call_types`;
CREATE TABLE `call_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of call_types
-- ----------------------------
INSERT INTO `call_types` VALUES (1, 'Visit', '2018-01-22 21:38:42', NULL, 0);
INSERT INTO `call_types` VALUES (2, 'Phone Call', '2018-01-22 21:38:56', NULL, 0);
INSERT INTO `call_types` VALUES (3, 'Email', '2018-01-22 21:39:02', NULL, 0);

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for clients
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `zip` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_date` date NOT NULL,
  `website` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `vat_number` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `disable_online_payment` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `attend_1st_meeting` int(11) NOT NULL DEFAULT 0,
  `status` enum('Pending','Approved','Disapproved','') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cOurRef` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES (19, 'bett', '', '', '', '', '', '2018-04-12', '', '', '', 0, '', '', 0, 5, 0, 'Pending', '', NULL);

-- ----------------------------
-- Table structure for custom_field_values
-- ----------------------------
DROP TABLE IF EXISTS `custom_field_values`;
CREATE TABLE `custom_field_values`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_to_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `related_to_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for custom_fields
-- ----------------------------
DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `related_to` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of custom_fields
-- ----------------------------
INSERT INTO `custom_fields` VALUES (1, 'Service', 'Service', 'Consulting,New Business,Recruitment', 'multi_select', 'estimate_form-1', 1, 1, 1);

-- ----------------------------
-- Table structure for email_templates
-- ----------------------------
DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `default_message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `custom_message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of email_templates
-- ----------------------------
INSERT INTO `email_templates` VALUES (1, 'login_info', 'Login details', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\">\n  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"PRO-KAZI\">\n  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', 0);
INSERT INTO `email_templates` VALUES (2, 'reset_password', 'Reset password', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"PRO-KAZI\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', 0);
INSERT INTO `email_templates` VALUES (3, 'team_member_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', 0);
INSERT INTO `email_templates` VALUES (4, 'send_invoice', 'New invoice', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', 0);
INSERT INTO `email_templates` VALUES (5, 'signature', 'Signature', '<p>Â© Pro-Kazi. Powered By: <a href=\"https://wizag.biz/\" target=\"_blank\">Wise &amp; Agile Solutions Limited. </a></p>', '<p>Â© Pro-Kazi. Powered By: <a href=\"https://wizag.biz/\" target=\"_blank\">Wise &amp; Agile Solutions Limited. </a></p>', 0);
INSERT INTO `email_templates` VALUES (6, 'client_contact_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', 0);
INSERT INTO `email_templates` VALUES (7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>', 0);
INSERT INTO `email_templates` VALUES (8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>', 0);
INSERT INTO `email_templates` VALUES (9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>', 0);
INSERT INTO `email_templates` VALUES (10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>', 1);
INSERT INTO `email_templates` VALUES (11, 'general_notification', '{EVENT_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>', 1);
INSERT INTO `email_templates` VALUES (12, 'petty_cash', 'Petty Cash', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>PETTY CASH #{PETTY_CASH_ID}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Petty Cash Refund Claim Amounting To {PETTY_CASH_AMOUNT}, For {PETTY_CASH_NAME} Requested On {PETTY_CASH_REQUEST_DATE} Has Been Received And {PETTY_CASH_STATUS}. {PETTY_CASH_COMMENT}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>PETTY CASH #{PETTY_CASH_ID}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Petty Cash Refund Claim Amounting To {PETTY_CASH_AMOUNT}, For {PETTY_CASH_NAME} Requested On {PETTY_CASH_REQUEST_DATE} Has Been Received And {PETTY_CASH_STATUS}. {PETTY_CASH_COMMENT}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', 0);
INSERT INTO `email_templates` VALUES (13, 'inventory_requisitions', 'Inventory Requisitions', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>INVENTORY REQUISITIONS #{INVENTORY_REQUISITIONS_ID}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Inventory Requisite For {INVENTORY_REQUISITIONS_QUANTITY} Out Of The Available {INVENTORY_REQUISITIONS_AVAILABLE} {INVENTORY_REQUISITIONS_NAME} Requested On {INVENTORY_REQUISITIONS_REQUEST_DATE} has been {INVENTORY_REQUISITIONS_STATUS}. {INVENTORY_REQUISITIONS_COMMENT}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>INVENTORY REQUISITIONS #{INVENTORY_REQUISITIONS_ID}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Inventory Requisite For {INVENTORY_REQUISITIONS_QUANTITY} Out Of The Available {INVENTORY_REQUISITIONS_AVAILABLE} {INVENTORY_REQUISITIONS_NAME} Requested On {INVENTORY_REQUISITIONS_REQUEST_DATE} has been {INVENTORY_REQUISITIONS_STATUS}. {INVENTORY_REQUISITIONS_COMMENT}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', 0);
INSERT INTO `email_templates` VALUES (14, 'legal_notification', 'Prokazi Cases', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">\r\n    <div style=\"max-width:640px; margin:0 auto; \">\r\n        <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\r\n<img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\">\r\n            <h1>Pro Kazi Case: # {CASE_TITLE}</h1></div>\r\n        <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">Hi {USER_NAME} </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">You have been added to a legal case </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">The case is scheduled on  {CASE_DATE}</span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p>\r\n            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>\r\n            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div>\r\n        </div>\r\n    </div>\r\n</div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">\r\n    <div style=\"max-width:640px; margin:0 auto; \">\r\n        <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\">\r\n            <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\">\r\n            <h1>Pro Kazi Case: # {CASE_TITLE}</h1></div>\r\n        <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">Hi {USER_NAME} </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">You have been added to a legal case </span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\">The case is scheduled on  {CASE_DATE}</span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p>\r\n            <p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p>\r\n            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #4f0158; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>\r\n            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div>\r\n        </div>\r\n    </div>\r\n</div>', 0);
INSERT INTO `email_templates` VALUES (15, 'next_maintenance_date', 'Technical ', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>VEHICLE #{VEHICLE_NO}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {TITLE} {USER_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Vehicle No.&nbsp; {VEHICLE_NO},&nbsp; next maintenance date will be {NEXT_DATE}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff;text-align: center;background-color:#9ad4ea;padding: 30px;border-top-left-radius: 3px;border-top-right-radius: 3px;margin: 0;\"> <img src=\"http://173.212.247.73:8080/pro.teamkazi.com/files/system/default-stie-logo.png\" alt=\"Pro-Kazi\"> <h1>VEHICLE #{VEHICLE_NO}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {TITLE} {USER_NAME},</span><br></p> <p style=\"\"> <span style=\"font-size: 14px; line-height: 20px;\"> <!-- Thank you for your business cooperation. --> </span> <br> </p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your Vehicle No.&nbsp; {VEHICLE_NO},&nbsp; next maintenance date will be {NEXT_DATE}</span></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p> <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p> </div> </div></div>', 0);

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `code_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `title` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `join_date` timestamp(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `asset_no`(`code_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES (6, 'E00008', 'ISAAC BABU WATKINS', 'Mr', '2011-04-04 00:00:00', 'watkins@esl-eastafrica.com', 0, '2018-03-19 11:05:35');
INSERT INTO `employees` VALUES (7, 'E00009', 'CHRISPUS MAINGI KILEI', 'Mr', '2011-07-04 00:00:00', 'chrispus.kilei@esl-east africa.co', 0, '2018-03-19 11:05:35');
INSERT INTO `employees` VALUES (8, 'E00016', 'DANIEL LUKORITO WANIKINA', 'Mr', '2015-08-05 00:00:00', '3transport@esl-eastafrica.com', 0, '2018-03-19 11:05:35');
INSERT INTO `employees` VALUES (9, 'E00018', 'JUSTUS KALII MUTHEMBWA', 'Mr', '2015-09-01 00:00:00', '2transport@esl-eastafrica.com', 0, '2018-03-19 11:05:35');
INSERT INTO `employees` VALUES (10, 'E00044', 'ERICKSON MWANIKI NGELE', 'Mr', '2013-05-01 00:00:00', '1transport@esl-eastafrica.com', 0, '2018-03-19 11:05:35');

-- ----------------------------
-- Table structure for equipments
-- ----------------------------
DROP TABLE IF EXISTS `equipments`;
CREATE TABLE `equipments`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asset_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `purchase_price` float NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of equipments
-- ----------------------------
INSERT INTO `equipments` VALUES (1, 'S008', '567', 'SPADE', 32000, '2018-03-15 09:13:03', 0);
INSERT INTO `equipments` VALUES (2, 'J009', '900', 'tyre', 20000, '2018-03-15 09:16:52', 0);
INSERT INTO `equipments` VALUES (3, 't008', '843', 'torch', 21000, '2018-03-15 09:17:08', 0);
INSERT INTO `equipments` VALUES (4, 'e839', '111', 'engine', 10000, '2018-03-15 09:17:28', 0);
INSERT INTO `equipments` VALUES (8, 'ESL/MSA/EQ/00116', 'ESL/MSA/EQ/00116', 'TRIMMER LIFTING SLINGS', 534422, '2018-03-23 13:05:21', 0);

-- ----------------------------
-- Table structure for escalation_matrix
-- ----------------------------
DROP TABLE IF EXISTS `escalation_matrix`;
CREATE TABLE `escalation_matrix`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `escalation_matrix` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `agent_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `escalation` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `assigned_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE,
  CONSTRAINT `escalation_matrix_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for estimate_forms
-- ----------------------------
DROP TABLE IF EXISTS `estimate_forms`;
CREATE TABLE `estimate_forms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estimate_forms
-- ----------------------------
INSERT INTO `estimate_forms` VALUES (1, 'H - Test Estimate form', '', 'active', 1);

-- ----------------------------
-- Table structure for estimate_items
-- ----------------------------
DROP TABLE IF EXISTS `estimate_items`;
CREATE TABLE `estimate_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for estimate_requests
-- ----------------------------
DROP TABLE IF EXISTS `estimate_requests`;
CREATE TABLE `estimate_requests`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_form_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `client_id` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `status` enum('new','processing','hold','canceled','estimated') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for estimates
-- ----------------------------
DROP TABLE IF EXISTS `estimates`;
CREATE TABLE `estimates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL DEFAULT 0,
  `estimate_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `last_email_sent_date` date NULL DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax_id2` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for event_comments
-- ----------------------------
DROP TABLE IF EXISTS `event_comments`;
CREATE TABLE `event_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `event_id` int(11) NOT NULL,
  `share_with` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for event_notes
-- ----------------------------
DROP TABLE IF EXISTS `event_notes`;
CREATE TABLE `event_notes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time(0) NULL DEFAULT NULL,
  `end_time` time(0) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `location` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `share_with` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(11) NULL DEFAULT NULL,
  `prospector_id` int(11) NULL DEFAULT NULL,
  `business_type` int(11) NOT NULL,
  `call_type` int(11) NOT NULL,
  `objective_type` int(11) NOT NULL,
  `pipeline_stage` int(11) NOT NULL,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for expense_categories
-- ----------------------------
DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE `expense_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of expense_categories
-- ----------------------------
INSERT INTO `expense_categories` VALUES (1, 'Miscellaneous expense', 0);

-- ----------------------------
-- Table structure for expenses
-- ----------------------------
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `amount` double NOT NULL,
  `files` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for extended_services
-- ----------------------------
DROP TABLE IF EXISTS `extended_services`;
CREATE TABLE `extended_services`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of extended_services
-- ----------------------------
INSERT INTO `extended_services` VALUES (1, 'External Parts Service', '2018-03-22 12:19:40', 0);
INSERT INTO `extended_services` VALUES (2, 'Fuel', '2018-03-22 12:19:49', 0);

-- ----------------------------
-- Table structure for external_services
-- ----------------------------
DROP TABLE IF EXISTS `external_services`;
CREATE TABLE `external_services`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `job_card_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `supplier_id` int(100) NULL DEFAULT NULL,
  `service_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `start_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0000-00-00 00:00:00',
  `total_service` double NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `amount` float NULL DEFAULT NULL,
  `quantity` int(100) NULL DEFAULT NULL,
  `total_fuel` float NULL DEFAULT NULL,
  `service_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of external_services
-- ----------------------------
INSERT INTO `external_services` VALUES (2, '5', NULL, 'fuel', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2018-03-23 11:12:28', 0, 800, 90, 72000, 'ES-002', NULL);
INSERT INTO `external_services` VALUES (3, '5', 10, 'service', '03/28/2018', '03/31/2018', 2400, '2018-03-23 11:24:22', 0, NULL, NULL, NULL, 'ES-003', NULL);
INSERT INTO `external_services` VALUES (4, '7', 0, 'service', '03/28/2018', '03/30/2018', 1600, '2018-03-23 12:25:12', 0, NULL, NULL, NULL, 'ES-004', NULL);
INSERT INTO `external_services` VALUES (5, '6', 2, 'service', '03/23/2018', '04/16/2018', 19166.666666669, '2018-03-23 18:54:58', 0, NULL, NULL, NULL, 'ES-005', NULL);
INSERT INTO `external_services` VALUES (6, '6', NULL, 'fuel', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2018-03-23 18:55:33', 0, 104, 50, 5200, 'ES-006', NULL);

-- ----------------------------
-- Table structure for fuel_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `fuel_suppliers`;
CREATE TABLE `fuel_suppliers`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `price` mediumint(9) NOT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fuel_suppliers
-- ----------------------------
INSERT INTO `fuel_suppliers` VALUES (1, 'Totals', 'T007', '098325435', 200, '2018-04-10 08:43:32', 0);
INSERT INTO `fuel_suppliers` VALUES (3, 'KenGen', 'K9090', '08923543', 110, '2018-04-10 08:46:34', 0);

-- ----------------------------
-- Table structure for fuels
-- ----------------------------
DROP TABLE IF EXISTS `fuels`;
CREATE TABLE `fuels`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `litres` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `price` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `supplier_id` int(100) NULL DEFAULT NULL,
  `staff_id` int(100) NULL DEFAULT NULL,
  `invoice_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expense_id` double NULL DEFAULT NULL,
  `expense_cost` double NULL DEFAULT NULL,
  `km_reading` int(100) NULL DEFAULT NULL,
  `vehicle_id` int(100) NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of fuels
-- ----------------------------
INSERT INTO `fuels` VALUES (1, '5000', '200', '1000000', 1, 6, '565655', 3, 400, 9000, 33, '2018-04-12 13:13:01', NULL, 0);
INSERT INTO `fuels` VALUES (2, '800', '110', '88000', 3, 6, '787878', 0, 0, 5000, 36, '2018-04-12 13:13:29', NULL, 0);
INSERT INTO `fuels` VALUES (3, '3000', '200', '600000', 1, 6, '33333', 0, 0, 200000, 37, '2018-04-12 13:13:55', NULL, 0);
INSERT INTO `fuels` VALUES (4, '5000', '110', '550000', 3, 8, '12121212', 4, 4000, 300000, 38, '2018-04-12 13:14:25', NULL, 0);
INSERT INTO `fuels` VALUES (5, '40000', '200', '8000000', 1, 10, '454545', 0, 0, 120000, 39, '2018-04-12 13:14:53', NULL, 0);
INSERT INTO `fuels` VALUES (6, '34000', '200', '6800000', 1, 8, '676768', 1, 5000, 43000, 46, '2018-04-12 13:15:18', NULL, 0);
INSERT INTO `fuels` VALUES (7, '32000', '200', '6400000', 1, 6, '232323', 0, 0, 23000, 47, '2018-04-12 13:15:42', NULL, 0);
INSERT INTO `fuels` VALUES (8, '457890', '200', '91578000', 1, 7, '232312212', 3, 400, 34900, 48, '2018-04-12 13:16:12', NULL, 0);
INSERT INTO `fuels` VALUES (9, '4500', '110', '495000', 3, 6, '324567', 0, 0, 123450, 50, '2018-04-12 13:16:44', NULL, 0);
INSERT INTO `fuels` VALUES (10, '123456', '200', '24691200', 1, 9, '2121234433', 0, 0, 21000, 33, '2018-04-12 13:17:11', NULL, 0);
INSERT INTO `fuels` VALUES (11, '56000', '110', '6160000', 3, 10, '343434', 3, 400, 789876, 36, '2018-04-12 13:17:36', NULL, 0);
INSERT INTO `fuels` VALUES (12, '2590', '110', '284900', 3, 9, '67896', 0, 0, 89045, 38, '2018-04-12 13:18:06', NULL, 0);
INSERT INTO `fuels` VALUES (14, '34000', '200', '6800000', 1, 9, '3234545', 4, 4000, 467000, 39, '2018-04-12 17:08:45', NULL, 0);
INSERT INTO `fuels` VALUES (15, '34', '200', '6800', 1, 6, '234343', 0, 0, 43256, 39, '2018-04-12 17:11:09', NULL, 0);
INSERT INTO `fuels` VALUES (16, '3290', '110', '361900', 3, 6, '123456', 1, 5000, 432156, 37, '2018-04-12 17:11:49', NULL, 0);

-- ----------------------------
-- Table structure for hire_assets
-- ----------------------------
DROP TABLE IF EXISTS `hire_assets`;
CREATE TABLE `hire_assets`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `asset` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `staff_id` int(100) NULL DEFAULT NULL,
  `client_id` int(100) NULL DEFAULT NULL,
  `rate` double NOT NULL,
  `tonnes` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total` double NOT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hire_assets
-- ----------------------------
INSERT INTO `hire_assets` VALUES (1, '8', 6, 2, 60, '2', 120, '2018-04-10 16:04:46', NULL, 0);
INSERT INTO `hire_assets` VALUES (3, '3', 8, 701, 21000, '100', 2100000, '2018-04-10 16:11:14', '2018-04-13 13:39:41', 0);

-- ----------------------------
-- Table structure for inventory_requisitions
-- ----------------------------
DROP TABLE IF EXISTS `inventory_requisitions`;
CREATE TABLE `inventory_requisitions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_quantity` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `StkItem_id` int(11) NULL DEFAULT NULL,
  `sage_project_id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Pending',
  `approver_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inventory_requisitions
-- ----------------------------
INSERT INTO `inventory_requisitions` VALUES (1, 5, 135, 'A3 Envelope', '12', 135, 2, 'dss', '2018-04-12 00:00:00', NULL, 'Pending', 0, 0);
INSERT INTO `inventory_requisitions` VALUES (2, 94, 139, 'Envelope letter', '12', 139, 5, 'dhuigeyvcecvu', '2018-04-12 00:00:00', NULL, 'Pending', 0, 0);

-- ----------------------------
-- Table structure for invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE `invoice_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for invoice_payments
-- ----------------------------
DROP TABLE IF EXISTS `invoice_payments`;
CREATE TABLE `invoice_payments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `transaction_id` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_by` int(11) NULL DEFAULT 1,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `id_2`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `last_email_sent_date` date NULL DEFAULT NULL,
  `status` enum('draft','not_paid') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `tax_id2` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for job_inspections
-- ----------------------------
DROP TABLE IF EXISTS `job_inspections`;
CREATE TABLE `job_inspections`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_inspections
-- ----------------------------
INSERT INTO `job_inspections` VALUES (2, '5th Wheel Check', '2018-02-23 21:08:23', NULL, 0);
INSERT INTO `job_inspections` VALUES (3, 'General Inspection	\r\n', '2018-02-23 21:09:14', NULL, 0);
INSERT INTO `job_inspections` VALUES (4, 'Battery Check', '2018-02-23 21:09:14', NULL, 0);
INSERT INTO `job_inspections` VALUES (6, 'test', '2018-03-06 22:36:31', NULL, 0);

-- ----------------------------
-- Table structure for job_services
-- ----------------------------
DROP TABLE IF EXISTS `job_services`;
CREATE TABLE `job_services`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_services
-- ----------------------------
INSERT INTO `job_services` VALUES (1, 'Normal Job', '2018-02-22 01:32:19', NULL, 0);
INSERT INTO `job_services` VALUES (2, 'Service Job', '2018-02-22 01:32:19', NULL, 0);

-- ----------------------------
-- Table structure for job_tasks
-- ----------------------------
DROP TABLE IF EXISTS `job_tasks`;
CREATE TABLE `job_tasks`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `service_type_id` int(100) NULL DEFAULT NULL,
  `assigned_to` int(100) NOT NULL,
  `tasks` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `start_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `job_time_in` time(0) NULL DEFAULT NULL,
  `jobs_type_id` int(100) NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_tasks
-- ----------------------------
INSERT INTO `job_tasks` VALUES (1, 2, 6, 'complete', '2018-03-28 00:00:00', '01:59:00', 5, '2018-03-23 07:05:37', NULL, 0);
INSERT INTO `job_tasks` VALUES (2, 2, 9, 'great', '2018-03-21 00:00:00', '01:00:00', 6, '2018-03-23 07:05:58', NULL, 0);
INSERT INTO `job_tasks` VALUES (3, 2, 8, 'great task', '2018-03-28 00:00:00', '01:00:00', 2, '2018-03-23 07:07:31', NULL, 0);
INSERT INTO `job_tasks` VALUES (4, 1, 6, 'test 1', '0000-00-00 00:00:00', '00:00:00', 1, '2018-03-23 18:29:05', NULL, 0);
INSERT INTO `job_tasks` VALUES (5, 2, 0, 'test 1', '2018-03-21 00:00:00', '09:00:00', 0, '2018-03-23 18:30:07', NULL, 0);

-- ----------------------------
-- Table structure for job_types
-- ----------------------------
DROP TABLE IF EXISTS `job_types`;
CREATE TABLE `job_types`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `job_type_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `service_type` int(100) NULL DEFAULT NULL,
  `job_id` int(100) NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_types
-- ----------------------------
INSERT INTO `job_types` VALUES (1, 'oiling', 1, 2, '2018-03-23 07:00:28', NULL, 0);
INSERT INTO `job_types` VALUES (2, 'replacing tyre', 1, 2, '2018-03-23 07:00:59', NULL, 0);
INSERT INTO `job_types` VALUES (3, 'servicing', 2, 2, '2018-03-23 07:01:46', NULL, 0);
INSERT INTO `job_types` VALUES (4, 'pooling', 3, 2, '2018-03-23 07:02:05', NULL, 0);
INSERT INTO `job_types` VALUES (5, 'washing', 3, 1, '2018-03-23 07:02:32', NULL, 0);
INSERT INTO `job_types` VALUES (6, 'cleaning', 2, 1, '2018-03-23 07:02:53', NULL, 0);
INSERT INTO `job_types` VALUES (7, 'trenching', 2, 1, '2018-03-23 07:03:05', NULL, 0);
INSERT INTO `job_types` VALUES (8, 'Wheel Balance', 2, 2, '2018-03-23 17:43:21', NULL, 0);

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `job_service_id` int(100) NULL DEFAULT NULL,
  `job_type_id` int(100) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vehicle_no` int(100) NULL DEFAULT NULL,
  `completion_date` timestamp(0) NULL DEFAULT NULL,
  `time_in` time(0) NULL DEFAULT NULL,
  `km_reading` double NULL DEFAULT NULL,
  `fuel_balance` double NULL DEFAULT NULL,
  `card_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `supplier_id` int(100) NULL DEFAULT NULL,
  `service_type_id` int(100) NULL DEFAULT NULL,
  `application_data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (2, 2, 1, 'to be finished', 36, '2018-04-18 00:00:00', '12:00:00', 30000, 2000, 'ESL-2-KHMA 276C', NULL, NULL, '[{\"items\":{\"inspection_id\":\"2\",\"user\":\"6\",\"satus\":\"1\"}},{\"items\":{\"inspection_id\":\"3\",\"user\":\"8\",\"satus\":\"3\"}},{\"items\":{\"inspection_id\":\"2\",\"user\":\"10\",\"satus\":\"1\"}}]', '2018-04-11 09:05:30', NULL, 0);
INSERT INTO `jobs` VALUES (3, 2, 1, 'check out', 36, '2018-04-14 00:00:00', '01:00:00', 50000, 3000, 'ESL-3-KHMA 276C', NULL, 1, '[{\"items\":{\"inspection_id\":\"2\",\"user\":\"6\",\"satus\":\"1\"}},{\"items\":{\"inspection_id\":\"3\",\"user\":\"7\",\"satus\":\"3\"}},{\"items\":{\"inspection_id\":\"2\",\"user\":\"6\",\"satus\":\"1\"}},{\"items\":{\"inspection_id\":\"3\",\"user\":\"10\",\"satus\":\"3\"}}]', '2018-04-12 06:53:18', NULL, 0);

-- ----------------------------
-- Table structure for jobs_status
-- ----------------------------
DROP TABLE IF EXISTS `jobs_status`;
CREATE TABLE `jobs_status`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jobs_status
-- ----------------------------
INSERT INTO `jobs_status` VALUES (1, 'Not Started', 0);
INSERT INTO `jobs_status` VALUES (2, 'In Progress', 0);
INSERT INTO `jobs_status` VALUES (3, 'Completed', 0);

-- ----------------------------
-- Table structure for leave_applications
-- ----------------------------
DROP TABLE IF EXISTS `leave_applications`;
CREATE TABLE `leave_applications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_hours` decimal(7, 2) NOT NULL,
  `total_days` decimal(5, 2) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `reason` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime(0) NOT NULL,
  `created_by` int(11) NOT NULL,
  `checked_at` datetime(0) NULL DEFAULT NULL,
  `checked_by` int(11) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `leave_type_id`(`leave_type_id`) USING BTREE,
  INDEX `user_id`(`applicant_id`) USING BTREE,
  INDEX `checked_by`(`checked_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for leave_types
-- ----------------------------
DROP TABLE IF EXISTS `leave_types`;
CREATE TABLE `leave_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `color` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of leave_types
-- ----------------------------
INSERT INTO `leave_types` VALUES (1, 'Casual Leave', 'active', '#83c340', '', 0);

-- ----------------------------
-- Table structure for mailing_activity
-- ----------------------------
DROP TABLE IF EXISTS `mailing_activity`;
CREATE TABLE `mailing_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mailing_activity
-- ----------------------------
INSERT INTO `mailing_activity` VALUES (3, 'inwards', 'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Pellentesque in ipsum id orci p', '2018-04-14 05:11:35', NULL, 0);
INSERT INTO `mailing_activity` VALUES (4, 'outwards', 'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Pellentesque in ipsum id orci p', '2018-04-14 05:11:56', NULL, 0);

-- ----------------------------
-- Table structure for mailing_list
-- ----------------------------
DROP TABLE IF EXISTS `mailing_list`;
CREATE TABLE `mailing_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mailing_list
-- ----------------------------
INSERT INTO `mailing_list` VALUES (1, 'demo', '1234', 5, '2018-04-14 05:42:29', '2018-04-14 10:24:38', 1);
INSERT INTO `mailing_list` VALUES (2, 'amolo', 'ergervwer', 0, '2018-04-14 10:18:15', '2018-04-14 10:23:42', 1);
INSERT INTO `mailing_list` VALUES (3, 'demo 1', 'iohgfggy', 0, '2018-04-14 10:26:10', NULL, 0);
INSERT INTO `mailing_list` VALUES (4, 'ok', 'guig', 0, '2018-04-16 01:43:59', NULL, 0);

-- ----------------------------
-- Table structure for mailing_parcel
-- ----------------------------
DROP TABLE IF EXISTS `mailing_parcel`;
CREATE TABLE `mailing_parcel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NULL DEFAULT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mailing_parcel
-- ----------------------------
INSERT INTO `mailing_parcel` VALUES (6, 3, 5, 4, 82, 'domestic Insurance', 'ukirfufyufyuf', 2, '2018-04-16 02:18:05', '2018-04-16 02:46:46', 0);
INSERT INTO `mailing_parcel` VALUES (7, 3, 5, 3, 86, 'Other', 'lityudtcdygfu', 0, '2018-04-16 02:40:25', '2018-04-16 02:42:32', 0);
INSERT INTO `mailing_parcel` VALUES (8, 3, 5, 3, 82, 'rtryrtyrtyrt', 'lhlkgkufykjdjydjtdtuj', 1, '2018-04-16 02:41:29', '2018-04-16 02:46:54', 0);
INSERT INTO `mailing_parcel` VALUES (10, 4, 5, 82, 3, 'kjgy', 'iphuogo', 0, '2018-04-16 03:15:28', NULL, 0);

-- ----------------------------
-- Table structure for main_tasks
-- ----------------------------
DROP TABLE IF EXISTS `main_tasks`;
CREATE TABLE `main_tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `PROJECTS_FK`(`project_id`) USING BTREE,
  CONSTRAINT `PROJECTS_FK` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` enum('unread','read') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `message_id` int(11) NOT NULL DEFAULT 0,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted_by_users` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `message_from`(`from_user_id`) USING BTREE,
  INDEX `message_to`(`to_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for milestones
-- ----------------------------
DROP TABLE IF EXISTS `milestones`;
CREATE TABLE `milestones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of milestones
-- ----------------------------
INSERT INTO `milestones` VALUES (1, 'Fencing Complete', 1, '2018-04-13', 0);

-- ----------------------------
-- Table structure for notes
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for notification_settings
-- ----------------------------
DROP TABLE IF EXISTS `notification_settings`;
CREATE TABLE `notification_settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `enable_email` int(1) NOT NULL DEFAULT 0,
  `enable_web` int(1) NOT NULL DEFAULT 0,
  `notify_to_team` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notify_to_team_members` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `notify_to_terms` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `event`(`event`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notification_settings
-- ----------------------------
INSERT INTO `notification_settings` VALUES (1, 'project_created', 'project', 0, 0, '', '', '', 1, 0);
INSERT INTO `notification_settings` VALUES (2, 'project_deleted', 'project', 0, 0, '', '', '', 2, 0);
INSERT INTO `notification_settings` VALUES (3, 'project_task_created', 'project', 1, 1, '', '', 'project_members,task_assignee', 3, 0);
INSERT INTO `notification_settings` VALUES (4, 'project_task_updated', 'project', 0, 1, '', '', 'task_assignee', 4, 0);
INSERT INTO `notification_settings` VALUES (5, 'project_task_assigned', 'project', 0, 1, '', '', 'task_assignee', 5, 0);
INSERT INTO `notification_settings` VALUES (7, 'project_task_started', 'project', 0, 0, '', '', '', 7, 0);
INSERT INTO `notification_settings` VALUES (8, 'project_task_finished', 'project', 0, 0, '', '', '', 8, 0);
INSERT INTO `notification_settings` VALUES (9, 'project_task_reopened', 'project', 0, 0, '', '', '', 9, 0);
INSERT INTO `notification_settings` VALUES (10, 'project_task_deleted', 'project', 0, 1, '', '', 'task_assignee', 10, 0);
INSERT INTO `notification_settings` VALUES (11, 'project_task_commented', 'project', 0, 1, '', '', 'task_assignee', 11, 0);
INSERT INTO `notification_settings` VALUES (12, 'project_member_added', 'project', 0, 1, '', '', 'project_members', 12, 0);
INSERT INTO `notification_settings` VALUES (13, 'project_member_deleted', 'project', 0, 1, '', '', 'project_members', 13, 0);
INSERT INTO `notification_settings` VALUES (14, 'project_file_added', 'project', 0, 1, '', '', 'project_members', 14, 0);
INSERT INTO `notification_settings` VALUES (15, 'project_file_deleted', 'project', 0, 1, '', '', 'project_members', 15, 0);
INSERT INTO `notification_settings` VALUES (16, 'project_file_commented', 'project', 0, 1, '', '', 'project_members', 16, 0);
INSERT INTO `notification_settings` VALUES (17, 'project_comment_added', 'project', 0, 1, '', '', 'project_members', 17, 0);
INSERT INTO `notification_settings` VALUES (18, 'project_comment_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 18, 0);
INSERT INTO `notification_settings` VALUES (19, 'project_customer_feedback_added', 'project', 0, 1, '', '', 'project_members', 19, 0);
INSERT INTO `notification_settings` VALUES (20, 'project_customer_feedback_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 20, 0);
INSERT INTO `notification_settings` VALUES (21, 'client_signup', 'client', 0, 1, '1', '5', '', 21, 0);
INSERT INTO `notification_settings` VALUES (22, 'invoice_online_payment_received', 'invoice', 0, 0, '', '', '', 22, 0);
INSERT INTO `notification_settings` VALUES (23, 'leave_application_submitted', 'leave', 0, 0, '', '', '', 23, 0);
INSERT INTO `notification_settings` VALUES (24, 'leave_approved', 'leave', 0, 1, '', '', 'leave_applicant', 24, 0);
INSERT INTO `notification_settings` VALUES (25, 'leave_assigned', 'leave', 0, 1, '', '', 'leave_applicant', 25, 0);
INSERT INTO `notification_settings` VALUES (26, 'leave_rejected', 'leave', 0, 1, '', '', 'leave_applicant', 26, 0);
INSERT INTO `notification_settings` VALUES (27, 'leave_canceled', 'leave', 0, 0, '', '', '', 27, 0);
INSERT INTO `notification_settings` VALUES (28, 'ticket_created', 'ticket', 1, 1, '', '', 'ticket_assignee', 28, 0);
INSERT INTO `notification_settings` VALUES (29, 'ticket_commented', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 29, 0);
INSERT INTO `notification_settings` VALUES (30, 'ticket_closed', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 30, 0);
INSERT INTO `notification_settings` VALUES (31, 'ticket_reopened', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 31, 0);
INSERT INTO `notification_settings` VALUES (32, 'estimate_request_received', 'estimate', 0, 0, '', '', '', 32, 0);
INSERT INTO `notification_settings` VALUES (33, 'estimate_sent', 'estimate', 0, 0, '', '', '', 33, 0);
INSERT INTO `notification_settings` VALUES (34, 'estimate_accepted', 'estimate', 0, 0, '', '', '', 34, 0);
INSERT INTO `notification_settings` VALUES (35, 'estimate_rejected', 'estimate', 0, 0, '', '', '', 35, 0);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `notify_to` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `read_by` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, 5, '', '2018-03-23 12:03:03', '219,241', '', 'project_task_created', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (2, 5, '', '2018-04-12 08:01:51', '', '', 'project_task_created', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (3, 5, '', '2018-04-12 08:06:16', '94,100', ',100', 'project_task_created', 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (4, 94, '', '2018-04-12 08:08:23', '', '', 'project_task_updated', 1, 2, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (5, 100, '', '2018-04-12 08:11:04', '94', ',94', 'project_task_updated', 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (6, 100, '', '2018-04-12 08:14:22', '5', '', 'project_task_commented', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (7, 100, '', '2018-04-12 08:14:42', '5', ',5', 'project_task_updated', 1, 1, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (8, 5, '', '2018-04-12 08:24:58', '94,100', '', 'project_comment_added', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (9, 100, '', '2018-04-12 08:28:48', '5', ',5', 'project_task_commented', 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (10, 5, '', '2018-04-12 08:29:34', '', '', 'project_task_commented', 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (11, 100, '', '2018-04-12 08:33:08', '5', ',5', 'project_task_updated', 1, 1, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (12, 5, '', '2018-04-12 08:38:59', '', '', 'project_task_updated', 1, 1, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (13, 5, '', '2018-04-12 08:46:59', '94,100', '', 'project_comment_added', 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (14, 5, '', '2018-04-12 11:59:44', '94', '', 'project_task_created', 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (15, 94, '', '2018-04-12 12:03:39', '5,82', '', 'project_member_added', 2, 0, 0, 0, 0, 0, 0, 0, 82, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (16, 5, '', '2018-04-12 12:09:58', '82,83,94', '', 'project_task_created', 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (17, 100, '', '2018-04-12 13:49:26', '94', '', 'project_task_updated', 1, 2, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0);
INSERT INTO `notifications` VALUES (18, 5, '', '2018-04-13 12:17:14', '94', '', 'project_task_updated', 2, 2, 0, 0, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for objective_types
-- ----------------------------
DROP TABLE IF EXISTS `objective_types`;
CREATE TABLE `objective_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of objective_types
-- ----------------------------
INSERT INTO `objective_types` VALUES (1, 'Debt Collection', '2018-01-22 21:51:46', NULL, 0);
INSERT INTO `objective_types` VALUES (2, 'Development', '2018-01-22 21:51:57', NULL, 0);
INSERT INTO `objective_types` VALUES (3, 'Maintenance', '2018-01-22 21:52:08', NULL, 0);
INSERT INTO `objective_types` VALUES (4, 'Acquisition', '2018-01-22 21:52:20', NULL, 0);

-- ----------------------------
-- Table structure for other_expenses
-- ----------------------------
DROP TABLE IF EXISTS `other_expenses`;
CREATE TABLE `other_expenses`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cost` double NOT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of other_expenses
-- ----------------------------
INSERT INTO `other_expenses` VALUES (1, 'car wash', 'done weekly', 5000, '2018-04-12 09:30:13', 0);
INSERT INTO `other_expenses` VALUES (3, 'Lubricating', 'To be done frequently', 400, '2018-04-12 09:40:01', 0);
INSERT INTO `other_expenses` VALUES (4, 'fine', 'reckless driving', 4000, '2018-04-12 09:40:47', 0);

-- ----------------------------
-- Table structure for parts_suppliers
-- ----------------------------
DROP TABLE IF EXISTS `parts_suppliers`;
CREATE TABLE `parts_suppliers`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `account` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tax_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 538 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of parts_suppliers
-- ----------------------------
INSERT INTO `parts_suppliers` VALUES (1, 'kinde eng.', 'k0934423', '096554333386', '4567', '2018-03-15 17:04:50', 0);
INSERT INTO `parts_suppliers` VALUES (2, 'kenGen', 'kg45890', '903432535', '89022', '2018-03-15 17:05:20', 0);
INSERT INTO `parts_suppliers` VALUES (3, 'A.B.M.C International Ltd', 'A0033', '+ 254 20 40 31 000', 'P051390953D', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (4, 'A.D. Design Architects', 'A0039', '041-2220500', 'A002299132T', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (5, 'AAR Health Care', 'A0001', '020 271 531 9', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (6, 'Abercrombie & Kent Kenya Ltd', 'A0041', '', 'P000592730P', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (7, 'Abetrans Logistics Ltd', 'A0023', '+972-3-795-8888', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (8, 'Accesskenya Group Ltd', 'A0003', '020 360 000 0', 'P051193029R', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (9, 'African Cargo Handling Ltd', 'A0004', '328 230 00', 'P051118655F', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (10, 'African eDevelopment House', 'A0042', '', 'P051185021Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (11, 'African Marine and General Engineering Co. Ltd', 'A0029', '+254 722 203 455', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (12, 'Agents One', 'A0016', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (13, 'Ahlers India Private Ltd-India', 'A0022', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (14, 'AIG Kenya Insurance Co.Ltd', 'A0025', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (15, 'Airgo Consultants Ltd', 'A0011', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (16, 'Alba Petroleum Ltd', 'A0040', '+254 20 2107990', 'P000621140B', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (17, 'ALFOSS ENERGY LIMITED', 'A0026', '+254722871853', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (18, 'Alicom Systems Ltd', 'A0006', '44 1628 554650', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (19, 'Alicom Systems Ltd', 'A0014', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (20, 'All World Investment Ltd', 'A0044', '+256701778001', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (21, 'Amirali Transporters', 'A0032', '0710-786000', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (22, 'Anderson Human Capital Ltd', 'A0043', '020-2633926', 'P051391837Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (23, 'Antarc Ltd', 'A0036', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (24, 'Anwarali & Brothers Ltd', 'A0007', '020-8017615', 'P000620847Q', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (25, 'Aon Kenya Insurance Brokers Ltd', 'A0005', '473135/38/898', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (26, 'APA Insurance Ltd', 'A0028', '041-2226770', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (27, 'Apex Steel Ltd', 'A0027', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (28, 'Aquisana Ltd', 'A0002', '020 243 510 8', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (29, 'Aramex Kenya Ltd', 'A0038', '+254 20 5158000', 'P051139805Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (30, 'Ashbury & Fletcher Ltd', 'A0030', '+ 254 20 2014684', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (31, 'Athi Kay Ltd', 'A0035', '0700 117257', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (32, 'Auto Movers Ltd', 'A0045', '', 'P051412589J', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (33, 'Automobile Association of Kenya', 'A0034', '020 2612300', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (34, 'AutoXpress Ltd', 'A0017', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (35, 'Aviation Cargo Support Ltd', 'A0037', '+254-20-822917/8', 'P051215067C', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (36, 'Baileys Plant Hire Ltd', 'B0014', '0722 411128', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (37, 'Baltic International Maritime Council', 'B0003', '45 4436 6800', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (38, 'BANADARINI SHIP CHANDLERS', 'B0009', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (39, 'BANDARINI SHIPCHANDALERS & GENERAL AGENCIS LTD', 'B0008', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (40, 'Baobab Beach Resort Mombasa Ltd', 'B0020', '020 2057093-8', 'P000619188N', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (41, 'Baraka Fm Ltd', 'B0025', '0790955955', 'P051529971y', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (42, 'Bati Nakliyat ve Ticaret A.S.', 'B0012', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (43, 'Beca Auto Ltd', 'B0015', '0723 922 199', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (44, 'BEST BUYS TECHNOLOGIES LTD', 'B0006', '0412313225', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (45, 'Best Western Plus Creekside Hotel', 'B0022', '+254733888746', 'P051228052C', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (46, 'Bill investments ltd', 'B0002', '556459/', 'P000601105W', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (47, 'BIMCO', 'B0010', ' +45 44 36 68 0', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (48, 'Blue wave Company Ltd', 'B0001', '2227818/2230331', 'P051124454T', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (49, 'Bollore Africa Logistics Kenya Ltd', 'B0018', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (50, 'Boma Travel Services Ltd', 'B0016', '+254 41 2319796', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (51, 'Boma Travel Services Ltd (Usd)', 'B0017', '+254 41 2319796', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (52, 'Bounty Hotel', 'B0005', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (53, 'Brains Tours & Car Hire', 'B0004', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (54, 'Bribramo General Contractors Ltd', 'B0011', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (55, 'BrighterMonday.com Ltd', 'B0023', '0703 026117', 'P051208319X', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (56, 'Brookside Dairy Ltd', 'B0019', '+254 20 3542480', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (57, 'Burudika Holdings Ltd', 'B0027', '0707271757', 'P051559331L', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (58, 'Busara Logistics Ltd-KES', 'B0024', '0722472240', 'P051402002E', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (59, 'Business Motivation Seminars Ltd', 'B0021', '+44 20 8669, 5222', 'GB 407 3323 81', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (60, 'Butterfly For Weddings', 'B0026', '0726420119', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (61, 'Buzeki Dairy Ltd', 'B0013', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (62, 'Canopy  Solutions (K) Limited', 'C0036', '+254712923254', 'P051558306I', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (63, 'Car & General (trading)Ltd', 'C0009', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (64, 'Car Track', 'C0023', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (65, 'Cargo Service Centre', 'C0005', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (66, 'Castle Royal Hotel', 'C0027', '041 2228780', 'P000595575K', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (67, 'Cellnet Ltd', 'C0020', '041 2222239', 'P000619916A', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (68, 'Cemtec Eng. Ltd XXXXXXXXXX', 'C0010', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (69, 'Cemtec Engineering Ltd', 'C0006', '+254 041 24 90 310', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (70, 'Centre for Corporate Governance', 'C0028', '+254 20 3745915', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (71, 'Chandaria Industries Ltd', 'C0025', '+254 20 8563252-4', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (72, 'Chartis Kenya Insurance Co. Ltd  ', 'C0021', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (73, 'Chartis Kenya Insurance Co. Ltd (Ksh)', 'C0026', '020  3676 000  3751 800', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (74, 'CITY COUNCIL OF NAIROBI', 'C0014', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (75, 'CMA CGM Kenya Ltd', 'C0002', ' 25441435263', 'P051171485W', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (76, 'CMC MOTORS GROUP LTD', 'C0013', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (77, 'Coast Lamps Ltd (Ksh)', 'C0024', '(041)2311 411', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (78, 'Coco Vita Ltd', 'C0030', '0728-604471', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (79, 'College of Insurance, Mombasa', 'C0031', '020 2348328', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (80, 'Communications Authority of Kenya', 'C0029', '254-020-4242000', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (81, 'Communications Commission of Kenya', 'C0008', '254 020 424 2000', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (82, 'COMPUTECH LIMITED', 'C0015', '0733666661', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (83, 'Computech Ltd', 'C0017', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (84, 'Computech Ltd', 'C0019', '0733 666 666', 'P000599855R', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (85, 'Conquest Capital Ltd', 'C0034', '+254 020 2363559', 'P051220252M', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (86, 'Cory Logistics', 'C0007', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (87, 'Crater Automobiles (NBI) Ltd', 'C0033', '+254 020 8068901', 'P000606000F', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (88, 'Creative Concepts Ltd', 'C0032', '+254 41 2000169', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (89, 'Cross Freight GMBH', 'C0022', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (90, 'Crown Petroleum (K) Ltd', 'C0037', '0722 203 898', 'P051149445E', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (91, 'Crowne Plaza, Nairobi', 'C0035', '020 2746000', 'P051192432Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (92, 'Crystal Rims & Accessories Ltd', 'C0016', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (93, 'Crystal Rims & Accessories Ltd', 'C0018', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (94, 'Darajani hotel co.ltd', 'D0003', '041 2494692', 'P051200631H', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (95, 'David & Sons ', 'D0016', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (96, 'Davis & Shirtliff Ltd ', 'D0024', '+254 41 249 5920', 'P000591252N', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (97, 'Deans Travel Centre ltd', 'D0001', '041 2317211', 'P051165502Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (98, 'Deans Travel Centre Ltd (USD)', 'D0004', '041 2317211', 'P051165502Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (99, 'Delta Handling Services', 'D0026', '', 'P051340954Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (100, 'DENTECH ENTERPRISES', 'D0014', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (101, 'Dev Enterprises Ltd', 'D0002', '041 2222378', 'P000621269R', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (102, 'DHL Worldwide Express Kenya', 'D0005', '+254 (041) 223933 ', 'P000613307I', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (103, 'Digital Edge', 'D0021', '+254 729 265 020', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (104, 'Digital Hub', 'D0022', '+254 (20) 2112220', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (105, 'Dimensional Computer Backups', 'D0009', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (106, 'DIMENSIONAL SERVICES LTD', 'D0015', '020-2068790', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (107, 'Distance Car Hire, Tours & Travel Ltd', 'D0006', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (108, 'DN Freight', 'D0007', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (109, 'Document Consulting Ltd', 'D0013', '+254206005545/8', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (110, 'DODWELL and COMPANY (East Africa) Limited', 'D0019', '+254 11 230060', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (111, 'Dolphins Training & Consultants Ltd', 'D0025', '+254 20 2211362/4/5/382', 'P051219950K', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (112, 'Dorbe Leit Solutions Ltd', 'D0023', '0701 561 919', 'P051305505S', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (113, 'Dove Business Enterprise', 'D0017', '020-551239', 'A004023720Y', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (114, 'Dream Works Technologies ', 'D0008', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (115, 'DSM Corridor Group Ltd', 'D0020', '+255 (0) 75 4632827', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (116, 'DSTV Supersport', 'D0010', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (117, 'DSV Belgium N.V', 'D0018', '03/238 25 15', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (118, 'Eagle Africa Insurance Brokers Kenya Ltd', 'E0004', '041 2003051', 'P000591465U', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (119, 'East African Commercial & Shipping ', 'E0018', '254 707 032 148', 'P000618644C', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (120, 'Easternpioneers Limited', 'E0020', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (121, 'EBB  Alliance  Ltd (HK)', 'E0012', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (122, 'Eculine Kenya Ltd', 'E0005', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (123, 'Elegance Technology Ltd', 'E0023', '+254708198586', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (124, 'Elegance Technology Ltd', 'E0024', '+254 735248000', 'P051373020N', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (125, 'Elite Digital ', 'E0006', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (126, 'Elite Digital Mombasa Ltd', 'E0001', '020-8046262/63', 'P05131329G', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (127, 'Emirates Shipping EA Limited', 'E0007', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (128, 'Enforcer Alarms Ltd', 'E0003', '2222882/', 'P051091186X', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (129, 'Enhanced Performance & Innovation Centre (Ksh)', 'E0011', '020-2022156', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (130, 'EON Maritime Services', 'E0013', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (131, 'Equitorial Secretaries & Registrars', 'E0021', '2226422/3', 'P051146810Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (132, 'Euro Models (K) Ltd', 'E0022', '+254 0722 354532', 'P051552846H', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (133, 'Euromax Africa Investment Company Ltd', 'E0016', '+254724755296', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (134, 'Euromax Africa Investment Company Ltd', 'E0017', '041 2319447', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (135, 'Evergreen Logistics Corp.', 'E0010', '+886-02-2508369', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (136, 'Evergreen Logistics Corp.**************', 'E0009', '+886-02-25083969', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (137, 'Everlloyd Container Lines PVT Ltd', 'E0008', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (138, 'Expolanka Freight Dubai', 'E0002', '+971-4-2990111', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (139, 'Export Trading Company Ltd', 'E0025', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (140, 'Export UK Motors Limited', 'E0019', '+44 20 8986 1254', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (141, 'Express Chartering & Shipping Ltd', 'E0015', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (142, 'Eyecatchers  Ltd', 'E0014', '2224033', 'P051116426S', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (143, 'Fahmi Said Basalim', 'F0021', '+254 722 414918', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (144, 'Fairdeal  Superstores  Ltd', 'F0015', '0720 107033', 'P061148499S', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (145, 'Fairdeal Furniture Ltd', 'F0023', '020 829051/2/3', 'P051340082U', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (146, 'Faiz Gym', 'F0019', '0722 692961', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (147, 'Fapbod Ships & General contractors', 'F0001', '041 2230841/', 'P051102553N', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (148, 'Farouk Adam & Company Advocates', 'F0017', '2220210', 'A000140451V', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (149, 'Fast tTruck Int. limited', 'F0004', '2229784/6', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (150, 'Federation of Kenya Employers', 'F0013', '2721929/48/49/52', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (151, 'FinanMark Africa Ltd', 'F0024', '+254 020 3510610', 'P051201170K', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (152, 'Fire fox xxxxxxxxxxxxxx', 'F0008', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (153, 'Firefox Kenya Ltd', 'F0014', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (154, 'First Computers Ltd ', 'F0002', '+254 733 666 661', 'P051113453P', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (155, 'Flag Business Systems', 'F0011', '0723938719', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (156, 'Flamingo Beach Resort & Spa', 'F0020', '+254 41 5480034/5/6/7', 'VAT 0513633691', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (157, 'Floor Solutions', 'F0022', '', 'A007102667M', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (158, 'Fones Direct Ltd', 'F0018', '+254 (20) 300 1117', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (159, 'Fracoline Marketing Africa', 'F0009', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (160, 'Freight in Time Limited', 'F0012', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (161, 'Freightwell Express Limited-USD', 'F0005', '2224822/', 'P051153405J', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (162, 'Freightwell Express Ltd -KES', 'F0006', '+254-412229784', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (163, 'Furniture Palace International (K) Ltd', 'F0016', '0721 554 073', 'P051141705E', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (164, 'Furniturerama Ltd', 'F0003', '2494759-60', 'P 051133096Y', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (165, 'FUTURE KENYA (USD)', 'F0010', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (166, 'Future Kenya Ltd ', 'F0007', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (167, 'Galaxy Ventures Services', 'G0010', '', 'A005140848H', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (168, 'Ganador Investments', 'G0003', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (169, 'George Philip Muhugu Ngomo', 'G0001', '0734 790 410', 'A001754984K', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (170, 'Global Business Commanders Ltd', 'G0008', '041 2229381', '0130204X', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (171, 'Grantoh Logistics Ltd', 'G0009', '+254 723457084', 'P051530778K', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (172, 'Graphic World Ltd', 'G0005', '0721 241 052', 'P051376336G', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (173, 'Grayson Consulting Ltd', 'G0007', '020 261 7718', 'P051413941X', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (174, 'Green Island Ship Chandlers K Ltd', 'G0002', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (175, 'Green Island Shipping Services Ltd', 'G0006', '+254 20 2683940/2', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (176, 'Habib Boats', 'H0005', '0733895987', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (177, 'Hammond Tutu & Gunther Kenya Ltd', 'H0001', '020-2340347/', 'P051216709Z', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (178, 'Hammond Tutu & Guntherxxxxxxxx', 'H0007', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (179, 'Harbour Agency Limited', 'H0012', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (180, 'Heritage Insurance Company Ltd', 'H0004', '2224724', 'P000591465U', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (181, 'Hi-Tech Radiocall Services', 'H0003', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (182, 'Hot Point Appliances Ltd', 'H0011', '0770299361/2', 'P000597694S', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (183, 'Hotel English Point', 'H0009', '041 2147000', 'P051092905R', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (184, 'Hotel English Point - USD', 'H0013', '041 2147000', 'P051092905R', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (185, 'Hotel Rio', 'H0008', '+254 020 2300152', 'P051197219Y', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (186, 'Hull Marine Enterprises', 'H0010', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (187, 'HUSSEIN AUTO SPARES LTD', 'H0006', '0722820392', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (188, 'I. Messina (K) Ltd', 'I0016', '+254 41 2319640/1/2', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (189, 'IBC JAPAN', 'I0005', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (190, 'ICPAK', 'I0025', '020 2304226/7', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (191, 'IFA- Gelders Forwarding B.V', 'G0004', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (192, 'IFA Secretariat', 'I0002', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (193, 'IFA-Haiko Logistics India PVT Ltd', 'H0002', ' 00 9122 2857 7354/32', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (194, 'Imer Investments Ltd', 'I0014', '0722 403 049', 'P051405318U', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (195, 'Immaculate initial Services', 'I0033', '+254 721 217 110', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (196, 'Inchcape Shipping  Services Kenya Ltd', 'I0024', '+254 41 2314245', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (197, 'Indesols Ltd', 'I0022', '020 2573956', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (198, 'Industrial & Maritime Surveyors Ltd', 'I0006', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (199, 'Infinite  Horizon', 'I0008', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (200, 'Inspectorate E.A Ltd', 'I0017', '0722 305 872', 'P051173300F', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (201, 'Inspectorate E.A Ltd. (Kshs)', 'I0021', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (202, 'Institute of Certified Public Secretaries of Kenya', 'I0026', '', '', '2018-03-15 17:54:12', 0);
INSERT INTO `parts_suppliers` VALUES (203, 'Institute Of Chartered Shipbrokers', 'I0010', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (204, 'Institute of Chartered Shipbrokers ICS', 'I0013', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (205, 'Institute of Directors (Kenya)', 'I0029', '+254-020-2190131', 'P051180293W', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (206, 'Institute of Human Resource Management', 'I0018', '+254 (0) 20 2213745', 'P051222543Q', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (207, 'Institute of Internal Auditors', 'I0020', '2731246', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (208, 'Insurance Institute of East Africa', 'I0030', '+254 20 6530128', 'P051609555U', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (209, 'Intermark Services', 'I0027', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (210, 'International Maritime & Aviation', 'I0011', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (211, 'International Maritime & Aviation (Ksh)', 'I0004', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (212, 'International Maritime Aviation (Inactive)', 'I0009', '04 398 7117', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (213, 'International Register of Certified Auditors', 'I0028', '+44 0 20 7245 6833', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (214, 'Isinya Resorts Limited', 'I0023', '+254202310980', 'P051342232O', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (215, 'Island Auto Works', 'I0019', '0719 786 786', 'P051444842C', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (216, 'Island Tyres & Automart Ltd', 'I0001', '041 2494980', 'P051166177H', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (217, 'IVK Manuport Logistics LLC-USD', 'I0031', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (218, 'Ivory Software Ltd-Usd', 'I0032', '0720 224918', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (219, 'Ivory Technologies', 'I0015', '0734 391762', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (220, 'iWay Africa Kenya Ltd', 'I0012', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (221, 'JAAMBO FREIGHT', 'J0005', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (222, 'Jaffery Motors', 'J0012', '2226604', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (223, 'Jafftek Computer Solutions usd', 'J0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (224, 'Jans Trading Japan', 'J0003', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (225, 'Jathii Enterprises ', 'J0001', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (226, 'Jetvin Ltd', 'J0014', '0724 879270', 'P051530415N', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (227, 'Jihan Freighters Ltd', 'J0013', '2227093', 'P051099809K', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (228, 'JIWANI IMPEX LIMITED', 'J0004', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (229, 'Joash M . Orina', 'J0010', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (230, 'Jobs Connection Limited', 'J0008', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (231, 'Jomki  Enterprises Ship Contractors', 'J0002', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (232, 'Jona Pestcon', 'J0007', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (233, 'Josim Agencies Limited', 'J0011', '0725283299', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (234, 'Joweb Graphic Designers', 'J0016', '+254-20-2302017', 'A003648695T', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (235, 'Joyden Enterprises', 'J0009', '2495325', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (236, 'Julius Okoth Francis', 'J0015', '', 'A001279816U', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (237, 'Karigithu Kinyua & Co. Advocates', 'K0001', '2220909/', 'P051184901P', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (238, 'KASL', 'K0010', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (239, 'KAWSAR AUTO SPARES LTD', 'K0009', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (240, 'Kebba Holdings Ltd', 'K0028', '0706 223153', 'P051437328G', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (241, 'Keldex Enterprises Ltd', 'K0014', '+254727247137', 'P051427327E', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (242, 'KEMA (E.A) Ltd', 'K0019', '041 2492837', 'P051095678P', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (243, 'Kenya Airways Ltd(KAHL)', 'K0005', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (244, 'Kenya Ferry Services Ltd', 'K0004', '2226220/', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (245, 'Kenya Institute of Management', 'K0021', '020 2445555', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (246, 'Kenya Marine Contractors (EPZ) Ltd ', 'K0002', '+254 20 2381040', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (247, 'Kenya Maritime Authority', 'K0013', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (248, 'Kenya National Chamber of Commerce & Industry', 'K0030', '0721373373', 'P051453668U', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (249, 'Kenya National Shipping Line Ltd', 'K0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (250, 'Kenya Orient Insurance Ltd', 'K0029', '', 'P000609360C', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (251, 'Kenya port Authority', 'K0003', '+254 11 312211', 'P051094522S', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (252, 'Kenya Ports Authority', 'K0012', '254 11 312211', 'P051094522S', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (253, 'Kenya Red cross Society EMS ', 'K0020', '0725 292 000', 'P051111931F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (254, 'Kenya Shippers Council', 'K0018', '+254 20 2684799/801', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (255, 'KENYA SHIPS AGENT ASSOCIATION', 'K0011', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (256, 'KenyaWeb.Com Limited', 'K0007', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (257, 'Ketty Tours', 'K0015', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (258, 'Ketty Tours, Travels & Safaris Ltd', 'K0016', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (259, 'Keyun Hauliers Ltd', 'K0026', '0729 643448', 'P051565294U', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (260, 'Kimlan Management Ltd', 'K0024', '+254 0721 234013', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (261, 'Kingsway Tyres Ltd', 'K0022', '041 2491013', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (262, 'Kiragu & Mwangi Ltd ', 'K0017', '4452581/2/3', 'P051094719W', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (263, 'Kismart Aluminium Fabrications', 'K0025', '+254 020 8053119', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (264, 'Kivunzi (K) Ltd', 'K0023', '0708 898735', 'P051407674O', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (265, 'KK Facilities Management Ltd', 'K0027', '', 'P051119652E', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (266, 'KW Design', 'K0008', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (267, 'L L & L Enterprises', 'L0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (268, 'Laminate and Interiors Masters', 'L0015', '0795 502697', 'A003709706B', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (269, 'Lamwo General Engineering Works Ltd', 'L0012', '+254 0726 741201', '168884J', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (270, 'Land & Marine Publications Ltd', 'L0010', '+44(0)1206752902', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (271, 'Lantech Data Services Ltd', 'L0013', '+254 020 243 5477', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (272, 'Lan-X Africa Ltd', 'L0007', '020 2166058', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (273, 'Lapid Logistics Limited', 'L0002', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (274, 'Lapid Logistics Ltd Usd', 'L0004', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (275, 'Lenga Afri Ltd - KES', 'L0018', '+254 716 304 680', 'P051667772Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (276, 'Lenga Afri Ltd - USD', 'L0017', '+254 716 304 680', 'P051667772Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (277, 'Leopard Beach Resort & Spa', 'L0011', '+254-20 2692844', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (278, 'Lesus Executive Ltd', 'L0016', '0718708771', 'P051569349W', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (279, 'Lexis Guest House', 'L0003', '0723268332', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (280, 'Lifting Equipment Co. Ltd', 'L0001', ' (254-41)2220267', 'P000619655J', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (281, 'Logistics Three Sixty Five Ltd', 'L0009', '+254 (20) 50572/3/4', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (282, 'Louise Dreyfus Commodities K. Ltd C/O Baba Shippin', 'L0008', '+254722897006', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (283, 'Loxera Advisory Services Ltd', 'L0014', '0700-310906', 'P051368522F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (284, 'Mac & More Solutions Ltd', 'M0050', '+254 20 4452088', 'P051213088B', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (285, 'Mali World Ltd', 'M0045', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (286, 'Manken Geohydrotech Consultants', 'M0016', '0722796171', 'A001285084W', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (287, 'MANPOWER SERVICES (K) LTD', 'M0040', '2710550', 'P051111229E', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (288, 'Manson Hotel', 'M0014', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (289, 'Mantrac  Kenya  Ltd (Ksh)', 'M0034', '041 2223442', 'P000591111Y', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (290, 'Mantrac Kenya Ltd (Usd)', 'M0032', '041 2223442', 'P000591111Y', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (291, 'Manuchar Kenya Ltd', 'M0024', '+254 20 6005282', 'P051334120M', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (292, 'Manuchar...........', 'M0015', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (293, 'ManucharMNV', 'M0004', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (294, 'Marajani Communications Tours and Assistance Ltd', 'M0043', '+254 733 954949', 'P051149812A', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (295, 'Marine Spectrum Inspection Company', 'M0035', '020 8187211', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (296, 'Marines Car Hire Ltd', 'M0048', '0722410354', 'P051342568F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (297, 'MASTERPIECE COURIER SERVICES LTD', 'M0018', '020-2640240', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (298, 'MaxSmith Group Ltd', 'M0036', '+254-718-860-470', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (299, 'Mbukoni Logistics Limited', 'M0023', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (300, 'Metalic Ship and General Contractors', 'M0028', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (301, 'Michimedia Limited', 'M0037', '020 8077180', 'P051158326Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (302, 'Milele Beach Resort', 'M0008', '0729403649', 'P051099353L', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (303, 'MISSION TO SEA MEN XXXXXXXXXXX', 'M0021', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (304, 'Mission to seamen Entertainment ', 'M0005', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (305, 'Mivumoni Secondary School', 'M0026', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (306, 'Mjshabiby Enterprises', 'M0010', '0723-598038', 'A002754982J', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (307, 'Modern Fitness Gym, Nyali Centre', 'M0039', '+254 708 748 474', 'P051525790R', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (308, 'Mohammed Ahmed Abdalla', 'M0013', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (309, 'Mombasa Canvas', 'M0019', '2315640', 'P000621116Y', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (310, 'Mombasa Continental Resort', 'M0031', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (311, 'Mombasa Fresh Water Supplier', 'M0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (312, 'Mombasa Shipchandlers Ltd', 'M0049', '', 'P051137078G', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (313, 'Mombasa Sports Club', 'M0027', '', 'P051092224N', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (314, 'Motown Engineering Works Limited', 'M0022', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (315, 'MOTOWN ENGINEERING WORKS LTD', 'M0020', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (316, 'mozart Business Solution', 'M0017', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (317, 'MTN Business (K) Ltd', 'M0001', '+254 (20)698-8000', 'P051138876Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (318, 'Multiple ICD (Kenya) Limited', 'M0038', '020 231 77 82', 'P051232338S', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (319, 'Multiple Solutions Ltd', 'M0029', '+254 20 8017584', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (320, 'Muthaiga Golf Club', 'M0047', '020-2368440/1', 'P000606864F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (321, 'Muturi Gakuo & Kibara Advocates', 'M0042', '041-2313418', 'P051123447Q', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (322, 'Mvita  Freight  Ltd', 'M0030', '041 2315844', 'P051232751V', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (323, 'Mvita Freight Ltd', 'M0025', '254 41 2315844', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (324, 'Mvuli House, Nairobi', 'M0033', '+254 20 600 8052', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (325, 'MWACHEO SHIP CONTRACTORS', 'M0041', '0724 174 180', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (326, 'Mwacheo Ship Contractors', 'M0044', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (327, 'MYSSA General Suppliers & Contractors', 'M0002', ' 0721 400 824', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (328, 'Myssa General Suppliers & Contractors', 'M0007', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (329, 'MZ Radiators (MSA) Ltd', 'M0046', '', 'P051650227W', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (330, 'Nairobi Serena Hotel', 'N0015', '+254 20 2822000', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (331, 'Najmi Clearing & Forwarding ', 'N0013', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (332, 'Nat Fire Company', 'N0009', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (333, 'Nation Media Group LTD', 'N0001', '+2540412225479', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (334, 'Nation Media Group Ltd', 'N0011', '32088000/1/2/3', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (335, 'Navcom Ltd', 'N0018', '+254 (020) 3873510', 'P000614755Y', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (336, 'Neptune Ship Contractors', 'N0012', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (337, 'Next Level Valuers & Property Consultants', 'N0005', '0722764636', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (338, 'NIBEATO AUTO WORKS LTD', 'N0004', '0723691295', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (339, 'NICHOLAS SHIPPING SA', 'N0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (340, 'Nicholson Shipping SA', 'N0007', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (341, 'Nine One One Group Ltd', 'N0014', '+ 254 20 4911000', 'P051099772S', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (342, 'Nisomar Ltd', 'N0019', '', 'P051627477X', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (343, 'North Coast Beach Hotel ', 'N0010', '020 2037784', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (344, 'November Sixty Two Ltd', 'N0017', '+254 0725095056', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (345, 'Nueva  Direction', 'N0008', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (346, 'Nyali Airconditioning & Refrigration services Ltd', 'N0003', '231 5503', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (347, 'NYALI GOLF AND COUNTRY CLUB', 'N0002', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (348, 'Nyali International Beach Hotel', 'N0016', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (349, 'OAKWOOD Consulting-KES', 'O0018', '0723726694', 'N/A', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (350, 'OAKWOOD Consulting-USD', 'O0017', '0723726694', 'N/A', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (351, 'Occupational Safety and Health Fund', 'O0013', '+ 254 (041) 2312031', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (352, 'Oceanfreight E.A Ltd', 'O0001', ' 2223446', 'P000621296U', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (353, 'Oceanfreight EA Limited', 'O0002', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (354, 'Office Mart Ltd', 'O0007', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (355, 'Officeline Trading', 'O0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (356, 'Ole-Sereni Hotel', 'O0008', '+254 203901000', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (357, 'Olunzi Marine services', 'O0009', '+254 725 141 864', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (358, 'Opal Asia Line India PVT Ltd', 'O0016', '', 'N/A', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (359, 'Oriel Limited', 'O0003', '041 470753', 'P051096223W', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (360, 'Oriental Business Paradise', 'O0004', '0726 675 904', 'P051115801L', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (361, 'Orima & Company Advocates', 'O0014', '+256 (0) 392 179 040', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (362, 'Orway Maritime ', 'O0011', '35482011', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (363, 'Orway Maritime Services - USD', 'O0010', '35482011', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (364, 'Orway Maritime Services - USD', 'O0019', '+254723942023', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (365, 'Otieno-Adede Associates', 'O0015', '+254 41 2225172', 'A001197447T', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (366, 'Overdrive Consultants Ltd', 'O0012', '+ 254 41 2226647/6403', 'P051520042Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (367, 'P.N MASHRU LIMITED', 'P0019', '020 - 2040526/7', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (368, 'Pacco Motors', 'P0015', '0722-803 849', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (369, 'Pan Africa Express Transport Ltd', 'P0016', '+254 20 3907000', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (370, 'Panal Freighters Limited-USD', 'P0012', '+254 538 015 353', 'P051148463G', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (371, 'Panal Freighters Ltd-KES', 'P0026', '+254 538 015 353', 'P051148463G', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (372, 'Panca Anggerik SDN BHD', 'P0010', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (373, 'Parkerflash Creations Ltd', 'P0027', '254721797643', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (374, 'PAUL NKOLA', 'P0007', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (375, 'Pepe Art', 'P0013', '+254 725 088285', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (376, 'Perfect Scan ltd', 'P0005', '020 2648286', 'P051176232U', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (377, 'Personal Systems Nairobi Ltd', 'P0004', '0737333470', 'P051173268A', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (378, 'Petro Oil Kenya Ltd', 'P0001', '041-2315461/', 'P051135956F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (379, 'PG Bison Kenya Ltd', 'P0024', '+254 20 2378902', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (380, 'Phanry Enterprises', 'P0008', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (381, 'Philomu Mapping Services', 'P0017', '0720 279 960', 'A003841632N', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (382, 'PIL K Limited', 'P0011', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (383, 'PKF Kenya', 'P0003', '+254 41 2226422/3', 'P051130467R', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (384, 'Polimax Services Limited', 'P0021', '0727 618869', 'P051389997I', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (385, 'Polucon Services (Kenya) Ltd', 'P0020', '254-41-4470777/3/4', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (386, 'Port Management Association of Eastern & Southern ', 'P0023', '+254 20 238 1184', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (387, 'Postal Corporation of Kenya', 'P0025', '', 'P051128734A', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (388, 'PowerPoint Systems East Africa Ltd ', 'P0022', '020 6530260', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (389, 'Prideinn Hotels & Investments Ltd', 'P0018', '+ 254 41 2317895', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (390, 'Probranding Ventures', 'P0002', '254 721 100178', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (391, 'Process Express International', 'P0009', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (392, 'Project Cargo Network', 'P0014', '+44 2392 425204', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (393, 'Protecting & Indemnity K Ltd', 'P0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (394, 'Rabaria Communications', 'R0015', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (395, 'Radisson Blu Hotels & Resorts', 'R0008', '', 'P051179504Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (396, 'Raphael Logistics T Ltd', 'R0010', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (397, 'Rapid Kate Services Ltd', 'R0009', '020 551896/897', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (398, 'Ree J\'s  Ltd (Usd)', 'R0012', '0728 445688', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (399, 'Ree J\'s Ltd', 'R0002', '0728-445688', 'P051146293G', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (400, 'Ree Js Ltd XXXXXXXXXXXXXXXXXXX', 'R0013', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (401, 'Reed Events Management (PTY) Ltd', 'R0016', '011 549 8300', '1983/008778/07', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (402, 'Reflex Printers Ltd', 'R0018', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (403, 'Resolution Insurance Company Ltd', 'R0011', '+254 20 2894 000', 'P051150885Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (404, 'Roanna Marine Services', 'R0003', '(254-020)354201', 'A 00127652N', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (405, 'Roanna Marine Services (Usd)', 'R0014', '+254 020 354201', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (406, 'Rollard Tours & Car Rental Ltd', 'R0020', '+ 254-041-2221657', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (407, 'Romageco K Ltd', 'R0005', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (408, 'Royal Court Hotel (Ksh)', 'R0001', '041 222379', 'P051106160S', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (409, 'ROYAL COURT HOTEL(Ksh) XXXXXXXXXXXX', 'R0007', '2223379', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (410, 'RSM (Eastern Africa) Consulting Ltd', 'R0017', '+256 (0) 414 342 780/9', '1005172863', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (411, 'Ruman Shipcontractors (USD)', 'R0004', '020 354820', 'P051183732S', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (412, 'Ruman shipcontractors Limited', 'R0006', '0254-020-3548201', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (413, 'Sadena Agencies Ltd', 'S0002', '020 2039108', 'P051245190F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (414, 'Safaricom Limited', 'S0005', '041 2223911', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (415, 'Safetrac Ltd', 'S0059', '0716 291 813', 'P051597426P', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (416, 'Safmarine Kenya Limited', 'S0025', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (417, 'Samco Holdings Ltd T/A EKA Hotel', 'S0045', '0719 045 000', 'PO51097146E', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (418, 'San Valencia Ltd', 'S0049', '0412312399', 'P051189925J', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (419, 'SAROVA WHITE SANDS HOTEL', 'S0022', '+254412128000', 'P000608996S', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (420, 'Satguru Travels & Tours Services', 'S0050', '', 'P000599474Q', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (421, 'Satguru Travels & Tours Services Ltd (Usd)', 'S0051', '+254-41-2220337/8/9', 'P000599474Q', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (422, 'Scanwell Logistics (china)co. ltd(Guangzhou Branch', 'S0015', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (423, 'Scanwell Logistics (CMH)', 'S0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (424, 'Scanwell Logistics HK Ltd', 'S0007', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (425, 'Scanwell Logistics India PVT Ltd-Bangalore ', 'S0033', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (426, 'Scanwell Logistics NYC inc', 'S0029', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (427, 'Scanwell Logistics Pakistan (PVT) Ltd', 'S0030', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (428, 'Scanwell Logistics Spain', 'S0008', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (429, 'Sea-Bulk Shipping Services Ltd', 'S0041', '+254-412222972 ', 'P051096086L', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (430, 'Seaforth Shipping (Kenya) Ltd', 'S0031', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (431, 'Seaforth Shipping (Kenya) Ltd', 'S0035', '+254 41 231 3776', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (432, 'Seatrade Agencies Ltd', 'S0053', '+254 41 2311491', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (433, 'Send It Africa Logistics', 'S0028', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (434, 'Sentrim Hotels & Lodges', 'S0037', '020 315680', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (435, 'Serena Beach Hotel & Spar', 'S0039', '+ 254 41 5485721/2/3/4', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (436, 'SGL Universal (Guangzhou) Co Ltd', 'S0032', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (437, 'SGS Kenya Limited-KES', 'S0038', '020 2733693/99/90', 'P000618406U', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (438, 'SGS Kenya Ltd (Usd)', 'S0048', '020 2733693/99/90', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (439, 'Shake Distributors Ltd', 'S0055', '043-30047', 'P051194701Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (440, 'Shanghai Janus Grab Company Ltd (Usd)', 'S0056', '+86-21-68855558', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (441, 'Shanghai Janus Grab Company LtdXXXXXXXXXXXXXXX', 'S0054', '+86-21-68855558', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (442, 'Shanghai Qifan Co.Ltd', 'S0016', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (443, 'Shanifreight Logistics ', 'S0042', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (444, 'Shankar Electronics Ltd', 'S0052', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (445, 'Shikara Limited ', 'S0044', '041 2224333', 'P051184035Q', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (446, 'Shine Travels & Cargo PVT Ltd', 'S0009', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (447, 'Shipbrokers Register', 'S0010', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (448, 'Signon Freight Ltd', 'S0021', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (449, 'Six Eighty Hotel', 'S0003', '(02) 315000', 'P000595575K', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (450, 'Smart Force Trade Ltd', 'S0004', '2495754', 'P051203411E', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (451, 'Smart Skills Trainers Ltd', 'S0043', '020-2538634', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (452, 'Snow Desert (EA) Ltd', 'S0057', '020 2612558', 'P051400822M', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (453, 'Somco Books & Stationers', 'S0036', '0722 847921', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (454, 'Soundboard Consulting Associates', 'S0060', '', 'P051355715Y', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (455, 'Sovereign Logistics Ltd-KES', 'S0023', '041 2229784', 'P051372811P', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (456, 'Sovereign Logistics Ltd-USD', 'S0046', '+254 41 2229784', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (457, 'Spaceman Information Technology', 'S0013', '0700111499', 'P051585201Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (458, 'Stan consulting Group Ltd (Ksh)', 'S0034', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (459, 'Stan Equipment & Logistics Services Ltd', 'S0001', '2223186/7', 'P051172959E', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (460, 'Starwis ship contractors& eng.ltd', 'S0017', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (461, 'Summerdale Inn', 'S0047', '', 'P051215355B', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (462, 'Sun Fire & Safety Supplies Ltd', 'S0040', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (463, 'SUNRISE RESORT', 'S0027', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (464, 'Super First Forwarders', 'S0011', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (465, 'Superstar Parcels Ltd', 'S0058', '020 353 5465', 'P051234295G', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (466, 'Suppliers Magnate', 'S0012', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (467, 'Swissport Cargo Services', 'S0014', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (468, 'Tanzania Ports Authority ', 'T0025', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (469, 'Tariq Khan & Associates Advocates', 'T0032', '+254 0200727724494', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (470, 'Taxwise Africa Consulting LLP', 'T0038', '', 'P051574842J', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (471, 'Techbiz  Ltd (usd)', 'T0024', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (472, 'Techbiz Ltd  (Ksh)', 'T0022', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (473, 'Techbiz Ltd XXXXXXXXXXXX', 'T0021', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (474, 'Telkom Kenya', 'T0006', '+254 20 4952001/2', 'P051128176G', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (475, 'Telwise Networks Systems Ltd', 'T0040', '0723 903737', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (476, 'Texas Alarms Kenya Ltd ;2011', 'T0007', '472222/', 'P051118168F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (477, 'The Aga Khan Hospital XXXXXXXXXXXX', 'T0016', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (478, 'The Aga Khan Hospital,Mombasa', 'T0018', '231 2953 / 4 / 5', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (479, 'The Co-operative Insurance Co. (K) Ltd', 'T0003', '2823000', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (480, 'The Copy Cat Ltd Msa', 'T0002', '020-226701', 'P00597676Q', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (481, 'The Docucare Agencies', 'T0001', '020 2171069', 'P051217587P', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (482, 'The Grind Group Ltd', 'T0037', '+254 732 885035', 'P051330218I', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (483, 'The Institute of Certified Public Secretaries of K', 'T0034', '+ 254 20 3597840/2', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (484, 'The Kenya Institute of Management', 'T0027', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (485, 'The KK Group of Companies', 'T0039', '+254 20 4245000', 'P051119652E', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (486, 'The Mission to Seamen  - KES', 'T0013', '', 'P051092074X', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (487, 'The Mission to Seamen (usd)', 'T0014', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (488, 'The Panari Hotel Nairobi', 'T0026', '3946000', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (489, 'The Ship Brokers\' Register', 'T0017', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (490, 'Tiensi Enterprises ', 'T0045', '+254 720 711057', 'A004813216L', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (491, 'Tikone Solutions Ltd', 'T0041', '+254735599509', 'P051585371Q', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (492, 'Timcage Enterprises(Msa)', 'T0033', '020 2138050', 'P051370570Y', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (493, 'TNT Express Worldwide (K) Ltd', 'T0043', '', 'P051202136L', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (494, 'TOYOTA KENYA', 'T0019', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (495, 'Traceble Measurement Centre Ltd', 'T0042', '020 2188235', 'P051434315Q', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (496, 'Trade Magnate Limited', 'T0004', '041 2022457/8', 'P051152374V', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (497, 'Trainconsult Ltd', 'T0046', '', 'P051454913W', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (498, 'Training and Consultancy Associates Ltd', 'T0031', '+254 20 2714206/08', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (499, 'Transglobal Cargo Centre Ltd', 'T0008', ' +254-(020)827069', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (500, 'TRANSGLOBAL CARGO CENTRE LTD', 'T0020', '2929000', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (501, 'Translink Logistics Ltd', 'T0028', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (502, 'Translink Logistics Ltd (Usd)', 'T0029', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (503, 'Transocean Marine Surveyors', 'T0005', '3548201', 'A002059560V', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (504, 'Transport Events Management Ltd', 'T0036', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (505, 'Travellers Beach Hotel', 'T0023', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (506, 'Tripple M & Associates ', 'T0035', '041 2319770', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (507, 'Trubrand Solutions Ltd', 'T0012', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (508, 'Trubrand Solutions Ltd', 'T0015', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (509, 'Tuskys Mattresses Ltd', 'T0044', '+254-20-355-5318', 'P051091887F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (510, 'Two Dots Business Systems', 'T0030', '0723 938719', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (511, 'Tysons Limited', 'T0010', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (512, 'UK Roadrunner Ltd', 'U0006', '0044 7850064725', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (513, 'Umma University Trust', 'U0001', '020 2469381/2', 'P051137878Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (514, 'UNDERWATER ENGINEERING & HARBOURS SERVICES CONT', 'U0003', '', 'A002677774P', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (515, 'Unifilters Kenya Ltd', 'U0007', '+254 20 6536418/9', 'P051095256F', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (516, 'United Cargo Logistics S.R.L', 'U0004', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (517, 'Universal Forwarding International Freight Specialists', 'U0008', '+44 191 214 0800', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (518, 'URBAN CARGO NETWORKS', 'U0002', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (519, 'Usafi Services Ltd', 'U0005', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (520, 'UUNET Kenya Ltd', 'W0001', '+2542069 88000', 'P051138876Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (521, 'Vectocorn Pest Control', 'V0001', '2491531', 'P000621010R', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (522, 'Victoria Furnitures Ltd', 'V0005', '020 2650989', 'P000593928Z', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (523, 'VIJAY OPTICIANS', 'V0002', '2223813', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (524, 'Vision Institute of Professionals', 'V0004', '041-2230295', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (525, 'Visualtech Communication Technologies', 'V0007', '041-2008814', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (526, 'Vmax Insurance Agencies', 'V0003', '041 - 2226770', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (527, 'Volcan Holdings Ltd', 'V0006', '+254 020 8087305', 'P051211097V', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (528, 'Wamu Hardware & Electrical', 'W0006', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (529, 'Whitesands Beach Resort & Spa', 'W0005', '', 'P000607761D', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (530, 'Wilhelmsen Ships Service Ltd', 'W0009', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (531, 'Wilke International Ltd', 'W0003', '', 'P051147656H', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (532, 'Wilken Wireless (K)  Ltd', 'W0007', '+254 20 6006030/7', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (533, 'wilking enterprises ltd', 'W0004', '', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (534, 'Wilson Kazeni Mkanza', 'W0011', '', 'TIN 112-165-789', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (535, 'Woodtex Kenya Ltd', 'W0002', '8076224', 'P000613037L', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (536, 'Wylde International Ltd', 'W0008', '+254 701 560 203', '', '2018-03-15 17:54:13', 0);
INSERT INTO `parts_suppliers` VALUES (537, 'xxxxx', 'K001', '', '', '2018-03-15 17:54:13', 0);

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'custom',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `online_payable` tinyint(1) NOT NULL DEFAULT 0,
  `available_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_payment_amount` double NOT NULL DEFAULT 0,
  `settings` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
INSERT INTO `payment_methods` VALUES (1, 'Cash', 'custom', 'Cash payments', 0, 0, 0, '', 0);
INSERT INTO `payment_methods` VALUES (2, 'Stripe', 'stripe', 'Stripe online payments', 1, 0, 0, 'a:3:{s:15:\"pay_button_text\";s:6:\"Stripe\";s:10:\"secret_key\";s:6:\"\";s:15:\"publishable_key\";s:6:\"\";}', 0);
INSERT INTO `payment_methods` VALUES (3, 'PayPal Payments Standard', 'paypal_payments_standard', 'PayPal Payments Standard Online Payments', 1, 0, 0, 'a:4:{s:15:\"pay_button_text\";s:6:\"PayPal\";s:5:\"email\";s:4:\"\";s:11:\"paypal_live\";s:1:\"0\";s:5:\"debug\";s:1:\"0\";}', 0);

-- ----------------------------
-- Table structure for paypal_ipn
-- ----------------------------
DROP TABLE IF EXISTS `paypal_ipn`;
CREATE TABLE `paypal_ipn`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `ipn_hash` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ipn_data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for petty_cash
-- ----------------------------
DROP TABLE IF EXISTS `petty_cash`;
CREATE TABLE `petty_cash`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `petty_cash` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sage_project_id` int(11) NOT NULL,
  `sage_project` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Pending',
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`, `sage_project_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `petty_cash_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `petty_cash_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for petty_cash_types
-- ----------------------------
DROP TABLE IF EXISTS `petty_cash_types`;
CREATE TABLE `petty_cash_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `share_with` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_comments
-- ----------------------------
DROP TABLE IF EXISTS `project_comments`;
CREATE TABLE `project_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `comment_id` int(11) NOT NULL DEFAULT 0,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `file_id` int(11) NOT NULL DEFAULT 0,
  `customer_feedback_id` int(11) NOT NULL DEFAULT 0,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_comments
-- ----------------------------
INSERT INTO `project_comments` VALUES (1, 100, '2018-04-12 08:14:22', 'Fencing complete as of now', 1, 0, 1, 0, 0, 'a:0:{}', 0);
INSERT INTO `project_comments` VALUES (2, 5, '2018-04-12 08:24:58', 'Test Comment', 1, 0, 0, 0, 0, 'a:0:{}', 0);
INSERT INTO `project_comments` VALUES (3, 100, '2018-04-12 08:28:48', 'all materials supplied', 1, 0, 1, 0, 0, 'a:0:{}', 0);
INSERT INTO `project_comments` VALUES (4, 5, '2018-04-12 08:29:33', 'thanks', 1, 0, 1, 0, 0, 'a:0:{}', 0);
INSERT INTO `project_comments` VALUES (5, 5, '2018-04-12 08:46:59', 'AR', 1, 0, 0, 0, 0, 'a:1:{i:0;a:2:{s:9:\"file_name\";s:70:\"project_comment_file5acf1d034b024-Accounts-Receivable-Transactions.pdf\";s:9:\"file_size\";s:6:\"103563\";}}', 0);

-- ----------------------------
-- Table structure for project_files
-- ----------------------------
DROP TABLE IF EXISTS `project_files`;
CREATE TABLE `project_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `file_size` double NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `project_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_members
-- ----------------------------
DROP TABLE IF EXISTS `project_members`;
CREATE TABLE `project_members`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_leader` tinyint(1) NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_members
-- ----------------------------
INSERT INTO `project_members` VALUES (1, 5, 1, 1, 0);
INSERT INTO `project_members` VALUES (2, 241, 1, 0, 0);
INSERT INTO `project_members` VALUES (3, 219, 1, 0, 0);
INSERT INTO `project_members` VALUES (4, 94, 1, 0, 0);
INSERT INTO `project_members` VALUES (5, 100, 1, 0, 0);
INSERT INTO `project_members` VALUES (6, 5, 2, 1, 0);
INSERT INTO `project_members` VALUES (7, 94, 2, 0, 0);
INSERT INTO `project_members` VALUES (8, 82, 2, 0, 0);
INSERT INTO `project_members` VALUES (9, 83, 2, 0, 0);
INSERT INTO `project_members` VALUES (10, 5, 3, 1, 0);
INSERT INTO `project_members` VALUES (11, 5, 4, 1, 0);

-- ----------------------------
-- Table structure for project_time
-- ----------------------------
DROP TABLE IF EXISTS `project_time`;
CREATE TABLE `project_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime(0) NOT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `status` enum('open','logged','approved') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'logged',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_time
-- ----------------------------
INSERT INTO `project_time` VALUES (1, 1, 100, '2018-04-12 08:32:30', NULL, 'open', 0);

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `sage_client_id` int(11) NULL DEFAULT NULL,
  `sage_depertment_id` int(11) NULL DEFAULT NULL,
  `created_date` date NOT NULL,
  `status` enum('open','completed','canceled') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `price` double NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES (1, 'AGENCY : AGENCY', 'Development of Land in Mazeras', '2018-04-12', '2018-11-14', 1, 1, 2, '2018-04-12', 'completed', '', 5000000, 0);
INSERT INTO `projects` VALUES (2, 'AGENCY : AGENCY', 'dferrcvercercerc', '2018-04-12', '2018-04-26', 1, 1, 2, '2018-04-12', 'open', 'php', 10000, 0);
INSERT INTO `projects` VALUES (3, 'managu', '', '2018-04-12', '0000-00-00', 6, 6, NULL, '2018-04-12', 'open', '', 0, 0);
INSERT INTO `projects` VALUES (4, 'demo task', '', '2018-04-12', '0000-00-00', 1, 1, 1, '2018-04-12', 'open', '', 0, 0);

-- ----------------------------
-- Table structure for providers
-- ----------------------------
DROP TABLE IF EXISTS `providers`;
CREATE TABLE `providers`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telephone_no` mediumint(9) NULL DEFAULT NULL,
  `tax` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of providers
-- ----------------------------
INSERT INTO `providers` VALUES (2, 'Safaricom', 'All in one', 8388607, '10', '2018-04-09 08:52:55', 0);
INSERT INTO `providers` VALUES (3, 'Airtel', 'cheap material', 934234, '12', '2018-04-09 08:56:02', 0);
INSERT INTO `providers` VALUES (5, 'Tikone', 'The place to be', 8388607, '20', '2018-04-09 09:22:22', 0);
INSERT INTO `providers` VALUES (6, 'Cyto', 'c0009', 8388607, '12', '2018-04-10 07:32:34', 0);

-- ----------------------------
-- Table structure for rates_perhour
-- ----------------------------
DROP TABLE IF EXISTS `rates_perhour`;
CREATE TABLE `rates_perhour`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `amount` float NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of rates_perhour
-- ----------------------------
INSERT INTO `rates_perhour` VALUES (1, 800, 'Flat Rate', '2018-03-22 15:15:45', 0);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrators', 'a:24:{s:5:\"leave\";s:3:\"all\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:3:\"all\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:3:\"all\";s:8:\"estimate\";s:3:\"all\";s:7:\"expense\";s:3:\"all\";s:6:\"client\";s:3:\"all\";s:6:\"ticket\";s:3:\"all\";s:12:\"announcement\";s:3:\"all\";s:19:\"can_create_projects\";s:1:\"1\";s:17:\"can_edit_projects\";s:1:\"1\";s:19:\"can_delete_projects\";s:1:\"1\";s:30:\"can_add_remove_project_members\";s:1:\"1\";s:16:\"can_create_tasks\";s:1:\"1\";s:14:\"can_edit_tasks\";s:1:\"1\";s:16:\"can_delete_tasks\";s:1:\"1\";s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";s:1:\"1\";s:21:\"can_delete_milestones\";s:1:\"1\";s:16:\"can_delete_files\";s:1:\"1\";s:34:\"can_view_team_members_contact_info\";s:1:\"1\";s:34:\"can_view_team_members_social_links\";s:1:\"1\";}', 0);
INSERT INTO `roles` VALUES (2, 'General Staff', 'a:24:{s:5:\"leave\";s:3:\"all\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:3:\"all\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:3:\"all\";s:8:\"estimate\";s:3:\"all\";s:7:\"expense\";s:3:\"all\";s:6:\"client\";s:3:\"all\";s:6:\"ticket\";s:3:\"all\";s:12:\"announcement\";s:3:\"all\";s:19:\"can_create_projects\";s:1:\"1\";s:17:\"can_edit_projects\";s:1:\"1\";s:19:\"can_delete_projects\";s:1:\"1\";s:30:\"can_add_remove_project_members\";s:1:\"1\";s:16:\"can_create_tasks\";s:1:\"1\";s:14:\"can_edit_tasks\";s:1:\"1\";s:16:\"can_delete_tasks\";s:1:\"1\";s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";s:1:\"1\";s:21:\"can_delete_milestones\";s:1:\"1\";s:16:\"can_delete_files\";s:1:\"1\";s:34:\"can_view_team_members_contact_info\";s:1:\"1\";s:34:\"can_view_team_members_social_links\";s:1:\"1\";}', 0);

-- ----------------------------
-- Table structure for sage_clients
-- ----------------------------
DROP TABLE IF EXISTS `sage_clients`;
CREATE TABLE `sage_clients`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contact_person` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 703 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sage_clients
-- ----------------------------
INSERT INTO `sage_clients` VALUES (2, 'safcomm', 's3456', 'Ann', '0782353456', '2018-04-10 13:52:56', '2018-04-10 13:01:56', 0);
INSERT INTO `sage_clients` VALUES (3, 'Cash Customer', 'CASH', NULL, NULL, '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (4, '24Vision Chartering Solution', '2001', 'Jonathan Scheers', '+971 52 934 9491', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (5, '30 South Maritime', '3001', 'FRANS DAVIDTZ ', '+27 0 716754774', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (6, 'ARM Cement  Limited', 'A001', 'Manish Mehta', '+254 20 3744617/20/22/25', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (7, 'EBB - Abe Trans Logistics Ltd', 'A087', 'Buffy', '+972 3 7958888', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (8, 'Avtelco Kenya Limited', 'A090', 'GEOFF KHITOME', '+254 20 3001785', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (10, 'AM Nomikos & Son (UK) Ltd ', 'A099', 'Nicholas Fuller ', '+ 44  0  20 7591 1800', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (11, 'Aeromarine Logistics (K)Ltd', 'A100', 'Moses Muriuki ', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (12, 'Abyssinia Iron and Steel Ltd', 'A105', 'Nelson', '720030471', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (13, 'A M Nomikos & Sons (UK) Ltd ', 'A107', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (14, 'Arch Shipping FZ-LLC', 'A108', 'Gaurav Sharma ', '+91 141 239 8830', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (15, 'A.M.Nomikos Aquirius Inc C/O DA Desk', 'A113', '', '9.71144E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (16, 'Africa Navigation B.V.', 'A118', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (17, 'Ariston Navigation Corp', 'A120', 'Spiros Bouloukos ', '+30 210 4293250', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (18, 'Alpha Shipping Co. Hamburg', 'A126', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (19, 'A.M. Nomikos Transworld Maritime Agencies S.A', 'A128', '', '+30 210 6155 200', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (20, 'AB MARITIME INC.', 'A133', 'PANAGIOTIS PAPPAS', '3.0211E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (21, 'ATLANTIC MARITIME COA INC,', 'A134', 'C. MINIC  ', '+1  450  678-7676', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (22, 'Australian High Commission', 'A135', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (23, 'Aegeus Shipping', 'A137', 'Capt. Viliosis', '3.02108E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (24, 'AAL Shipping', 'A138', 'Ole Boysen', '+65 9654 7213', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (25, 'Alster Int\'l Shipping Services Inc', 'A139', 'Ms Myla Cabuyao', '+63 2 8876010 to 12', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (26, 'A-One Plastics Limited ', 'A140', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (27, 'AS Klaveness Chartering ', 'A141', 'Elmo Adelwis Kagaoan', '4722526825', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (28, 'Amnav Limited', 'A143', 'Navraj Dhillon', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (29, 'Atmus Enterprises Ltd', 'A144', 'Mustafa', '+254710 111 110', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (30, 'Allseas Marine S.A', 'A145', 'Costas J. Nomikos', '+30 6972866869', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (31, 'Asante Capital EPZ Ltd', 'A146', 'Evans', '703996577', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (32, 'Bamburi Cement Limited', 'B068', 'Catherine Theuri', '020 2710487/8/9', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (33, 'Baypamar Fishing SA', 'B069', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (34, 'IFA - Bati Nakliyat Ve Ticaret', 'B072', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (35, 'Bannie and Archer Co.Ltd', 'B073', 'NASREEN', '25423749792', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (36, 'Blue Fleet Athens', 'B074', '', '+30 2109571595', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (37, 'Bernhard Schulte Shipmanagement(Singapore)Pte Ltd', 'B075', 'Kin Lin (Ms)', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (38, 'Burundi Cement Company', 'B076', 'AMELIE FIAT', '25722276549', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (39, 'Blessing Bulk Carriers Europe Athens Co', 'B077', 'Stasinos Sotiris', '+30 210 8055 370', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (40, 'BTG Pactual Commodities (Switzerland) SA', 'B080', 'Adeline Binoche', ' +41  0  22 747 75', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (41, 'Black Pearl Maritime Security Management Ltd ', 'B081', 'Noam Nafusi', '+44 7700017748', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (42, 'Braville Agencies  Limited.', 'B082', 'BIPIN PARMAR', '+254  729  403 672', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (43, 'Byzantine Maritime Corp', 'B083', 'Seti Kontouzoglou', '+30 210 6281115', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (44, 'Bonfide C & F Company Ltd', 'B084', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (45, 'BRV  Shipping & Chartering', 'B085', 'Hos', '+44 20 32 39 60 60  UK ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (46, 'Buzeki Group Ltd', 'B086', 'Mr. Bundotich Kiprop', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (47, 'BK Shipping Co., Ltd', 'B087', 'Ms Jane', '-8140', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (48, 'Bibby Line Limited (As agents for Owners)', 'B089', 'Gill Birchall (Miss)', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (49, 'Baliwag Navigation Inc.', 'B090', 'Capt. Vicmar C. Calibjo', '60.00526122', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (50, 'Bollore Logistics', 'B092', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (51, 'Bulk Marine Limited', 'B093', 'Anadi Seth', '+9 124 406 7202', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (52, 'Bulker Chartering & Management SA', 'B094', 'Stefano Magnelli', '41919107800', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (53, 'Bernhard Schulte Shipmanagement (Cyprus) Ltd', 'B095', 'Marina Evripidou ', '35725846623', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (54, 'BPI Shipping ', 'B096', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (55, 'Blueseas Shipping S.A', 'B097', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (56, 'Bulk-Chart', 'B098', 'Mohan Nair', '+91 80 41144964', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (57, 'Biolite Uganda Ltd', 'B099', 'Felipe Spath Botero', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (58, 'Biolite Holdings (K) Ltd', 'B100', 'Felipe Spath Botero', '412229784', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (59, 'Biolite Holdings (K) Ltd', 'B101', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (60, 'Bioafriq Energy Ltd', 'B102', 'James Nyama', '721739494', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (61, 'Cargill International S.A', 'C009', 'Stephane jaton', '41227032696', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (62, 'Commodity Trading Co', 'C022', 'Gnanam', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (63, 'Cement Traders Inc', 'C048', 'Lima Goussous', '96265685115', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (64, 'Chinpo Shipping Co', 'C049', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (65, 'C.E.G. Bulk Chartering', 'C051', '', '00049  0  40 317858 30', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (66, 'Cargill Ocean Transportation (Singapore) Pte Ltd', 'C057', 'Lee Lijing Belle', 'Tel: +65-6393 8349', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (67, 'Crescent Imports and Exports- USD', 'C058', 'Faiza', '+61 3 9363 7545', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (68, 'Clipper Bulk USA', 'C061', 'Gary Lawrence', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (69, 'Crown Berger Kenya Ltd (Usd)', 'C062', 'Nyalwal Philip', '2.54202E+12', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (70, 'Cemco Cement Trading S.L.', 'C063', 'Alvaro Bonello', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (71, 'Citic Ship Management Ltd', 'C064', 'Eric wang', '13601007962', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (72, 'Canmarine Shipbrokers', 'C065', 'Hazal Ercin', '+90 216 4501566', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (73, 'Coastal International Shipping Line Ltd', 'C066', 'Abdulla O Issa', '+255 777 844755', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (74, 'Castleton Commodities Shipping Co. Pte. Ltd.', 'C067', 'Christopher Wilson', '+65 6692 0354', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (75, 'Castor Vali Maritime Ltd', 'C068', 'Clemence Leedham', '+44  0  207 368 1648', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (76, 'Corrugated Sheets Limited', 'C069', 'RAI NYONDO', '2.54712E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (77, 'C Marine Transport Company', 'C070', 'Tassos Raissis', '+30 210 4584817', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (78, 'Cargill Energy, Transportation and Metals', 'C071', 'Kristina Yaneva', '+359 2 809 9158', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (79, 'Castle Royal Hotel', 'C073', 'Maureen Omondi', '+254 734161197', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (80, 'Columbus Maritime Corp.', 'C074', 'Sergiy Sitovskyy', '+380 951 757 075', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (81, 'Cem Asia Trading JLT', 'C075', 'Syed Mujeebuddin', ' +97144 522 833', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (82, 'Citadel Maritime Ltd', 'C076', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (83, 'Continental Logistics Network Ltd', 'C078', 'Wachira', '2.54721E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (84, 'CMA CGM Kenya Ltd.', 'C079', 'STEPHEN  MWAREMA', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (85, 'Copenship MPP A/S', 'C080', 'Christian Christensen', 'ianik Bross Shipping Corp', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (86, 'CHINA-AFRICA TOTAL LOGISTICS ', 'C081', ' +30 210 4110357 ', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (87, 'Diamond Shipping Services Ltd', 'D061', '', '254  41  2228810', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (88, 'Devji Meghji & Bros Ltd', 'D062', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (89, 'DBC Shipping L.L.C', 'D063', 'Jahufar Fuad', '+97155 5921090', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (90, 'Dry Chart Interocean', 'D064', 'ANKIT DHAWAN', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (91, 'Diaplous Maritime Services', 'D066', '', 'Tel:+30 210 4131222', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (92, ' Dynacom Tankers Management Limited', 'D067', '', ' +30 210 891 77 00', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (93, 'Dromon Maritime Agency', 'D068', 'Richard Kersey', '+44 20 7628 0477', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (94, 'DND Management Inc', 'D069', 'Alexis Doucas', '3.02109E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (95, 'Dcc Bulk Inc', 'D070', 'Capt.Ioannis Malichoutsakis', '3.02104E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (96, 'Doshi Enterprises Ltd', 'D071', '', '+254 2224414, ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (97, 'DNA MARITIME INC.', 'D072', 'Apostolis Peppes', 'TEL:+30 210 9689600 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (98, 'Decor Hardware (USD)', 'D073', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (99, 'Decor Hardware ', 'D074', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (100, 'Densan Shipping Co.Inc.', 'D075', 'Melik Okumus', '+90 212 2456810    ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (101, 'Dasin Shipping Pte Ltd', 'D076', 'Xu Shaoxue', '+86 411 83780200', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (102, 'Densay Shipping and Trading DMCC ', 'D077', 'VOLKAN BALITATn', '2.55689E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (103, 'Dianik Ship Management LLC', 'D078', 'Violetta088', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (104, 'Dragon Citi', 'D082', '', '89', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (105, 'East African Portland Cement Company', 'E090', 'Ngala Oloitiptip', '-1518', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (106, 'East African Commercial &Shipping Co. Ltd', 'E093', 'George Gachanja ', '+ 254   722 429 225', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (107, 'Emarat Maritime', 'E094', 'Ashwin Philip', '+971  4  3599955 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (108, 'Eagle Ship Management LLC', 'E095', 'Paula Stancu Giordani', '212 785 3335', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (109, 'ESC Global Security Ltd', 'E096', 'Ms Liisabell Naarits', '+372 5146 119', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (110, 'Eagle Management Consultancy PTE Ltd', 'E097', 'Lorilyn Reylana', '+65 6508 6881', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (111, 'EAGLE BULK PTE LTD SINGAPORE', 'E098', 'SIMON(SUNGMIN)KIM', '+65 9106 3990', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (112, 'Eagle Shipping International (USA) LLC', 'E099', 'Vijay Prasad', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (113, 'ED & F MAN SHIPPING', 'E100', 'Struan Ridgwell', '+65 6922 6716', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (114, 'Evalend Shipping Company S.A', 'E102', 'Katerina Yfantouda', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (115, 'Ecolab EA Kenya Limited', 'E103', 'Daniel   O. Apat', '020 3540625', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (116, 'Export Trading Co Ltd ( Uganda)', 'E105', 'Mr Mustan', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (117, 'Export Trading Group', 'E106', 'Siddique al rashid', 'Ph: +971 4 386 4551 | Ext', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (118, 'Electrical & General Appliances Ltd', 'E107', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (119, 'Eastern Mediterranean Maritime Ltd', 'E108', 'Theofilos Haldezos', '3.0211E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (120, 'Export Trading Co Ltd', 'E109', 'Export Trading Co', '254 20 266880', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (121, 'ESL Uganda Limited', 'E110', 'Merreck Getugi', '+256 200 988811', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (122, 'Excelzor Logistis Ltd', 'E111', 'Royden Ferreira', '9.12265E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (123, 'Fairseas International Trade & Logistics {Pty} Ltd', 'F039', 'Liam McKenzie', '27 21 4108819', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (124, 'Freightwell Express Ltd- Usd', 'F040', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (125, 'Freightwell Express Limited', 'F041', 'Washington Mwamburi', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (126, 'International Exports', 'F042', 'Sheen', '+91 22 4236 9911  Direct ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (127, 'Fleet Management Ltd', 'F048', 'Arun', '+852 22988342', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (128, 'Freight  Forwarders Kenya Limited', 'F049', 'ABDUL BARADIA', '+254  041  2227575', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (129, 'Fortuna- Seaside Chartering ', 'F056', 'Philip Heymans ', '4539161200', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (130, 'FACTOR 8 SHIPPING', 'F057', 'SIMON F. TROWENN', '+375 931 061 06', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (131, 'FORTIS BULKERS INC.', 'F058', 'CAPT. SAKIS MASALAS', '+3ranch) ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (132, 'Fortune Global Shipping & Logistics Ltd', 'F059', 'Kingsley Ekweariri ', '+353 899 G028', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (133, 'FOSROC Kenya Limited-USD', 'F060', 'Lilian Kariba', '2.5470 210 8986160 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (134, 'Gourdomichalis Maritime.A', 'G030', '', '+30 210 4290880', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (135, 'Government Clearing Agency', 'G031', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (136, 'Greenroad Int\'l Logistics Co., LTD', 'G032', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (137, 'Greenspark (K) Ltd', 'G033', '', '+254 701997668', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (138, 'Gearbulk Manila', 'G034', 'Sandy Gonzales', '+63 2 917 8948', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (139, 'Hanse International (Kenya) Limited', 'H001', 'RITA BOCHERE', ' +254-2080-69370', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (140, 'Heidelberg East Africa', 'H002', 'HENRY FWAYA', '734333222', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (141, 'Hyundai Glovis Co.Ltd', 'H003', 'Ms. S.E. Kim/STAFF', '82-2-2054-7611', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (142, 'HC Trading Malta Limited', 'H004', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (143, 'Hermes Maritime Services Pvt.Ltd.', 'H005', 'ATTN. TANUJA', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (144, 'Handymax Freight Trader,Cargill ETM ', 'H006', 'Willem Olde Kalter', '-14473', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (145, 'Hanbyul Merchant Marine Co Ltd', 'H007', 'Andrew Lim ', '-3405', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (146, 'Handymax Chartering', 'H009', 'Hardik Sanghvi', '+91 22 28329187', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (147, 'HBC Asia Pte. Ltd', 'H010', 'Christopher Wilson', '+65-6303 9111', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (148, 'Hyundai Merchant Marine Co.,Ltd. (HMM)', 'H011', 'Ryan Kim', '82-2-3706-5679', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (149, 'HC-Chartering GmbH  & Co. KG        ', 'H013', '', '+49  0 4102 8033 -185', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (150, 'HC Trading', 'H014', 'Ajith Kumar', '+00 971 4 204 55 23', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (151, 'Harbour Agency Limited', 'H016', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (152, 'HMS Bergbau AG', 'H017', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (153, 'Hydroturf East Africa Ltd', 'H018', 'Philip Ochola', '742961657', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (154, 'Hellas Confidence Shipmanagement S.A', 'H019', 'Maria Tsilika', '0030 210 9859384', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (155, 'Henok Fashion Ltd', 'H020', 'Eric', '254 715 435 810', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (156, 'Hydroturf East Africa Ltd', 'H021', 'Philip Ochola', '742961657', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (157, 'ISK Shipping Limited', 'I040', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (158, 'Island View Shipping (Singapore)', 'I041', 'Stuart Frost', '+65 6632 1316', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (159, 'Institute of Chartered Ship Brokers (E.A) ', 'I042', 'Mercy', '-2224609', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (160, 'International Shipping and Logistics FZE ', 'I043', 'Partha S Pal', '+971 4 4508953  Ext 115 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (161, 'IVK Manuport Logistics LLC', 'I044', '', '+971 4 2594884', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (162, 'I. Messina (K) Ltd. ', 'I046', 'Peter Kwinga', '041-2319640/1/2, 020-2434', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (163, 'IHB Shipping Co. Ltd', 'I047', 'Georgi Sivkov', '+359 52 912 968', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (164, 'Inspectorate (E.A) Ltd', 'I048', 'Kyalo Ilunga', '2.54722E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (165, 'Interchart Shipping Co Ltd.', 'I049', 'Michael Taliotis', '+357 25 381560', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (166, 'IDC Denizcilik Sanayi Ve Tic. A.S.', 'I050', 'Ersan Erdogan', ' +90  232  441 50 50', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (167, 'Inchcape Shipping Services ', 'I052', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (168, 'Intercities Freight & Shipping Ltd', 'I053', 'Jacob K. Theuri', '2.54723E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (169, 'IHB Shipping Chartering', 'I054', 'K.Gunchev', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (170, 'Intermarine Shipping DMCC', 'I055', '', '+971 4 4366500', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (171, 'Interagro (K) Limited', 'I056', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (172, 'IMC Shipping Co Pte Ltd', 'I057', '', '-6246', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (173, 'Insight Maritime DMCC Dubai', 'I058', 'Mr. Binu', '+97 144430305', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (174, 'ISL Dubai ', 'I059', 'Partha S Pal', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (175, 'IMT International Mining & Trading AG', 'I060', 'Gritt Burger', '+41 55 220 2000', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (176, 'IS-BIR Shipping & Trading Co.', 'I061', 'Aysel CETIN', '+90216 442 3373', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (177, 'Island View Shipping Singapore', 'I062', 'Stuart Frost', '+65 6632 1316', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (178, 'Indoors East Africa Ltd', 'I064', 'Mr Omar', '733746810', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (179, 'Inlaco Japan Co Ltd', 'I065', 'Xuan Ha (Mr)', '8.18013E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (180, 'Iskenderum Ship Management', 'I066', 'Berk Bulgan', '0090 543 395 54 04', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (181, 'Inmar Shipping & Logistics Pvt Ltd', 'I067', 'Balraj', '+91 44 65515055', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (182, 'Icare International Ltd', 'I068', 'Augustine', '717193863', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (183, 'International Materials MEIO', 'I069', 'Ibraheem Salahudeen', '+971 4 2314181', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (184, 'Joru Laboratory Supplies', 'J029', 'John ', 'P.O Box 14296', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (185, 'Jamii Telecommunications Limited', 'J032', 'Japheth Tirop /Jackson ', 'P.O Box 47419-00100  Nbi', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (186, 'Jacky Line Shipping Ltd', 'J053', 'Yuri Rivkin', '+ 972 0 3-568-1738', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (187, 'Jubilee Jumbo Hardware Ltd', 'J054', 'MAUREEN ', '254 57 2021162', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (188, 'Jewisache General Supply Co. Ltd', 'J055', 'JESSICA SAMUEL', '+255 786845586', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (189, 'Just Essentials Ltd', 'J059', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (190, 'Joru Laboratory Limited', 'J060', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (191, 'Jiangsu Far East Shipping Co. Ltd ', 'J062', 'ALEX LEE', '86 25 84787553/84787530', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (192, 'Jenlor International LLC', 'J063', 'Daniel  Uzcategui', '-9574', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (193, 'J. Lauritzen Singapore Pte. Ltd.', 'J064', 'Rasmus Christoffer Hansen', '+65 6572 9170', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (194, 'Johann M.K.  Blumenthal  GMBH & CO. KG', 'J065', 'Anastasios Karagiannis ', '+49 40 80 90 60 5-90 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (195, 'Jaldhi Overseas Pte Ltd', 'J066', 'Murali', '+65 6223 8929', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (196, 'Jaldhi Overseas Singapore Pte Ltd', 'J067', 'Nur Azan', '+ 65 6223 8929', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (197, 'Janchart Shipping A/S ', 'J068', '', '+45 7554 0099', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (198, 'Jiangsu Steamship Company Ltd', 'J069', 'Blair Chen', '-56360237', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (199, 'Jua Letu Renewables Ltd', 'J070', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (200, 'Jindal Saw Limited', 'J071', 'CJ Singh', '91-9610077200', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (201, 'K.B Saghani ', 'K028', 'Babu Sanghani', '020 537663', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (202, 'Korea Shipping Limited', 'K039', 'Mr K.C Kim', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (203, 'Kopak Shipping Limited', 'K053', '', '9.23123E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (204, 'Larus S.A', 'K054', 'G. Livanios', '2104287315', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (205, 'Kalee Limited', 'K068', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (206, 'Komsol Limited', 'K069', 'PETER MAINA', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (207, 'Kephis', 'K070', 'LEWIS BOR', '+254 20 3597201/2/3', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (208, 'Kenya Electricity Transmission Company Limited', 'K071', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (209, 'Ken-Spore Limited', 'K077', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (210, 'Karlog Shipping ', 'K078', 'GEORGE SIMBOURAS', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (211, 'Kenya Marine Contractors EPZ', 'K079', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (212, 'KON-QUEST PIRAEUS ', 'K081', 'A.SIROPOULOS', '+210 4182025 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (213, 'Kaf Marine Chartering', 'K082', 'DENIZ ALTINGUL', '+ 90 324 2390234/23826', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (214, 'Kenya General Industries ', 'K083', 'Mr.Patel ', '2.54722E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (215, 'Kensalt Limited', 'K084', '', '041-3433004', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (216, 'Khetshi Dharamshi & Company Ltd', 'K085', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (217, 'KB Sanghani and Sons ', 'K086', 'Nunu Sanghani', '+254 73 519 444', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (218, 'Karsan Ramji & Sons Ltd', 'K088', 'Kisor Warsani ', '+254-750872953.', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (219, 'Kingstar Shipping Limited ', 'K089', 'Shuring Chan ', '+(852) 2576 2611', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (220, 'Kalyan Shipping Ltd', 'K090', 'Jestine Joseph', '97144313501', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (221, 'KANSA MARITIME LLP', 'K091', '', 'Imran Bachoo', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (222, 'Louis Dreyfus Commodities Services ', 'L078', 'Attn Accounting dept', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (223, 'Lauritzen Bulkers', 'L081', '', '+ 45 3396 8336 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (224, 'Laskaridis Shipping Co. Ltd.', 'L082', '', '+30 210 6284 204', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (225, 'LarfageHolcim Trading Ltd', 'L083', 'Jean Jose Pedreira', '+41 442 25 62 86', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (226, 'LBH Mozambique (Nacala)', 'L084', 'Antonie Briel', ' +258 26 526 797 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (227, 'Loxera Advisory Services Ltd', 'L085', 'Sammy Kiriru', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (228, 'Larus Piraeus PH', 'L087', '', '+30 210 4287316', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (229, 'Mombasa Cement Limited', 'M023', 'Jitendra Shah', '020 202420/3862', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (230, 'Tata Chemicals Magadi', 'M037', '', '254  20  6999000', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (231, 'Ocean Maritime', 'M040', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (232, 'Midwest Ventures Limited', 'M043', '', '256 41 4232763', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (233, 'Manuchar Kampalaala Cement', 'M045', 'Subu ', '-404117', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (234, 'Marimed Agencies', 'M055', 'G. Subudhi', '97165263312', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (235, 'Manuchar Steel NV', 'M077', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (236, 'MUR Shipping', 'M080', 'Arzan', '+971 4 341 5701', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (237, 'ijing ', 'M082', 'Xu Bin (??)', ' 86 -10-85276986 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (238, 'Marlow Navigations Co. Ltd', 'M083', 'Nicoletta Constantinou', '+357 25 882274', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (239, 'Mebs International Usd', 'M085', 'NICK REIFF', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (240, 'Muranga Forwarders Ltd', 'M121', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (241, 'Maritime Asset Security and Training (MAST) Ltd', 'M122', 'Derek Roberts', '+253 77671253', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (242, 'Marimed Shipping (India) Pvt. Ltd. ', 'M129', 'Dattaram Walvankar ', ' +91-98677 60636 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (243, 'Mediship Limited', 'M131', 'Mr. Wang Jiawei', '-84585806', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (244, 'Meridian Global Consulting LLC', 'M132', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (245, 'Mahmut Resit Ustun ', 'M133', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (246, 'Multiple Solutions Ltd A/C Kampala Cement, Uganda', 'M135', 'Kennedy Elazia ', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (247, 'Multiple ICD Kenya Limited.', 'M136', '', '+254 715 546022 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (248, 'Maritime Freight Co Ltd', 'M146', '', '254 41 2220075 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (249, 'Misuga Kaiun (HK) Limited', 'M148', 'Ajay Naik', '+ 852  34202340', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (250, 'MID-SHIP Group LLC ', 'M149', '', '+351.291.098.242 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (251, 'MEDIBULK SA-PIRAEUS', 'M150', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (252, 'MEADWAY SHIPPING & TRADING INC.', 'M151', '', ' +30211 5007100 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (253, 'Mirage Shipping SA ', 'M152', '', '+41 22 509 1783 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (254, 'Mandarine Ocean Limited', 'M153', 'Marco Zhou', '+862 168415818', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (255, 'Marbrokers Chartering', 'M156', 'Charles Dixey ', '30 210 6090 744', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (256, 'Modion Maritime Management S.A. ', 'M158', 'Cpt. Athanasiadis Dimitris', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (257, 'Multiple Solutions Ltd  a/c BUCECO', 'M163', 'Kennedy Elazia', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (258, 'Mehta Electricals Limited-USD', 'M165', 'Nishma B. Mehta', '2.54721E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (259, 'Mehta Electricals Ltd-KES', 'M166', 'Nishma B. Mehta', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (260, 'Mercurius Shipping GmbH', 'M170', 'Jonas Zukauskas', '+49  30  65 66 81 -81', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (261, 'Multiship International Ltd', 'M174', 'Captain Singh', '2.54412E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (262, 'Macor Shipping Sdn Bhd', 'M176', 'Jacky', '+603 6201 0139/0187', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (263, 'Multiple Solutions Ltd - KES', 'M179', 'Kennedy Elazia', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (264, 'Marfin Management S.A.M', 'M180', 'Simon Trowel', '+377 93 106 106', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (265, 'Menengai Oil Refineries Ltd', 'M181', '', '512212356', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (266, 'Mo Shipping Norway', 'M186', 'Marco Zhou', '+86 13918201528', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (267, 'Muthaiga Golf Club', 'M187', 'Michael', '722168720', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (268, 'Maisha Mabati Mills Ltd', 'M188', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (269, 'Maisha Packaging Company Ltd', 'M189', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (270, 'Multiple ICD (K) Limited', 'M190', 'Gideon C. Koech', '2.54727E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (271, 'National Cement Co Ltd-USD', 'N005', 'Mr Lokesh', '254  20  25 29 553/4/5/6', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (272, 'Northern Uganda Auricul Centre', 'N078', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (273, 'Newport Chartering Ltd', 'N080', 'Nikos', '+30-210 4111192 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (274, 'Nordic Bulk Carriers A/S', 'N081', 'HENRIK HOLLESEN', '+45 3910 0811', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (275, 'National Cement Company Ltd', 'N082', 'Mr.Chandresh Jagad, F.D', '+254  0  733 777 002', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (276, 'NYK Global Bulk Corporation', 'N083', 'Tatsuya Kitani ', '81-90-7251-1360', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (277, 'Nirav Agencies ', 'N084', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (278, 'NORDEN Shipping (Singapore) Pte. Ltd              ', 'N085', 'BingZong , Aw', '+65 6395 4462', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (279, 'Norvic Shipping North America Inc.', 'N087', '', '+91 120-482-0200', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (280, 'Noble Group Limited - Geneva', 'N088', 'VASSILIS XANTHIS', '+41 21/331 0890', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (281, 'NIOVIS SHIPPING CO. S.A.', 'N089', 'Giannis Theodorou', '+30 210 4285 831', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (282, 'Navig8 Bulk Asia Pte Ltd', 'N090', 'CK HAN', '+65  6622 0089', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (283, 'Natural Operation', 'N091', 'BUHARI  KACAN', ':+90 216 380 3700', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (284, 'Norden India, Handymax Chartering', 'N092', 'Hardik Sanghvi', '+91 22 28329189', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (285, 'Norden Shipping (Shanghai) Representative Office', 'N093', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (286, 'Navigation Maritime Bulgare', 'N094', 'Boris Shabarkov', '+359 52 683 284', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (287, 'Nordica International Ltd', 'N095', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (288, 'NG Shipping & Trading Ltd', 'N096', '', '+90 216 416 50 38', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (289, 'Navision Chartering ', 'N097', 'Mads Martedal Poulsen', '+45 3977 1193', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (290, 'Norden Tankers & Bulkers ', 'N099', 'Peter Koch Hansen', '+9 22 2832 9188', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (291, 'Norvic Shipping India Private Ltd', 'N100', 'Shailesh  Dewan', '+91 120 482 0200', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (292, 'Navina Maritime S.A', 'N101', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (293, 'Ocean Bulk Shipping LLC', 'O080', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (294, 'Ocean Marine Shipping', 'O082', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (295, 'Orion Bulkers gmbh & Co. ', 'O083', 'Dirk Hartje', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (296, 'Occidental Insurance Co. Ltd', 'O084', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (297, 'Oras Denizcilik ve Ticaret Ltd (Sti)', 'O087', 'Faruk', '+90 216 327 44 75', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (298, 'Oldendorff Luebeck,Port d/a department', 'O088', 'Patrick Eggers', '+49 451 15 00 0', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (299, 'Ocean Breeze Chartering S.A', 'O090', 'Stelios Kamvas - Dry Cargo Cha', '+ 30 6944 334032 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (300, 'Orion Shipmanagement Trading Ltd. Istanbul', 'O091', 'Capt. Colakel', '+90 532 7010650', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (301, 'OVERSEAS MARINE ENT. INC. ', 'O093', 'Panayiotis', '+30 210 9681322 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (302, 'Orient shipping Rotterdam B.V', 'O094', 'P.W Soet', '+31 104116338', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (303, 'Orb Energy Private Ltd', 'O095', 'Daniel Njoroge', '+254 722 924 954', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (304, 'One Acre Fund ', 'O096', 'JULIA FRANKLIN', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (305, 'One Acre Fund', 'O097', 'Naomi', '2.54722E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (306, 'Pendulum Ship management Inc', 'P057', 'Capt. A. paburas', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (307, 'Protex Epz (K) Limited-KES', 'P074', 'Lawrence', '045 6622345', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (308, 'Parbat Siyani Construction Ltd', 'P075', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (309, 'PoolShop EA Limited', 'P076', 'Joseph', '721233079', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (310, 'Parbat Siyani Construction Limited-Kes', 'P080', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (311, 'PETRASCO', 'P081', 'Rhonda Reekie ', '+ 44  1224  337736 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (312, 'Pan Afica Chemicals Ltd', 'P082', 'VISHAL DAWDA', '-726740920', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (313, 'Pancoast Trading (Singapore) PTE Ltd', 'P085', 'Anders Johannsen', '6564115658', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (314, 'Pan African Syndicate Limited', 'P088', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (315, 'Prime Transport Ltd', 'P089', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (316, 'Packaging Industries', 'P090', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (317, 'PACMAR SINGAPORE', 'P092', 'Nejdet', '6562483115', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (318, 'Planfreight International ', 'P093', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (319, 'Phaethon International Limited', 'P094', 'YEGOR ROGOVENKO', '-799.1369863', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (320, 'P.N Mashru Ltd', 'P095', 'Francis Mulilli', '-291483.7143', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (321, 'Poolshop EA Limited ', 'P096', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (322, 'Pak Mumtaz Uganda Ltd', 'P097', '', '256 772 923277', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (323, 'P.K.KAKOULIDIS SHIPPING Co. LTD.', 'P098', 'THANOS', '+ 30-210 4290610 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (324, 'Pacific Basin Shipping (South Africa) (Pty) Ltd', 'P099', 'Chris Martin', ' +27  31  764 2670 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (325, 'Pollen Limited', 'P100', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (326, 'Pearl k Shipping Company Ltd', 'P101', 'Roumen Boyadjiev', '+359 888 576784', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (327, 'PACMAR - SINGAPORE   ', 'P102', 'Nejdet', '+65 6248 3115', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (328, 'Peter Doehle Schiffahrts - KG', 'P103', 'Christian Kotter', '49 40 38 108 768', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (329, 'Precious Shipping Public Company Limited ', 'P104', 'Capt. Nopphong Ratanachaiphorn', '-6968748', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (330, 'Prote.A.S. Maritime', 'P106', 'Iro Karavasili', '+30 210 9689977', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (331, 'Pacific Basin Shipping Middle East DMCC ', 'P107', 'Mukesh Kumar', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (332, 'Peakward Enterprises (Holdings) Ltd', 'P108', 'Okan BAYER', '+90 532 581 9339 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (333, 'Pacific World Shipping Pte Ltd', 'P109', 'Fahad Shamim', '97144356964', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (334, 'Polimax Services Limited', 'P110', 'MR FARAJ ', '0727 618869', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (335, 'Prime Steel Mills Ltd', 'P111', 'Mr. Chandresh Jagad', '+254 700 331 175', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (336, 'Pacific Ship Managers Malaysia SDN BHD', 'P112', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (337, 'Pan Ocean Company Ltd', 'P113', '', '+82.2.316.5395 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (338, 'Pro Shipping Inc c/o Portline Bulk International S', 'P114', 'MARIO SILVA', '+351 21 839 18 28', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (339, 'Primebulk Shipmanagement Ltd', 'P115', 'Capt. George', '+ 30 210 6202849', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (340, 'Pan Ocean Co. Ltd', 'P117', 'J.H. Kim', '8223165362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (341, 'Probulk Shipping & Trading ', 'P118', 'Ioakim Xydas', '3.0213E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (342, 'Pan Ocean Co., Ltd', 'P119', 'Mr. Sarang Jung', '8223165398', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (343, 'Portobello Shipping & Trading', 'P120', 'Geir Laupsa', '+27 83 2878737', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (344, 'Parbat Siyani Interiors Ltd-KES', 'P121', '', '2.54203E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (345, 'Parbat Siyani Interiors Ltd-USD', 'P122', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (346, 'Polaris Shipping Co Ltd', 'P125', 'Wayne Park ', '+82 2 2003 10554', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (347, 'Pola Maris NV', 'P126', 'Stefan Nys', '+30 4758 50923', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (348, 'Quest Works Limited', 'Q001', 'Anne Muregi', '0728-623102', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (349, 'Quest Works Limited', 'Q002', 'Anne Muregi', '0728-623102', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (350, 'Quynh Le Do', 'Q003', 'Quynh Le Do', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (351, 'Riftcot Limited', 'R008', 'Vishal Khagram', '+ 254 20 445 2270', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (352, 'Ryce Southern Sudan Ltd', 'R009', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (353, 'Red Four Group', 'R010', 'Dave', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (354, 'Ryce Southern Sudan Ltd', 'R011', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (355, 'Rubber Products Ltd', 'R013', '', '020 557173/2229982', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (356, 'Evergreen-Round The World Logistics Corp (M)SDNBHD', 'R016', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (357, 'Revital Healthcare (EPZ) Ltd', 'R017', 'Francisca', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (358, 'Roofing Ltd', 'R018', 'Krishna Das', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (359, 'Ruman Shipcontractors Limited', 'R019', 'Mohammed Mansoor ', '+722 251 598', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (360, 'Reem Maritime Ltd', 'R020', 'MOHAMAD ESMAEIL', '+963 43 215562/3', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (361, 'R K Sanghani ', 'R021', 'NUNU SANGHANI', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (362, 'Ripe Freight Services Ltd', 'R022', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (363, 'Reliable Freight Services', 'R023', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (364, 'Rapid Kate Services Ltd', 'R024', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (365, 'Regal Freighters ', 'R025', 'Issa Odhowa Aden', '+254 721 217 655', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (366, 'Richstone Hellas Limited', 'R026', 'Dimitris Meletis', '+30 210 4280343 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (367, 'Ruman Shipcontractors Ltd (Ksh)', 'R027', 'Mr. Mansoor', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (368, 'Rana Shipping', 'R028', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (369, 'Roche Transport & Logistics Ltd', 'R029', 'ALi Hussein Shire', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (370, 'Rai Cement Limited', 'R030', 'RAKESH WATS', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (371, 'Reederei Gebr Winter GmbH & Co KG', 'R031', 'Malgorzata Mackiewicz-Beker', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (372, 'Royal Yatch Services', 'R032', 'C/O Captain Mohammed', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (373, 'Remi Maritime Corp', 'R033', 'Remi', '+30 2104283622', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (374, 'Bollore Africa Logistics Kenya LTD', 'S003', '', '254 41 34 33 821', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (375, 'Osman Shipping LLC', 'S019', 'Salma A.K', '97165559911', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (376, 'Setaf Saget ', 'S031', 'Hilbert Gregory', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (377, 'Solym Carriers Limited', 'S046', 'Mr Mike Papalis', '3.06937E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (378, 'Sea Trade Agencies limited', 'S060', 'Gharib', '722871208', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (379, 'Seaforth Shipping Services', 'S061', 'Patrick Mwamisi', '733633520', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (380, 'Seven Seas Shipping', 'S062', 'Jalal', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (381, 'SLH Venus Shipping S.A', 'S063', 'Silvia Bertamini', '3.02E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (382, 'Skywards International Freight', 'S081', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (383, 'Solym Carriers Ltd', 'S083', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (384, 'Synresins Limited', 'S084', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (385, 'Sea Trek Trans PTE Ltd', 'S085', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (386, 'Sekur Holding Inc', 'S086', 'Donald Halilaj', ' +30  2104594100', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (387, 'Sanghani Ltd ', 'S087', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (388, 'Sea Globe Management & Trading', 'S088', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (389, 'Steelwool (Africa) Ltd', 'S089', '020-2017719/20', '020-2017719', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (390, 'Stile Logistics', 'S090', 'Tom ', '516-374-7400', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (391, 'Shreeji Transporters ', 'S092', 'Mr Vimal', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (392, 'Sturrock Shipping (Kenya) Ltd', 'S093', 'Mercy Chomba', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (393, 'Star Bulk', 'S099', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (394, 'Strategic Bulk Carriers', 'S102', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (395, 'STX Pan Ocean (America)Inc', 'S103', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (396, 'Sovereign Logistics Ltd-KES', 'S104', 'Pauline Karwirwa', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (397, ' Sovereign Logistics Ltd-USD', 'S105', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (398, 'Steel Rolling Mills Ltd ', 'S106', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (399, 'Seateam Management PTE Ltd', 'S107', 'Capt. Maniego', '6.39089E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (400, 'Signode Packaging Ltd', 'S109', 'LUCIA KAVATA', '5022487', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (401, 'SESAC SAS', 'S110', 'Adeline Binoche (Ms) ', '+33 155491600', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (402, 'Shurie Trucks Ltd', 'S112', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (403, 'Silk Road Shipping & Trading Co. Ltd', 'S113', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (404, 'Shun Shing Dubai Group ', 'S115', 'Siddiq Ahmed', '+97150 5688108', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (405, 'Stan Consulting Group Ltd', 'S117', 'Ibrahim', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (406, 'Savannah Cement  Limited', 'S118', 'Samson Shivina', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (407, 'Savannah Cement (EPZ) Ltd ', 'S119', 'Ibrahim', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (408, 'Shreeji Forwarders Ltd', 'S120', 'WILLIAM ', '+254 786 330 602', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (409, 'Sireen Shipping & Trading Co.Ltd', 'S121', 'ISM Department', '9616217020', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (410, 'Seven Seas(Chartering) Ltd - London', 'S122', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (411, 'LSS Ltd', 'S123', 'Nora Salama', 'Tel: +30 210 3313155', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (412, 'SKYDIVE LOGISTICS', 'S124', 'Laban N.', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (413, 'Skydive Logistics', 'S125', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (414, 'Silk Road Shipping & Trading Co Ltd ', 'S126', 'Ayham Abu Issa', '00962 6 5605228', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (415, 'SEATRANS MANAGEMENT ENTERPRISES INC.', 'S127', 'P.PISSIAS', '-4264410', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (416, 'SEACAPE LOGISTICS & MANAGEMENT SERVICES INC.', 'S128', 'DAVID PEREIRA', '786-797-6190', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (417, 'Seacape Shipping & Trading,C/O Seacape Logistics A', 'S129', 'C/O SEACAPE LOGISTICS AND MANA', '-6201', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (418, 'Seabridge Chartering, LLC', 'S130', 'Peter A. Thanasoulis', '+212.742.0077', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (419, 'Superfoam Limited', 'S157', 'Mr. Mike Fischer', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (420, 'SuperFoam Limited- usd', 'S158', 'Mr. Mike Fischer', '0202041346/7/8', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (421, 'Sealestial Navigation Co.', 'S160', 'Cpt.A.Papadakis', '3.0211E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (422, 'Savannah Cement Limited', 'S161', 'Samson Shivina', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (423, 'Swire Bulk ', 'S163', 'Kevin Lisboa', '+65 6632 9292', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (424, 'Saj Ceramics Ltd', 'S164', 'Atul Parmar', '+254 721 206 671', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (425, 'SMT Shipping', 'S165', 'John Egan', '+203 599 1530', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (426, 'Sanergy Limited', 'S166', 'Barrack Onyango', '+254 20 6005011', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (427, 'Schenker LLC', 'S167', 'Peter Lwanga', 'Tel  +971 4 8879292  ext.', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (428, 'Stam Shipping S.A ', 'S168', 'Nikos Vlachos', '+30 210 4295091', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (429, 'Sea commercial Shipping Services S.A', 'S169', 'Kostas Bessas', '+30 2118889000', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (430, 'Segal Shipping Services PVT Ltd', 'S170', 'Hardik Paun', '+91 2836 220999', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (431, ' Royal Court Affairs', 'S171', 'Zakariya Sulaiman Abdullah ', '+00968 24736801', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (432, 'Sam Shipping Management S.A', 'S172', 'Kristianna Kolitsida', '+30 6986400201', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (433, 'Seawind Far East Ltd', 'S173', 'Mathias Rottstegge', '00852 2385 5397', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (434, 'Samos Steamship Co. (As Agents Only)', 'S174', 'Capt K. Vougioukas', '-9466080', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (435, 'Tororo Cement Limited', 'T015', 'Jitendra Shah', '0414-260184', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (436, 'TBS Shipping Services', 'T044', 'Ruchir Seth', '+1 914 216 3271', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (437, 'Thorco Shipping', 'T064', 'Hasanah Hardi', '6563248660', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (438, 'Todwill Kenya ', 'T065', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (439, 'Tata Africa Holding', 'T066', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (440, 'Trade & Transport Consortium  Ltd S.A.', 'T067', 'Ayman El Said', '27797601634', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (441, 'IFA-TQ Express Limited', 'T068', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (442, 'Todwil Kenya', 'T069', 'JOHNNY LIMB', '733339000', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (443, 'Techpak Industries Ltd', 'T070', '', '020-551625', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (444, 'Thoresen & Co.', 'T071', 'Hilo Fujimoto', '+66 0  2254-8437', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (445, 'TYL Limited', 'T072', 'ANNASTASIA GIKUNDA', '0203751985/6', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (446, 'Two Diamond Enterprises', 'T074', '', '718766014', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (447, 'Transatlantic Maritime', 'T075', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (448, 'Translink (U) Ltd', 'T076', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (449, 'Transporte Multimodal S.A DE C.V', 'T077', 'Juan Carlos', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (450, 'Trendbulk Chartering and Trading Ltd. ', 'T078', 'Yigit Sakir', '+ 90 216 688 27 77', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (451, 'Trade Magnate ', 'T079', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (452, 'Tamani Construction Company Limited', 'T080', 'DANIEL MBURU', '+254020 272 4852', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (453, 'Tristar Management Ltd ', 'T081', '', '+ 30 210 4599111', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (454, 'Tania Holdings Limited', 'T082', 'Jessica Kesi', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (455, ' Master and Owners Mv JS Danube ', 'T083', 'C/O V Ships Asia Group Pte Ltd', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (456, 'Target Marine S.A', 'T085', 'MICHAEL KARRAS', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (457, 'TOPSHEEN SHIPPING GROUP LIMITED', 'T086', 'Crystal (Gu Xin)', '+86 010 84519089', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (458, 'TRANSGRAIN SHIPPING B.V', 'T088', 'Peter Heezen', '+31 10 4301516', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (459, 'Tata Africa Holdings (Kenya) Ltd', 'T089', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (460, 'TKB Chartering ', 'T090', 'Anders Svarrer', '+45 3946 3642', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (461, 'Thoresen Shipping Singapore (Pte) Ltd', 'T091', 'Katerina Kanellopoulou', '6597778132', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (462, 'Transfreight Logistics Ltd', 'T094', 'J. Mbuvi', '2.54724E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (463, 'Triaena Maritime Security Ltd', 'T095', 'Vasilis Tzanis', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (464, 'TRANSBULK SHIPPING CORPORATION LIMITED  ', 'T096', 'JAY CHEN', '-50872017', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (465, 'Turquoise Trading & Agency', 'T097', 'Hasmet ', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (466, 'Twyford Ceramics Company Limited', 'T098', 'Kevin Ren', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (467, 'Totadex Kenya Ltd', 'T099', 'Emmanuel M.', '+254 700 000 192', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (468, 'Trans Power Co Ltd', 'T100', 'Oliver Ren', '86 592 238 7660', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (469, 'Technomar Shipping Inc ', 'T101', 'Sophia Pagali', '+30210 6233670', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (470, 'Thalkat Shipping S.A ', 'T102', 'Aristotelis Ypsilantis', '3.02109E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (471, 'Trident Plumbers Ltd', 'T103', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (472, 'THOME SHIP MANAGEMENT PTE LTD', 'T104', 'MARLYN C. FRANCISCO', '6.39209E+13', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (473, 'Techbuilding Group Ltd', 'T105', 'Wolgang Manfred', '25639201400', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (474, 'Tsavo Lite Ltd', 'T106', 'Peter Kibe', '722387469', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (475, 'The Paint Depo', 'T107', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (476, 'Tsavo Litearthick Kannappan', 'T108', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (477, 'Triton Navigation B.V.', 'T109', 'Toshiyuki Abe', '+31-205752650', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (478, 'Tropical Healthcare Ltd', 'T110', 'James Nyamweya', '+44  0  1268286646', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (479, 'United Aryan EPZ Limited', 'U021', '', '614-491-0001', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (480, 'Unique Air Express', 'U022', 'Ravi More', '+91 206720000', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (481, 'Unilever(K) Ltd', 'U024', 'Mr David Dickie', '+254 71 5061262', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (482, 'United Marine Security', 'U025', 'Jose Ojeda ', '+1201-3 Ltd', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (483, 'USL Shipping  DMC EST ', 'U026', 'Krishnan', '97142667253', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (484, 'Ultrabulk Shipholding PL', 'U027', 'William Blunck', '+65 63763693', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (485, 'United Ocean Ship Management (PVT) Ltd', 'U028', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (486, 'United Ocean Ship Management Pte Ltd ', 'U029', 'Hasan Iftekhar', '-68545516', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (487, 'Union Marine Management Services PTE Ltd', 'U030', 'Sameer Mahashur', '+65 6922 0031', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (488, 'Univan Man', 'U031', '254(0)713371197 ', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (489, 'W. Bockstiegel Maritime Service GmbH & Co. KG ', 'W039', 'Johann Prahm', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (490, 'Worldwide Auctioneers (WWA)', 'W040', 'Digamber Naswa', '+971 4 881 6142 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (491, 'White Sea Navigation S.A', 'W041', 'WHITE SEA NAVIGATION S.A.', 'WHITE SEA NAVIGATION S.A.', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (492, 'Wasan Shipping ', 'W042', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (493, 'Wm. Miller\'s Nachfolger (GmbH & Co.) KG', 'W043', '', 'Tel: +49  0 40 / 36 01 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (494, 'Wilhemsen Procurement Services', 'W044', 'Girish', '91 98195998', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (495, 'Wilhelmsen Ships Services PTE Ltd', 'W045', 'Alvin Ong', '+65 63954545', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (496, 'Weco Bulk A/S', 'W046', 'Joakim G. Larsen', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (497, 'Western Bulk Chartering, Singapore ', 'W047', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (498, 'Wadi Degla Investment (K) Ltd', 'W048', 'Joseph', '0792 888 888', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (499, 'West Kenya Sugar Company Ltd', 'W049', '', '-6553.733333', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (500, 'Western Steel Mills Ltd', 'W050', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (501, 'Xianglong Shipping Co. Ltd', 'X002', 'Mr Vito Guo', '+86 185 6110 3527', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (502, 'Yentek Shipping Co. Ltd', 'Y001', 'Gokhan Soytekin', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (503, 'Yayla Shipping , Istanbul', 'Y002', 'Capt.Ertugrul Caglayan', '+90 212 283 98 55', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (504, 'Yara Ltd', 'Y003', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (505, 'Zelmar Shipping', 'Z001', 'Sezen Gurbuz(Ms)', '9.02123E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (506, 'Zodiac Maritime Agencies Ltd', 'Z002', 'VICTOR SORESCU', '+44-207 333 2361', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (507, 'Zahra Maritime Services Co.', 'Z003', 'Captain Asib', '+963 43 316778 / 213495', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (508, 'D/S NORDEN A/S   ', 'D060', 'Jesper Rosenlund', '+45  3095 7070', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (509, 'Elgon Kenya Limited ', 'E089', 'Mr. Ashok Reddy', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (510, 'GRECOMAR SHIPPING AGENCY LTD', 'G029', '', '+30 210 8986160 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (511, 'Amer Abdalla', 'ise Dreyfus C/o Baba', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (512, 'Lighthouse Navigation PTE Ltd', 'L076', 'Amar Deep', '6626543100', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (513, 'Logistics Three Sixty Five Limited ', 'L077', 'Imran Bachoo', '+254  0 20 261 6211', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (514, 'Mitchell Cotts Freight Kenya Limited', 'M107', '', '254   041  2316826;', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (515, 'Mer Union NV - Antwerp', 'M113', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (516, 'Marine Transport', 'M114', 'Tassos Raissis', '+30 210 4584817', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (517, 'Spedag Interfreight K Limited', 'S131', 'GODFREY YENGO', '2.5473E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (518, 'Spear Logistics Kenya Ltd', 'S133', 'Robina', '+254 720 450 447', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (519, 'SIVA Bulk ', 'S134', 'Satheesh. J', '9.12268E+11', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (520, 'SEATREK TRANS PTE LTD.', 'S135', 'BH SEO', '+65 6692 0089 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (521, 'Seabulk Shipping Services Ltd', 'S136', 'Capt. Abubakar ', '254 723786261', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (522, 'Starbulk S.A.', 'S137', 'Capt. Nikolaos Thomatos', '+30 210 61 78 400', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (523, 'Si32 9292', 'S138', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (524, 'Soni Plant Agencies ', 'S139', 'John Soni', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (525, 'SeaStar Chartering', 'S140', 'Andreas Chamakiotis', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (526, 'Smit Salvage B.V', 'S141', 'Mr J.J Schreurs', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (527, 'Saacke Energy Systems (SHANGHAI) Co. Ltd', 'S142', 'Vicky Yang??', '+86  0 21 6495 1529 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (528, 'Sanghi Industries Ltd', 'S143', 'AKASH SHAH', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (529, 'SAN VALENCIA LIMITED', 'S144', '', '0412312399', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (530, 'Swiss Marine Services S.A', 'S151', 'SSD', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (531, 'Venturi Fleet Management S.A', 'V076', 'Ms Anna Reshetnikova', '+30 694201-4846', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (532, 'Wilhemsen Ships Services', 'W016', 'Daniel Majiba', ' +254  41 222 7964 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (533, 'Worldwide Energy Logistics', 'W036', 'Jamie Burt', '+44  0 2088670330', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (534, 'W.E Tilley (Muthaiga) Ltd', 'W037', 'MAUREEN', '722649018', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (535, 'WCO DTE (Kenya) ', 'W038', 'SSgt Grant McFall ', '254 0 713371197 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (536, 'Export Trading Co. Ltd', 'E087', 'Danny Chng', ' +65 6536 8400 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (537, 'Equinox Maritime Ltd', 'E088', 'GEORGE XIROS', '210-6240400', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (538, 'Golden Ocean Management Asia PTE. LTD. ', 'G027', 'Alex Ku ', '6592248188', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (539, 'General Cargo Services Ltd', 'G028', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (540, 'LBH Global Quality Desk ', 'L073', 'Eric \'t  Hart', '+31 0 10 50 65 038', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (541, 'Liebherr-Werk Nenzing GmbH', 'L074', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (542, 'Louise Dreyfus C/o Baba Shipping Services Ltd', 'L075', 'Amer Abdalla', '+254 722 897 006', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (543, 'Multiple Hauliers (EA) Limited', 'M103', 'Shreyesh Dave,General Manager', '+254 20 39 44 000', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (544, 'Manuchar NV Beijing ', 'M106', 'Xu Bin (??)', ' 86 -10-85276986 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (545, 'V. Ships (Ukraine)', 'V069', 'Ruslan Tsybin', ' +380 48  7340340 ext ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (546, 'Vitol Services Ltd', 'V070', 'Capt Rishab Bahl', '+ 65 6839 4835', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (547, 'VISION CHARTERING S.A.', 'V071', '', '+30 210 41 36 685 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (548, 'VARAMAR LTD', 'V072', '', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (549, 'VICTORY SHIPPING PTE. LTD.', 'V073', 'Amit Daga', '+65 6341 7767', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (550, 'V.Ships Asia Group Pte. Ltd.', 'V074', 'JOCEV CHONG', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (551, 'Victoria Steamship Co. Ltd', 'V075', 'Ioanna Liagou', '+44 207 977 1710', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (552, 'Name', 'Account', 'Contact_Person', 'Telephone', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (553, 'V.Ships Asia Group Pte. Ltd.', 'V074', 'JOCEV CHONG', '4362', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (554, 'Victoria Steamship Co. Ltd', 'V075', 'Ioanna Liagou', '+44 207 977 1710', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (555, 'Cargill Ocean Transportation Singapore Pte Ltd', 'C082', 'Sachin Matpal', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (556, 'CALTREK FREIGHT', 'C083', 'DIMITRIS SPERTOS', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (557, 'COSMOTRANS NAVIGATION S.A. - PIRAEUS/GREECE', 'C084', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (558, 'CIMERWA LTD', 'C085', 'Sahinkuye Uwizeyimana Déo', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (559, 'Cube Movers Ltd', 'C096', 'Davis Muhavi', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (560, 'Cube Movers Ltd', 'C097', 'Davis Muhavi', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (561, 'Centuries Global Consulting ', 'C100', 'Anne WAnjiku Muregi', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (562, 'Charterbulk Shipping LLC', 'C101', 'Miss Richelle G. Fernando', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (563, 'Dava International', 'D050', 'Emma', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (564, 'Del-Ray Cargo Services Ltd', 'D051', 'Mohamed Ramadhan', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (565, 'Dodhia Packaging Ltd', 'D052', 'GRACE', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (566, 'Dune Packaging Ltd', 'D053', 'DIMPLE', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (567, 'EBB - Darka Group of Companies', 'D054', 'Mohamed A.M. Osman ', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (568, 'DAC Aviation East Africa Ltd', 'D056', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (569, 'D Amico Dry Limited, DA-Desk. ', 'D058', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (570, 'Dianik Bross Shipping Corp. S.A.', 'D059', 'Violetta Samona', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (571, 'Diamond Shipbrokers Ltd', 'D084', 'Alexandros K. Gkogkas', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (572, 'D.G.M Shipping & Chartering', 'D087', 'Bhusan Bhattacharjee', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (573, 'Dunhill Impex & Trading Company Ltd', 'D090', 'Mahesh Panchani', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (574, 'Digital Packaging Innovations Holdings Ltd', 'D091', 'Meeraj Shah', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (575, 'Export Trading Co Inputs Kenya Ltd', 'E006', 'Mr Kalpesh Patel Mr Ganesh', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (576, 'Expolanka Freight K Limited', 'E027', 'Pinus Mokaya', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (577, 'Oerssleffs Eftf A/S', 'E056', 'Benn Moreno', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (578, 'Expolanka Freight Limited', 'E072', 'Pinus Mokaya', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (579, 'Energy Shipping spa ', 'E073', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (580, 'Empower Installation Contractors Ltd', 'E078', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (581, 'Elegant Packaging Ltd', 'E081', 'AYUB VARWANI', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (582, 'Elegance Packaging Limited', 'E082', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (583, 'Eastern Bulk Carriers AS – Norway', 'E083', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (584, 'ELB Logistics Gmbh', 'E084', 'Sören Möller', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (585, 'Express Chartering & Shipping Ltd ', 'E085', 'Aston', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (586, 'Falcon Maritime A/S Copenhagen', 'F061', 'Claus Bjarnested', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (587, 'Fresh Life Initiative Ltd', 'F062', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (588, 'Fairwind International Shipping Company', 'F063', 'Vicky Wang', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (589, 'Fresh Life Initiative Ltd', 'F064', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (590, 'Global text Africa Ltd', 'G013', 'Mr. Kioko', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (591, 'Global Paper Product Limited', 'G014', 'MUSTAFA M ESMAILJI', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (592, 'G Bulk Corp', 'G015', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (593, 'Guardian Bank Ltd a/c Eagle Retread Limited', 'G016', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (594, 'Gimbco Freight Limited', 'G017', 'Mr.Gitonga', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (595, 'Gedenlines', 'G018', 'Sai', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (596, 'Goodearth Maritime Ltd ', 'G019', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (597, 'Gemini Chartering & Trading Ltd - Turkey ', 'G020', 'CAN', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (598, 'Gulf of Aden Group Transits LTD', 'G021', 'Kevin  Cerullo', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (599, 'G. D’ALESIO s.a.s.', 'G022', 'Capt. Giuseppe Pasciuto', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (600, 'GAC Global Hub Services (DMCC Branch) ', 'G026', 'Xavier Vikram ', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (601, 'Kardeniz & Mardeniz Shipping Managemnet', 'K092', 'Ercan Kibar', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (602, 'KOG Transport PVT LTD,', 'K093', 'Tabrez Bharde', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (603, 'Koch Carbon Wichita', 'K095', 'Dodd Carpenter', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (604, 'Kitengela Glass Research & Training Trust', 'K096', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (605, 'Kimanthi Ndwiga Muriuki c/o The Paint Depo', 'K097', 'Juster', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (606, 'Kansa Maritime LLP', 'K098', 'Sasi Kumar J', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (607, 'Leadarrow S.A', 'L065', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (608, 'La Griglia Ltd', 'L066', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (609, 'Latek Group', 'L067', 'Özcan ÇINAR', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (610, 'Labulux Supplies Ltd', 'L068', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (611, 'LaGriglia Limited', 'L069', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (612, 'L.A.D.M', 'L070', 'JENNY BARON', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (613, 'LPL  Shipping S.A.', 'L071', 'Cpt John Alexiadis', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (614, 'Lonestar Consultants EA Ltd', 'L072', 'PAUL MWAKISHA', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (615, 'Marimed Shipping (Vietnam) Rep. Office', 'M087', 'VAN DANG', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (616, 'Meadway Shipping & Trading Inc. - Athens', 'M088', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (617, 'Mebs International', 'M089', 'Ann George', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (618, 'Mansel Ltd  c/o Vitol SA ', 'M090', 'Agnès Bourdet', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (619, 'Manuchar Kenya Limited', 'M091', 'Michael Ndenga', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (620, 'Manuchar Steel N.V Ksh', 'M092', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (621, 'Millenium GR Ltd', 'M093', 'Cpt Chloros Paris', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (622, 'MLB Manfred Lauterjung Befrachtung GmbH & Co. KG', 'M094', 'Anika Samus', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (623, 'Meadway Shipping Singapore Pte Ltd', 'M096', 'CAPT. NK', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (624, 'Med Star S R L', 'M099', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (625, 'Med Brokerage & Managemet Corp.', 'M101', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (626, 'Multiple Solutions Ltd A/C Kampala Cement', 'M102', 'Subu ', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (627, 'Sea Vision Shipping Inc.', 'S152', 'Fotis Varthalis', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (628, 'Sucres & Denrées', 'S153', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (629, 'Stealth Maritime Corporation S.A. ', 'S154', 'Capt.Giorgos Trachalakis', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (630, 'Samsun Logix Corporation/ Shipping Business Team ', 'S155', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (631, 'Sanergy Limited', 'S156', 'Barrack Onyango', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (632, 'United Group Limited', 'U032', 'Mr Shani', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (633, 'Ultrabulk (Germany) GmbH', 'U033', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (634, 'Vision Africa & Mabadiliko care', 'V065', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (635, 'Vitol SA ', 'V066', 'Agnès Bourdet', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (636, 'V.Ships (Chennai) Private Limited', 'V067', 'Karthick Kannappan', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (637, 'Peter Wachira Irungu', 'P123', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (638, 'Aspida Maritime Security Corp.', 'A123', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (639, 'M184', 'M184', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (640, 'M185', 'M185', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (641, 'B079', 'B079', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (642, 'D092', 'D092', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (643, 'M159', 'M159', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (644, 'M160', 'M160', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (645, 'Jihan Freighters Ltd', 'J072', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (646, 'Ms. Cara Spencer', 'M191', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (647, 'United (EA) Warehouses Ltd', 'U034', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (648, 'SILVESTER MUSOVYA KUTUTA', '1', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (649, 'CATHERINE ANZAZI LEWA', '17', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (650, 'MOURINE ACHIENG MAGERO', '34', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (651, 'FRANCISCA MUENI NZIOKA', '40', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (652, 'WILLINGTONE MICHAEL WARIO', '43', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (653, 'ALOICE MUOKI KUTUTA', '47', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (654, 'MAUREEN ATIENO OPIYO', '48', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (655, 'ISAAC BABU WATKINS', '49', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (656, 'CHRISPUS MAINGI KILEI', '51', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (657, 'EVANS NGALA CHIBUNGU', '55', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (658, 'LEONARD MWARUWA BAYA', '56', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (659, 'MARTIN KARANI IKIARA', '57', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (660, 'LENROD MWAMBURI MGENDI', '65', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (661, 'JOHN KIPCHUMBA LAGAT', '69', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (662, 'JOYLINAH NDUTA NJERI', '73', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (663, 'DANIEL LUKORITO WANIKINA', '76', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (664, 'STEPHEN OKIKI OMONDI', '77', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (665, 'JUSTUS KALII MUTHEMBWA', '78', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (666, 'PATRICK MUKUNDI MBUGUA', '79', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (667, 'RAYMOND JUMA WANGUNDA', '80', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (668, 'FLORENCE CHEPNGETICH TUEI', '81', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (669, 'KENNEDY KIVUVANI', '82', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (670, 'ERIC OLENSI OLENSI OSINYA', '86', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (671, 'CATHERINE NYAMBURA THUO', '87', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (672, 'GRACE MPOYA', '88', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (673, 'PATRICK MURANGIRI MAGIRI', '84', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (674, 'ERIC MULWA KYALO', '89', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (675, 'IRENE ATIENO OTIENO', '91', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (676, 'MERCYLINE MUTHEU MUTUA', '92', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (677, 'ARSHUR LOMO OWANE', '90', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (678, 'COLLINS ONYANGO PAMBA', '93', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (679, 'GULJAN ABUBAKAR RAMADHAN', '94', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (680, 'FRANCIS OUMA OPALO', '95', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (681, 'PETER HAVACY MANGA', '97', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (682, 'LAWRENCE ODHIAMBO AMENYA', '98', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (683, 'MOSES ELIAS MANGALE', '99', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (684, 'MOUREEN WAIRIMU KIAMA', '100', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (685, 'WAYNE DICKSON NDAKALA', 'T020', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (686, 'GEORGE ABWAO OMORE', 'T022', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (687, 'FREDRICK WAWALA', 'T023', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (688, 'AHMED ABDULRAHMAN AHMED', 'T025', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (689, 'PAUL NZISSI MUSYOKA', 'T026', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (690, 'BILHA AMAGOVE OMUDI', 'T027', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (691, 'ERICKSON MWANIKI NGELE', '63', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (692, 'JESINTA NJERI NJOROGE', 'T028', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (693, '', '', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (694, 'Devki Steel Mills Ltd', 'D093', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (695, 'Jotun Kenya Ltd', 'J073', 'Sreejith', '+254720204181', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (696, 'Jotun Kenya Ltd', 'J074', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (697, 'Jane Muthoni Chege', 'J075', 'Jane', '254725849476', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (698, 'Marine Security International ', 'M192', 'Cdr Sakes', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (699, ' Master & Owners Mv Doric Spirit', 'M194', 'Master', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (700, 'Two Dots Business Systems Ltd', 'T111', 'Daniel Muhoro Githii', '0723 938 719 ', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (701, 'Asheric Company Ltd', 'A150', '', '', '2018-04-10 14:00:08', NULL, 0);
INSERT INTO `sage_clients` VALUES (702, 'ARM Cement Limited - Ksh', 'A096', 'Manish  Mehta', '+254 20 3744617/20/22/25', '2018-04-10 14:01:36', NULL, 0);

-- ----------------------------
-- Table structure for service_types
-- ----------------------------
DROP TABLE IF EXISTS `service_types`;
CREATE TABLE `service_types`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `km_range` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of service_types
-- ----------------------------
INSERT INTO `service_types` VALUES (1, 'Service A', 'Service A Operations', '0 to 5000', '2018-02-23 22:09:32', '0000-00-00 00:00:00', 0);
INSERT INTO `service_types` VALUES (2, 'Service B', 'Service B Operations', '5000-15000', '2018-02-23 22:09:32', NULL, 0);
INSERT INTO `service_types` VALUES (3, 'Service C', 'Service C Operations', 'Above 15000', '2018-02-23 22:09:43', NULL, 0);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `setting_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE INDEX `setting_name`(`setting_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('', '', 0);
INSERT INTO `settings` VALUES ('accepted_file_formats', 'jpg,jpeg,doc,png,gif,pdf,docx', 0);
INSERT INTO `settings` VALUES ('add_projects_from_excel', 'YES', 0);
INSERT INTO `settings` VALUES ('admin_costs', '436587', 0);
INSERT INTO `settings` VALUES ('allowed_ip_addresses', '', 0);
INSERT INTO `settings` VALUES ('app_title', 'PRO-KAZI', 0);
INSERT INTO `settings` VALUES ('client_can_add_project_files', '1', 0);
INSERT INTO `settings` VALUES ('client_can_comment_on_files', '1', 0);
INSERT INTO `settings` VALUES ('client_can_comment_on_tasks', '1', 0);
INSERT INTO `settings` VALUES ('client_can_create_tasks', '', 0);
INSERT INTO `settings` VALUES ('client_can_edit_tasks', '1', 0);
INSERT INTO `settings` VALUES ('client_can_view_project_files', '1', 0);
INSERT INTO `settings` VALUES ('client_can_view_tasks', '1', 0);
INSERT INTO `settings` VALUES ('client_message_users', '5,27,28', 0);
INSERT INTO `settings` VALUES ('company_address', '10100 Nyeri, KE.', 0);
INSERT INTO `settings` VALUES ('company_email', 'wagura465@gmail.com', 0);
INSERT INTO `settings` VALUES ('company_name', 'mhub', 0);
INSERT INTO `settings` VALUES ('company_phone', '718837808', 0);
INSERT INTO `settings` VALUES ('company_website', 'WaguraMaurice', 0);
INSERT INTO `settings` VALUES ('currency_symbol', 'Ksh', 0);
INSERT INTO `settings` VALUES ('date_format', 'd/m/Y', 0);
INSERT INTO `settings` VALUES ('decimal_separator', '.', 0);
INSERT INTO `settings` VALUES ('default_currency', 'KES', 0);
INSERT INTO `settings` VALUES ('disable_client_login', '1', 0);
INSERT INTO `settings` VALUES ('disable_client_signup', '1', 0);
INSERT INTO `settings` VALUES ('email_protocol', '', 0);
INSERT INTO `settings` VALUES ('email_sent_from_address', 't.develoment@wizag.biz', 0);
INSERT INTO `settings` VALUES ('email_sent_from_name', 'Wise & Agile Solutions Limited', 0);
INSERT INTO `settings` VALUES ('email_smtp_host', '', 0);
INSERT INTO `settings` VALUES ('email_smtp_pass', '', 0);
INSERT INTO `settings` VALUES ('email_smtp_port', '', 0);
INSERT INTO `settings` VALUES ('email_smtp_security_type', 'tls', 0);
INSERT INTO `settings` VALUES ('email_smtp_user', '', 0);
INSERT INTO `settings` VALUES ('escalation_duration', '45', 0);
INSERT INTO `settings` VALUES ('escalation_via_email', '1', 0);
INSERT INTO `settings` VALUES ('escalation_via_sms', '1', 0);
INSERT INTO `settings` VALUES ('first_day_of_week', '0', 0);
INSERT INTO `settings` VALUES ('HR', '', 0);
INSERT INTO `settings` VALUES ('HR_sync', 'off', 0);
INSERT INTO `settings` VALUES ('invoice_logo', 'default-invoice-logo.png', 0);
INSERT INTO `settings` VALUES ('item_purchase_code', 'ITEM-PURCHASE-CODE', 0);
INSERT INTO `settings` VALUES ('language', 'english', 0);
INSERT INTO `settings` VALUES ('module_admin', '1', 0);
INSERT INTO `settings` VALUES ('module_announcement', '', 0);
INSERT INTO `settings` VALUES ('module_attendance', '', 0);
INSERT INTO `settings` VALUES ('module_clients', '1', 0);
INSERT INTO `settings` VALUES ('module_escalation_matrix', '1', 0);
INSERT INTO `settings` VALUES ('module_estimate', '', 0);
INSERT INTO `settings` VALUES ('module_estimate_request', '', 0);
INSERT INTO `settings` VALUES ('module_event', '1', 0);
INSERT INTO `settings` VALUES ('module_expense', '', 0);
INSERT INTO `settings` VALUES ('module_invoice', '', 0);
INSERT INTO `settings` VALUES ('module_leave', '', 0);
INSERT INTO `settings` VALUES ('module_message', '1', 0);
INSERT INTO `settings` VALUES ('module_note', '1', 0);
INSERT INTO `settings` VALUES ('module_parcel', '1', 0);
INSERT INTO `settings` VALUES ('module_sage', '', 0);
INSERT INTO `settings` VALUES ('module_ticket', '1', 0);
INSERT INTO `settings` VALUES ('module_timeline', '1', 0);
INSERT INTO `settings` VALUES ('opening_hours', '1:00 AM', 0);
INSERT INTO `settings` VALUES ('order_project_tasks', 'title', 0);
INSERT INTO `settings` VALUES ('Payroll', 'on', 0);
INSERT INTO `settings` VALUES ('Payroll_sync', 'on', 0);
INSERT INTO `settings` VALUES ('product_serial', 'auto', 0);
INSERT INTO `settings` VALUES ('rows_per_page', '50', 0);
INSERT INTO `settings` VALUES ('sage_IDInvJrBatches', '1', 0);
INSERT INTO `settings` VALUES ('sage_Inventory_Project', '22', 0);
INSERT INTO `settings` VALUES ('sage_petty_cash_account_id', '94', 0);
INSERT INTO `settings` VALUES ('sage_petty_cash_batches_id', '3', 0);
INSERT INTO `settings` VALUES ('sage_TrCode', '37', 0);
INSERT INTO `settings` VALUES ('sage_WarehouseID', '1', 0);
INSERT INTO `settings` VALUES ('scrollbar', 'native', 0);
INSERT INTO `settings` VALUES ('serial_prefix', 'SN', 0);
INSERT INTO `settings` VALUES ('show_background_image_in_signin_page', 'yes', 0);
INSERT INTO `settings` VALUES ('show_logo_in_signin_page', 'yes', 0);
INSERT INTO `settings` VALUES ('site_logo', 'default-stie-logo.png', 0);
INSERT INTO `settings` VALUES ('time_format', 'capital', 0);
INSERT INTO `settings` VALUES ('timezone', 'Africa/Nairobi', 0);
INSERT INTO `settings` VALUES ('working_hours', '560', 0);
INSERT INTO `settings` VALUES ('xlsx_logo', 'excel_logo.png', 0);

-- ----------------------------
-- Table structure for social_links
-- ----------------------------
DROP TABLE IF EXISTS `social_links`;
CREATE TABLE `social_links`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `twitter` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `linkedin` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `googleplus` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `digg` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `youtube` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `pinterest` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `instagram` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `github` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `tumblr` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `vine` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for spares
-- ----------------------------
DROP TABLE IF EXISTS `spares`;
CREATE TABLE `spares`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `job_card_id` int(100) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `spare_id` int(100) NULL DEFAULT NULL,
  `amount` double NULL DEFAULT NULL,
  `quantity` int(100) NULL DEFAULT NULL,
  `total` int(100) NULL DEFAULT NULL,
  `requisition_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of spares
-- ----------------------------
INSERT INTO `spares` VALUES (10, 5, 'great', 3, 450, 3, 1350, 'RQ-010', '2018-03-23 09:35:41', 0);
INSERT INTO `spares` VALUES (11, 6, 'goodie', 1, 450, 2, 900, 'RQ-011', '2018-03-23 09:36:31', 0);
INSERT INTO `spares` VALUES (12, 6, NULL, 3, NULL, 3, 63000, 'RQ-012', '2018-03-23 13:55:00', 0);
INSERT INTO `spares` VALUES (13, 6, NULL, 4, 10000, 4, 40000, 'RQ-013', '2018-03-23 13:59:19', 0);
INSERT INTO `spares` VALUES (14, 7, 'testing2..', 1, 32000, 5, 160000, 'RQ-014', '2018-03-23 14:02:14', 0);
INSERT INTO `spares` VALUES (15, 7, 'testing2..', 2, 20000, 2, 40000, 'RQ-015', '2018-03-23 18:49:53', 0);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `project_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `ticket_id` int(11) NULL DEFAULT NULL,
  `milestone_id` int(11) NOT NULL DEFAULT 0,
  `assigned_to` int(11) NOT NULL,
  `deadline` date NULL DEFAULT NULL,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `max_hours` int(11) NOT NULL DEFAULT 0,
  `points` tinyint(4) NOT NULL DEFAULT 1,
  `status` enum('to_do - 0%','in_progress - 25%','in_progress - 50%','in_progress - 75%','done - 100%') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to_do - 0%',
  `hesabu` int(11) NOT NULL,
  `start_date` date NULL DEFAULT NULL,
  `collaborators` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT 0,
  `priority` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Normal',
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, '', 'Purchase of fencing materials', 'refwfwefw', 2, 0, NULL, 1, 5, '0000-00-00', '', 0, 1, 'to_do - 0%', 0, '0000-00-00', '', 0, 'Normal', '2018-04-12');
INSERT INTO `tasks` VALUES (2, '', 'FEncing', 'Fencing To be done ASAP', 2, 0, NULL, 1, 94, '2018-05-05', '', 40, 1, 'to_do - 0%', 0, '2018-04-27', '100', 0, 'Normal', '2018-04-09');
INSERT INTO `tasks` VALUES (3, '', 'demo task', '', 2, 0, NULL, 0, 94, '0000-00-00', '', 25, 1, 'in_progress - 25%', 0, '0000-00-00', '', 0, 'Normal', '2018-04-12');
INSERT INTO `tasks` VALUES (4, '', 'demo 3', '', 2, 0, NULL, 0, 83, '0000-00-00', '', 0, 1, 'to_do - 0%', 0, '0000-00-00', '', 0, 'Normal', '2018-04-12');

-- ----------------------------
-- Table structure for taxes
-- ----------------------------
DROP TABLE IF EXISTS `taxes`;
CREATE TABLE `taxes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taxes
-- ----------------------------
INSERT INTO `taxes` VALUES (1, 'Tax (16%)', 16, 0);

-- ----------------------------
-- Table structure for tbl_case_procedures
-- ----------------------------
DROP TABLE IF EXISTS `tbl_case_procedures`;
CREATE TABLE `tbl_case_procedures`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_case_procedures
-- ----------------------------
INSERT INTO `tbl_case_procedures` VALUES (1, 'Hearing', 0);
INSERT INTO `tbl_case_procedures` VALUES (2, 'Mentioning', 0);

-- ----------------------------
-- Table structure for tbl_case_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_case_status`;
CREATE TABLE `tbl_case_status`  (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_case_status
-- ----------------------------
INSERT INTO `tbl_case_status` VALUES (1, 'Active');
INSERT INTO `tbl_case_status` VALUES (2, 'Inactive');

-- ----------------------------
-- Table structure for tbl_case_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_case_type`;
CREATE TABLE `tbl_case_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_case_type
-- ----------------------------
INSERT INTO `tbl_case_type` VALUES (1, 'InWards', 0);
INSERT INTO `tbl_case_type` VALUES (2, 'Out Wards', 0);

-- ----------------------------
-- Table structure for tbl_cases
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cases`;
CREATE TABLE `tbl_cases`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `case_procedure` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `case_type` int(11) NOT NULL DEFAULT 0,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_checklist_performed_on
-- ----------------------------
DROP TABLE IF EXISTS `tbl_checklist_performed_on`;
CREATE TABLE `tbl_checklist_performed_on`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_checklist_performed_on
-- ----------------------------
INSERT INTO `tbl_checklist_performed_on` VALUES (1, 'ICT', 0);
INSERT INTO `tbl_checklist_performed_on` VALUES (2, 'Maintenance', 0);

-- ----------------------------
-- Table structure for tbl_checklist_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_checklist_status`;
CREATE TABLE `tbl_checklist_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_checklist_status
-- ----------------------------
INSERT INTO `tbl_checklist_status` VALUES (1, 'Submitted', 0);
INSERT INTO `tbl_checklist_status` VALUES (2, 'Escalated', 0);
INSERT INTO `tbl_checklist_status` VALUES (3, 'Closed', 0);

-- ----------------------------
-- Table structure for tbl_checklist_task_checks
-- ----------------------------
DROP TABLE IF EXISTS `tbl_checklist_task_checks`;
CREATE TABLE `tbl_checklist_task_checks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_item` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 passed 0 failed',
  `comment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `checklist_task` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_checklist_task_checks
-- ----------------------------
INSERT INTO `tbl_checklist_task_checks` VALUES (1, 1, 0, 'check out', 3);
INSERT INTO `tbl_checklist_task_checks` VALUES (2, 1, 1, NULL, 4);
INSERT INTO `tbl_checklist_task_checks` VALUES (3, 2, 1, 'comment', 4);

-- ----------------------------
-- Table structure for tbl_checklist_tasks
-- ----------------------------
DROP TABLE IF EXISTS `tbl_checklist_tasks`;
CREATE TABLE `tbl_checklist_tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `performed_by` int(11) NOT NULL,
  `performed_on` date NOT NULL,
  `escalate_to` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_checklist_tasks
-- ----------------------------
INSERT INTO `tbl_checklist_tasks` VALUES (1, '1523546027', 1, 5, '2018-04-12', 0, 0);
INSERT INTO `tbl_checklist_tasks` VALUES (2, '1523598375', 1, 5, '2018-04-13', 0, 0);
INSERT INTO `tbl_checklist_tasks` VALUES (3, '1523598900', 2, 5, '2018-04-13', 106, 0);
INSERT INTO `tbl_checklist_tasks` VALUES (4, '1523623486', 1, 5, '2018-04-13', 0, 0);

-- ----------------------------
-- Table structure for tbl_checklist_types
-- ----------------------------
DROP TABLE IF EXISTS `tbl_checklist_types`;
CREATE TABLE `tbl_checklist_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_checklist_types
-- ----------------------------
INSERT INTO `tbl_checklist_types` VALUES (1, 'Daily', 0);
INSERT INTO `tbl_checklist_types` VALUES (2, 'Weekly', 1);
INSERT INTO `tbl_checklist_types` VALUES (3, 'Monthly', 0);

-- ----------------------------
-- Table structure for tbl_checklists
-- ----------------------------
DROP TABLE IF EXISTS `tbl_checklists`;
CREATE TABLE `tbl_checklists`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL,
  `performed_on` int(11) NOT NULL,
  `comment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_checklists
-- ----------------------------
INSERT INTO `tbl_checklists` VALUES (1, 'demo', 0, 1, 'to be done');
INSERT INTO `tbl_checklists` VALUES (2, 'Comp', 0, 2, 'spoilt battery');

-- ----------------------------
-- Table structure for tbl_cust_supp_checkitems
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cust_supp_checkitems`;
CREATE TABLE `tbl_cust_supp_checkitems`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `performed_on` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '1 customer and 2 suppliers',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_cust_supp_checkitems
-- ----------------------------
INSERT INTO `tbl_cust_supp_checkitems` VALUES (21, 'Kra Pin', 0, '1,2');
INSERT INTO `tbl_cust_supp_checkitems` VALUES (22, 'Account opening form', 0, '1,2');
INSERT INTO `tbl_cust_supp_checkitems` VALUES (23, 'New item', 1, '1,');
INSERT INTO `tbl_cust_supp_checkitems` VALUES (24, 'National Identity', 1, '1,2');
INSERT INTO `tbl_cust_supp_checkitems` VALUES (25, 'First item', 1, '');

-- ----------------------------
-- Table structure for tbl_cust_supp_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cust_supp_status`;
CREATE TABLE `tbl_cust_supp_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_cust_supp_status
-- ----------------------------
INSERT INTO `tbl_cust_supp_status` VALUES (1, 'Submitted');
INSERT INTO `tbl_cust_supp_status` VALUES (2, 'Partially Submitted');

-- ----------------------------
-- Table structure for tbl_cust_supplier_checks
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cust_supplier_checks`;
CREATE TABLE `tbl_cust_supplier_checks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '1 customer, 2 supplier',
  `cust_supp_id` int(11) NOT NULL,
  `checked_on` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 for subitted 1 for partially',
  `checked_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `cust_supp_id`(`cust_supp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_cust_supplier_specific_checks
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cust_supplier_specific_checks`;
CREATE TABLE `tbl_cust_supplier_specific_checks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_item` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 for subitted 1 for partially',
  `comment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `expiry_date` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `customer_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_doc_escalation_n_reminders
-- ----------------------------
DROP TABLE IF EXISTS `tbl_doc_escalation_n_reminders`;
CREATE TABLE `tbl_doc_escalation_n_reminders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doc_type` int(10) UNSIGNED NOT NULL,
  `reminder_to` int(11) NOT NULL,
  `duration_before` int(10) UNSIGNED NOT NULL,
  `reminder_every` int(10) UNSIGNED NOT NULL,
  `reminder_for` int(10) UNSIGNED NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_doc_esc_rem_type`(`doc_type`) USING BTREE,
  INDEX `fk_esc_rem_esc_to`(`reminder_to`) USING BTREE,
  INDEX `fk_esc_rem_rem_every`(`reminder_every`) USING BTREE,
  INDEX `fk_esc_rem_reminder_for`(`reminder_for`) USING BTREE,
  INDEX `fk_esc_rem_duration_before`(`duration_before`) USING BTREE,
  CONSTRAINT `fk_doc_esc_rem_type` FOREIGN KEY (`doc_type`) REFERENCES `tbl_legal_document_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_esc_rem_duration_before` FOREIGN KEY (`duration_before`) REFERENCES `tbl_time_durations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_esc_rem_esc_to` FOREIGN KEY (`reminder_to`) REFERENCES `team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_esc_rem_rem_every` FOREIGN KEY (`reminder_every`) REFERENCES `tbl_time_durations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_esc_rem_reminder_for` FOREIGN KEY (`reminder_for`) REFERENCES `tbl_time_durations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_doc_escalation_n_reminders
-- ----------------------------
INSERT INTO `tbl_doc_escalation_n_reminders` VALUES (1, 'test reminder', 3, 1, 3, 2, 3, 0);
INSERT INTO `tbl_doc_escalation_n_reminders` VALUES (2, 'Weekly reminder', 3, 2, 2, 2, 2, 0);

-- ----------------------------
-- Table structure for tbl_escalation_matrix
-- ----------------------------
DROP TABLE IF EXISTS `tbl_escalation_matrix`;
CREATE TABLE `tbl_escalation_matrix`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `users` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_knowledge_base
-- ----------------------------
DROP TABLE IF EXISTS `tbl_knowledge_base`;
CREATE TABLE `tbl_knowledge_base`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `solution` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NULL DEFAULT 0,
  `image` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE,
  CONSTRAINT `tbl_knowledge_base_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tbl_knowledge_base_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_knowledge_base_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_knowledge_base_ticket
-- ----------------------------
DROP TABLE IF EXISTS `tbl_knowledge_base_ticket`;
CREATE TABLE `tbl_knowledge_base_ticket`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NULL DEFAULT NULL,
  `solution_id` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ticket_id`(`ticket_id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE,
  INDEX `solution_id`(`solution_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_knowledge_base_types
-- ----------------------------
DROP TABLE IF EXISTS `tbl_knowledge_base_types`;
CREATE TABLE `tbl_knowledge_base_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deleted` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_knowledge_base_types
-- ----------------------------
INSERT INTO `tbl_knowledge_base_types` VALUES (1, 'bug', 0);
INSERT INTO `tbl_knowledge_base_types` VALUES (2, 'improvement', 0);
INSERT INTO `tbl_knowledge_base_types` VALUES (3, 'recomendation', 0);
INSERT INTO `tbl_knowledge_base_types` VALUES (4, 'development', 0);

-- ----------------------------
-- Table structure for tbl_legal_case_procedures
-- ----------------------------
DROP TABLE IF EXISTS `tbl_legal_case_procedures`;
CREATE TABLE `tbl_legal_case_procedures`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legal_case` int(11) NOT NULL,
  `date` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `assigned` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `procedure_val` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_legal_docs_items
-- ----------------------------
DROP TABLE IF EXISTS `tbl_legal_docs_items`;
CREATE TABLE `tbl_legal_docs_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sage_item_id` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `legal_doc_id` int(11) NOT NULL,
  `premium` int(11) NOT NULL,
  `issage` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_legal_document_types
-- ----------------------------
DROP TABLE IF EXISTS `tbl_legal_document_types`;
CREATE TABLE `tbl_legal_document_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_expiry` int(11) NOT NULL DEFAULT 0,
  `can_upload` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_legal_document_types
-- ----------------------------
INSERT INTO `tbl_legal_document_types` VALUES (1, 'Legal', 1, 0, 0);
INSERT INTO `tbl_legal_document_types` VALUES (2, 'Gazzete Notices', 1, 0, 0);
INSERT INTO `tbl_legal_document_types` VALUES (3, 'Insuarance', 1, 1, 0);
INSERT INTO `tbl_legal_document_types` VALUES (4, 'Policy', 1, 0, 0);

-- ----------------------------
-- Table structure for tbl_legal_documents
-- ----------------------------
DROP TABLE IF EXISTS `tbl_legal_documents`;
CREATE TABLE `tbl_legal_documents`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `document_type` int(10) UNSIGNED NOT NULL,
  `file_document` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_responsible` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `covered_from` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `covered_to` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `reminder` int(11) NOT NULL DEFAULT 0,
  `reminder_sent` int(11) NOT NULL DEFAULT 0,
  `completed_escalations` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_doc_type`(`document_type`) USING BTREE,
  INDEX `fk_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_migartions
-- ----------------------------
DROP TABLE IF EXISTS `tbl_migartions`;
CREATE TABLE `tbl_migartions`  (
  `version` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_migartions
-- ----------------------------
INSERT INTO `tbl_migartions` VALUES (4);

-- ----------------------------
-- Table structure for tbl_third_party
-- ----------------------------
DROP TABLE IF EXISTS `tbl_third_party`;
CREATE TABLE `tbl_third_party`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tbl_time_durations
-- ----------------------------
DROP TABLE IF EXISTS `tbl_time_durations`;
CREATE TABLE `tbl_time_durations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seconds` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_time_durations
-- ----------------------------
INSERT INTO `tbl_time_durations` VALUES (1, '1 day', 2723623, 0);
INSERT INTO `tbl_time_durations` VALUES (2, '3 days', 487348, 0);
INSERT INTO `tbl_time_durations` VALUES (3, '1 Week', 120000, 0);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `members` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 'HR TEAM', '', 0);
INSERT INTO `team` VALUES (2, 'PAYROLL', '', 0);

-- ----------------------------
-- Table structure for team_member_job_info
-- ----------------------------
DROP TABLE IF EXISTS `team_member_job_info`;
CREATE TABLE `team_member_job_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_of_hire` date NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  `salary` double NOT NULL DEFAULT 0,
  `working_hours` double NOT NULL DEFAULT 1,
  `hourly_rate` double NOT NULL DEFAULT 1,
  `salary_term` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of team_member_job_info
-- ----------------------------
INSERT INTO `team_member_job_info` VALUES (4, 5, '2016-09-16', 0, 15000, 176, 85.227272727273, 'Monthly');
INSERT INTO `team_member_job_info` VALUES (81, 82, '2018-01-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (82, 83, '2018-01-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (83, 84, '2018-03-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (84, 85, '2001-05-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (85, 86, '2007-04-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (86, 87, '2009-12-10', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (87, 88, '2014-07-14', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (88, 89, '2011-01-03', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (89, 90, '2011-11-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (90, 91, '2011-10-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (91, 92, '2011-04-04', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (92, 93, '2011-07-04', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (93, 94, '2011-12-19', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (94, 95, '2011-12-20', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (95, 96, '2011-12-29', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (96, 97, '2015-08-05', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (97, 98, '2013-05-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (98, 99, '2013-11-10', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (99, 100, '2014-10-07', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (100, 101, '2015-07-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (101, 102, '2015-06-16', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (102, 103, '2015-09-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (103, 104, '2016-02-16', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (104, 105, '2014-08-17', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (105, 106, '2016-01-07', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (106, 107, '2016-01-10', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (107, 108, '2012-03-15', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (108, 109, '2015-11-09', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (109, 110, '2017-01-26', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (110, 111, '2016-06-02', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (111, 112, '2012-06-04', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (112, 113, '2012-04-02', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (113, 114, '2015-01-02', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (114, 115, '2017-05-02', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (115, 116, '2017-07-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (116, 117, '2017-08-14', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (117, 118, '2017-10-13', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (118, 119, '2017-10-13', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (119, 120, '2017-11-20', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (120, 121, '2018-03-15', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (121, 122, '2018-03-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (122, 123, '2010-05-24', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (123, 124, '2015-08-05', 0, 0, 560, 0, 'Contract');

-- ----------------------------
-- Table structure for third_party_messages
-- ----------------------------
DROP TABLE IF EXISTS `third_party_messages`;
CREATE TABLE `third_party_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `third_p_id` int(100) NOT NULL,
  `sender_id` int(100) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ticket_comments
-- ----------------------------
DROP TABLE IF EXISTS `ticket_comments`;
CREATE TABLE `ticket_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `files` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ticket_types
-- ----------------------------
DROP TABLE IF EXISTS `ticket_types`;
CREATE TABLE `ticket_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket_types
-- ----------------------------
INSERT INTO `ticket_types` VALUES (1, 'System', 0);
INSERT INTO `ticket_types` VALUES (2, 'Email', 0);
INSERT INTO `ticket_types` VALUES (3, 'Call', 0);
INSERT INTO `ticket_types` VALUES (6, 'Visit', 0);

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `external_reference` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `status` enum('new','client_replied','open','closed') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `last_activity_at` datetime(0) NULL DEFAULT NULL,
  `assigned_to` int(11) NOT NULL DEFAULT 0,
  `escalation_matrix` int(11) NOT NULL,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('staff','client') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'client',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` enum('active','inactive') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `message_checked_at` datetime(0) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `notification_checked_at` datetime(0) NOT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT 0,
  `job_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `disable_login` tinyint(1) NOT NULL DEFAULT 0,
  `note` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `alternative_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `alternative_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `ssn` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `sticky_note` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `skype` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `enable_web_notification` tinyint(1) NOT NULL DEFAULT 1,
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT 1,
  `landing_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '/dashboard',
  `created_at` datetime(0) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_type`(`user_type`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `client_id`(`client_id`) USING BTREE,
  INDEX `deleted`(`deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (5, 'Admin', 'User', 'staff', 1, 1, 'admin@teamkazi.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '2017-11-30 10:53:08', 0, '2018-04-12 14:27:01', 0, 'Developer', 0, NULL, '', '', '0700000000', '', '1900-12-21', '', 'male', NULL, '', 1, 1, '/dashboard', '2016-12-07 09:48:20', 0);
INSERT INTO `users` VALUES (82, 'Pato', 'Mark', 'staff', 0, 2, 'karukurobert@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '2018-04-15 21:54:59', 0, 'IT : Pragramming', 0, NULL, NULL, NULL, '0727869468', NULL, NULL, NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-03-27 00:00:00', 0);
INSERT INTO `users` VALUES (83, 'Rob', 'Kim', 'staff', 0, 2, 'bscnrb128917@spu.ac.ke', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'IT : Pragramming', 0, NULL, NULL, NULL, '', NULL, NULL, NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-03-27 00:00:00', 0);
INSERT INTO `users` VALUES (84, 'caro', 'kim', 'staff', 0, 2, 'r.karuku@wizag.biz', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'IT : Pragramming', 0, NULL, NULL, NULL, '0727869468', NULL, '1998-03-10', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-03-27 00:00:00', 0);
INSERT INTO `users` VALUES (85, 'SILVESTER', 'KUTUTA', 'staff', 0, 2, 'silvester@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : MD/CEO', 0, NULL, NULL, NULL, '', NULL, '1966-01-10', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (86, 'CATHERINE', 'LEWA', 'staff', 0, 2, 'catherine.lewa@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accountant Receivable', 0, NULL, NULL, NULL, '', NULL, '1980-07-06', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (87, 'MOURINE', 'MAGERO', 'staff', 0, 2, 'mourine.magero@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Administration Officer', 0, NULL, NULL, NULL, '', NULL, '1984-01-24', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (88, 'CATHERINE', 'THUO', 'staff', 0, 2, 'catherine.thuo@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Administration Officer', 0, NULL, NULL, NULL, '', NULL, '1976-01-11', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (89, 'WILLINGTONE', 'WARIO', 'staff', 0, 2, 'wario@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Payables', 0, NULL, NULL, NULL, '', NULL, '1985-05-05', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (90, 'ALOICE', 'KUTUTA', 'staff', 0, 2, 'aloice@esl-eastfarica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Legal Manager', 0, NULL, NULL, NULL, '', NULL, '1981-01-06', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (91, 'MAUREEN', 'OPIYO', 'staff', 0, 2, 'maurine.atieno@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Country Operations Manager', 0, NULL, NULL, NULL, '', NULL, '1984-06-26', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (92, 'ISAAC', 'WATKINS', 'staff', 0, 2, 'watkins@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Technical Manager', 0, NULL, NULL, NULL, '', NULL, '1961-08-16', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (93, 'CHRISPUS', 'KILEI', 'staff', 0, 2, 'chrispus.kilei@esl-east africa.co', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Technical Supervisor', 0, NULL, NULL, NULL, '', NULL, '1970-04-24', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (94, 'EVANS', 'CHIBUNGU', 'staff', 0, 2, 'evans.ngala@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '2018-04-12 12:00:27', 0, 'Corporate Support : ICT Manager', 0, NULL, NULL, NULL, '', NULL, '1985-09-22', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (95, 'LEONARD', 'BAYA', 'staff', 0, 2, 'bayamleonard@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Supervisor', 0, NULL, NULL, NULL, '', NULL, '1974-03-06', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (96, 'MARTIN', 'IKIARA', 'staff', 0, 2, 'martin.karani@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Group Chief Finance Officer', 0, NULL, NULL, NULL, '', NULL, '1979-06-05', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (97, 'DANIEL', 'WANIKINA', 'staff', 0, 2, '3transport@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Machine Operator', 0, NULL, NULL, NULL, '', NULL, '1988-06-22', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (98, 'ERICKSON', 'NGELE', 'staff', 0, 2, '1transport@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Machine Operator', 0, NULL, NULL, NULL, '', NULL, '1979-03-02', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (99, 'LENROD', 'MGENDI', 'staff', 0, 2, 'lenrod.mwamburi@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Audit, Risk and Compliance : Group Internal Audit Risk & Compliance Officer', 0, NULL, NULL, NULL, '', NULL, '1979-06-13', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (100, 'JOHN', 'LAGAT', 'staff', 0, 2, 'it.support@esl-eastafrica.com', 'e10adc3949ba59abbe56e057f20f883e', '_file5acf61ea82a24-avatar.png', 'active', '0000-00-00 00:00:00', 0, '2018-04-12 08:47:23', 0, 'Corporate Support : ICT Assistant', 0, NULL, NULL, NULL, '', NULL, '1981-11-27', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (101, 'JOYLINAH', 'NJERI', 'staff', 0, 2, 'joylinah.nduta@esl-eastafica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Procurement Officer', 0, NULL, NULL, NULL, '', NULL, '1986-10-20', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (102, 'STEPHEN', 'OMONDI', 'staff', 0, 2, 'stephen.okiki@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR Assistant', 0, NULL, NULL, NULL, '', NULL, '1988-03-20', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (103, 'JUSTUS', 'MUTHEMBWA', 'staff', 0, 2, '2transport@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Transport Clerk', 0, NULL, NULL, NULL, '', NULL, '1975-10-11', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (104, 'ERIC OLENSI', 'OSINYA', 'staff', 0, 2, 'erick.osinya@esl', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Transport Clerk', 0, NULL, NULL, NULL, '', NULL, '1994-03-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (105, 'PATRICK', 'MBUGUA', 'staff', 0, 2, 'patrick.mbugua.esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Credit Controller', 0, NULL, NULL, NULL, '', NULL, '1987-08-11', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (106, 'RAYMOND', 'WANGUNDA', 'staff', 0, 2, 'ops@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Boarding Clerk', 0, NULL, NULL, NULL, '', NULL, '1987-08-07', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (107, 'FLORENCE', 'TUEI', 'staff', 0, 2, 'florence.tuei@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Country Sales & Marketing Manager', 0, NULL, NULL, NULL, '', NULL, '1977-08-20', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (108, 'KENNEDY', 'KIVUVANI', 'staff', 0, 2, 'kennedy.kivuvani@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Business Development Manager', 0, NULL, NULL, NULL, '', NULL, '1966-12-23', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (109, 'GRACE', 'MPOYA', 'staff', 0, 2, 'grace.mpoya@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Customer Service Executive - Ops', 0, NULL, NULL, NULL, '', NULL, '1977-12-12', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (110, 'ERIC', 'KYALO', 'staff', 0, 2, 'audit@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Audit, Risk and Compliance : Audit Assistant', 0, NULL, NULL, NULL, '', NULL, '1994-01-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (111, 'IRENE', 'OTIENO', 'staff', 0, 2, 'irene.atieno@esl-eastarica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Payales', 0, NULL, NULL, NULL, '', NULL, '1987-05-28', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (112, 'MERCYLINE', 'MUTUA', 'staff', 0, 2, 'mercyline.mutua@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accountant Payable', 0, NULL, NULL, NULL, '', NULL, '1987-12-14', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (113, 'ARSHUR', 'OWANE', 'staff', 0, 2, 'lomo.owane@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Sales Support Executive', 0, NULL, NULL, NULL, '', NULL, '1985-10-15', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (114, 'COLLINS', 'PAMBA', 'staff', 0, 2, 'collinspamba@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Receivables', 0, NULL, NULL, NULL, '', NULL, '1986-04-02', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (115, 'GULJAN', 'RAMADHAN', 'staff', 0, 2, '1ops@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Customer Service Executive - Agency', 0, NULL, NULL, NULL, '', NULL, '1992-05-04', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (116, 'FRANCIS', 'OPALO', 'staff', 0, 2, 'francis.opalo@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Port Agency Manager', 0, NULL, NULL, NULL, '', NULL, '1972-06-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (117, 'PETER', 'MANGA', 'staff', 0, 2, 'peter.manga@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR Clerk', 0, NULL, NULL, NULL, '', NULL, '1994-10-30', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (118, 'LAWRENCE', 'AMENYA', 'staff', 0, 2, 'lawrence.amenya@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Officer', 0, NULL, NULL, NULL, '', NULL, '1991-02-27', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (119, 'MOSES', 'MANGALE', 'staff', 0, 2, '1kennedy.kivuvani@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Officer', 0, NULL, NULL, NULL, '', NULL, '1986-01-01', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (120, 'MOUREEN', 'KIAMA', 'staff', 0, 2, 'mourine.kiama@esl-eastafrica', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Key Accounts Executive', 0, NULL, NULL, NULL, '', NULL, '1991-09-18', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (121, 'Benson', 'Ireri', 'staff', 0, 2, 'agency@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Officer', 0, NULL, NULL, NULL, '', NULL, NULL, NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (122, 'FANUEL', 'ONYANGO', 'staff', 0, 2, 'fanuel.onyango@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Key Accounts Executive', 0, NULL, NULL, NULL, '', NULL, NULL, NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-12 00:00:00', 0);
INSERT INTO `users` VALUES (123, 'FRANCISCA', 'NZIOKA', 'staff', 0, 2, 'francisca@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR & Admin Manager', 0, NULL, NULL, NULL, '', NULL, '1974-04-16', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-04-13 00:00:00', 0);
INSERT INTO `users` VALUES (124, 'DANIEL', 'WANIKINA', 'staff', 0, 2, 'transport@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Machine Operator', 0, NULL, NULL, NULL, '', NULL, '1988-06-22', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-04-13 00:00:00', 0);

-- ----------------------------
-- Table structure for vehicle_details
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_details`;
CREATE TABLE `vehicle_details`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vehicle_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vehicle_details
-- ----------------------------
INSERT INTO `vehicle_details` VALUES (1, 'NISSAN', 'KVW 567Y', 'brand new', '2018-02-22 04:36:30', NULL, 0);
INSERT INTO `vehicle_details` VALUES (2, 'PRADO', 'KCA 679P', 'MODERN', '2018-02-22 04:36:30', NULL, 0);

-- ----------------------------
-- Table structure for warranties
-- ----------------------------
DROP TABLE IF EXISTS `warranties`;
CREATE TABLE `warranties`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `part_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `warranty_period` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `asset` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of warranties
-- ----------------------------
INSERT INTO `warranties` VALUES (1, 'trimmers', '567890', 'deadasd', '2018-04-20', '37', '2018-04-06 10:20:48', 0);

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 12/02/2018 22:20:37
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of business_types
-- ----------------------------
INSERT INTO `business_types` VALUES (1, 'New', '2018-01-22 10:05:34', '2018-02-12 16:55:25', 0);

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
INSERT INTO `call_types` VALUES (1, 'Visit', '2018-01-22 07:38:42', NULL, 0);
INSERT INTO `call_types` VALUES (2, 'Phone Call', '2018-01-22 07:38:56', NULL, 0);
INSERT INTO `call_types` VALUES (3, 'Email', '2018-01-22 07:39:02', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of inventory_requisitions
-- ----------------------------
INSERT INTO `inventory_requisitions` VALUES (40, 185, 2, 'Sugar', '1', 2, 1, 'sdfgdfbdfgbdfgbfgdb df', '2018-02-12 19:17:20', '2018-02-12 19:17:20', 'Approved', 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
INSERT INTO `objective_types` VALUES (1, 'Debt Collection', '2018-01-22 07:51:46', NULL, 0);
INSERT INTO `objective_types` VALUES (2, 'Development', '2018-01-22 07:51:57', NULL, 0);
INSERT INTO `objective_types` VALUES (3, 'Maintenance', '2018-01-22 07:52:08', NULL, 0);
INSERT INTO `objective_types` VALUES (4, 'Acquisition', '2018-01-22 07:52:20', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
  `created_date` date NOT NULL,
  `status` enum('open','completed','canceled') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `price` double NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrators', 'a:24:{s:5:\"leave\";s:3:\"all\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:3:\"all\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:3:\"all\";s:8:\"estimate\";s:3:\"all\";s:7:\"expense\";s:3:\"all\";s:6:\"client\";s:3:\"all\";s:6:\"ticket\";s:3:\"all\";s:12:\"announcement\";s:3:\"all\";s:19:\"can_create_projects\";s:1:\"1\";s:17:\"can_edit_projects\";s:1:\"1\";s:19:\"can_delete_projects\";s:1:\"1\";s:30:\"can_add_remove_project_members\";s:1:\"1\";s:16:\"can_create_tasks\";s:1:\"1\";s:14:\"can_edit_tasks\";s:1:\"1\";s:16:\"can_delete_tasks\";s:1:\"1\";s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";s:1:\"1\";s:21:\"can_delete_milestones\";s:1:\"1\";s:16:\"can_delete_files\";s:1:\"1\";s:34:\"can_view_team_members_contact_info\";s:1:\"1\";s:34:\"can_view_team_members_social_links\";s:1:\"1\";}', 0);
INSERT INTO `roles` VALUES (2, 'General Staff', 'a:24:{s:5:\"leave\";s:3:\"all\";s:14:\"leave_specific\";s:0:\"\";s:10:\"attendance\";s:3:\"all\";s:19:\"attendance_specific\";s:0:\"\";s:7:\"invoice\";s:3:\"all\";s:8:\"estimate\";s:3:\"all\";s:7:\"expense\";s:3:\"all\";s:6:\"client\";s:3:\"all\";s:6:\"ticket\";s:3:\"all\";s:12:\"announcement\";s:3:\"all\";s:19:\"can_create_projects\";s:1:\"1\";s:17:\"can_edit_projects\";s:1:\"1\";s:19:\"can_delete_projects\";s:1:\"1\";s:30:\"can_add_remove_project_members\";s:1:\"1\";s:16:\"can_create_tasks\";s:1:\"1\";s:14:\"can_edit_tasks\";s:1:\"1\";s:16:\"can_delete_tasks\";s:1:\"1\";s:20:\"can_comment_on_tasks\";s:1:\"1\";s:21:\"can_create_milestones\";s:1:\"1\";s:19:\"can_edit_milestones\";s:1:\"1\";s:21:\"can_delete_milestones\";s:1:\"1\";s:16:\"can_delete_files\";s:1:\"1\";s:34:\"can_view_team_members_contact_info\";s:1:\"1\";s:34:\"can_view_team_members_social_links\";s:1:\"1\";}', 0);

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
INSERT INTO `settings` VALUES ('email_protocol', 'smtp', 0);
INSERT INTO `settings` VALUES ('email_sent_from_address', 'wagura465@gmail.com', 0);
INSERT INTO `settings` VALUES ('email_sent_from_name', 'Wise & Agile Solutions Limited', 0);
INSERT INTO `settings` VALUES ('email_smtp_host', 'in.mailjet.com', 0);
INSERT INTO `settings` VALUES ('email_smtp_pass', '8b49011a29bba60a1e89774b6aa01a95', 0);
INSERT INTO `settings` VALUES ('email_smtp_port', '465', 0);
INSERT INTO `settings` VALUES ('email_smtp_security_type', 'ssl', 0);
INSERT INTO `settings` VALUES ('email_smtp_user', 'ac746108f48ffb16045549bb3fbab8d9', 0);
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
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 411 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of team_member_job_info
-- ----------------------------
INSERT INTO `team_member_job_info` VALUES (4, 5, '2016-09-16', 0, 15000, 176, 85.227272727273, 'Monthly');
INSERT INTO `team_member_job_info` VALUES (72, 180, '2001-05-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (73, 181, '2007-04-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (74, 182, '2009-12-10', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (75, 183, '2010-05-24', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (76, 184, '2011-01-03', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (77, 185, '2011-11-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (78, 186, '2011-10-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (79, 187, '2011-04-04', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (80, 188, '2011-07-04', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (81, 189, '2011-12-19', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (82, 190, '2011-12-20', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (83, 191, '2011-12-29', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (84, 192, '2013-11-10', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (85, 193, '2014-10-07', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (86, 194, '2015-07-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (87, 195, '2015-08-05', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (88, 196, '2015-06-16', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (89, 197, '2015-09-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (90, 198, '2014-08-17', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (91, 199, '2016-01-07', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (92, 200, '2016-01-10', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (93, 201, '2012-03-15', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (94, 202, '2016-02-16', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (95, 203, '2014-07-14', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (96, 204, '2015-11-09', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (97, 205, '2007-11-26', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (98, 206, '2017-01-26', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (99, 207, '2016-06-02', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (100, 208, '2012-06-04', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (101, 209, '2012-04-02', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (102, 210, '2015-01-02', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (103, 211, '2017-05-02', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (104, 212, '2017-07-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (105, 213, '2017-08-14', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (106, 214, '2017-10-13', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (107, 215, '2017-10-13', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (108, 216, '2017-11-20', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (109, 217, '2013-05-01', 0, 0, 560, 0, 'Contract');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ticket_types
-- ----------------------------
DROP TABLE IF EXISTS `ticket_types`;
CREATE TABLE `ticket_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (5, 'Admin', 'User', 'staff', 1, 1, 'admin@teamkazi.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '2017-11-30 10:53:08', 0, '2017-12-13 16:31:14', 0, 'Developer', 0, NULL, '', '', '0700000000', '', '1900-12-21', '', 'male', NULL, '', 1, 1, '/dashboard', '2016-12-07 09:48:20', 0);
INSERT INTO `users` VALUES (180, 'SILVESTER', 'KUTUTA', 'staff', 0, 2, 'silvester@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : MD/CEO', 0, NULL, NULL, NULL, '', NULL, '1966-01-10', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (181, 'CATHERINE', 'LEWA', 'staff', 0, 2, 'catherine.lewa@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accountant Receivable', 0, NULL, NULL, NULL, '', NULL, '1980-07-06', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (182, 'MOURINE', 'MAGERO', 'staff', 0, 2, 'mourine.magero@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Administration Officer', 0, NULL, NULL, NULL, '', NULL, '1984-01-24', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (183, 'FRANCISCA', 'NZIOKA', 'staff', 0, 2, 'francisca@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR&Admin Officer', 0, NULL, NULL, NULL, '', NULL, '1974-04-16', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (184, 'WILLINGTONE', 'WARIO', 'staff', 0, 2, 'wario@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Payables', 0, NULL, NULL, NULL, '', NULL, '1985-05-05', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (185, 'ALOICE', 'KUTUTA', 'staff', 0, 2, 'aloice@esl-eastfarica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '2018-02-12 19:13:42', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Legal Manager', 0, NULL, NULL, NULL, '', NULL, '1981-01-06', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (186, 'MAUREEN', 'OPIYO', 'staff', 0, 2, 'maurine.atieno@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Country Operations Manager', 0, NULL, NULL, NULL, '', NULL, '1984-06-26', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (187, 'ISAAC', 'WATKINS', 'staff', 0, 2, 'watkins@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Technical Manager', 0, NULL, NULL, NULL, '', NULL, '1961-08-16', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (188, 'CHRISPUS', 'KILEI', 'staff', 0, 2, 'chrispus.kilei@esl-east africa.co', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Technical Supervisor', 0, NULL, NULL, NULL, '', NULL, '1970-04-24', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (189, 'EVANS', 'CHIBUNGU', 'staff', 0, 2, 'evans.ngala@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : ICT Manager', 0, NULL, NULL, NULL, '', NULL, '1985-09-22', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (190, 'LEONARD', 'BAYA', 'staff', 0, 2, 'bayamleonard@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Supervisor', 0, NULL, NULL, NULL, '', NULL, '1974-03-06', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (191, 'MARTIN', 'IKIARA', 'staff', 0, 2, 'martin.karani@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Group Chief Finance Officer', 0, NULL, NULL, NULL, '', NULL, '1979-06-05', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (192, 'LENROD', 'MGENDI', 'staff', 0, 2, 'lenrod.mwamburi@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Audit, Risk and Compliance : Group Internal Audit Risk & Compliance Officer', 0, NULL, NULL, NULL, '', NULL, '1979-06-13', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (193, 'JOHN', 'LAGAT', 'staff', 0, 2, 'it.support@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : ICT Assistant', 0, NULL, NULL, NULL, '', NULL, '1981-11-27', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (194, 'JOYLINAH', 'NJERI', 'staff', 0, 2, 'joylinah.nduta@esl-eastafica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Procurement Officer', 0, NULL, NULL, NULL, '', NULL, '1986-10-20', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (195, 'DANIEL', 'WANIKINA', 'staff', 0, 2, '3transport@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Machine Operator', 0, NULL, NULL, NULL, '', NULL, '1988-06-22', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (196, 'STEPHEN', 'OMONDI', 'staff', 0, 2, 'stephen.okiki@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR Assistant', 0, NULL, NULL, NULL, '', NULL, '1988-03-20', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (197, 'JUSTUS', 'MUTHEMBWA', 'staff', 0, 2, '2transport@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Transport Clerk', 0, NULL, NULL, NULL, '', NULL, '1975-10-11', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (198, 'PATRICK', 'MBUGUA', 'staff', 0, 2, 'patrick.mbugua.esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Credit Controller', 0, NULL, NULL, NULL, '', NULL, '1987-08-11', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (199, 'RAYMOND', 'WANGUNDA', 'staff', 0, 2, 'ops@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Boarding Clerk', 0, NULL, NULL, NULL, '', NULL, '1987-08-07', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (200, 'FLORENCE', 'TUEI', 'staff', 0, 2, 'florence.tuei@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Country Sales & Marketing Manager', 0, NULL, NULL, NULL, '', NULL, '1977-08-20', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (201, 'KENNEDY', 'KIVUVANI', 'staff', 0, 2, 'kennedy.kivuvani@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Business Development Manager', 0, NULL, NULL, NULL, '', NULL, '1966-12-23', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (202, 'ERIC OLENSI', 'OSINYA', 'staff', 0, 2, 'erick.osinya@esl', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Transport Clerk', 0, NULL, NULL, NULL, '', NULL, '1994-03-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (203, 'CATHERINE', 'THUO', 'staff', 0, 2, 'catherine.thuo@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : Administration Officer', 0, NULL, NULL, NULL, '', NULL, '1976-01-11', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (204, 'GRACE', 'MPOYA', 'staff', 0, 2, 'grace.mpoya@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Customer Service Executive - Ops', 0, NULL, NULL, NULL, '', NULL, '1977-12-12', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (205, 'PATRICK', 'MAGIRI', 'staff', 0, 2, 'patrick.magiri@sovereignlog.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Business Development Manager', 0, NULL, NULL, NULL, '', NULL, '1977-12-01', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (206, 'ERIC', 'KYALO', 'staff', 0, 2, 'audit@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Audit, Risk and Compliance : Audit Assistant', 0, NULL, NULL, NULL, '', NULL, '1994-01-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (207, 'IRENE', 'OTIENO', 'staff', 0, 2, 'irene.atieno@esl-eastarica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Payales', 0, NULL, NULL, NULL, '', NULL, '1987-05-28', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (208, 'MERCYLINE', 'MUTUA', 'staff', 0, 2, 'mercyline.mutua@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accountant Payable', 0, NULL, NULL, NULL, '', NULL, '1987-12-14', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (209, 'ARSHUR', 'OWANE', 'staff', 0, 2, 'lomo.owane@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Sales Support Executive', 0, NULL, NULL, NULL, '', NULL, '1985-10-15', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (210, 'COLLINS', 'PAMBA', 'staff', 0, 2, 'collinspamba@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Finance : Accounts Receivables', 0, NULL, NULL, NULL, '', NULL, '1986-04-02', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (211, 'GULJAN', 'RAMADHAN', 'staff', 0, 2, '1ops@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Customer Service Executive - Agency', 0, NULL, NULL, NULL, '', NULL, '1992-05-04', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (212, 'FRANCIS', 'OPALO', 'staff', 0, 2, 'francis.opalo@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Port Agency Manager', 0, NULL, NULL, NULL, '', NULL, '1972-06-12', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (213, 'PETER', 'MANGA', 'staff', 0, 2, 'peter.manga@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Corporate Support : HR Clerk', 0, NULL, NULL, NULL, '', NULL, '1994-10-30', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (214, 'LAWRENCE', 'AMENYA', 'staff', 0, 2, 'lawrence.amenya@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Officer', 0, NULL, NULL, NULL, '', NULL, '1991-02-27', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (215, 'MOSES', 'MANGALE', 'staff', 0, 2, '1kennedy.kivuvani@freightwell.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Operations : Operations Officer', 0, NULL, NULL, NULL, '', NULL, '1986-01-01', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (216, 'MOUREEN', 'KIAMA', 'staff', 0, 2, 'mourine.kiama@esl-eastafrica', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Sales & Marketing : Key Accounts Executive', 0, NULL, NULL, NULL, '', NULL, '1991-09-18', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);
INSERT INTO `users` VALUES (217, 'ERICKSON', 'NGELE', 'staff', 0, 2, '1transport@esl-eastafrica.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Technical : Machine Operator', 0, NULL, NULL, NULL, '', NULL, '1979-03-02', NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-02-12 00:00:00', 0);

SET FOREIGN_KEY_CHECKS = 1;

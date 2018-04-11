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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of activity_logs
-- ----------------------------
INSERT INTO `activity_logs` VALUES (1, '2018-03-23 12:03:03', 5, 'created', 'task', 'Other', 1, NULL, 'project', 1, '', 0, 0);

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `asset_no`(`asset_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of assets
-- ----------------------------
INSERT INTO `assets` VALUES (33, '426', 'ESL/MSA//MV/2712', 'CARTRACK GARGETS - GALOOLI', '0', '2012-11-07 11:00:00', 0, '2018-03-03 21:17:12', '2016-03-10', '2018-03-30 00:00:00', 400, 6, '2018-03-23 05:53:13');
INSERT INTO `assets` VALUES (36, '427', 'KHMA 276C', 'CAT 938G WHEEL LOADER I', '0', '2018-01-22 11:00:00', 0, '2018-03-05 02:52:39', '2018-03-17', '2018-04-01 00:00:00', 480, 6, '2018-03-19 14:00:44');
INSERT INTO `assets` VALUES (37, '428', 'KCA 001G', 'LAND ROVER VOGUE 3.6TDV 8', '0', '2014-02-09 11:00:00', 0, '2018-03-05 02:52:39', '2017-06-16', '2018-03-31 00:00:00', 250, 8, '2018-03-19 13:58:03');
INSERT INTO `assets` VALUES (38, '429', 'KCB 363Y', 'TOYOTA HILUX DOUBLE CAB', '0', '2018-01-22 11:00:00', 0, '2018-03-05 02:52:39', '2018-03-21', '2018-05-02 00:00:00', 500, 8, '2018-03-19 13:59:32');
INSERT INTO `assets` VALUES (39, '430', 'KCC 694T', 'TOYOTA SUCCEED', '0', '2018-01-22 11:00:00', 0, '2018-03-05 02:52:39', '2018-08-16', '2018-01-01 00:00:00', 0, 10, '2018-03-19 11:16:34');
INSERT INTO `assets` VALUES (46, '7645', '3e34d', 'toyota', 'nai', NULL, 0, '2018-03-08 22:14:16', '2018-01-31', '2018-05-01 00:00:00', 200, 7, '2018-03-19 13:59:58');
INSERT INTO `assets` VALUES (47, '431', 'KCC 168Z', 'TOYOTA FIELDER', '0', '2018-01-22 00:00:00', 0, '2018-03-15 18:04:47', '2017-02-02', '2018-06-01 00:00:00', 390, 6, '2018-03-19 13:59:10');
INSERT INTO `assets` VALUES (48, '432', 'KCC 169Z', 'TOYOTA VOXY', '0', '2018-01-22 00:00:00', 0, '2018-03-16 16:13:17', '2018-05-01', '2018-03-31 00:00:00', 300, 6, '2018-03-23 06:14:44');
INSERT INTO `assets` VALUES (50, '433', 'KHMA 812G', 'CAT 938G WHEELLOADER II', '0', '2018-01-22 00:00:00', 0, '2018-03-19 10:05:05', '2018-01-31', '2018-03-31 00:00:00', 320, 7, '2018-03-23 05:54:06');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
  `application_data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (1, 2, 2, 'desct', 37, '2018-03-21 00:00:00', '01:00:00', 7890, 700, 'ESL-1-KCA 001G', '[{\"items\":{\"inspection_id\":\"2\",\"user\":\"6\",\"satus\":\"1\"}},{\"items\":{\"inspection_id\":\"4\",\"user\":\"8\",\"satus\":\"2\"}},{\"items\":{\"inspection_id\":\"3\",\"user\":\"9\",\"satus\":\"3\"}},{\"items\":{\"inspection_id\":\"6\",\"user\":\"10\",\"satus\":\"2\"}},{\"items\":{\"inspection_id\":\"2\",\"user\":\"7\",\"satus\":\"1\"}}]', '2018-03-27 09:09:12', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (1, 5, '', '2018-03-23 12:03:03', '219,241', '', 'project_task_created', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project_members
-- ----------------------------
INSERT INTO `project_members` VALUES (1, 5, 1, 1, 0);
INSERT INTO `project_members` VALUES (2, 241, 1, 0, 0);
INSERT INTO `project_members` VALUES (3, 219, 1, 0, 0);

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
  `sage_client_id` int(11) NULL DEFAULT NULL,
  `sage_project_id` int(11) NULL DEFAULT NULL,
  `created_date` date NOT NULL,
  `status` enum('open','completed','canceled') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `price` double NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

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
INSERT INTO `settings` VALUES ('email_protocol', 'smtp', 0);
INSERT INTO `settings` VALUES ('email_sent_from_address', 't.develoment@wizag.biz', 0);
INSERT INTO `settings` VALUES ('email_sent_from_name', 'Wise & Agile Solutions Limited', 0);
INSERT INTO `settings` VALUES ('email_smtp_host', 'smtp.mailtrap.io', 0);
INSERT INTO `settings` VALUES ('email_smtp_pass', '2176180c5483c4', 0);
INSERT INTO `settings` VALUES ('email_smtp_port', '465', 0);
INSERT INTO `settings` VALUES ('email_smtp_security_type', 'tls', 0);
INSERT INTO `settings` VALUES ('email_smtp_user', 'e84a71a5ca5cc0', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of team_member_job_info
-- ----------------------------
INSERT INTO `team_member_job_info` VALUES (4, 5, '2016-09-16', 0, 15000, 176, 85.227272727273, 'Monthly');
INSERT INTO `team_member_job_info` VALUES (81, 82, '2018-01-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (82, 83, '2018-01-01', 0, 0, 560, 0, 'Contract');
INSERT INTO `team_member_job_info` VALUES (83, 84, '2018-03-01', 0, 0, 560, 0, 'Contract');

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
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (5, 'Admin', 'User', 'staff', 1, 1, 'admin@teamkazi.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '2017-11-30 10:53:08', 0, '2017-12-13 16:31:14', 0, 'Developer', 0, NULL, '', '', '0700000000', '', '1900-12-21', '', 'male', NULL, '', 1, 1, '/dashboard', '2016-12-07 09:48:20', 0);
INSERT INTO `users` VALUES (82, 'Pato', 'Mark', 'staff', 0, 2, 'karukurobert@gmail.com', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'IT : Pragramming', 0, NULL, NULL, NULL, '0727869468', NULL, NULL, NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-03-27 00:00:00', 0);
INSERT INTO `users` VALUES (83, 'Rob', 'Kim', 'staff', 0, 2, 'bscnrb128917@spu.ac.ke', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'IT : Pragramming', 0, NULL, NULL, NULL, '', NULL, NULL, NULL, 'male', NULL, NULL, 1, 1, '/dashboard', '2018-03-27 00:00:00', 0);
INSERT INTO `users` VALUES (84, 'caro', 'kim', 'staff', 0, 2, 'r.karuku@wizag.biz', '25d55ad283aa400af464c76d713c07ad', NULL, 'active', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 'IT : Pragramming', 0, NULL, NULL, NULL, '0727869468', NULL, '1998-03-10', NULL, 'female', NULL, NULL, 1, 1, '/dashboard', '2018-03-27 00:00:00', 0);

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

SET FOREIGN_KEY_CHECKS = 1;

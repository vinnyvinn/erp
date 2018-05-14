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

 Date: 14/05/2018 07:50:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ict_issets
-- ----------------------------
DROP TABLE IF EXISTS `ict_issets`;
CREATE TABLE `ict_issets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sage_id` int(11) NOT NULL DEFAULT 0,
  `sage_dept` int(11) NOT NULL DEFAULT 0,
  `model_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `serial_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `assigned_to` int(11) NOT NULL DEFAULT 0,
  `accepted` enum('No','Yes') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'No',
  `category_id` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sage_id`(`sage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 374 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ict_issets
-- ----------------------------
INSERT INTO `ict_issets` VALUES (342, 310, 8, NULL, NULL, 0, 'No', 0, 'Nulla porttitor accumsan tincidunt. Cras ultricies ligula sed magna dictum porta. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur arcu erat, accumsan id imperdiet et, po', 0);
INSERT INTO `ict_issets` VALUES (343, 311, 0, NULL, 'QWERTY!@#$', 350, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (344, 312, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (345, 313, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (346, 314, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (347, 315, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (348, 316, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (349, 317, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (350, 318, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (351, 319, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (352, 320, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (353, 321, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (354, 322, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (355, 323, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (356, 324, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (357, 325, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (358, 326, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (359, 327, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (360, 328, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (361, 329, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (362, 330, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (363, 331, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (364, 332, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (365, 333, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (366, 334, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (367, 335, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (368, 336, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (369, 337, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (370, 338, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (371, 339, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (372, 1002, 0, NULL, NULL, 0, 'No', 0, NULL, 0);
INSERT INTO `ict_issets` VALUES (373, 0, 0, NULL, NULL, 5, 'Yes', NULL, NULL, 0);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NULL DEFAULT NULL,
  `desig_id` int(11) NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `members` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 626 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (589, NULL, 1, 'MD/CEO', ',348', 0);
INSERT INTO `team` VALUES (590, NULL, 2, 'Accounts Manager - Receivable', ',349', 0);
INSERT INTO `team` VALUES (591, NULL, 3, 'Administration Officer', ',350,370', 0);
INSERT INTO `team` VALUES (592, NULL, 4, 'HR & Admin Manager', ',351', 0);
INSERT INTO `team` VALUES (593, NULL, 5, 'Assistant Accountant - Payable', '', 0);
INSERT INTO `team` VALUES (594, NULL, 6, 'Legal Manager', ',352', 0);
INSERT INTO `team` VALUES (595, NULL, 7, 'Country Operations Manager', ',353', 0);
INSERT INTO `team` VALUES (596, NULL, 8, 'Technical Manager', ',354', 0);
INSERT INTO `team` VALUES (597, NULL, 9, 'Technical Supervisor', ',355', 0);
INSERT INTO `team` VALUES (598, NULL, 10, 'ICT Manager', ',356', 0);
INSERT INTO `team` VALUES (599, NULL, 11, 'Operations Supervisor', ',357', 0);
INSERT INTO `team` VALUES (600, NULL, 12, 'Group Chief Finance Officer', ',358', 0);
INSERT INTO `team` VALUES (601, NULL, 13, 'Machine Operator', ',362,383', 0);
INSERT INTO `team` VALUES (602, NULL, 14, 'Group Internal Audit Risk & Compliance Officer', ',359', 0);
INSERT INTO `team` VALUES (603, NULL, 15, 'ICT Assistant', ',360', 0);
INSERT INTO `team` VALUES (604, NULL, 16, 'Procurement Officer', ',361', 0);
INSERT INTO `team` VALUES (605, NULL, 17, 'HR Assistant', ',363', 0);
INSERT INTO `team` VALUES (606, NULL, 18, 'Transport Clerk', ',364,369', 0);
INSERT INTO `team` VALUES (607, NULL, 19, 'Credit Controller', ',365', 0);
INSERT INTO `team` VALUES (608, NULL, 20, 'Boarding Clerk', ',366', 0);
INSERT INTO `team` VALUES (609, NULL, 21, 'Country Sales & Marketing Manager', ',367', 0);
INSERT INTO `team` VALUES (610, NULL, 22, 'Business Development Manager', ',368', 0);
INSERT INTO `team` VALUES (611, NULL, 23, 'Customer Service Executive - Ops', ',371', 0);
INSERT INTO `team` VALUES (612, NULL, 24, 'Audit Assistant', ',372', 0);
INSERT INTO `team` VALUES (613, NULL, 25, 'Assistant Accountant -  Receivable.', ',373,376', 0);
INSERT INTO `team` VALUES (614, NULL, 26, 'Accounts Manager - Payable', ',374', 0);
INSERT INTO `team` VALUES (615, NULL, 27, 'Sales Support Executive', ',375', 0);
INSERT INTO `team` VALUES (616, NULL, 28, 'Accounts Receivables', '', 0);
INSERT INTO `team` VALUES (617, NULL, 29, 'Customer Service Executive - Agency', ',377', 0);
INSERT INTO `team` VALUES (618, NULL, 30, 'Port Agency Manager', ',378', 0);
INSERT INTO `team` VALUES (619, NULL, 31, 'HR Clerk', ',379', 0);
INSERT INTO `team` VALUES (620, NULL, 32, 'Operations Officer', ',380,381,385', 0);
INSERT INTO `team` VALUES (621, NULL, 33, 'Finance Intern', '', 0);
INSERT INTO `team` VALUES (622, NULL, 34, 'Operations Intern', '', 0);
INSERT INTO `team` VALUES (623, NULL, 35, 'ICT Intern', '', 0);
INSERT INTO `team` VALUES (624, NULL, 36, 'Key Accounts Executive', ',382,384', 0);
INSERT INTO `team` VALUES (625, NULL, 37, 'Sales Executive', '', 0);

SET FOREIGN_KEY_CHECKS = 1;

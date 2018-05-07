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

 Date: 05/05/2018 13:18:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `assigned_to` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `escalation_matrix` int(11) NOT NULL,
  `team_id` int(11) NULL DEFAULT 0,
  `labels` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES (17, 0, '', 1, 'amolo', 5, '2018-04-30 08:37:27', 'new', '2018-04-30 08:37:27', '', 0, 3, 'tydytr', 0);

SET FOREIGN_KEY_CHECKS = 1;

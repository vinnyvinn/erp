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

 Date: 26/04/2018 10:12:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for preventive_maintainance
-- ----------------------------
DROP TABLE IF EXISTS `preventive_maintainance`;
CREATE TABLE `preventive_maintainance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sage_item_id` int(11) NOT NULL,
  `maintainance_date` date NOT NULL,
  `assigned_id` int(11) NOT NULL,
  `excalation_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `performed_by` int(11) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of preventive_maintainance
-- ----------------------------
INSERT INTO `preventive_maintainance` VALUES (3, 247, '2018-04-26', 91, 1, 1, 91, '2018-04-25 23:35:34', '2018-04-26 02:14:15', 1);
INSERT INTO `preventive_maintainance` VALUES (4, 247, '2018-04-27', 91, 1, 1, 91, '2018-04-25 23:37:42', '2018-04-26 02:46:58', 0);
INSERT INTO `preventive_maintainance` VALUES (5, 247, '2018-04-27', 93, 1, 0, 0, '2018-04-25 23:37:42', '2018-04-26 00:06:35', 0);

SET FOREIGN_KEY_CHECKS = 1;

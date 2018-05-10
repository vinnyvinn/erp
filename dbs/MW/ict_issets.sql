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

 Date: 10/05/2018 11:17:50
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
  `assigned_to` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sage_id`(`sage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 373 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

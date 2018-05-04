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

 Date: 03/05/2018 16:54:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ict_issets
-- ----------------------------
DROP TABLE IF EXISTS `ict_issets`;
CREATE TABLE `ict_issets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sage_id` int(11) NOT NULL,
  `sage_dept` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sage_id`(`sage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 512 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ict_issets
-- ----------------------------
INSERT INTO `ict_issets` VALUES (342, 247, 0, 85, 0);
INSERT INTO `ict_issets` VALUES (343, 248, 0, 85, 0);
INSERT INTO `ict_issets` VALUES (344, 249, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (345, 250, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (346, 251, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (347, 252, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (348, 253, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (349, 254, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (350, 255, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (351, 256, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (352, 257, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (353, 258, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (354, 259, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (355, 260, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (356, 261, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (357, 262, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (358, 263, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (359, 264, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (360, 265, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (361, 266, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (362, 267, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (363, 268, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (364, 269, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (365, 270, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (366, 271, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (367, 272, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (368, 273, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (369, 274, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (370, 275, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (371, 276, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (372, 277, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (373, 278, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (374, 279, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (375, 280, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (376, 281, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (377, 282, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (378, 283, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (379, 284, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (380, 285, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (381, 286, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (382, 287, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (383, 288, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (384, 289, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (385, 290, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (386, 291, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (387, 292, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (388, 293, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (389, 294, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (390, 295, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (391, 296, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (392, 297, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (393, 299, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (394, 300, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (395, 301, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (396, 302, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (397, 303, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (398, 304, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (399, 305, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (400, 306, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (401, 307, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (402, 308, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (403, 309, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (404, 310, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (405, 311, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (406, 312, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (407, 313, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (408, 314, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (409, 315, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (410, 316, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (411, 317, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (412, 318, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (413, 319, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (414, 320, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (415, 321, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (416, 322, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (417, 323, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (418, 324, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (419, 325, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (420, 326, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (421, 327, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (422, 328, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (423, 329, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (424, 330, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (425, 331, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (426, 332, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (427, 333, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (428, 334, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (429, 335, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (430, 336, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (431, 337, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (432, 338, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (433, 339, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (434, 340, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (435, 341, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (436, 342, 0, 5, 0);
INSERT INTO `ict_issets` VALUES (437, 343, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (438, 344, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (439, 345, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (440, 346, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (441, 347, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (442, 348, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (443, 349, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (444, 350, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (445, 351, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (446, 352, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (447, 353, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (448, 354, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (449, 355, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (450, 356, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (451, 357, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (452, 358, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (453, 359, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (454, 360, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (455, 361, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (456, 362, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (457, 363, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (458, 364, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (459, 365, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (460, 366, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (461, 367, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (462, 368, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (463, 369, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (464, 370, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (465, 371, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (466, 372, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (467, 373, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (468, 374, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (469, 375, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (470, 376, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (471, 377, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (472, 378, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (473, 379, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (474, 380, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (475, 381, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (476, 382, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (477, 383, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (478, 384, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (479, 385, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (480, 386, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (481, 387, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (482, 388, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (483, 389, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (484, 390, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (485, 391, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (486, 392, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (487, 393, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (488, 394, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (489, 396, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (490, 397, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (491, 398, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (492, 399, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (493, 402, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (494, 404, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (495, 405, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (496, 406, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (497, 407, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (498, 408, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (499, 409, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (500, 410, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (501, 411, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (502, 412, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (503, 413, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (504, 414, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (505, 415, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (506, 416, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (507, 417, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (508, 418, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (509, 419, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (510, 420, 0, 0, 0);
INSERT INTO `ict_issets` VALUES (511, 421, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;

/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : myztreedemo

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-05-25 13:00:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `treenode`
-- ----------------------------
DROP TABLE IF EXISTS `treenode`;
CREATE TABLE `treenode` (
  `NAME` varchar(50) DEFAULT NULL,
  `PID` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPEN` int(11) DEFAULT NULL,
  `ISPARENT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of treenode
-- ----------------------------
INSERT INTO `treenode` VALUES ('父节点1', '0', '1', '1', '1');
INSERT INTO `treenode` VALUES ('叶子节点-1-1', '1', '2', '1', '1');
INSERT INTO `treenode` VALUES ('叶子节点-1-2', '1', '3', '0', '1');
INSERT INTO `treenode` VALUES ('叶子节点-1-3', '1', '4', '1', '1');
INSERT INTO `treenode` VALUES ('叶子节点-1-1-1', '2', '5', '0', null);
INSERT INTO `treenode` VALUES ('叶子节点-1-1-2', '2', '6', '0', null);
INSERT INTO `treenode` VALUES ('叶子节点-1-2-1', '3', '7', '1', null);
INSERT INTO `treenode` VALUES ('叶子节点-1-2-2', '3', '8', '1', null);
INSERT INTO `treenode` VALUES ('叶子节点-1-3-1', '4', '9', null, null);
INSERT INTO `treenode` VALUES ('叶子节点-1-3-2', '4', '10', null, null);
INSERT INTO `treenode` VALUES ('父节点2', '0', '11', '0', '1');
INSERT INTO `treenode` VALUES ('叶子节点-2-1', '11', '12', '0', '1');
INSERT INTO `treenode` VALUES ('叶子节点-2-1-1', '12', '13', null, null);

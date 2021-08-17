/*
 Navicat Premium Data Transfer

 Source Server         : db_con
 Source Server Type    : MySQL
 Source Server Version : 50558
 Source Host           : localhost:3306
 Source Schema         : salesapp

 Target Server Type    : MySQL
 Target Server Version : 50558
 File Encoding         : 65001

 Date: 17/08/2021 08:59:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities`  (
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `authority` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  UNIQUE INDEX `ix_auth_username`(`username`, `authority`) USING BTREE,
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO `authorities` VALUES ('user1', 'ROLE_USER');
INSERT INTO `authorities` VALUES ('user2', 'ROLE_USER');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `brandid` int(11) NOT NULL AUTO_INCREMENT,
  `brandname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`brandid`) USING BTREE,
  UNIQUE INDEX `brandname`(`brandname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (2, 'Motorola');
INSERT INTO `brands` VALUES (3, 'Samsung');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lastname` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contactno` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `emailid` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customerid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (17, 'dgsdg', 'GOUSE JOHN', 'Male', '9963695064', 'GOUSEJAN@GMAIL.COM', 'KAVALI');
INSERT INTO `customers` VALUES (18, 'dfhdf', 'gjg', 'Female', '9502547907', 'fhdh', '7 16 10');

-- ----------------------------
-- Table structure for mobileproducts
-- ----------------------------
DROP TABLE IF EXISTS `mobileproducts`;
CREATE TABLE `mobileproducts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `itemcode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `barcode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `image` blob NULL,
  `colour` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `brandid` int(11) NULL DEFAULT NULL,
  `modelid` int(11) NULL DEFAULT NULL,
  `varid` int(11) NULL DEFAULT NULL,
  `imeino` int(11) NULL DEFAULT NULL,
  `issold` bit(1) NULL DEFAULT NULL,
  `companyoffer` bit(1) NULL DEFAULT NULL,
  `purchasedate` datetime NULL DEFAULT NULL,
  `sgst` int(11) NULL DEFAULT NULL,
  `cgst` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dealerprice` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `itemcode`(`itemcode`) USING BTREE,
  UNIQUE INDEX `barcode`(`barcode`) USING BTREE,
  INDEX `brandid`(`brandid`) USING BTREE,
  INDEX `modelid`(`modelid`) USING BTREE,
  INDEX `varid`(`varid`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `mobileproducts_ibfk_1` FOREIGN KEY (`brandid`) REFERENCES `brands` (`brandid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mobileproducts_ibfk_2` FOREIGN KEY (`modelid`) REFERENCES `phonemodels` (`modelid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mobileproducts_ibfk_3` FOREIGN KEY (`varid`) REFERENCES `variants` (`varid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mobileproducts
-- ----------------------------

-- ----------------------------
-- Table structure for mpurchaseorders
-- ----------------------------
DROP TABLE IF EXISTS `mpurchaseorders`;
CREATE TABLE `mpurchaseorders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceno` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `invoicedate` datetime NULL DEFAULT NULL,
  `totalquantity` int(11) NULL DEFAULT NULL,
  `supplierid` int(11) NULL DEFAULT NULL,
  `sgst` decimal(10, 2) NULL DEFAULT NULL,
  `cgst` decimal(10, 2) NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT NULL,
  `totalamount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `supplierid`(`supplierid`) USING BTREE,
  CONSTRAINT `mpurchaseorders_ibfk_1` FOREIGN KEY (`supplierid`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mpurchaseorders
-- ----------------------------

-- ----------------------------
-- Table structure for mpurorderdetails
-- ----------------------------
DROP TABLE IF EXISTS `mpurorderdetails`;
CREATE TABLE `mpurorderdetails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseid` int(11) NULL DEFAULT NULL,
  `productid` int(11) NULL DEFAULT NULL,
  `purchasedate` datetime NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `amount` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchaseid`(`purchaseid`) USING BTREE,
  INDEX `productid`(`productid`) USING BTREE,
  CONSTRAINT `mpurorderdetails_ibfk_1` FOREIGN KEY (`purchaseid`) REFERENCES `mpurchaseorders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mpurorderdetails_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `mobileproducts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mpurorderdetails
-- ----------------------------

-- ----------------------------
-- Table structure for phonemodels
-- ----------------------------
DROP TABLE IF EXISTS `phonemodels`;
CREATE TABLE `phonemodels`  (
  `modelid` int(11) NOT NULL AUTO_INCREMENT,
  `brandid` int(11) NULL DEFAULT NULL,
  `modelname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`modelid`) USING BTREE,
  INDEX `brandid`(`brandid`, `modelname`) USING BTREE,
  CONSTRAINT `phonemodels_ibfk_1` FOREIGN KEY (`brandid`) REFERENCES `brands` (`brandid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of phonemodels
-- ----------------------------
INSERT INTO `phonemodels` VALUES (19, 2, 'MOTO G5');
INSERT INTO `phonemodels` VALUES (4, 3, 'Samsung J5');

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `contactno` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES (1, 'flipkart', '9855654456', 'online shop');
INSERT INTO `suppliers` VALUES (2, 'amazon', '9855654456', 'online shop');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', '$2a$10$qb.tGqcwvoNyKSXN.nJ1Z.RHa8fcdhwKn4KxE3GzSodrzof6YPqBi', 1);
INSERT INTO `users` VALUES ('user1', '$2a$10$ikktSGIeJv.KkyjavqhVTusHK7JKu4fsZwJPDR.v.Wrh8yqYgcy0C', 1);
INSERT INTO `users` VALUES ('user2', '$2a$10$I4.ybaEZbWuU67meS1JYB.1OHeGQ9QrpYWiONAJ66u0bglSKdyani', 1);

-- ----------------------------
-- Table structure for variants
-- ----------------------------
DROP TABLE IF EXISTS `variants`;
CREATE TABLE `variants`  (
  `varid` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(11) NULL DEFAULT NULL,
  `ram` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `storage` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`varid`) USING BTREE,
  UNIQUE INDEX `modelid`(`modelid`, `ram`, `storage`) USING BTREE,
  CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`modelid`) REFERENCES `phonemodels` (`modelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of variants
-- ----------------------------
INSERT INTO `variants` VALUES (14, 4, '1 GB', '8 GB');

SET FOREIGN_KEY_CHECKS = 1;

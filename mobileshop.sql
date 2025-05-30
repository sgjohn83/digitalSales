/*
 Navicat Premium Data Transfer

 Source Server         : sg
 Source Server Type    : MySQL
 Source Server Version : 50541
 Source Host           : localhost:3306
 Source Schema         : mobileshop

 Target Server Type    : MySQL
 Target Server Version : 50541
 File Encoding         : 65001

 Date: 31/05/2025 00:42:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`brand_id`) USING BTREE,
  UNIQUE INDEX `brand_name`(`brand_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mobile_no` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_type` enum('Sales','Purchase') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `reference_id` int(11) NULL DEFAULT NULL,
  `amount` decimal(12, 2) NULL DEFAULT NULL,
  `payment_mode` enum('Cash','Card','UPI','Finance') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `payment_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ram` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `storage` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `product_type` enum('GST','NON_GST') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'GST',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `brand_id`(`brand_id`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for productstock
-- ----------------------------
DROP TABLE IF EXISTS `productstock`;
CREATE TABLE `productstock`  (
  `imei_no` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `selling_price` decimal(10, 2) NULL DEFAULT NULL,
  `status` enum('In Stock','Sold') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'In Stock',
  `quantity` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`imei_no`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `purchase_id`(`purchase_id`) USING BTREE,
  CONSTRAINT `productstock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `productstock_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase`  (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(12, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`purchase_id`) USING BTREE,
  UNIQUE INDEX `invoice_no`(`invoice_no`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for purchaseitem
-- ----------------------------
DROP TABLE IF EXISTS `purchaseitem`;
CREATE TABLE `purchaseitem`  (
  `purchase_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `imei_no` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unit_price` decimal(10, 2) NULL DEFAULT NULL,
  `discount` decimal(10, 2) NULL DEFAULT 0.00,
  `cgst` decimal(10, 2) NULL DEFAULT NULL,
  `sgst` decimal(10, 2) NULL DEFAULT NULL,
  `rate` decimal(10, 2) NULL DEFAULT NULL,
  `amount` decimal(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`purchase_item_id`) USING BTREE,
  INDEX `purchase_id`(`purchase_id`) USING BTREE,
  INDEX `imei_no`(`imei_no`) USING BTREE,
  CONSTRAINT `purchaseitem_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`purchase_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `purchaseitem_ibfk_2` FOREIGN KEY (`imei_no`) REFERENCES `productstock` (`imei_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` enum('Cash','Card','UPI','Finance') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Cash',
  `is_financed` tinyint(1) NULL DEFAULT 0,
  `down_payment` decimal(10, 2) NULL DEFAULT 0.00,
  `total_amount` decimal(12, 2) NOT NULL,
  PRIMARY KEY (`sales_id`) USING BTREE,
  UNIQUE INDEX `invoice_no`(`invoice_no`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for salesitem
-- ----------------------------
DROP TABLE IF EXISTS `salesitem`;
CREATE TABLE `salesitem`  (
  `sales_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `imei_no` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `unit_price` decimal(10, 2) NOT NULL,
  `cgst` decimal(10, 2) NULL DEFAULT 0.00,
  `sgst` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`sales_item_id`) USING BTREE,
  UNIQUE INDEX `imei_no`(`imei_no`) USING BTREE,
  INDEX `sales_id`(`sales_id`) USING BTREE,
  CONSTRAINT `salesitem_ibfk_1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`sales_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `salesitem_ibfk_2` FOREIGN KEY (`imei_no`) REFERENCES `productstock` (`imei_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mobile_no` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `role` enum('Admin','Employee') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'Employee',
  `created_at` datetime NULL DEFAULT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

SET FOREIGN_KEY_CHECKS = 1;

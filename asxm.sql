/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : asxm

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 16/06/2025 00:06:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cusorders
-- ----------------------------
DROP TABLE IF EXISTS `cusorders`;
CREATE TABLE `cusorders`  (
  `ORDERID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `CUSID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ORDERTIME` int NULL DEFAULT NULL,
  `ORDERSTATE` int NULL DEFAULT NULL COMMENT '0--临时\r\n            1--下单\r\n            2--正在处理\r\n            3--处理完成',
  `ORDERTOTLEPRICE` decimal(10, 2) NULL DEFAULT NULL,
  `ORDERNUM` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CREATETIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ORDERNUM`) USING BTREE,
  INDEX `FK_Relationship_5`(`CUSID` ASC) USING BTREE,
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`CUSID`) REFERENCES `customer` (`CUSID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cusorders
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `CUSID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `OPENID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `NICKNAME` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`CUSID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('57e9e0b3-f49e-44b1-bd00-aa03e45d7db8', 'oz6td7EtgvtkmPBySEQtze2oFvgE', '微信用户');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `GID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `GTID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `GNAME` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `GPRICE` decimal(10, 2) NULL DEFAULT NULL,
  `GSTATE` int NULL DEFAULT NULL,
  `GCONTENT` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `GIMG` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `GTIME` int NULL DEFAULT NULL COMMENT '需要时间（单位：分钟）',
  `GCOUNT` int NULL DEFAULT 0,
  `GINFO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`GID`) USING BTREE,
  INDEX `FK_Relationship_4`(`GTID` ASC) USING BTREE,
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`GTID`) REFERENCES `goodstype` (`GTID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('01695c6b-f5b9-43cd-9f30-ae2a5cf9aa1c', '4', '鸡杂酸辣粉', 13.00, 1, '周一至周日  8：00-22：00', 'CFO0ihTpEPvM328377f6644defe1207412c7061b5542.jpg', 5, 0, '可以一试！');
INSERT INTO `goods` VALUES ('134e4353-6a1e-44f8-ab70-9059134dedeb', '1', '辣子鸡拌面', 12.00, 1, '周一至周日  8：00-22：00', 'sTFaT0tcf72kfd4a0e7618daac0b85b2c80702cbe94b.jpg', 5, 0, '鸡都被辣到烫屁股');
INSERT INTO `goods` VALUES ('1469fc57-cb3f-42fe-a520-21e45ed7363a', '1', '红烧肥肠面/米线', 15.00, 1, '周一至周日  8：00-22：00', 'FiPqQaeWxDEe1ae322f4e659c9733fc7d362cbe53752.jpg', 5, 0, '本店特色');
INSERT INTO `goods` VALUES ('16a9d1ed-4f62-4fb0-a9e4-aa5485a8226d', '1', '酸菜牛肉面/米线', 16.00, 1, '周一至周日  8：00-22：00', '5G29DmotQUoEedc8a7cc94c044388feb394f93019f8f.jpg', 5, 0, '喷香！！!');
INSERT INTO `goods` VALUES ('1a9cdfcb-d9b6-45e2-bad5-66c9e1a05fdf', '3', '干拌红油抄手', 12.00, 1, '周一至周日  8：00-22：00', 'lLQ3V8VxsbQAf4450991a696e6105e9803c0b32df4d9.jpg', 5, 0, '够味够辣！');
INSERT INTO `goods` VALUES ('2308a3f7-65fc-4e2b-89cf-9d59c01a6a4d', '4', '老成都酸辣粉', 10.00, 1, '周一至周日  8：00-22：00', 'zTvuEIn1A2MLa7989073555c7c577fa7e7fe4be8ec69.jpg', 5, 0, '正宗酸辣粉');
INSERT INTO `goods` VALUES ('2906a4ee-4069-4702-a4a4-724be23ad022', '3', '番茄浓汤抄手', 12.00, 1, '周一至周日  8：00-22：00', 'wupTg0jH6CEHeada9e8ae9045bfb17f3e8c473d8d04e.jpg', 5, 0, '浓浓的番茄汤~');
INSERT INTO `goods` VALUES ('2e7b1746-c562-4ba9-8da3-2a708f9fe3a6', '1', '泡椒鸡杂面/米线', 12.00, 1, '周一至周日  8：00-22：00', 'ohakzMOV8QEb8331e2e5197e62d735ab833958e7393f.jpg', 5, 0, '泡椒味又酸！又辣！又爽！');
INSERT INTO `goods` VALUES ('3018da52-6fa4-4ad8-8412-98333a1bc1f4', '2', '宜宾浑燃面', 11.00, 1, '周一至周日  8：00-22：00', '11.jpg', 5, 0, '好吃不贵');
INSERT INTO `goods` VALUES ('34601c92-bd8b-419d-91e1-abd2b0500a19', '2', '土豆泥肉酱拌面', 13.00, 1, '周一至周日  8：00-22：00', 'EAD5C9wrosVp5a2a8fb97871ba8b7968c88a105d5d66.jpg', 5, 0, '加上肉酱更好吃！');
INSERT INTO `goods` VALUES ('3906b05c-f0cc-464d-9ead-7dd290b21522', '1', '酸菜肥肠面/米线', 16.00, 1, '周一至周日  8：00-22：00', 'Bm3Nd5gc5WA2853dec47d47716a0e8bb524b412de8b6.jpg', 5, 0, '本店特色，喷香！');
INSERT INTO `goods` VALUES ('4b9363b7-a4f8-4329-8024-b53386cf4ddc', '3', '骨汤抄手', 10.00, 1, '周一至周日  8：00-22：00', '17.jpg', 4, 0, '这是一份儿非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非');
INSERT INTO `goods` VALUES ('5779ec14-645f-4737-bcd7-a91d3247f657', '3', '鸡汤抄手', 10.00, 1, '周一至周日  8：00-22：00', '77cZUNccfww126fcfc627f8c5ba638c7ad4685d24544.jpg', 5, 0, '特色美食');
INSERT INTO `goods` VALUES ('58d9a28f-8746-492b-9f25-bcbe440ed636', '2', '芽菜肉酱拌面', 12.00, 1, '周一至周日  8：00-22：00', '12.jpg', 10, 0, '这是一份儿非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非');
INSERT INTO `goods` VALUES ('82cb2db1-fd7e-48ed-89f5-24813da9dca6', '4', '大勺肉酱酸辣粉', 13.00, 1, '周一至周日  8：00-22：00', '2.jpg', 5, 0, '这是一份儿非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常好');
INSERT INTO `goods` VALUES ('89e8ec77-8820-48c1-9d4e-f001f093ff93', '4', '肥肠酸辣粉', 15.00, 1, '周一至周日  8：00-22：00', '24.jpg', 4, 0, '这是川渝经典，头牌之一');
INSERT INTO `goods` VALUES ('8b2a1f20-6dba-48ea-9846-9aecca498578', '5', '酸梅汤', 3.00, 1, '周一至周日  8：00-22：00', 'LFU7Nf9eVuNI2d837db1a39ec3684c84ad744284f717.jpg', 5, 0, '冰冰凉凉，夏日解渴');
INSERT INTO `goods` VALUES ('90c8eaef-5b4d-4205-8c3f-7848e8b71a34', '2', '干馏麻辣小面', 8.00, 1, '周一至周日  8：00-22：00', '9fXboRWBfni805aaaa83661423ecc121e9cf7d456494.jpg', 5, 0, '实惠便宜');
INSERT INTO `goods` VALUES ('a4c3915a-c16f-42d5-a336-a0f976034500', '5', '红糖冰粉', 3.00, 1, '周一至周日  8：00-22：00', 'q1GlzEqZK9ut4706f70c7787564c886a000f7b9f8985.jpg', 5, 0, '消暑必吃！');
INSERT INTO `goods` VALUES ('bb44df61-3029-4b6c-abf4-878630383dca', '1', '泡椒郡花面/米线', 13.00, 1, '周一至周日  8：00-22：00', 'Bm3Nd5gc5WA2853dec47d47716a0e8bb524b412de8b6.jpg', 5, 0, '独特郡花味，让你吃完还想再来一碗');
INSERT INTO `goods` VALUES ('bb775b95-5ed2-4832-a940-61dff5534eda', '2', '菌菇卤肉拌面', 12.00, 1, '周一至周日  8：00-22：00', 'j1DqfYpEY5za0fad8da30e6e2d17552bc891eaba11da.jpg', 5, 0, '姑加肉，永不孤独~');
INSERT INTO `goods` VALUES ('bdc3e476-7309-429d-a4c0-fa80da4337bb', '1', '酸菜肉丝面/米线', 13.00, 1, '周一至周日  8：00-22：00', 'aU6b0sl5idDxd90c718e199dd12ea490868bc7c3d7bb.jpg', 5, 0, '肉肉只多不少');
INSERT INTO `goods` VALUES ('c0ffd01a-ec40-4b26-86be-67efc8183106', '2', '土豆泥拌面', 11.00, 1, '周一至周日  8：00-22：00', '6iIG4EZSstst1b4491b94ffb43b9c65a098b57b3fccc.jpg', 5, 0, '特别美味，土豆的咸香！');
INSERT INTO `goods` VALUES ('c7409919-1b55-4345-ad19-3f94c11f65cd', '1', '麻辣小面', 8.00, 1, '周一至周日  8：00-22：00', 'uqhEwgtuY6EE5b3c45a2c0489296670ffb37ad6742ff.jpg', 5, 0, '实惠便宜');
INSERT INTO `goods` VALUES ('d5646197-83c5-459e-85f9-f69e4207e52a', '3', '老麻抄手', 12.00, 1, '周一至周日  8：00-22：00', '18.jpg', 5, 0, '这是一份儿非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非');
INSERT INTO `goods` VALUES ('e658b7c7-25eb-482b-b848-25b62b3e2a74', '2', '杂酱面', 11.00, 1, '周一至周日  8：00-22：00', 'dwzmvtcRY70pc0cfa21408f086aca53442f9469257ad.jpg', 5, 0, '正宗杂酱面');
INSERT INTO `goods` VALUES ('efb24c91-bcfd-4d8d-81a8-087d25fa2b9f', '1', '豌杂面', 15.00, 1, '周一至周日  8：00-22：00', 'nnzVS9TGHWJY881ba2185f43ebfd25c9bbe80d20a08b.jpg', 5, 0, '本店首选头牌，不仅味道出众，还回味无穷');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `GTID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `GTNAME` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `GTSTATE` int NULL DEFAULT NULL,
  PRIMARY KEY (`GTID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', '汤面类', 1);
INSERT INTO `goodstype` VALUES ('2', '干拌面类', 1);
INSERT INTO `goodstype` VALUES ('3', '抄手类', 1);
INSERT INTO `goodstype` VALUES ('4', '酸辣粉类', 1);
INSERT INTO `goodstype` VALUES ('5', '饮品类', 1);

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `GID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ORDERID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `GNAME` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `GCOUNT` decimal(10, 2) NULL DEFAULT NULL,
  `GPRICE` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `GTIME` int NULL DEFAULT NULL,
  INDEX `FK_Relationship_6`(`ORDERID` ASC) USING BTREE,
  INDEX `FK_Relationship_7`(`GID` ASC) USING BTREE,
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`GID`) REFERENCES `goods` (`GID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('1469fc57-cb3f-42fe-a520-21e45ed7363a', 'c910c800-48eb-11f0-b67b-e99bc389e0e3', '红烧肥肠面/米线', 1.00, '15', 5);
INSERT INTO `orderdetail` VALUES ('1469fc57-cb3f-42fe-a520-21e45ed7363a', '2c2132c0-49ca-11f0-aa4c-f7d39bc793b1', '红烧肥肠面/米线', 3.00, '15', 5);
INSERT INTO `orderdetail` VALUES ('134e4353-6a1e-44f8-ab70-9059134dedeb', 'cecd0610-49d5-11f0-95c5-2d7807140c0c', '辣子鸡拌面', 2.00, '12', 5);
INSERT INTO `orderdetail` VALUES ('134e4353-6a1e-44f8-ab70-9059134dedeb', '8b51add0-49f0-11f0-9024-055442b20d37', '辣子鸡拌面', 1.00, '12', 5);
INSERT INTO `orderdetail` VALUES ('c7409919-1b55-4345-ad19-3f94c11f65cd', 'b62e9ab0-49f8-11f0-bd93-41b3ba085777', '麻辣小面', 2.00, '8', 5);
INSERT INTO `orderdetail` VALUES ('bdc3e476-7309-429d-a4c0-fa80da4337bb', 'c5043630-49f8-11f0-bd93-41b3ba085777', '酸菜肉丝面/米线', 1.00, '13', 5);
INSERT INTO `orderdetail` VALUES ('c7409919-1b55-4345-ad19-3f94c11f65cd', 'c5043630-49f8-11f0-bd93-41b3ba085777', '麻辣小面', 2.00, '8', 5);
INSERT INTO `orderdetail` VALUES ('134e4353-6a1e-44f8-ab70-9059134dedeb', '465008e0-49f9-11f0-a506-99cf951a12c7', '辣子鸡拌面', 3.00, '12', 5);
INSERT INTO `orderdetail` VALUES ('134e4353-6a1e-44f8-ab70-9059134dedeb', '56c300b0-49f9-11f0-a506-99cf951a12c7', '辣子鸡拌面', 3.00, '12', 5);
INSERT INTO `orderdetail` VALUES ('c7409919-1b55-4345-ad19-3f94c11f65cd', '56c300b0-49f9-11f0-a506-99cf951a12c7', '麻辣小面', 1.00, '8', 5);
INSERT INTO `orderdetail` VALUES ('1469fc57-cb3f-42fe-a520-21e45ed7363a', '93f18a10-49f9-11f0-a506-99cf951a12c7', '红烧肥肠面/米线', 1.00, '15', 5);

-- ----------------------------
-- Table structure for overorder
-- ----------------------------
DROP TABLE IF EXISTS `overorder`;
CREATE TABLE `overorder`  (
  `ORDERID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `CUSID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `ORDERTIME` int NULL DEFAULT NULL,
  `ORDERSTATE` int NULL DEFAULT 3 COMMENT '0--临时\\\\\\\\r\\\\\\\\n            1--下单\\\\\\\\r\\\\\\\\n            2--正在处理\\\\\\\\r\\\\\\\\n            3--处理完成',
  `ORDERTOTLEPRICE` decimal(10, 2) NULL DEFAULT NULL,
  `ORDERNUM` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CREATETIME` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ORDERNUM`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of overorder
-- ----------------------------
INSERT INTO `overorder` VALUES ('ef137ef0-9887-11e9-9960-e90128ae1bef', 'ca1f0540-5659-4809-8708-0be47bf33f18', 110, 3, 220.00, 0000000003, '2025-06-17 23:05:13');
INSERT INTO `overorder` VALUES ('f855cbd0-9887-11e9-9960-e90128ae1bef', 'ca1f0540-5659-4809-8708-0be47bf33f18', 57, 3, 178.00, 0000000004, '2025-06-26 23:05:19');
INSERT INTO `overorder` VALUES ('0894df60-98a9-11e9-acc3-f7241ce36425', 'ca1f0540-5659-4809-8708-0be47bf33f18', 16, 3, 20.00, 0000000005, '2025-06-18 23:05:22');
INSERT INTO `overorder` VALUES ('12c6bc60-98a9-11e9-acc3-f7241ce36425', 'ca1f0540-5659-4809-8708-0be47bf33f18', 36, 3, 60.00, 0000000006, '2025-06-26 23:05:25');
INSERT INTO `overorder` VALUES ('ef7f8ec0-98a9-11e9-a2b1-cf87d44fe9f7', 'ca1f0540-5659-4809-8708-0be47bf33f18', 8, 3, 10.00, 0000000007, '2025-06-04 23:05:29');
INSERT INTO `overorder` VALUES ('0ca880f0-98ab-11e9-bbf5-5be13d8682cd', 'ca1f0540-5659-4809-8708-0be47bf33f18', 26, 3, 186.00, 0000000008, '2025-08-20 23:05:33');
INSERT INTO `overorder` VALUES ('1af52bb0-477b-11f0-8ac3-27098d49ccce', 'ce897359-9129-4fb3-b530-ace4fc0836fa', 44, 3, 55.00, 0000000009, '2025-06-11 23:05:37');
INSERT INTO `overorder` VALUES ('c910c800-48eb-11f0-b67b-e99bc389e0e3', 'ce897359-9129-4fb3-b530-ace4fc0836fa', 5, 3, 15.00, 0000000010, '2025-06-12 23:05:43');
INSERT INTO `overorder` VALUES ('465008e0-49f9-11f0-a506-99cf951a12c7', '57e9e0b3-f49e-44b1-bd00-aa03e45d7db8', 15, 3, 36.00, 0000000011, '2025-06-13 23:05:46');
INSERT INTO `overorder` VALUES ('56c300b0-49f9-11f0-a506-99cf951a12c7', '57e9e0b3-f49e-44b1-bd00-aa03e45d7db8', 20, 3, 44.00, 0000000012, '2025-06-11 23:05:49');
INSERT INTO `overorder` VALUES ('93f18a10-49f9-11f0-a506-99cf951a12c7', '57e9e0b3-f49e-44b1-bd00-aa03e45d7db8', 5, 3, 15.00, 0000000013, '2025-06-15 15:01:12');

-- ----------------------------
-- Table structure for syscus
-- ----------------------------
DROP TABLE IF EXISTS `syscus`;
CREATE TABLE `syscus`  (
  `CUSID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `NICKNAME` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `LIMITS` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`CUSID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of syscus
-- ----------------------------
INSERT INTO `syscus` VALUES ('57e9e0b3-f49e-44b1-bd00-aa03e45d7db8', '吃货', 'true');

SET FOREIGN_KEY_CHECKS = 1;

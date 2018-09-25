/*
Navicat MySQL Data Transfer

Source Server         : 默认链接
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : erp02

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-09-21 10:35:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('1', '小张超市', '111', '武汉', '027-9123131', '张大明', '13812312312321312', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('2', '小明超市', '222', '深圳', '0755-9123131', '张小明', '13812312312321312', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('3', '快七超市', '430000', '武汉', '027-11011011', '雷生', '13434134131', '招商银行', '6543123341334133', '6666@66.com', '545341', '1');
INSERT INTO `bus_customer` VALUES ('7', '小小的小小', '123488', '武汉大楼2栋3单元', '123456789', '小小', '161364641', '武汉银行', '123648486531153', '86789', '123453153', null);

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) DEFAULT NULL,
  `produceplace` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `goodspackage` varchar(255) DEFAULT NULL,
  `productcode` varchar(255) DEFAULT NULL,
  `promitcode` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sq0btr2v2lq8gt8b4gb8tlk0i` (`providerid`),
  CONSTRAINT `FK_sq0btr2v2lq8gt8b4gb8tlk0i` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES ('1', '娃哈哈', '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', '2', '400', '10', 'resources/images/userface1.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('2', '旺旺雪饼[小包]', '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', '4', '1100', '10', 'resources/images/userface2.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('3', '旺旺大礼包', '仙桃', '盒', '盒', '11', '11', '111', '28', '1000', '100', 'resources/images/userface3.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('4', '娃哈哈', '武汉', '200ML', '瓶', '11', '111', '12321', '3', '1050', '10', 'resources/images/userface4.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('5', '娃哈哈', '武汉', '300ML', '瓶', '1234', '12321', '', '3', '1000', '100', 'resources/images/userface5.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('9', '好丽友', '武汉', '115x55', '袋', '564dasd6434', '375344sas335', '五大', '453', '3900', '20', 'upload/2018-09-16/201809162150147856023.jpg', '1', '2');

-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) NOT NULL,
  `inporttime` datetime NOT NULL,
  `operateperson` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `inportprice` double NOT NULL,
  `providerid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1o4bujsyd2kl4iqw48fie224v` (`providerid`),
  KEY `FK_ho29poeu4o2dxu4rg1ammeaql` (`goodsid`),
  CONSTRAINT `FK_1o4bujsyd2kl4iqw48fie224v` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`),
  CONSTRAINT `FK_ho29poeu4o2dxu4rg1ammeaql` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------
INSERT INTO `bus_inport` VALUES ('1', '微信', '2018-05-07 13:00:00', '张三', '100', '备注', '3.5', '1', '1');
INSERT INTO `bus_inport` VALUES ('2', '支付宝', '2018-05-07 15:00:00', '张三', '1000', '无', '2.5', '3', '3');
INSERT INTO `bus_inport` VALUES ('3', '银联', '2018-05-07 16:20:00', '张三', '100', '1231', '111', '3', '3');
INSERT INTO `bus_inport` VALUES ('4', '银联', '2018-05-07 18:20:00', '张三', '1000', '无', '2', '3', '1');
INSERT INTO `bus_inport` VALUES ('5', '银联', '2018-05-07 16:30:00', '张三', '100', '无', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('6', '银联', '2018-05-07 15:40:00', '张三', '100', '1231', '2.5', '1', '2');
INSERT INTO `bus_inport` VALUES ('8', '支付宝', '2018-09-18 08:57:19', '超级管理员', '100', '无', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('10', '支付宝', '2018-08-07 17:17:57', '超级管理员', '100', 'sadfasfdsa', '1.5', '3', '1');
INSERT INTO `bus_inport` VALUES ('11', '微信', '2018-09-17 16:58:10', '超级管理员', '600', '好吃', '20', '2', '9');
INSERT INTO `bus_inport` VALUES ('12', '支付宝', '2018-09-17 16:39:24', '超级管理员', '50', '好喝', '5', '3', '4');
INSERT INTO `bus_inport` VALUES ('13', '支付宝', '2018-09-17 17:00:13', '超级管理员', '300', '好吃', '20', '2', '9');

-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) NOT NULL,
  `outporttime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `operateperson` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `providerid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------
INSERT INTO `bus_outport` VALUES ('1', '支付宝', '2018-09-05 17:18:00', '超级管理员', '200', '漏气', '2', '9');

-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `connectionperson` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES ('1', '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('2', '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('3', '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', '1');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT '0' COMMENT '1父节点  0 子节点',
  `remark` varchar(255) DEFAULT NULL,
  `loc` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码【为了调事显示顺序】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '总经办', '1', '1', '大BOSS', '深圳', '1', '1');
INSERT INTO `sys_dept` VALUES ('2', '1', '开发部', '1', '1', '程序员屌丝', '武汉', '1', '2');
INSERT INTO `sys_dept` VALUES ('3', '1', '运营部', '1', '1', '无', '武汉', '1', '3');
INSERT INTO `sys_dept` VALUES ('4', '1', '市场部', '1', '1', '无', '武汉', '1', '4');
INSERT INTO `sys_dept` VALUES ('5', '2', '开发一部', '1', '0', '主管JAVA开发', '武汉', '1', '5');
INSERT INTO `sys_dept` VALUES ('6', '2', '开发二部', '1', '0', '主管.NET开发', '武汉', '1', '6');
INSERT INTO `sys_dept` VALUES ('7', '3', '运营一部', '1', '0', '商城项目的运营', '武汉', '1', '7');
INSERT INTO `sys_dept` VALUES ('8', '2', '开发三部', '1', '0', '111', '11', '1', '50');
INSERT INTO `sys_dept` VALUES ('9', '2', '开发四部', '1', '0', '222', '222', '1', '51');
INSERT INTO `sys_dept` VALUES ('10', '2', '开发五部', '1', '0', '333', '33', '1', '53');
INSERT INTO `sys_dept` VALUES ('22', '3', '运营二部', '0', '0', '上海郊区', '上海', '1', '23');

-- ----------------------------
-- Table structure for sys_leavebill
-- ----------------------------
DROP TABLE IF EXISTS `sys_leavebill`;
CREATE TABLE `sys_leavebill` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `days` double(255,0) DEFAULT NULL,
  `laevetime` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL COMMENT '1,新建  2，已提交   3，审批中  4，审批完成',
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_leavebill
-- ----------------------------
INSERT INTO `sys_leavebill` VALUES ('1', '请假', '回家', '5', '2018-08-13 14:12:43', '0', '5');

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `loginip` varchar(255) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=988 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES ('443', '超级管理员-system', '127.0.0.1', '2018-08-07 15:26:22');
INSERT INTO `sys_log_login` VALUES ('444', '超级管理员-system', '127.0.0.1', '2018-08-07 15:30:31');
INSERT INTO `sys_log_login` VALUES ('445', '超级管理员-system', '127.0.0.1', '2018-08-07 15:35:07');
INSERT INTO `sys_log_login` VALUES ('447', '超级管理员-system', '127.0.0.1', '2018-08-07 16:15:50');
INSERT INTO `sys_log_login` VALUES ('448', '超级管理员-system', '127.0.0.1', '2018-08-07 16:16:16');
INSERT INTO `sys_log_login` VALUES ('449', '超级管理员-system', '127.0.0.1', '2018-08-07 16:21:23');
INSERT INTO `sys_log_login` VALUES ('450', '超级管理员-system', '127.0.0.1', '2018-08-07 16:54:27');
INSERT INTO `sys_log_login` VALUES ('451', '超级管理员-system', '127.0.0.1', '2018-08-07 17:09:25');
INSERT INTO `sys_log_login` VALUES ('452', '超级管理员-system', '127.0.0.1', '2018-08-07 17:13:34');
INSERT INTO `sys_log_login` VALUES ('453', '超级管理员-system', '127.0.0.1', '2018-08-07 17:17:29');
INSERT INTO `sys_log_login` VALUES ('454', '超级管理员-system', '127.0.0.1', '2018-08-08 09:32:50');
INSERT INTO `sys_log_login` VALUES ('455', '超级管理员-system', '127.0.0.1', '2018-08-08 09:58:55');
INSERT INTO `sys_log_login` VALUES ('456', '超级管理员-system', '127.0.0.1', '2018-08-08 10:08:55');
INSERT INTO `sys_log_login` VALUES ('457', '超级管理员-system', '192.168.4.139', '2018-08-08 10:13:31');
INSERT INTO `sys_log_login` VALUES ('458', '超级管理员-system', '192.168.4.139', '2018-08-08 10:23:54');
INSERT INTO `sys_log_login` VALUES ('459', '超级管理员-system', '192.168.4.110', '2018-08-08 10:38:59');
INSERT INTO `sys_log_login` VALUES ('460', '超级管理员-system', '127.0.0.1', '2018-08-08 10:48:43');
INSERT INTO `sys_log_login` VALUES ('461', '超级管理员-system', '127.0.0.1', '2018-08-08 11:12:47');
INSERT INTO `sys_log_login` VALUES ('462', '超级管理员-system', '127.0.0.1', '2018-08-08 11:13:03');
INSERT INTO `sys_log_login` VALUES ('463', '超级管理员-system', '127.0.0.1', '2018-08-08 11:13:26');
INSERT INTO `sys_log_login` VALUES ('464', '超级管理员-system', '127.0.0.1', '2018-08-08 11:13:33');
INSERT INTO `sys_log_login` VALUES ('465', '超级管理员-system', '127.0.0.1', '2018-08-08 11:13:45');
INSERT INTO `sys_log_login` VALUES ('466', '超级管理员-system', '127.0.0.1', '2018-08-08 11:14:22');
INSERT INTO `sys_log_login` VALUES ('467', '超级管理员-system', '127.0.0.1', '2018-08-08 11:14:25');
INSERT INTO `sys_log_login` VALUES ('468', '超级管理员-system', '127.0.0.1', '2018-08-08 11:14:37');
INSERT INTO `sys_log_login` VALUES ('469', '超级管理员-system', '127.0.0.1', '2018-08-08 11:14:41');
INSERT INTO `sys_log_login` VALUES ('470', '超级管理员-system', '127.0.0.1', '2018-08-08 11:14:47');
INSERT INTO `sys_log_login` VALUES ('471', '超级管理员-system', '127.0.0.1', '2018-08-08 11:15:01');
INSERT INTO `sys_log_login` VALUES ('472', '超级管理员-system', '127.0.0.1', '2018-08-08 11:15:13');
INSERT INTO `sys_log_login` VALUES ('473', '超级管理员-system', '127.0.0.1', '2018-08-08 11:19:42');
INSERT INTO `sys_log_login` VALUES ('474', '超级管理员-system', '127.0.0.1', '2018-08-08 11:35:13');
INSERT INTO `sys_log_login` VALUES ('475', '超级管理员-system', '127.0.0.1', '2018-08-08 11:36:43');
INSERT INTO `sys_log_login` VALUES ('476', '超级管理员-system', '127.0.0.1', '2018-08-08 11:37:14');
INSERT INTO `sys_log_login` VALUES ('477', '超级管理员-system', '127.0.0.1', '2018-08-08 11:38:27');
INSERT INTO `sys_log_login` VALUES ('478', '超级管理员-system', '127.0.0.1', '2018-08-08 11:39:29');
INSERT INTO `sys_log_login` VALUES ('479', '超级管理员-system', '127.0.0.1', '2018-08-08 11:41:21');
INSERT INTO `sys_log_login` VALUES ('480', '超级管理员-system', '127.0.0.1', '2018-08-08 11:41:56');
INSERT INTO `sys_log_login` VALUES ('481', '超级管理员-system', '127.0.0.1', '2018-08-08 11:43:47');
INSERT INTO `sys_log_login` VALUES ('482', '超级管理员-system', '127.0.0.1', '2018-08-08 11:44:12');
INSERT INTO `sys_log_login` VALUES ('483', '超级管理员-system', '127.0.0.1', '2018-08-08 11:44:24');
INSERT INTO `sys_log_login` VALUES ('484', '超级管理员-system', '127.0.0.1', '2018-08-08 11:44:32');
INSERT INTO `sys_log_login` VALUES ('485', '超级管理员-system', '127.0.0.1', '2018-08-08 11:44:40');
INSERT INTO `sys_log_login` VALUES ('486', '超级管理员-system', '127.0.0.1', '2018-08-08 11:44:55');
INSERT INTO `sys_log_login` VALUES ('487', '超级管理员-system', '127.0.0.1', '2018-08-08 11:45:06');
INSERT INTO `sys_log_login` VALUES ('488', '超级管理员-system', '127.0.0.1', '2018-08-08 11:45:22');
INSERT INTO `sys_log_login` VALUES ('489', '超级管理员-system', '127.0.0.1', '2018-08-08 11:45:44');
INSERT INTO `sys_log_login` VALUES ('490', '超级管理员-system', '127.0.0.1', '2018-08-08 11:46:29');
INSERT INTO `sys_log_login` VALUES ('491', '超级管理员-system', '127.0.0.1', '2018-08-08 14:14:55');
INSERT INTO `sys_log_login` VALUES ('492', '超级管理员-system', '127.0.0.1', '2018-08-08 14:15:34');
INSERT INTO `sys_log_login` VALUES ('493', '超级管理员-system', '127.0.0.1', '2018-08-08 14:16:19');
INSERT INTO `sys_log_login` VALUES ('494', '超级管理员-system', '127.0.0.1', '2018-08-08 14:16:51');
INSERT INTO `sys_log_login` VALUES ('495', '超级管理员-system', '127.0.0.1', '2018-08-08 14:17:43');
INSERT INTO `sys_log_login` VALUES ('496', '超级管理员-system', '127.0.0.1', '2018-08-08 14:18:01');
INSERT INTO `sys_log_login` VALUES ('497', '超级管理员-system', '127.0.0.1', '2018-08-08 14:18:20');
INSERT INTO `sys_log_login` VALUES ('498', '超级管理员-system', '127.0.0.1', '2018-08-08 14:18:50');
INSERT INTO `sys_log_login` VALUES ('499', '超级管理员-system', '127.0.0.1', '2018-08-08 14:19:52');
INSERT INTO `sys_log_login` VALUES ('500', '超级管理员-system', '192.168.4.139', '2018-08-08 14:38:19');
INSERT INTO `sys_log_login` VALUES ('501', '超级管理员-system', '127.0.0.1', '2018-08-08 15:09:57');
INSERT INTO `sys_log_login` VALUES ('502', '超级管理员-system', '127.0.0.1', '2018-08-08 15:11:08');
INSERT INTO `sys_log_login` VALUES ('503', '超级管理员-system', '127.0.0.1', '2018-08-08 15:22:11');
INSERT INTO `sys_log_login` VALUES ('504', '超级管理员-system', '192.168.4.110', '2018-08-08 15:57:40');
INSERT INTO `sys_log_login` VALUES ('505', '超级管理员-system', '127.0.0.1', '2018-08-08 16:05:11');
INSERT INTO `sys_log_login` VALUES ('506', '超级管理员-system', '127.0.0.1', '2018-08-08 16:10:09');
INSERT INTO `sys_log_login` VALUES ('507', '超级管理员-system', '192.168.4.110', '2018-08-08 16:18:13');
INSERT INTO `sys_log_login` VALUES ('508', '超级管理员-system', '127.0.0.1', '2018-08-08 16:59:40');
INSERT INTO `sys_log_login` VALUES ('509', '超级管理员-system', '127.0.0.1', '2018-09-12 08:57:30');
INSERT INTO `sys_log_login` VALUES ('510', '超级管理员-system', '127.0.0.1', '2018-09-12 08:58:55');
INSERT INTO `sys_log_login` VALUES ('511', '超级管理员-system', '127.0.0.1', '2018-09-12 09:00:43');
INSERT INTO `sys_log_login` VALUES ('512', '超级管理员-system', '127.0.0.1', '2018-09-12 09:01:36');
INSERT INTO `sys_log_login` VALUES ('513', '超级管理员-system', '127.0.0.1', '2018-09-12 09:01:55');
INSERT INTO `sys_log_login` VALUES ('514', '超级管理员-system', '127.0.0.1', '2018-09-12 11:02:10');
INSERT INTO `sys_log_login` VALUES ('515', '超级管理员-system', '127.0.0.1', '2018-09-12 11:02:54');
INSERT INTO `sys_log_login` VALUES ('516', '超级管理员-system', '127.0.0.1', '2018-09-12 11:05:25');
INSERT INTO `sys_log_login` VALUES ('517', '超级管理员-system', '127.0.0.1', '2018-09-12 11:06:14');
INSERT INTO `sys_log_login` VALUES ('518', '超级管理员-system', '127.0.0.1', '2018-09-12 11:08:06');
INSERT INTO `sys_log_login` VALUES ('519', '超级管理员-system', '127.0.0.1', '2018-09-12 11:13:17');
INSERT INTO `sys_log_login` VALUES ('520', '超级管理员-system', '127.0.0.1', '2018-09-12 11:15:54');
INSERT INTO `sys_log_login` VALUES ('521', '超级管理员-system', '127.0.0.1', '2018-09-12 11:21:22');
INSERT INTO `sys_log_login` VALUES ('522', '超级管理员-system', '127.0.0.1', '2018-09-12 11:21:45');
INSERT INTO `sys_log_login` VALUES ('523', '超级管理员-system', '127.0.0.1', '2018-09-12 11:25:04');
INSERT INTO `sys_log_login` VALUES ('524', '超级管理员-system', '127.0.0.1', '2018-09-12 11:25:53');
INSERT INTO `sys_log_login` VALUES ('525', '超级管理员-system', '127.0.0.1', '2018-09-12 11:27:45');
INSERT INTO `sys_log_login` VALUES ('526', '超级管理员-system', '127.0.0.1', '2018-09-12 11:27:59');
INSERT INTO `sys_log_login` VALUES ('527', '超级管理员-system', '127.0.0.1', '2018-09-12 11:30:10');
INSERT INTO `sys_log_login` VALUES ('528', '超级管理员-system', '127.0.0.1', '2018-09-12 11:31:22');
INSERT INTO `sys_log_login` VALUES ('529', '超级管理员-system', '127.0.0.1', '2018-09-12 11:34:37');
INSERT INTO `sys_log_login` VALUES ('533', '超级管理员-system', '127.0.0.1', '2018-09-12 11:59:31');
INSERT INTO `sys_log_login` VALUES ('534', '超级管理员-system', '127.0.0.1', '2018-09-12 11:59:56');
INSERT INTO `sys_log_login` VALUES ('535', '超级管理员-system', '127.0.0.1', '2018-09-12 12:00:50');
INSERT INTO `sys_log_login` VALUES ('536', '超级管理员-system', '127.0.0.1', '2018-09-12 12:01:25');
INSERT INTO `sys_log_login` VALUES ('537', '超级管理员-system', '127.0.0.1', '2018-09-12 12:01:43');
INSERT INTO `sys_log_login` VALUES ('538', '超级管理员-system', '127.0.0.1', '2018-09-12 12:03:44');
INSERT INTO `sys_log_login` VALUES ('539', '超级管理员-system', '127.0.0.1', '2018-09-12 12:04:17');
INSERT INTO `sys_log_login` VALUES ('540', '超级管理员-system', '127.0.0.1', '2018-09-12 12:37:33');
INSERT INTO `sys_log_login` VALUES ('541', '超级管理员-system', '127.0.0.1', '2018-09-12 12:38:37');
INSERT INTO `sys_log_login` VALUES ('542', '超级管理员-system', '127.0.0.1', '2018-09-12 12:40:07');
INSERT INTO `sys_log_login` VALUES ('543', '超级管理员-system', '127.0.0.1', '2018-09-12 12:41:56');
INSERT INTO `sys_log_login` VALUES ('544', '超级管理员-system', '127.0.0.1', '2018-09-12 12:42:52');
INSERT INTO `sys_log_login` VALUES ('545', '超级管理员-system', '127.0.0.1', '2018-09-12 12:44:22');
INSERT INTO `sys_log_login` VALUES ('546', '超级管理员-system', '127.0.0.1', '2018-09-12 12:45:55');
INSERT INTO `sys_log_login` VALUES ('547', '超级管理员-system', '127.0.0.1', '2018-09-12 12:52:09');
INSERT INTO `sys_log_login` VALUES ('548', '超级管理员-system', '127.0.0.1', '2018-09-12 12:55:58');
INSERT INTO `sys_log_login` VALUES ('549', '超级管理员-system', '127.0.0.1', '2018-09-12 12:58:59');
INSERT INTO `sys_log_login` VALUES ('550', '超级管理员-system', '127.0.0.1', '2018-09-12 13:00:58');
INSERT INTO `sys_log_login` VALUES ('551', '超级管理员-system', '127.0.0.1', '2018-09-12 13:02:49');
INSERT INTO `sys_log_login` VALUES ('552', '超级管理员-system', '127.0.0.1', '2018-09-12 13:04:41');
INSERT INTO `sys_log_login` VALUES ('553', '超级管理员-system', '127.0.0.1', '2018-09-12 13:07:23');
INSERT INTO `sys_log_login` VALUES ('554', '超级管理员-system', '127.0.0.1', '2018-09-12 13:08:52');
INSERT INTO `sys_log_login` VALUES ('555', '超级管理员-system', '127.0.0.1', '2018-09-12 13:09:17');
INSERT INTO `sys_log_login` VALUES ('566', '超级管理员-system', '127.0.0.1', '2018-09-12 14:02:48');
INSERT INTO `sys_log_login` VALUES ('567', '超级管理员-system', '127.0.0.1', '2018-09-12 14:03:15');
INSERT INTO `sys_log_login` VALUES ('568', '超级管理员-system', '127.0.0.1', '2018-09-12 14:04:16');
INSERT INTO `sys_log_login` VALUES ('569', '超级管理员-system', '127.0.0.1', '2018-09-12 14:04:51');
INSERT INTO `sys_log_login` VALUES ('570', '超级管理员-system', '127.0.0.1', '2018-09-12 14:05:25');
INSERT INTO `sys_log_login` VALUES ('571', '超级管理员-system', '127.0.0.1', '2018-09-12 14:06:30');
INSERT INTO `sys_log_login` VALUES ('572', '超级管理员-system', '127.0.0.1', '2018-09-12 14:06:42');
INSERT INTO `sys_log_login` VALUES ('573', '超级管理员-system', '127.0.0.1', '2018-09-12 14:07:25');
INSERT INTO `sys_log_login` VALUES ('574', '超级管理员-system', '127.0.0.1', '2018-09-12 14:07:36');
INSERT INTO `sys_log_login` VALUES ('575', '超级管理员-system', '127.0.0.1', '2018-09-12 14:08:05');
INSERT INTO `sys_log_login` VALUES ('576', '超级管理员-system', '127.0.0.1', '2018-09-12 14:08:12');
INSERT INTO `sys_log_login` VALUES ('577', '超级管理员-system', '127.0.0.1', '2018-09-12 14:09:30');
INSERT INTO `sys_log_login` VALUES ('578', '超级管理员-system', '127.0.0.1', '2018-09-12 14:10:19');
INSERT INTO `sys_log_login` VALUES ('579', '超级管理员-system', '127.0.0.1', '2018-09-12 14:11:02');
INSERT INTO `sys_log_login` VALUES ('580', '超级管理员-system', '127.0.0.1', '2018-09-12 14:12:24');
INSERT INTO `sys_log_login` VALUES ('581', '超级管理员-system', '127.0.0.1', '2018-09-12 14:12:34');
INSERT INTO `sys_log_login` VALUES ('582', '超级管理员-system', '127.0.0.1', '2018-09-12 14:13:57');
INSERT INTO `sys_log_login` VALUES ('583', '超级管理员-system', '127.0.0.1', '2018-09-12 14:17:31');
INSERT INTO `sys_log_login` VALUES ('584', '超级管理员-system', '127.0.0.1', '2018-09-12 14:18:17');
INSERT INTO `sys_log_login` VALUES ('585', '超级管理员-system', '127.0.0.1', '2018-09-12 19:13:23');
INSERT INTO `sys_log_login` VALUES ('586', '超级管理员-system', '127.0.0.1', '2018-09-12 19:15:20');
INSERT INTO `sys_log_login` VALUES ('587', '超级管理员-system', '127.0.0.1', '2018-09-12 19:21:57');
INSERT INTO `sys_log_login` VALUES ('588', '超级管理员-system', '127.0.0.1', '2018-09-12 19:23:41');
INSERT INTO `sys_log_login` VALUES ('589', '超级管理员-system', '127.0.0.1', '2018-09-12 19:28:45');
INSERT INTO `sys_log_login` VALUES ('590', '超级管理员-system', '127.0.0.1', '2018-09-12 19:53:39');
INSERT INTO `sys_log_login` VALUES ('591', '超级管理员-system', '127.0.0.1', '2018-09-12 19:54:19');
INSERT INTO `sys_log_login` VALUES ('592', '超级管理员-system', '127.0.0.1', '2018-09-12 19:56:02');
INSERT INTO `sys_log_login` VALUES ('593', '超级管理员-system', '127.0.0.1', '2018-09-12 19:59:54');
INSERT INTO `sys_log_login` VALUES ('594', '超级管理员-system', '127.0.0.1', '2018-09-12 20:00:41');
INSERT INTO `sys_log_login` VALUES ('595', '超级管理员-system', '127.0.0.1', '2018-09-12 20:01:37');
INSERT INTO `sys_log_login` VALUES ('596', '超级管理员-system', '127.0.0.1', '2018-09-12 20:10:10');
INSERT INTO `sys_log_login` VALUES ('597', '超级管理员-system', '127.0.0.1', '2018-09-12 20:12:02');
INSERT INTO `sys_log_login` VALUES ('598', '超级管理员-system', '127.0.0.1', '2018-09-12 20:37:49');
INSERT INTO `sys_log_login` VALUES ('599', '超级管理员-system', '127.0.0.1', '2018-09-12 20:40:42');
INSERT INTO `sys_log_login` VALUES ('600', '超级管理员-system', '127.0.0.1', '2018-09-12 20:41:59');
INSERT INTO `sys_log_login` VALUES ('601', '超级管理员-system', '127.0.0.1', '2018-09-12 20:43:13');
INSERT INTO `sys_log_login` VALUES ('602', '超级管理员-system', '127.0.0.1', '2018-09-12 21:18:41');
INSERT INTO `sys_log_login` VALUES ('603', '超级管理员-system', '127.0.0.1', '2018-09-12 21:22:00');
INSERT INTO `sys_log_login` VALUES ('604', '超级管理员-system', '127.0.0.1', '2018-09-12 21:24:12');
INSERT INTO `sys_log_login` VALUES ('605', '超级管理员-system', '127.0.0.1', '2018-09-12 21:24:41');
INSERT INTO `sys_log_login` VALUES ('606', '超级管理员-system', '127.0.0.1', '2018-09-12 21:29:29');
INSERT INTO `sys_log_login` VALUES ('607', '超级管理员-system', '127.0.0.1', '2018-09-12 22:42:23');
INSERT INTO `sys_log_login` VALUES ('608', '超级管理员-system', '127.0.0.1', '2018-09-12 22:48:06');
INSERT INTO `sys_log_login` VALUES ('609', '超级管理员-system', '127.0.0.1', '2018-09-12 22:49:29');
INSERT INTO `sys_log_login` VALUES ('610', '超级管理员-system', '127.0.0.1', '2018-09-12 22:50:35');
INSERT INTO `sys_log_login` VALUES ('611', '超级管理员-system', '127.0.0.1', '2018-09-12 22:53:45');
INSERT INTO `sys_log_login` VALUES ('612', '超级管理员-system', '127.0.0.1', '2018-09-12 22:55:37');
INSERT INTO `sys_log_login` VALUES ('613', '超级管理员-system', '127.0.0.1', '2018-09-12 22:57:15');
INSERT INTO `sys_log_login` VALUES ('614', '超级管理员-system', '127.0.0.1', '2018-09-12 22:59:37');
INSERT INTO `sys_log_login` VALUES ('615', '超级管理员-system', '127.0.0.1', '2018-09-12 23:01:27');
INSERT INTO `sys_log_login` VALUES ('616', '超级管理员-system', '127.0.0.1', '2018-09-12 23:02:38');
INSERT INTO `sys_log_login` VALUES ('617', '超级管理员-system', '127.0.0.1', '2018-09-12 23:14:46');
INSERT INTO `sys_log_login` VALUES ('618', '超级管理员-system', '127.0.0.1', '2018-09-12 23:15:16');
INSERT INTO `sys_log_login` VALUES ('619', '超级管理员-system', '127.0.0.1', '2018-09-12 23:21:44');
INSERT INTO `sys_log_login` VALUES ('620', '超级管理员-system', '127.0.0.1', '2018-09-12 23:22:08');
INSERT INTO `sys_log_login` VALUES ('621', '超级管理员-system', '127.0.0.1', '2018-09-13 09:04:07');
INSERT INTO `sys_log_login` VALUES ('622', '超级管理员-system', '127.0.0.1', '2018-09-13 09:28:37');
INSERT INTO `sys_log_login` VALUES ('623', '超级管理员-system', '127.0.0.1', '2018-09-13 09:37:34');
INSERT INTO `sys_log_login` VALUES ('624', '超级管理员-system', '127.0.0.1', '2018-09-13 09:45:36');
INSERT INTO `sys_log_login` VALUES ('625', '超级管理员-system', '127.0.0.1', '2018-09-13 09:50:50');
INSERT INTO `sys_log_login` VALUES ('626', '超级管理员-system', '127.0.0.1', '2018-09-13 10:03:54');
INSERT INTO `sys_log_login` VALUES ('627', '超级管理员-system', '127.0.0.1', '2018-09-13 10:06:45');
INSERT INTO `sys_log_login` VALUES ('628', '超级管理员-system', '127.0.0.1', '2018-09-13 10:12:33');
INSERT INTO `sys_log_login` VALUES ('629', '超级管理员-system', '127.0.0.1', '2018-09-13 10:16:19');
INSERT INTO `sys_log_login` VALUES ('630', '超级管理员-system', '127.0.0.1', '2018-09-13 10:19:06');
INSERT INTO `sys_log_login` VALUES ('631', '超级管理员-system', '127.0.0.1', '2018-09-13 10:19:44');
INSERT INTO `sys_log_login` VALUES ('632', '超级管理员-system', '127.0.0.1', '2018-09-13 10:25:35');
INSERT INTO `sys_log_login` VALUES ('633', '超级管理员-system', '127.0.0.1', '2018-09-13 10:29:25');
INSERT INTO `sys_log_login` VALUES ('634', '超级管理员-system', '127.0.0.1', '2018-09-13 10:31:30');
INSERT INTO `sys_log_login` VALUES ('635', '超级管理员-system', '127.0.0.1', '2018-09-13 10:39:52');
INSERT INTO `sys_log_login` VALUES ('636', '超级管理员-system', '127.0.0.1', '2018-09-13 11:16:39');
INSERT INTO `sys_log_login` VALUES ('637', '超级管理员-system', '127.0.0.1', '2018-09-13 11:58:19');
INSERT INTO `sys_log_login` VALUES ('638', '超级管理员-system', '127.0.0.1', '2018-09-13 11:59:39');
INSERT INTO `sys_log_login` VALUES ('639', '超级管理员-system', '127.0.0.1', '2018-09-13 14:00:26');
INSERT INTO `sys_log_login` VALUES ('640', '超级管理员-system', '127.0.0.1', '2018-09-13 14:16:58');
INSERT INTO `sys_log_login` VALUES ('641', '超级管理员-system', '127.0.0.1', '2018-09-13 14:20:13');
INSERT INTO `sys_log_login` VALUES ('642', '超级管理员-system', '127.0.0.1', '2018-09-13 14:23:19');
INSERT INTO `sys_log_login` VALUES ('643', '超级管理员-system', '127.0.0.1', '2018-09-13 14:26:21');
INSERT INTO `sys_log_login` VALUES ('644', '超级管理员-system', '127.0.0.1', '2018-09-13 14:30:54');
INSERT INTO `sys_log_login` VALUES ('645', '超级管理员-system', '127.0.0.1', '2018-09-13 14:31:22');
INSERT INTO `sys_log_login` VALUES ('646', '超级管理员-system', '127.0.0.1', '2018-09-13 14:32:38');
INSERT INTO `sys_log_login` VALUES ('647', '超级管理员-system', '127.0.0.1', '2018-09-13 14:33:19');
INSERT INTO `sys_log_login` VALUES ('648', '超级管理员-system', '127.0.0.1', '2018-09-13 14:39:19');
INSERT INTO `sys_log_login` VALUES ('649', '超级管理员-system', '127.0.0.1', '2018-09-13 14:42:10');
INSERT INTO `sys_log_login` VALUES ('650', '超级管理员-system', '127.0.0.1', '2018-09-13 14:44:14');
INSERT INTO `sys_log_login` VALUES ('651', '超级管理员-system', '127.0.0.1', '2018-09-13 14:46:02');
INSERT INTO `sys_log_login` VALUES ('652', '超级管理员-system', '127.0.0.1', '2018-09-13 14:46:37');
INSERT INTO `sys_log_login` VALUES ('653', '超级管理员-system', '127.0.0.1', '2018-09-13 14:48:24');
INSERT INTO `sys_log_login` VALUES ('654', '超级管理员-system', '127.0.0.1', '2018-09-13 14:50:23');
INSERT INTO `sys_log_login` VALUES ('655', '超级管理员-system', '127.0.0.1', '2018-09-13 14:52:53');
INSERT INTO `sys_log_login` VALUES ('656', '超级管理员-system', '127.0.0.1', '2018-09-13 14:55:43');
INSERT INTO `sys_log_login` VALUES ('657', '超级管理员-system', '127.0.0.1', '2018-09-13 15:00:31');
INSERT INTO `sys_log_login` VALUES ('658', '超级管理员-system', '127.0.0.1', '2018-09-13 15:03:38');
INSERT INTO `sys_log_login` VALUES ('659', '超级管理员-system', '127.0.0.1', '2018-09-13 15:08:26');
INSERT INTO `sys_log_login` VALUES ('660', '超级管理员-system', '127.0.0.1', '2018-09-13 15:10:07');
INSERT INTO `sys_log_login` VALUES ('661', '超级管理员-system', '127.0.0.1', '2018-09-13 15:14:30');
INSERT INTO `sys_log_login` VALUES ('662', '超级管理员-system', '127.0.0.1', '2018-09-13 15:15:10');
INSERT INTO `sys_log_login` VALUES ('663', '超级管理员-system', '127.0.0.1', '2018-09-13 15:23:03');
INSERT INTO `sys_log_login` VALUES ('664', '超级管理员-system', '127.0.0.1', '2018-09-13 15:26:36');
INSERT INTO `sys_log_login` VALUES ('665', '超级管理员-system', '127.0.0.1', '2018-09-13 15:29:04');
INSERT INTO `sys_log_login` VALUES ('666', '超级管理员-system', '127.0.0.1', '2018-09-13 15:34:10');
INSERT INTO `sys_log_login` VALUES ('667', '超级管理员-system', '127.0.0.1', '2018-09-13 15:47:35');
INSERT INTO `sys_log_login` VALUES ('668', '超级管理员-system', '127.0.0.1', '2018-09-13 15:54:11');
INSERT INTO `sys_log_login` VALUES ('669', '超级管理员-system', '127.0.0.1', '2018-09-13 15:55:10');
INSERT INTO `sys_log_login` VALUES ('670', '超级管理员-system', '127.0.0.1', '2018-09-13 15:56:33');
INSERT INTO `sys_log_login` VALUES ('671', '超级管理员-system', '127.0.0.1', '2018-09-13 15:57:08');
INSERT INTO `sys_log_login` VALUES ('672', '超级管理员-system', '127.0.0.1', '2018-09-13 15:58:37');
INSERT INTO `sys_log_login` VALUES ('673', '超级管理员-system', '127.0.0.1', '2018-09-13 16:01:38');
INSERT INTO `sys_log_login` VALUES ('674', '超级管理员-system', '127.0.0.1', '2018-09-13 16:02:14');
INSERT INTO `sys_log_login` VALUES ('675', '超级管理员-system', '127.0.0.1', '2018-09-13 16:02:43');
INSERT INTO `sys_log_login` VALUES ('676', '超级管理员-system', '127.0.0.1', '2018-09-13 16:04:18');
INSERT INTO `sys_log_login` VALUES ('677', '超级管理员-system', '127.0.0.1', '2018-09-13 16:04:51');
INSERT INTO `sys_log_login` VALUES ('678', '超级管理员-system', '127.0.0.1', '2018-09-13 16:05:13');
INSERT INTO `sys_log_login` VALUES ('679', '超级管理员-system', '127.0.0.1', '2018-09-13 16:08:07');
INSERT INTO `sys_log_login` VALUES ('680', '超级管理员-system', '127.0.0.1', '2018-09-13 16:09:25');
INSERT INTO `sys_log_login` VALUES ('681', '超级管理员-system', '127.0.0.1', '2018-09-13 16:13:47');
INSERT INTO `sys_log_login` VALUES ('682', '超级管理员-system', '127.0.0.1', '2018-09-13 16:39:33');
INSERT INTO `sys_log_login` VALUES ('683', '超级管理员-system', '127.0.0.1', '2018-09-13 16:42:26');
INSERT INTO `sys_log_login` VALUES ('684', '超级管理员-system', '127.0.0.1', '2018-09-13 16:50:27');
INSERT INTO `sys_log_login` VALUES ('685', '超级管理员-system', '127.0.0.1', '2018-09-13 16:54:52');
INSERT INTO `sys_log_login` VALUES ('686', '超级管理员-system', '127.0.0.1', '2018-09-13 16:56:54');
INSERT INTO `sys_log_login` VALUES ('687', '超级管理员-system', '127.0.0.1', '2018-09-13 17:02:06');
INSERT INTO `sys_log_login` VALUES ('688', '超级管理员-system', '127.0.0.1', '2018-09-13 17:05:20');
INSERT INTO `sys_log_login` VALUES ('689', '超级管理员-system', '127.0.0.1', '2018-09-13 17:20:40');
INSERT INTO `sys_log_login` VALUES ('690', '超级管理员-system', '127.0.0.1', '2018-09-13 17:42:12');
INSERT INTO `sys_log_login` VALUES ('691', '超级管理员-system', '127.0.0.1', '2018-09-13 17:42:41');
INSERT INTO `sys_log_login` VALUES ('692', '超级管理员-system', '127.0.0.1', '2018-09-13 17:43:06');
INSERT INTO `sys_log_login` VALUES ('693', '超级管理员-system', '127.0.0.1', '2018-09-13 17:44:01');
INSERT INTO `sys_log_login` VALUES ('694', '超级管理员-system', '127.0.0.1', '2018-09-13 17:46:38');
INSERT INTO `sys_log_login` VALUES ('695', '超级管理员-system', '127.0.0.1', '2018-09-13 17:47:10');
INSERT INTO `sys_log_login` VALUES ('696', '超级管理员-system', '127.0.0.1', '2018-09-13 17:47:30');
INSERT INTO `sys_log_login` VALUES ('697', '超级管理员-system', '127.0.0.1', '2018-09-13 17:49:38');
INSERT INTO `sys_log_login` VALUES ('698', '超级管理员-system', '127.0.0.1', '2018-09-13 17:50:18');
INSERT INTO `sys_log_login` VALUES ('699', '超级管理员-system', '127.0.0.1', '2018-09-13 17:51:16');
INSERT INTO `sys_log_login` VALUES ('700', '超级管理员-system', '127.0.0.1', '2018-09-13 17:51:45');
INSERT INTO `sys_log_login` VALUES ('701', '超级管理员-system', '127.0.0.1', '2018-09-13 17:51:59');
INSERT INTO `sys_log_login` VALUES ('702', '超级管理员-system', '127.0.0.1', '2018-09-13 17:52:16');
INSERT INTO `sys_log_login` VALUES ('703', '超级管理员-system', '127.0.0.1', '2018-09-13 17:54:14');
INSERT INTO `sys_log_login` VALUES ('704', '超级管理员-system', '127.0.0.1', '2018-09-13 17:55:19');
INSERT INTO `sys_log_login` VALUES ('705', '超级管理员-system', '127.0.0.1', '2018-09-13 17:55:27');
INSERT INTO `sys_log_login` VALUES ('706', '超级管理员-system', '127.0.0.1', '2018-09-13 17:55:41');
INSERT INTO `sys_log_login` VALUES ('707', '超级管理员-system', '127.0.0.1', '2018-09-13 17:55:59');
INSERT INTO `sys_log_login` VALUES ('708', '超级管理员-system', '127.0.0.1', '2018-09-13 17:57:27');
INSERT INTO `sys_log_login` VALUES ('709', '超级管理员-system', '127.0.0.1', '2018-09-13 19:37:34');
INSERT INTO `sys_log_login` VALUES ('710', '超级管理员-system', '127.0.0.1', '2018-09-13 20:11:27');
INSERT INTO `sys_log_login` VALUES ('711', '超级管理员-system', '127.0.0.1', '2018-09-13 20:13:08');
INSERT INTO `sys_log_login` VALUES ('712', '超级管理员-system', '127.0.0.1', '2018-09-13 20:14:04');
INSERT INTO `sys_log_login` VALUES ('713', '超级管理员-system', '127.0.0.1', '2018-09-13 20:14:25');
INSERT INTO `sys_log_login` VALUES ('714', '超级管理员-system', '127.0.0.1', '2018-09-13 20:15:52');
INSERT INTO `sys_log_login` VALUES ('715', '超级管理员-system', '127.0.0.1', '2018-09-13 20:17:12');
INSERT INTO `sys_log_login` VALUES ('716', '超级管理员-system', '127.0.0.1', '2018-09-13 20:18:56');
INSERT INTO `sys_log_login` VALUES ('717', '超级管理员-system', '127.0.0.1', '2018-09-13 20:20:46');
INSERT INTO `sys_log_login` VALUES ('718', '超级管理员-system', '127.0.0.1', '2018-09-13 20:24:15');
INSERT INTO `sys_log_login` VALUES ('719', '超级管理员-system', '127.0.0.1', '2018-09-13 20:25:36');
INSERT INTO `sys_log_login` VALUES ('720', '超级管理员-system', '127.0.0.1', '2018-09-13 20:31:32');
INSERT INTO `sys_log_login` VALUES ('721', '超级管理员-system', '127.0.0.1', '2018-09-13 20:33:54');
INSERT INTO `sys_log_login` VALUES ('722', '超级管理员-system', '127.0.0.1', '2018-09-13 20:35:21');
INSERT INTO `sys_log_login` VALUES ('723', '超级管理员-system', '127.0.0.1', '2018-09-13 20:38:04');
INSERT INTO `sys_log_login` VALUES ('724', '超级管理员-system', '127.0.0.1', '2018-09-13 20:41:31');
INSERT INTO `sys_log_login` VALUES ('725', '超级管理员-system', '127.0.0.1', '2018-09-13 20:43:52');
INSERT INTO `sys_log_login` VALUES ('726', '超级管理员-system', '127.0.0.1', '2018-09-13 20:46:06');
INSERT INTO `sys_log_login` VALUES ('727', '超级管理员-system', '127.0.0.1', '2018-09-13 20:47:10');
INSERT INTO `sys_log_login` VALUES ('728', '超级管理员-system', '127.0.0.1', '2018-09-13 20:48:05');
INSERT INTO `sys_log_login` VALUES ('729', '超级管理员-system', '127.0.0.1', '2018-09-13 21:33:24');
INSERT INTO `sys_log_login` VALUES ('730', '超级管理员-system', '127.0.0.1', '2018-09-13 22:02:00');
INSERT INTO `sys_log_login` VALUES ('731', '超级管理员-system', '127.0.0.1', '2018-09-13 22:05:39');
INSERT INTO `sys_log_login` VALUES ('732', '超级管理员-system', '127.0.0.1', '2018-09-13 22:05:54');
INSERT INTO `sys_log_login` VALUES ('733', '超级管理员-system', '127.0.0.1', '2018-09-13 22:06:31');
INSERT INTO `sys_log_login` VALUES ('734', '超级管理员-system', '127.0.0.1', '2018-09-13 22:07:14');
INSERT INTO `sys_log_login` VALUES ('735', '超级管理员-system', '127.0.0.1', '2018-09-13 22:07:29');
INSERT INTO `sys_log_login` VALUES ('736', '超级管理员-system', '127.0.0.1', '2018-09-13 22:08:16');
INSERT INTO `sys_log_login` VALUES ('737', '超级管理员-system', '127.0.0.1', '2018-09-13 22:09:13');
INSERT INTO `sys_log_login` VALUES ('738', '超级管理员-system', '127.0.0.1', '2018-09-13 22:09:42');
INSERT INTO `sys_log_login` VALUES ('739', '超级管理员-system', '127.0.0.1', '2018-09-13 22:10:49');
INSERT INTO `sys_log_login` VALUES ('740', '超级管理员-system', '127.0.0.1', '2018-09-13 22:11:51');
INSERT INTO `sys_log_login` VALUES ('741', '超级管理员-system', '127.0.0.1', '2018-09-13 22:12:08');
INSERT INTO `sys_log_login` VALUES ('742', '超级管理员-system', '127.0.0.1', '2018-09-13 22:13:49');
INSERT INTO `sys_log_login` VALUES ('743', '超级管理员-system', '127.0.0.1', '2018-09-13 22:17:10');
INSERT INTO `sys_log_login` VALUES ('744', '超级管理员-system', '127.0.0.1', '2018-09-13 22:18:14');
INSERT INTO `sys_log_login` VALUES ('745', '超级管理员-system', '127.0.0.1', '2018-09-13 22:23:06');
INSERT INTO `sys_log_login` VALUES ('746', '超级管理员-system', '127.0.0.1', '2018-09-13 22:25:11');
INSERT INTO `sys_log_login` VALUES ('747', '超级管理员-system', '127.0.0.1', '2018-09-14 08:54:34');
INSERT INTO `sys_log_login` VALUES ('748', '超级管理员-system', '127.0.0.1', '2018-09-14 08:58:49');
INSERT INTO `sys_log_login` VALUES ('749', '超级管理员-system', '127.0.0.1', '2018-09-14 09:00:18');
INSERT INTO `sys_log_login` VALUES ('750', '超级管理员-system', '127.0.0.1', '2018-09-14 09:02:26');
INSERT INTO `sys_log_login` VALUES ('751', '超级管理员-system', '127.0.0.1', '2018-09-14 09:37:06');
INSERT INTO `sys_log_login` VALUES ('752', '超级管理员-system', '127.0.0.1', '2018-09-14 09:37:35');
INSERT INTO `sys_log_login` VALUES ('753', '超级管理员-system', '127.0.0.1', '2018-09-14 09:38:28');
INSERT INTO `sys_log_login` VALUES ('754', '超级管理员-system', '127.0.0.1', '2018-09-14 09:41:44');
INSERT INTO `sys_log_login` VALUES ('755', '超级管理员-system', '127.0.0.1', '2018-09-14 09:42:16');
INSERT INTO `sys_log_login` VALUES ('756', '超级管理员-system', '127.0.0.1', '2018-09-14 13:43:18');
INSERT INTO `sys_log_login` VALUES ('757', '超级管理员-system', '127.0.0.1', '2018-09-14 14:11:37');
INSERT INTO `sys_log_login` VALUES ('758', '超级管理员-system', '127.0.0.1', '2018-09-14 14:13:31');
INSERT INTO `sys_log_login` VALUES ('759', '超级管理员-system', '127.0.0.1', '2018-09-14 14:16:58');
INSERT INTO `sys_log_login` VALUES ('760', '超级管理员-system', '127.0.0.1', '2018-09-14 14:18:16');
INSERT INTO `sys_log_login` VALUES ('761', '超级管理员-system', '127.0.0.1', '2018-09-14 14:20:26');
INSERT INTO `sys_log_login` VALUES ('762', '超级管理员-system', '127.0.0.1', '2018-09-14 14:21:52');
INSERT INTO `sys_log_login` VALUES ('763', '超级管理员-system', '127.0.0.1', '2018-09-14 14:24:21');
INSERT INTO `sys_log_login` VALUES ('764', '超级管理员-system', '127.0.0.1', '2018-09-14 14:26:31');
INSERT INTO `sys_log_login` VALUES ('765', '超级管理员-system', '127.0.0.1', '2018-09-14 14:46:55');
INSERT INTO `sys_log_login` VALUES ('766', '超级管理员-system', '127.0.0.1', '2018-09-14 17:40:42');
INSERT INTO `sys_log_login` VALUES ('767', '超级管理员-system', '127.0.0.1', '2018-09-14 17:44:21');
INSERT INTO `sys_log_login` VALUES ('768', '超级管理员-system', '127.0.0.1', '2018-09-14 17:46:07');
INSERT INTO `sys_log_login` VALUES ('769', '超级管理员-system', '127.0.0.1', '2018-09-14 20:51:50');
INSERT INTO `sys_log_login` VALUES ('770', '超级管理员-system', '127.0.0.1', '2018-09-14 20:54:35');
INSERT INTO `sys_log_login` VALUES ('771', '超级管理员-system', '127.0.0.1', '2018-09-14 20:55:45');
INSERT INTO `sys_log_login` VALUES ('772', '超级管理员-system', '127.0.0.1', '2018-09-14 20:55:59');
INSERT INTO `sys_log_login` VALUES ('773', '超级管理员-system', '127.0.0.1', '2018-09-14 20:57:05');
INSERT INTO `sys_log_login` VALUES ('774', '超级管理员-system', '127.0.0.1', '2018-09-14 20:58:06');
INSERT INTO `sys_log_login` VALUES ('775', '超级管理员-system', '127.0.0.1', '2018-09-14 21:06:39');
INSERT INTO `sys_log_login` VALUES ('776', '超级管理员-system', '127.0.0.1', '2018-09-14 21:08:26');
INSERT INTO `sys_log_login` VALUES ('777', '超级管理员-system', '127.0.0.1', '2018-09-14 21:16:51');
INSERT INTO `sys_log_login` VALUES ('778', '超级管理员-system', '127.0.0.1', '2018-09-14 21:17:15');
INSERT INTO `sys_log_login` VALUES ('779', '超级管理员-system', '127.0.0.1', '2018-09-14 21:20:28');
INSERT INTO `sys_log_login` VALUES ('780', '超级管理员-system', '127.0.0.1', '2018-09-14 21:36:49');
INSERT INTO `sys_log_login` VALUES ('781', '超级管理员-system', '127.0.0.1', '2018-09-14 21:39:25');
INSERT INTO `sys_log_login` VALUES ('782', '超级管理员-system', '127.0.0.1', '2018-09-14 21:40:30');
INSERT INTO `sys_log_login` VALUES ('783', '超级管理员-system', '127.0.0.1', '2018-09-14 21:43:01');
INSERT INTO `sys_log_login` VALUES ('784', '超级管理员-system', '127.0.0.1', '2018-09-14 21:44:07');
INSERT INTO `sys_log_login` VALUES ('785', '超级管理员-system', '127.0.0.1', '2018-09-14 21:44:38');
INSERT INTO `sys_log_login` VALUES ('786', '超级管理员-system', '127.0.0.1', '2018-09-14 21:48:49');
INSERT INTO `sys_log_login` VALUES ('787', '超级管理员-system', '127.0.0.1', '2018-09-14 21:49:08');
INSERT INTO `sys_log_login` VALUES ('788', '超级管理员-system', '127.0.0.1', '2018-09-14 21:50:02');
INSERT INTO `sys_log_login` VALUES ('789', '超级管理员-system', '127.0.0.1', '2018-09-14 22:20:43');
INSERT INTO `sys_log_login` VALUES ('790', '超级管理员-system', '127.0.0.1', '2018-09-14 22:22:46');
INSERT INTO `sys_log_login` VALUES ('791', '超级管理员-system', '127.0.0.1', '2018-09-14 22:24:14');
INSERT INTO `sys_log_login` VALUES ('792', '超级管理员-system', '127.0.0.1', '2018-09-14 22:25:37');
INSERT INTO `sys_log_login` VALUES ('793', '超级管理员-system', '127.0.0.1', '2018-09-14 22:27:07');
INSERT INTO `sys_log_login` VALUES ('794', '超级管理员-system', '127.0.0.1', '2018-09-14 22:30:02');
INSERT INTO `sys_log_login` VALUES ('795', '超级管理员-system', '127.0.0.1', '2018-09-14 22:33:43');
INSERT INTO `sys_log_login` VALUES ('796', '超级管理员-system', '127.0.0.1', '2018-09-14 22:36:39');
INSERT INTO `sys_log_login` VALUES ('797', '超级管理员-system', '127.0.0.1', '2018-09-14 22:42:14');
INSERT INTO `sys_log_login` VALUES ('798', '超级管理员-system', '127.0.0.1', '2018-09-14 22:43:35');
INSERT INTO `sys_log_login` VALUES ('799', '超级管理员-system', '127.0.0.1', '2018-09-14 22:45:23');
INSERT INTO `sys_log_login` VALUES ('800', '超级管理员-system', '127.0.0.1', '2018-09-14 22:45:41');
INSERT INTO `sys_log_login` VALUES ('801', '超级管理员-system', '127.0.0.1', '2018-09-14 22:46:10');
INSERT INTO `sys_log_login` VALUES ('802', '超级管理员-system', '127.0.0.1', '2018-09-14 22:47:08');
INSERT INTO `sys_log_login` VALUES ('803', '超级管理员-system', '127.0.0.1', '2018-09-14 23:01:04');
INSERT INTO `sys_log_login` VALUES ('804', '超级管理员-system', '127.0.0.1', '2018-09-14 23:03:02');
INSERT INTO `sys_log_login` VALUES ('805', '超级管理员-system', '127.0.0.1', '2018-09-14 23:05:21');
INSERT INTO `sys_log_login` VALUES ('806', '超级管理员-system', '127.0.0.1', '2018-09-15 08:58:30');
INSERT INTO `sys_log_login` VALUES ('807', '超级管理员-system', '127.0.0.1', '2018-09-15 08:59:30');
INSERT INTO `sys_log_login` VALUES ('808', '超级管理员-system', '127.0.0.1', '2018-09-15 09:07:13');
INSERT INTO `sys_log_login` VALUES ('809', '超级管理员-system', '127.0.0.1', '2018-09-15 11:56:22');
INSERT INTO `sys_log_login` VALUES ('810', '超级管理员-system', '127.0.0.1', '2018-09-15 12:02:08');
INSERT INTO `sys_log_login` VALUES ('811', '超级管理员-system', '127.0.0.1', '2018-09-15 14:15:29');
INSERT INTO `sys_log_login` VALUES ('812', '超级管理员-system', '127.0.0.1', '2018-09-15 14:19:32');
INSERT INTO `sys_log_login` VALUES ('813', '超级管理员-system', '127.0.0.1', '2018-09-15 14:24:08');
INSERT INTO `sys_log_login` VALUES ('814', '超级管理员-system', '127.0.0.1', '2018-09-15 14:28:17');
INSERT INTO `sys_log_login` VALUES ('815', '超级管理员-system', '127.0.0.1', '2018-09-15 14:29:51');
INSERT INTO `sys_log_login` VALUES ('816', '超级管理员-system', '127.0.0.1', '2018-09-15 15:49:17');
INSERT INTO `sys_log_login` VALUES ('817', '超级管理员-system', '127.0.0.1', '2018-09-15 15:52:25');
INSERT INTO `sys_log_login` VALUES ('818', '超级管理员-system', '127.0.0.1', '2018-09-15 15:52:46');
INSERT INTO `sys_log_login` VALUES ('819', '超级管理员-system', '127.0.0.1', '2018-09-15 15:53:38');
INSERT INTO `sys_log_login` VALUES ('820', '超级管理员-system', '127.0.0.1', '2018-09-15 15:54:35');
INSERT INTO `sys_log_login` VALUES ('821', '超级管理员-system', '127.0.0.1', '2018-09-15 15:56:40');
INSERT INTO `sys_log_login` VALUES ('822', '超级管理员-system', '127.0.0.1', '2018-09-15 15:58:01');
INSERT INTO `sys_log_login` VALUES ('823', '超级管理员-system', '127.0.0.1', '2018-09-15 16:14:56');
INSERT INTO `sys_log_login` VALUES ('824', '超级管理员-system', '127.0.0.1', '2018-09-15 16:15:29');
INSERT INTO `sys_log_login` VALUES ('825', '超级管理员-system', '127.0.0.1', '2018-09-15 16:16:20');
INSERT INTO `sys_log_login` VALUES ('826', '超级管理员-system', '127.0.0.1', '2018-09-15 16:17:21');
INSERT INTO `sys_log_login` VALUES ('827', '超级管理员-system', '127.0.0.1', '2018-09-15 19:20:20');
INSERT INTO `sys_log_login` VALUES ('828', '超级管理员-system', '127.0.0.1', '2018-09-15 19:21:09');
INSERT INTO `sys_log_login` VALUES ('829', '超级管理员-system', '127.0.0.1', '2018-09-15 19:22:15');
INSERT INTO `sys_log_login` VALUES ('830', '超级管理员-system', '127.0.0.1', '2018-09-15 19:23:59');
INSERT INTO `sys_log_login` VALUES ('831', '超级管理员-system', '127.0.0.1', '2018-09-15 19:25:43');
INSERT INTO `sys_log_login` VALUES ('832', '超级管理员-system', '127.0.0.1', '2018-09-15 19:26:26');
INSERT INTO `sys_log_login` VALUES ('833', '超级管理员-system', '127.0.0.1', '2018-09-15 19:28:07');
INSERT INTO `sys_log_login` VALUES ('834', '超级管理员-system', '127.0.0.1', '2018-09-15 19:29:09');
INSERT INTO `sys_log_login` VALUES ('835', '超级管理员-system', '127.0.0.1', '2018-09-15 19:30:36');
INSERT INTO `sys_log_login` VALUES ('836', '超级管理员-system', '127.0.0.1', '2018-09-15 19:31:22');
INSERT INTO `sys_log_login` VALUES ('837', '超级管理员-system', '127.0.0.1', '2018-09-15 19:39:11');
INSERT INTO `sys_log_login` VALUES ('838', '超级管理员-system', '127.0.0.1', '2018-09-15 19:40:00');
INSERT INTO `sys_log_login` VALUES ('839', '超级管理员-system', '127.0.0.1', '2018-09-15 19:48:13');
INSERT INTO `sys_log_login` VALUES ('840', '超级管理员-system', '127.0.0.1', '2018-09-15 19:58:37');
INSERT INTO `sys_log_login` VALUES ('841', '超级管理员-system', '127.0.0.1', '2018-09-15 20:06:53');
INSERT INTO `sys_log_login` VALUES ('842', '超级管理员-system', '127.0.0.1', '2018-09-15 20:07:00');
INSERT INTO `sys_log_login` VALUES ('843', '超级管理员-system', '127.0.0.1', '2018-09-15 20:13:37');
INSERT INTO `sys_log_login` VALUES ('844', '超级管理员-system', '127.0.0.1', '2018-09-15 20:17:26');
INSERT INTO `sys_log_login` VALUES ('845', '超级管理员-system', '127.0.0.1', '2018-09-15 20:20:51');
INSERT INTO `sys_log_login` VALUES ('846', '超级管理员-system', '127.0.0.1', '2018-09-15 20:30:46');
INSERT INTO `sys_log_login` VALUES ('847', '超级管理员-system', '127.0.0.1', '2018-09-15 20:33:07');
INSERT INTO `sys_log_login` VALUES ('848', '超级管理员-system', '127.0.0.1', '2018-09-15 20:34:41');
INSERT INTO `sys_log_login` VALUES ('849', '超级管理员-system', '127.0.0.1', '2018-09-15 20:41:04');
INSERT INTO `sys_log_login` VALUES ('850', '超级管理员-system', '127.0.0.1', '2018-09-15 20:44:33');
INSERT INTO `sys_log_login` VALUES ('851', '超级管理员-system', '127.0.0.1', '2018-09-15 20:46:53');
INSERT INTO `sys_log_login` VALUES ('852', '超级管理员-system', '127.0.0.1', '2018-09-15 20:48:43');
INSERT INTO `sys_log_login` VALUES ('853', '超级管理员-system', '127.0.0.1', '2018-09-15 20:53:08');
INSERT INTO `sys_log_login` VALUES ('854', '超级管理员-system', '127.0.0.1', '2018-09-15 21:03:06');
INSERT INTO `sys_log_login` VALUES ('855', '超级管理员-system', '127.0.0.1', '2018-09-15 21:06:21');
INSERT INTO `sys_log_login` VALUES ('856', '超级管理员-system', '127.0.0.1', '2018-09-15 21:15:57');
INSERT INTO `sys_log_login` VALUES ('857', '超级管理员-system', '127.0.0.1', '2018-09-15 21:16:34');
INSERT INTO `sys_log_login` VALUES ('858', '超级管理员-system', '127.0.0.1', '2018-09-15 21:18:23');
INSERT INTO `sys_log_login` VALUES ('859', '超级管理员-system', '127.0.0.1', '2018-09-15 21:19:07');
INSERT INTO `sys_log_login` VALUES ('860', '超级管理员-system', '127.0.0.1', '2018-09-15 21:20:45');
INSERT INTO `sys_log_login` VALUES ('861', '超级管理员-system', '127.0.0.1', '2018-09-15 21:23:31');
INSERT INTO `sys_log_login` VALUES ('862', '超级管理员-system', '127.0.0.1', '2018-09-15 21:24:23');
INSERT INTO `sys_log_login` VALUES ('863', '超级管理员-system', '127.0.0.1', '2018-09-15 21:24:36');
INSERT INTO `sys_log_login` VALUES ('864', '超级管理员-system', '127.0.0.1', '2018-09-15 21:24:56');
INSERT INTO `sys_log_login` VALUES ('865', '超级管理员-system', '127.0.0.1', '2018-09-15 21:26:44');
INSERT INTO `sys_log_login` VALUES ('866', '超级管理员-system', '127.0.0.1', '2018-09-15 21:27:01');
INSERT INTO `sys_log_login` VALUES ('867', '超级管理员-system', '127.0.0.1', '2018-09-15 21:27:18');
INSERT INTO `sys_log_login` VALUES ('868', '超级管理员-system', '127.0.0.1', '2018-09-15 21:32:08');
INSERT INTO `sys_log_login` VALUES ('869', '超级管理员-system', '127.0.0.1', '2018-09-15 21:32:58');
INSERT INTO `sys_log_login` VALUES ('870', '超级管理员-system', '127.0.0.1', '2018-09-15 21:33:18');
INSERT INTO `sys_log_login` VALUES ('871', '超级管理员-system', '127.0.0.1', '2018-09-15 21:33:48');
INSERT INTO `sys_log_login` VALUES ('872', '超级管理员-system', '127.0.0.1', '2018-09-15 21:36:01');
INSERT INTO `sys_log_login` VALUES ('873', '超级管理员-system', '127.0.0.1', '2018-09-15 21:37:00');
INSERT INTO `sys_log_login` VALUES ('874', '超级管理员-system', '127.0.0.1', '2018-09-15 21:37:19');
INSERT INTO `sys_log_login` VALUES ('875', '超级管理员-system', '127.0.0.1', '2018-09-15 21:38:24');
INSERT INTO `sys_log_login` VALUES ('876', '超级管理员-system', '127.0.0.1', '2018-09-15 21:40:51');
INSERT INTO `sys_log_login` VALUES ('877', '超级管理员-system', '127.0.0.1', '2018-09-15 21:42:31');
INSERT INTO `sys_log_login` VALUES ('878', '超级管理员-system', '127.0.0.1', '2018-09-15 21:43:31');
INSERT INTO `sys_log_login` VALUES ('879', '超级管理员-system', '127.0.0.1', '2018-09-15 21:46:23');
INSERT INTO `sys_log_login` VALUES ('880', '超级管理员-system', '127.0.0.1', '2018-09-15 21:46:41');
INSERT INTO `sys_log_login` VALUES ('881', '超级管理员-system', '127.0.0.1', '2018-09-15 21:48:44');
INSERT INTO `sys_log_login` VALUES ('882', '超级管理员-system', '127.0.0.1', '2018-09-15 21:50:53');
INSERT INTO `sys_log_login` VALUES ('883', '超级管理员-system', '127.0.0.1', '2018-09-15 21:52:04');
INSERT INTO `sys_log_login` VALUES ('884', '超级管理员-system', '127.0.0.1', '2018-09-15 21:53:55');
INSERT INTO `sys_log_login` VALUES ('885', '超级管理员-system', '127.0.0.1', '2018-09-15 21:55:27');
INSERT INTO `sys_log_login` VALUES ('886', '超级管理员-system', '127.0.0.1', '2018-09-15 21:56:58');
INSERT INTO `sys_log_login` VALUES ('887', '超级管理员-system', '127.0.0.1', '2018-09-15 21:57:17');
INSERT INTO `sys_log_login` VALUES ('888', '超级管理员-system', '127.0.0.1', '2018-09-15 22:22:14');
INSERT INTO `sys_log_login` VALUES ('889', '超级管理员-system', '127.0.0.1', '2018-09-16 14:14:06');
INSERT INTO `sys_log_login` VALUES ('890', '超级管理员-system', '127.0.0.1', '2018-09-16 16:59:23');
INSERT INTO `sys_log_login` VALUES ('891', '超级管理员-system', '127.0.0.1', '2018-09-16 17:02:51');
INSERT INTO `sys_log_login` VALUES ('892', '超级管理员-system', '127.0.0.1', '2018-09-16 17:05:01');
INSERT INTO `sys_log_login` VALUES ('893', '超级管理员-system', '127.0.0.1', '2018-09-16 17:27:00');
INSERT INTO `sys_log_login` VALUES ('894', '超级管理员-system', '127.0.0.1', '2018-09-16 17:28:03');
INSERT INTO `sys_log_login` VALUES ('895', '超级管理员-system', '127.0.0.1', '2018-09-16 17:30:50');
INSERT INTO `sys_log_login` VALUES ('896', '超级管理员-system', '127.0.0.1', '2018-09-16 17:34:53');
INSERT INTO `sys_log_login` VALUES ('897', '超级管理员-system', '127.0.0.1', '2018-09-16 17:38:10');
INSERT INTO `sys_log_login` VALUES ('898', '超级管理员-system', '127.0.0.1', '2018-09-16 17:40:33');
INSERT INTO `sys_log_login` VALUES ('899', '超级管理员-system', '127.0.0.1', '2018-09-16 17:44:13');
INSERT INTO `sys_log_login` VALUES ('900', '超级管理员-system', '127.0.0.1', '2018-09-16 17:45:52');
INSERT INTO `sys_log_login` VALUES ('901', '超级管理员-system', '127.0.0.1', '2018-09-16 17:47:36');
INSERT INTO `sys_log_login` VALUES ('902', '超级管理员-system', '127.0.0.1', '2018-09-16 17:52:11');
INSERT INTO `sys_log_login` VALUES ('903', '超级管理员-system', '127.0.0.1', '2018-09-16 17:53:19');
INSERT INTO `sys_log_login` VALUES ('904', '超级管理员-system', '127.0.0.1', '2018-09-16 18:10:00');
INSERT INTO `sys_log_login` VALUES ('905', '超级管理员-system', '127.0.0.1', '2018-09-16 19:42:25');
INSERT INTO `sys_log_login` VALUES ('906', '超级管理员-system', '127.0.0.1', '2018-09-16 19:55:33');
INSERT INTO `sys_log_login` VALUES ('907', '王五-ww', '127.0.0.1', '2018-09-16 19:55:52');
INSERT INTO `sys_log_login` VALUES ('908', '李四-ls', '127.0.0.1', '2018-09-16 19:56:16');
INSERT INTO `sys_log_login` VALUES ('909', '超级管理员-system', '127.0.0.1', '2018-09-16 19:56:38');
INSERT INTO `sys_log_login` VALUES ('910', '李四-ls', '127.0.0.1', '2018-09-16 19:58:05');
INSERT INTO `sys_log_login` VALUES ('911', '王五-ww', '127.0.0.1', '2018-09-16 19:58:14');
INSERT INTO `sys_log_login` VALUES ('912', '超级管理员-system', '127.0.0.1', '2018-09-16 20:05:35');
INSERT INTO `sys_log_login` VALUES ('913', '超级管理员-system', '127.0.0.1', '2018-09-16 20:48:31');
INSERT INTO `sys_log_login` VALUES ('914', '超级管理员-system', '127.0.0.1', '2018-09-16 20:49:37');
INSERT INTO `sys_log_login` VALUES ('915', '超级管理员-system', '127.0.0.1', '2018-09-16 20:54:38');
INSERT INTO `sys_log_login` VALUES ('916', '超级管理员-system', '127.0.0.1', '2018-09-16 21:02:47');
INSERT INTO `sys_log_login` VALUES ('917', '超级管理员-system', '127.0.0.1', '2018-09-16 21:04:37');
INSERT INTO `sys_log_login` VALUES ('918', '超级管理员-system', '127.0.0.1', '2018-09-16 21:07:00');
INSERT INTO `sys_log_login` VALUES ('919', '超级管理员-system', '127.0.0.1', '2018-09-16 21:10:45');
INSERT INTO `sys_log_login` VALUES ('920', '超级管理员-system', '127.0.0.1', '2018-09-16 21:12:31');
INSERT INTO `sys_log_login` VALUES ('921', '超级管理员-system', '127.0.0.1', '2018-09-16 21:13:34');
INSERT INTO `sys_log_login` VALUES ('922', '超级管理员-system', '127.0.0.1', '2018-09-16 21:14:23');
INSERT INTO `sys_log_login` VALUES ('923', '超级管理员-system', '127.0.0.1', '2018-09-16 21:15:14');
INSERT INTO `sys_log_login` VALUES ('924', '超级管理员-system', '127.0.0.1', '2018-09-16 21:16:56');
INSERT INTO `sys_log_login` VALUES ('925', '超级管理员-system', '127.0.0.1', '2018-09-16 21:18:04');
INSERT INTO `sys_log_login` VALUES ('926', '超级管理员-system', '127.0.0.1', '2018-09-16 21:19:31');
INSERT INTO `sys_log_login` VALUES ('927', '超级管理员-system', '127.0.0.1', '2018-09-16 21:25:16');
INSERT INTO `sys_log_login` VALUES ('928', '超级管理员-system', '127.0.0.1', '2018-09-16 21:26:47');
INSERT INTO `sys_log_login` VALUES ('929', '超级管理员-system', '127.0.0.1', '2018-09-16 21:28:17');
INSERT INTO `sys_log_login` VALUES ('930', '超级管理员-system', '127.0.0.1', '2018-09-16 21:29:36');
INSERT INTO `sys_log_login` VALUES ('931', '超级管理员-system', '127.0.0.1', '2018-09-16 21:31:59');
INSERT INTO `sys_log_login` VALUES ('932', '超级管理员-system', '127.0.0.1', '2018-09-16 21:32:19');
INSERT INTO `sys_log_login` VALUES ('933', '超级管理员-system', '127.0.0.1', '2018-09-16 21:41:19');
INSERT INTO `sys_log_login` VALUES ('934', '超级管理员-system', '127.0.0.1', '2018-09-16 21:49:28');
INSERT INTO `sys_log_login` VALUES ('935', '超级管理员-system', '127.0.0.1', '2018-09-16 22:04:06');
INSERT INTO `sys_log_login` VALUES ('936', '超级管理员-system', '127.0.0.1', '2018-09-16 22:08:03');
INSERT INTO `sys_log_login` VALUES ('937', '超级管理员-system', '127.0.0.1', '2018-09-16 22:24:29');
INSERT INTO `sys_log_login` VALUES ('938', '超级管理员-system', '127.0.0.1', '2018-09-16 22:28:28');
INSERT INTO `sys_log_login` VALUES ('939', '超级管理员-system', '127.0.0.1', '2018-09-16 22:38:19');
INSERT INTO `sys_log_login` VALUES ('940', '超级管理员-system', '127.0.0.1', '2018-09-16 22:39:08');
INSERT INTO `sys_log_login` VALUES ('941', '超级管理员-system', '127.0.0.1', '2018-09-16 23:00:49');
INSERT INTO `sys_log_login` VALUES ('942', '超级管理员-system', '127.0.0.1', '2018-09-16 23:14:13');
INSERT INTO `sys_log_login` VALUES ('943', '超级管理员-system', '127.0.0.1', '2018-09-16 23:15:09');
INSERT INTO `sys_log_login` VALUES ('944', '超级管理员-system', '127.0.0.1', '2018-09-16 23:15:59');
INSERT INTO `sys_log_login` VALUES ('945', '超级管理员-system', '127.0.0.1', '2018-09-16 23:16:54');
INSERT INTO `sys_log_login` VALUES ('946', '超级管理员-system', '127.0.0.1', '2018-09-16 23:19:22');
INSERT INTO `sys_log_login` VALUES ('947', '超级管理员-system', '127.0.0.1', '2018-09-16 23:20:48');
INSERT INTO `sys_log_login` VALUES ('948', '超级管理员-system', '127.0.0.1', '2018-09-16 23:21:50');
INSERT INTO `sys_log_login` VALUES ('949', '超级管理员-system', '127.0.0.1', '2018-09-16 23:22:11');
INSERT INTO `sys_log_login` VALUES ('950', '超级管理员-system', '127.0.0.1', '2018-09-16 23:22:32');
INSERT INTO `sys_log_login` VALUES ('951', '超级管理员-system', '127.0.0.1', '2018-09-16 23:23:06');
INSERT INTO `sys_log_login` VALUES ('952', '超级管理员-system', '127.0.0.1', '2018-09-16 23:24:56');
INSERT INTO `sys_log_login` VALUES ('953', '超级管理员-system', '127.0.0.1', '2018-09-16 23:27:51');
INSERT INTO `sys_log_login` VALUES ('954', '超级管理员-system', '127.0.0.1', '2018-09-16 23:29:06');
INSERT INTO `sys_log_login` VALUES ('955', '超级管理员-system', '127.0.0.1', '2018-09-17 09:00:28');
INSERT INTO `sys_log_login` VALUES ('956', '超级管理员-system', '127.0.0.1', '2018-09-17 09:41:42');
INSERT INTO `sys_log_login` VALUES ('957', '超级管理员-system', '127.0.0.1', '2018-09-17 10:14:05');
INSERT INTO `sys_log_login` VALUES ('958', '超级管理员-system', '127.0.0.1', '2018-09-17 10:16:39');
INSERT INTO `sys_log_login` VALUES ('959', '超级管理员-system', '127.0.0.1', '2018-09-17 10:19:41');
INSERT INTO `sys_log_login` VALUES ('960', '超级管理员-system', '127.0.0.1', '2018-09-17 10:25:17');
INSERT INTO `sys_log_login` VALUES ('961', '超级管理员-system', '127.0.0.1', '2018-09-17 10:27:50');
INSERT INTO `sys_log_login` VALUES ('962', '超级管理员-system', '127.0.0.1', '2018-09-17 10:33:04');
INSERT INTO `sys_log_login` VALUES ('963', '超级管理员-system', '127.0.0.1', '2018-09-17 10:33:26');
INSERT INTO `sys_log_login` VALUES ('964', '超级管理员-system', '127.0.0.1', '2018-09-17 10:41:08');
INSERT INTO `sys_log_login` VALUES ('965', '超级管理员-system', '127.0.0.1', '2018-09-17 10:41:29');
INSERT INTO `sys_log_login` VALUES ('966', '超级管理员-system', '127.0.0.1', '2018-09-17 15:23:15');
INSERT INTO `sys_log_login` VALUES ('967', '超级管理员-system', '127.0.0.1', '2018-09-17 15:26:35');
INSERT INTO `sys_log_login` VALUES ('968', '超级管理员-system', '127.0.0.1', '2018-09-17 16:07:14');
INSERT INTO `sys_log_login` VALUES ('969', '超级管理员-system', '127.0.0.1', '2018-09-17 16:08:34');
INSERT INTO `sys_log_login` VALUES ('970', '超级管理员-system', '127.0.0.1', '2018-09-17 16:23:24');
INSERT INTO `sys_log_login` VALUES ('971', '超级管理员-system', '127.0.0.1', '2018-09-17 16:35:31');
INSERT INTO `sys_log_login` VALUES ('972', '超级管理员-system', '127.0.0.1', '2018-09-17 16:36:38');
INSERT INTO `sys_log_login` VALUES ('973', '超级管理员-system', '127.0.0.1', '2018-09-17 16:37:56');
INSERT INTO `sys_log_login` VALUES ('974', '超级管理员-system', '127.0.0.1', '2018-09-17 16:38:19');
INSERT INTO `sys_log_login` VALUES ('975', '超级管理员-system', '127.0.0.1', '2018-09-17 16:53:19');
INSERT INTO `sys_log_login` VALUES ('976', '超级管理员-system', '127.0.0.1', '2018-09-17 16:56:50');
INSERT INTO `sys_log_login` VALUES ('977', '超级管理员-system', '127.0.0.1', '2018-09-17 17:02:17');
INSERT INTO `sys_log_login` VALUES ('978', '超级管理员-system', '127.0.0.1', '2018-09-17 17:04:18');
INSERT INTO `sys_log_login` VALUES ('979', '超级管理员-system', '127.0.0.1', '2018-09-17 17:21:15');
INSERT INTO `sys_log_login` VALUES ('980', '超级管理员-system', '127.0.0.1', '2018-09-17 17:29:36');
INSERT INTO `sys_log_login` VALUES ('981', '超级管理员-system', '127.0.0.1', '2018-09-17 17:31:47');
INSERT INTO `sys_log_login` VALUES ('982', '超级管理员-system', '127.0.0.1', '2018-09-17 18:58:32');
INSERT INTO `sys_log_login` VALUES ('983', '超级管理员-system', '127.0.0.1', '2018-09-17 18:59:32');
INSERT INTO `sys_log_login` VALUES ('984', '超级管理员-system', '127.0.0.1', '2018-09-17 19:01:32');
INSERT INTO `sys_log_login` VALUES ('985', '超级管理员-system', '127.0.0.1', '2018-09-17 19:04:35');
INSERT INTO `sys_log_login` VALUES ('986', '超级管理员-system', '127.0.0.1', '2018-09-17 22:19:22');
INSERT INTO `sys_log_login` VALUES ('987', '超级管理员-system', '127.0.0.1', '2018-09-18 08:56:53');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '关于系统V1.3更新公告', '2', '2018-08-07 00:00:00', '管理员');
INSERT INTO `sys_notice` VALUES ('10', '关于系统V1.2更新公告', '1231231<img src=\"http://127.0.0.1:8080/whsxt/resources/layui/images/face/15.gif\" alt=\"[生病]\">', '2018-08-07 00:00:00', '超级管理员');
INSERT INTO `sys_notice` VALUES ('11', '关于系统V1.1更新公告', '21321321321<img src=\"http://127.0.0.1:8080/whsxt/resources/layui/images/face/8.gif\" alt=\"[挤眼]\">', '2018-08-07 00:00:00', '超级管理员');
INSERT INTO `sys_notice` VALUES ('13', '更新', 'dasda', '2018-09-13 14:04:08', '超级管理员');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `parent` int(11) DEFAULT '0' COMMENT '0子节点 1父节点',
  `percode` varchar(255) DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `open` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '0', 'menu', '1', null, '尚学堂进销存管理系统', '&#xe68e;', '', '', '1', '1', '1');
INSERT INTO `sys_permission` VALUES ('2', '1', 'menu', '1', null, '基础管理', '&#xe857;', '', '', '1', '2', '1');
INSERT INTO `sys_permission` VALUES ('3', '1', 'menu', '1', null, '进货管理', '&#xe645;', '', null, '0', '3', '1');
INSERT INTO `sys_permission` VALUES ('4', '1', 'menu', '1', null, '销售管理', '&#xe611;', '', '', '0', '4', '1');
INSERT INTO `sys_permission` VALUES ('5', '1', 'menu', '1', null, '系统管理', '&#xe614;', '', '', '0', '5', '1');
INSERT INTO `sys_permission` VALUES ('6', '1', 'menu', '1', null, '其它管理', '&#xe628;', '', '', '0', '6', '1');
INSERT INTO `sys_permission` VALUES ('7', '2', 'menu', '0', null, '客户管理', '&#xe651;', '../customer/toCustomerManager.action', '', '0', '7', '1');
INSERT INTO `sys_permission` VALUES ('8', '2', 'menu', '0', null, '供应商管理', '&#xe658;', '../provider/toProviderManager.action', '', '0', '8', '1');
INSERT INTO `sys_permission` VALUES ('9', '2', 'menu', '0', null, '商品管理', '&#xe657;', '../goods/toGoodsManager.action', '', '0', '9', '1');
INSERT INTO `sys_permission` VALUES ('10', '3', 'menu', '0', null, '商品进货', '&#xe756;', '../inport/toInportManager.action', '', '0', '10', '1');
INSERT INTO `sys_permission` VALUES ('11', '3', 'menu', '0', null, '商品退货', '&#xe65a;', '../outport/toOutportManager.action', '', '0', '11', '1');
INSERT INTO `sys_permission` VALUES ('12', '4', 'menu', '0', null, '商品销售', '&#xe65b;', '', '', '0', '12', '1');
INSERT INTO `sys_permission` VALUES ('13', '4', 'menu', '0', null, '销售退货', '&#xe770;', '', '', '0', '13', '1');
INSERT INTO `sys_permission` VALUES ('14', '5', 'menu', '0', null, '部门管理', '&#xe770;', '../dept/toDeptManager.action', '', '0', '14', '1');
INSERT INTO `sys_permission` VALUES ('15', '5', 'menu', '0', null, '菜单管理', '&#xe857;', '../menu/toMenuManager.action', '', '0', '15', '1');
INSERT INTO `sys_permission` VALUES ('16', '5', 'menu', '0', '', '权限管理', '&#xe857;', '../permission/toPermissionManager.action', '', '0', '16', '1');
INSERT INTO `sys_permission` VALUES ('17', '5', 'menu', '0', '', '角色管理', '&#xe650;', '../role/toRoleManager.action', '', '0', '17', '1');
INSERT INTO `sys_permission` VALUES ('18', '5', 'menu', '0', '', '用户管理', '&#xe612;', '../user/toUserManager.action', '', '0', '18', '1');
INSERT INTO `sys_permission` VALUES ('21', '6', 'menu', '0', null, '登陆日志', '&#xe675;', '../logInfo/toLogInfoManager.action', null, '0', '21', '1');
INSERT INTO `sys_permission` VALUES ('22', '6', 'menu', '0', null, '系统公告', '&#xe756;', '../notice/toNoticeManager.action', null, '0', '22', '1');
INSERT INTO `sys_permission` VALUES ('23', '6', 'menu', '0', null, '图标管理', '&#xe670;', '../resources/page/icon.html', null, '0', '23', '1');
INSERT INTO `sys_permission` VALUES ('30', '14', 'permission', '0', 'dept:create', '添加部门', '', null, null, '0', '25', '1');
INSERT INTO `sys_permission` VALUES ('31', '14', 'permission', '0', 'dept:update', '修改部门', '', null, null, '0', '26', '1');
INSERT INTO `sys_permission` VALUES ('32', '14', 'permission', '0', 'dept:delete', '删除部门', '', null, null, '0', '27', '1');
INSERT INTO `sys_permission` VALUES ('33', '14', 'permission', '0', 'dept:batchdelete', '批量删除', '', null, null, '0', '28', '1');
INSERT INTO `sys_permission` VALUES ('34', '15', 'permission', '0', 'menu:create', '添加菜单', '', '', '', '0', '29', '1');
INSERT INTO `sys_permission` VALUES ('35', '15', 'permission', '0', 'menu:update', '修改菜单', '', null, null, '0', '30', '1');
INSERT INTO `sys_permission` VALUES ('36', '15', 'permission', '0', 'menu:delete', '删除菜单', '', null, null, '0', '31', '1');
INSERT INTO `sys_permission` VALUES ('37', '15', 'permission', '0', 'menu:batchdelete', '菜单批量删除', '', null, null, '0', '32', '1');
INSERT INTO `sys_permission` VALUES ('38', '16', 'permission', '0', 'permission:create', '添加权限', '', null, null, '0', '33', '1');
INSERT INTO `sys_permission` VALUES ('39', '16', 'permission', '0', 'permission:update', '修改权限', '', null, null, '0', '34', '1');
INSERT INTO `sys_permission` VALUES ('40', '16', 'permission', '0', 'permission:delete', '删除权限', '', null, null, '0', '35', '1');
INSERT INTO `sys_permission` VALUES ('41', '16', 'permission', '0', 'permission:batchdelete', '权限批量删除', '', null, null, '0', '36', '1');
INSERT INTO `sys_permission` VALUES ('42', '17', 'permission', '0', 'role:create', '添加角色', '', null, null, '0', '37', '1');
INSERT INTO `sys_permission` VALUES ('43', '17', 'permission', '0', 'role:update', '修改角色', '', null, null, '0', '38', '1');
INSERT INTO `sys_permission` VALUES ('44', '17', 'permission', '0', 'role:delete', '删除角色', '', null, null, '0', '39', '1');
INSERT INTO `sys_permission` VALUES ('45', '17', 'permission', '0', 'role:batchdelete', '角色批量删除', '', null, null, '0', '40', '1');
INSERT INTO `sys_permission` VALUES ('46', '17', 'permission', '0', 'role:selectPermission', '分配权限', '', null, null, '0', '41', '1');
INSERT INTO `sys_permission` VALUES ('47', '18', 'permission', '0', 'user:create', '添加用户', '', null, null, '0', '42', '1');
INSERT INTO `sys_permission` VALUES ('48', '18', 'permission', '0', 'user:update', '修改用户', '', null, null, '0', '43', '1');
INSERT INTO `sys_permission` VALUES ('49', '18', 'permission', '0', 'user:delete', '删除用户', '', null, null, '0', '44', '1');
INSERT INTO `sys_permission` VALUES ('50', '18', 'permission', '0', 'user:batchdelete', '用户批量删除', '', null, null, '0', '45', '1');
INSERT INTO `sys_permission` VALUES ('51', '18', 'permission', '0', 'user:selectRole', '用户分配角色', '', null, null, '0', '46', '1');
INSERT INTO `sys_permission` VALUES ('52', '18', 'permission', '0', 'user:resetpwd', '重置密码', null, null, null, '0', '47', '1');
INSERT INTO `sys_permission` VALUES ('53', '14', 'permission', '0', 'dept:view', '部门查询', null, null, null, '0', '48', '1');
INSERT INTO `sys_permission` VALUES ('54', '15', 'permission', '0', 'menu:view', '菜单查询', null, null, null, '0', '49', '1');
INSERT INTO `sys_permission` VALUES ('55', '16', 'permission', '0', 'permission:view', '权限查询', null, null, null, '0', '50', '1');
INSERT INTO `sys_permission` VALUES ('56', '17', 'permission', '0', 'role:view', '角色查询', null, null, null, '0', '51', '1');
INSERT INTO `sys_permission` VALUES ('57', '18', 'permission', '0', 'user:view', '用户查询', null, null, null, '0', '52', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '拥有所有菜单权限', '1');
INSERT INTO `sys_role` VALUES ('4', '基础数据管理员', '基础数据管理员', '1');
INSERT INTO `sys_role` VALUES ('5', '仓库管理员', '仓库管理员', '1');
INSERT INTO `sys_role` VALUES ('6', '销售管理员', '销售管理员', '1');
INSERT INTO `sys_role` VALUES ('7', '系统管理员', '系统管理员', '1');
INSERT INTO `sys_role` VALUES ('8', '杂项管理者', '其他管理，管理没有主题的功能', '1');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`rid`),
  KEY `FK_tcsr9ucxypb3ce1q5qngsfk33` (`rid`),
  CONSTRAINT `FK_PERMISSION_PID` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ROLE_RID` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1', '1');
INSERT INTO `sys_role_permission` VALUES ('1', '2');
INSERT INTO `sys_role_permission` VALUES ('1', '3');
INSERT INTO `sys_role_permission` VALUES ('1', '4');
INSERT INTO `sys_role_permission` VALUES ('1', '5');
INSERT INTO `sys_role_permission` VALUES ('1', '6');
INSERT INTO `sys_role_permission` VALUES ('1', '7');
INSERT INTO `sys_role_permission` VALUES ('1', '8');
INSERT INTO `sys_role_permission` VALUES ('1', '9');
INSERT INTO `sys_role_permission` VALUES ('1', '10');
INSERT INTO `sys_role_permission` VALUES ('1', '11');
INSERT INTO `sys_role_permission` VALUES ('1', '12');
INSERT INTO `sys_role_permission` VALUES ('1', '13');
INSERT INTO `sys_role_permission` VALUES ('1', '14');
INSERT INTO `sys_role_permission` VALUES ('1', '15');
INSERT INTO `sys_role_permission` VALUES ('1', '16');
INSERT INTO `sys_role_permission` VALUES ('1', '17');
INSERT INTO `sys_role_permission` VALUES ('1', '18');
INSERT INTO `sys_role_permission` VALUES ('1', '21');
INSERT INTO `sys_role_permission` VALUES ('1', '22');
INSERT INTO `sys_role_permission` VALUES ('1', '23');
INSERT INTO `sys_role_permission` VALUES ('1', '30');
INSERT INTO `sys_role_permission` VALUES ('1', '31');
INSERT INTO `sys_role_permission` VALUES ('1', '32');
INSERT INTO `sys_role_permission` VALUES ('1', '33');
INSERT INTO `sys_role_permission` VALUES ('1', '34');
INSERT INTO `sys_role_permission` VALUES ('1', '35');
INSERT INTO `sys_role_permission` VALUES ('1', '36');
INSERT INTO `sys_role_permission` VALUES ('1', '37');
INSERT INTO `sys_role_permission` VALUES ('1', '38');
INSERT INTO `sys_role_permission` VALUES ('1', '39');
INSERT INTO `sys_role_permission` VALUES ('1', '40');
INSERT INTO `sys_role_permission` VALUES ('1', '41');
INSERT INTO `sys_role_permission` VALUES ('1', '42');
INSERT INTO `sys_role_permission` VALUES ('1', '43');
INSERT INTO `sys_role_permission` VALUES ('1', '44');
INSERT INTO `sys_role_permission` VALUES ('1', '45');
INSERT INTO `sys_role_permission` VALUES ('1', '46');
INSERT INTO `sys_role_permission` VALUES ('1', '47');
INSERT INTO `sys_role_permission` VALUES ('1', '48');
INSERT INTO `sys_role_permission` VALUES ('1', '49');
INSERT INTO `sys_role_permission` VALUES ('1', '50');
INSERT INTO `sys_role_permission` VALUES ('1', '51');
INSERT INTO `sys_role_permission` VALUES ('1', '52');
INSERT INTO `sys_role_permission` VALUES ('1', '53');
INSERT INTO `sys_role_permission` VALUES ('1', '54');
INSERT INTO `sys_role_permission` VALUES ('1', '55');
INSERT INTO `sys_role_permission` VALUES ('1', '56');
INSERT INTO `sys_role_permission` VALUES ('1', '57');
INSERT INTO `sys_role_permission` VALUES ('4', '1');
INSERT INTO `sys_role_permission` VALUES ('4', '2');
INSERT INTO `sys_role_permission` VALUES ('4', '7');
INSERT INTO `sys_role_permission` VALUES ('4', '8');
INSERT INTO `sys_role_permission` VALUES ('4', '9');
INSERT INTO `sys_role_permission` VALUES ('5', '1');
INSERT INTO `sys_role_permission` VALUES ('5', '3');
INSERT INTO `sys_role_permission` VALUES ('5', '10');
INSERT INTO `sys_role_permission` VALUES ('5', '11');
INSERT INTO `sys_role_permission` VALUES ('6', '1');
INSERT INTO `sys_role_permission` VALUES ('6', '4');
INSERT INTO `sys_role_permission` VALUES ('6', '12');
INSERT INTO `sys_role_permission` VALUES ('6', '13');
INSERT INTO `sys_role_permission` VALUES ('7', '1');
INSERT INTO `sys_role_permission` VALUES ('7', '5');
INSERT INTO `sys_role_permission` VALUES ('7', '6');
INSERT INTO `sys_role_permission` VALUES ('7', '14');
INSERT INTO `sys_role_permission` VALUES ('7', '15');
INSERT INTO `sys_role_permission` VALUES ('7', '16');
INSERT INTO `sys_role_permission` VALUES ('7', '17');
INSERT INTO `sys_role_permission` VALUES ('7', '18');
INSERT INTO `sys_role_permission` VALUES ('7', '21');
INSERT INTO `sys_role_permission` VALUES ('7', '22');
INSERT INTO `sys_role_permission` VALUES ('7', '23');
INSERT INTO `sys_role_permission` VALUES ('7', '53');
INSERT INTO `sys_role_permission` VALUES ('7', '54');
INSERT INTO `sys_role_permission` VALUES ('7', '55');
INSERT INTO `sys_role_permission` VALUES ('7', '56');
INSERT INTO `sys_role_permission` VALUES ('7', '57');
INSERT INTO `sys_role_permission` VALUES ('8', '1');
INSERT INTO `sys_role_permission` VALUES ('8', '5');
INSERT INTO `sys_role_permission` VALUES ('8', '6');
INSERT INTO `sys_role_permission` VALUES ('8', '14');
INSERT INTO `sys_role_permission` VALUES ('8', '15');
INSERT INTO `sys_role_permission` VALUES ('8', '16');
INSERT INTO `sys_role_permission` VALUES ('8', '17');
INSERT INTO `sys_role_permission` VALUES ('8', '18');
INSERT INTO `sys_role_permission` VALUES ('8', '21');
INSERT INTO `sys_role_permission` VALUES ('8', '22');
INSERT INTO `sys_role_permission` VALUES ('8', '23');
INSERT INTO `sys_role_permission` VALUES ('8', '30');
INSERT INTO `sys_role_permission` VALUES ('8', '31');
INSERT INTO `sys_role_permission` VALUES ('8', '32');
INSERT INTO `sys_role_permission` VALUES ('8', '33');
INSERT INTO `sys_role_permission` VALUES ('8', '34');
INSERT INTO `sys_role_permission` VALUES ('8', '35');
INSERT INTO `sys_role_permission` VALUES ('8', '36');
INSERT INTO `sys_role_permission` VALUES ('8', '37');
INSERT INTO `sys_role_permission` VALUES ('8', '38');
INSERT INTO `sys_role_permission` VALUES ('8', '39');
INSERT INTO `sys_role_permission` VALUES ('8', '40');
INSERT INTO `sys_role_permission` VALUES ('8', '41');
INSERT INTO `sys_role_permission` VALUES ('8', '42');
INSERT INTO `sys_role_permission` VALUES ('8', '43');
INSERT INTO `sys_role_permission` VALUES ('8', '44');
INSERT INTO `sys_role_permission` VALUES ('8', '45');
INSERT INTO `sys_role_permission` VALUES ('8', '46');
INSERT INTO `sys_role_permission` VALUES ('8', '47');
INSERT INTO `sys_role_permission` VALUES ('8', '48');
INSERT INTO `sys_role_permission` VALUES ('8', '49');
INSERT INTO `sys_role_permission` VALUES ('8', '50');
INSERT INTO `sys_role_permission` VALUES ('8', '51');
INSERT INTO `sys_role_permission` VALUES ('8', '52');
INSERT INTO `sys_role_permission` VALUES ('8', '53');
INSERT INTO `sys_role_permission` VALUES ('8', '54');
INSERT INTO `sys_role_permission` VALUES ('8', '55');
INSERT INTO `sys_role_permission` VALUES ('8', '56');
INSERT INTO `sys_role_permission` VALUES ('8', '57');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`),
  KEY `FK_203gdpkwgtow7nxlo2oap5jru` (`rid`),
  CONSTRAINT `FK_203gdpkwgtow7nxlo2oap5jru` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_rmo144ixp2kul8rgs4sk5j0er` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('1', '2');
INSERT INTO `sys_role_user` VALUES ('4', '3');
INSERT INTO `sys_role_user` VALUES ('5', '4');
INSERT INTO `sys_role_user` VALUES ('6', '5');
INSERT INTO `sys_role_user` VALUES ('7', '6');
INSERT INTO `sys_role_user` VALUES ('8', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `loginname` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `mgr` int(11) DEFAULT NULL,
  `available` int(11) DEFAULT '1',
  `ordernum` int(11) DEFAULT NULL,
  `type` int(255) DEFAULT NULL COMMENT '用户类型[0超级管理员1，管理员，2普通用户]',
  `imgpath` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3rrcpvho2w1mx1sfiuuyir1h` (`deptid`),
  CONSTRAINT `FK_3rrcpvho2w1mx1sfiuuyir1h` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '超级管理员', 'system', '系统深处的男人', '1', '超级管理员', 'a7691fd575c7d5db939e23a450e1f9bf', '1', '2018-06-25 11:06:34', null, '1', '1', '0', '../resources/images/defaulttitle.jpg', 'CE4B560D1BB54312A1B720C0846752ED');
INSERT INTO `sys_user` VALUES ('2', '李四', 'ls', '武汉', '0', 'KING', '719c63bff4a7e72547b9829df98ccfc7', '1', '2018-06-25 11:06:36', null, '1', '2', '1', '../resources/images/defaulttitle.jpg', '907EEFE05DE14744A16BE08C479AA2A6');
INSERT INTO `sys_user` VALUES ('3', '王五', 'ww', '武汉', '1', '管理员', 'b318482b0241c109e83a4a10a0baa12e', '3', '2018-06-25 11:06:38', '2', '1', '3', '1', '../resources/images/defaulttitle.jpg', '26BFF6ACA33E4914BE735A852A67ECB9');
INSERT INTO `sys_user` VALUES ('4', '赵六', 'zl', '武汉', '1', '程序员', '5bbb1cffeafcffc4854391573860f007', '4', '2018-06-25 11:06:40', '3', '1', '4', '1', '../resources/images/defaulttitle.jpg', '8B35775DF7814C3F8877680D5E2A6598');
INSERT INTO `sys_user` VALUES ('5', '孙七', 'sq', '武汉', '1', '程序员', '35537613cf16e4620002ce0f65783052', '2', '2018-06-25 11:06:43', '4', '1', '5', '1', '../resources/images/defaulttitle.jpg', '209B0B722757489485FF6EBD75ED26CB');
INSERT INTO `sys_user` VALUES ('6', '刘八', 'lb', '深圳', '1', '程序员', 'dd9a3172241c19d21d0d8d0b48dfdb58', '4', '2018-08-06 11:21:12', '3', '1', '6', '1', '../resources/images/defaulttitle.jpg', '67972AD8B66D45F3BE488B8A320B407D');
INSERT INTO `sys_user` VALUES ('9', '露露', 'lulu', '武汉光谷', '0', '员工推荐的', 'cf9df141e2856e1b1aa1fdf4949c8100', '4', '2018-09-15 20:33:30', '6', '1', '10', '1', '../resources/images/defaulttitle.jpg', 'F658A4CBB652409B971750FB230BB78C');
SET FOREIGN_KEY_CHECKS=1;

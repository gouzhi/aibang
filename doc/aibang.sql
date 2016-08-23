/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : aibang

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-08-17 14:28:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ab_approve_email_active`
-- ----------------------------
DROP TABLE IF EXISTS `ab_approve_email_active`;
CREATE TABLE `ab_approve_email_active` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `EMAIL` varchar(50) NOT NULL COMMENT '邮箱地址',
  `VERIFY_USERID` int(11) DEFAULT NULL COMMENT '人工审核人ID',
  `VERIFY_MEMO` varchar(200) DEFAULT NULL COMMENT '审核备注',
  `VERIFY_TIME` datetime DEFAULT NULL COMMENT '审核时间',
  `STATUS` int(2) NOT NULL DEFAULT '0' COMMENT '激活状态 0未激活1激活',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `CREATE_IP` varchar(20) NOT NULL COMMENT '创建时IP',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`) USING BTREE,
  KEY `EMAIL` (`EMAIL`) USING BTREE,
  KEY `STATUS` (`STATUS`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_approve_email_active/邮箱激活';

-- ----------------------------
-- Records of ab_approve_email_active
-- ----------------------------

-- ----------------------------
-- Table structure for `ab_approve_realname`
-- ----------------------------
DROP TABLE IF EXISTS `ab_approve_realname`;
CREATE TABLE `ab_approve_realname` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT 'USER_ID',
  `REALNAME` varchar(50) NOT NULL COMMENT '真实姓名',
  `CARD_ID` varchar(50) NOT NULL COMMENT '身份证号',
  `STATUS` int(2) NOT NULL DEFAULT '0' COMMENT '认证状态 0未审核1审核成功-1审核失败',
  `SEX` int(11) DEFAULT NULL COMMENT '性别 0女1男',
  `CARD_PIC` varchar(100) DEFAULT NULL COMMENT '身份证图片地址',
  `CARD_PIC1` varchar(200) DEFAULT NULL COMMENT '身份证图片1',
  `CARD_PIC2` varchar(200) DEFAULT NULL COMMENT '身份证图片2',
  `VERIFY_USERID` int(11) DEFAULT NULL COMMENT '人工审核人ID',
  `VERIFY_MEMO` varchar(200) DEFAULT NULL COMMENT '审核备注',
  `VERIFY_TIME` datetime DEFAULT NULL COMMENT '审核时间',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `CREATE_IP` varchar(20) NOT NULL COMMENT '创建时IP',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`) USING BTREE,
  KEY `CARD_ID` (`CARD_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_APPROVE_REALNAME';



-- ----------------------------
-- Table structure for `ab_approve_sms`
-- ----------------------------
DROP TABLE IF EXISTS `ab_approve_sms`;
CREATE TABLE `ab_approve_sms` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `STATUS` int(2) NOT NULL DEFAULT '0' COMMENT '认证状态 0未审核1审核成功-1审核失败',
  `TYPE` int(11) NOT NULL COMMENT '类型',
  `PHONE` varchar(20) NOT NULL COMMENT '手机号码',
  `CREDIT` int(11) NOT NULL COMMENT '验证码',
  `VERIFY_USERID` int(11) NOT NULL COMMENT '人工审核人ID',
  `VERIFY_TIME` datetime NOT NULL COMMENT '审核时间',
  `VERIFY_REMARK` varchar(250) NOT NULL COMMENT '审核备注',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `CREATE_IP` varchar(20) NOT NULL COMMENT '创建时IP',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`) USING BTREE,
  KEY `STATUS` (`STATUS`) USING BTREE,
  KEY `CREATE_TIME` (`CREATE_TIME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_APPROVE_SMS';



-- ----------------------------
-- Table structure for `ab_approve_sms_sendlog`
-- ----------------------------
DROP TABLE IF EXISTS `ab_approve_sms_sendlog`;
CREATE TABLE `ab_approve_sms_sendlog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TYPE_ID` int(11) NOT NULL COMMENT '类型/configid=20',
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `PHONE` varchar(50) NOT NULL COMMENT '手机号码',
  `CONTENTS` varchar(250) NOT NULL COMMENT '内容',
  `STATUS` int(2) NOT NULL DEFAULT '1' COMMENT '发送状态1发送/0未发送',
  `SEND_RETURN` varchar(50) DEFAULT NULL COMMENT '发送返回值',
  `SEND_TIME` datetime NOT NULL COMMENT '发送时间',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `CREATE_IP` varchar(20) NOT NULL COMMENT '创建时IP',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`) USING BTREE,
  KEY `TYPE_ID` (`TYPE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ab_approve_sms_sendlog/手机发送记录';



-- ----------------------------
-- Table structure for `ab_sys_area`
-- ----------------------------
DROP TABLE IF EXISTS `ab_sys_area`;
CREATE TABLE `ab_sys_area` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `AREA_NAME` varchar(50) NOT NULL COMMENT '名称',
  `PY_NAME` varchar(50) DEFAULT NULL COMMENT '拼音',
  `PARENT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `ALL_PARENTID` varchar(800) NOT NULL DEFAULT ',0,' COMMENT '所有父ID/逗隔开',
  `ORDER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '同级的排序ID',
  `LAYER` int(11) NOT NULL DEFAULT '1' COMMENT '层级/1开始',
  `IS_DEL` int(1) NOT NULL DEFAULT '0' COMMENT '是否逻辑删除0：否',
  `OPT_ID` int(11) DEFAULT NULL COMMENT '操作员ID。界面录入时需填写',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `PARENT_ID` (`PARENT_ID`) USING BTREE,
  KEY `ALL_PARENTID` (`ALL_PARENTID`(255)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3545 DEFAULT CHARSET=utf8 COMMENT='全局地域/ab_sys_area';

-- ----------------------------
-- Records of ab_sys_area
-- ----------------------------
INSERT INTO `ab_sys_area` VALUES ('1', '北京市', 'BJS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('2', '天津市', 'TJS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('3', '河北省', 'HBS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('4', '山西省', 'SXS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('5', '内蒙古', 'NMG', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('6', '辽宁省', 'LNS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('7', '吉林省', 'JLS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('8', '黑龙江', 'HLJ', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('9', '上海市', 'SHS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('10', '江苏省', 'JSS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('11', '浙江省', 'ZJS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('12', '安徽省', 'AHS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('13', '福建省', 'FJS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('14', '江西省', 'JXS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('15', '山东省', 'SDS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('16', '河南省', 'HNS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('17', '湖北省', 'HBS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('18', '湖南省', 'HNS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('19', '广东省', 'GDS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('20', '广西省', 'GXS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('21', '海南省', 'HNS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('22', '重庆市', 'ZQS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('23', '四川省', 'SCS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('24', '贵州省', 'GZS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('25', '云南省', 'YNS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('26', '西藏自治区', 'XCZZQ', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('27', '陕西省', 'SXS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('28', '甘肃省', 'GSS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('29', '青海省', 'QHS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('30', '宁夏', 'NX', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('31', '新疆', 'XJ', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('32', '台湾省', 'TWS', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('33', '香港', 'XG', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:22');
INSERT INTO `ab_sys_area` VALUES ('34', '澳门', 'AM', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:23');
INSERT INTO `ab_sys_area` VALUES ('35', '海外', 'HW', '0', ',0,', '0', '1', '0', '0', '2008-11-24 11:03:23');
INSERT INTO `ab_sys_area` VALUES ('36', '北京市区', 'BJSQ', '1', ',0,1,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('37', '北京郊县', 'BJJX', '1', ',0,1,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('38', '天津市区', 'TJSQ', '2', ',0,2,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('39', '天津郊县', 'TJJX', '2', ',0,2,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('40', '石家庄市', 'SJZS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('41', '唐山市', 'TSS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('42', '秦皇岛市', 'QHDS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('43', '邯郸市', 'HDS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('44', '邢台市', 'XTS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('45', '保定市', 'BDS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('46', '张家口市', 'ZJKS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('47', '承德市', 'CDS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('48', '沧州市', 'CZS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('49', '廊坊市', 'LFS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('50', '衡水市', 'HSS', '3', ',0,3,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('51', '太原市', 'TYS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('52', '大同市', 'DTS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('53', '阳泉市', 'YQS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('54', '长治市', 'CZS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('55', '晋城市', 'JCS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('56', '朔州市', 'SZS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('57', '晋中市', 'JZS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('58', '运城市', 'YCS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('59', '忻州市', 'XZS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('60', '临汾市', 'LFS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('61', '吕梁市', 'LLS', '4', ',0,4,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('62', '呼和浩特市', 'HHHTS', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('63', '包头市', 'BTS', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('64', '乌海市', 'WHS', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('65', '赤峰市', 'CFS', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('66', '通辽市', 'TLS', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('67', '鄂尔多斯市', 'EEDSS', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('68', '呼伦贝尔市', 'HLBES', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('69', '巴彦淖尔市', 'BYNES', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('70', '乌兰察布市', 'WLCBS', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('71', '兴安盟', 'XAM', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('72', '锡林郭勒盟', 'XLGLM', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('73', '阿拉善盟', 'ALSM', '5', ',0,5,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('74', '沈阳市', 'SYS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('75', '大连市', 'DLS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('76', '鞍山市', 'ASS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('77', '抚顺市', 'FSS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('78', '本溪市', 'BXS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('79', '丹东市', 'DDS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('80', '锦州市', 'JZS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('81', '营口市', 'YKS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('82', '阜新市', 'FXS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('83', '辽阳市', 'LYS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('84', '盘锦市', 'PJS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('85', '铁岭市', 'TLS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('86', '朝阳市', 'CYS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('87', '葫芦岛市', 'HLDS', '6', ',0,6,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('88', '长春市', 'CCS', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('89', '吉林市', 'JLS', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('90', '四平市', 'SPS', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('91', '辽源市', 'LYS', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('92', '通化市', 'THS', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('93', '白山市', 'BSS', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:57');
INSERT INTO `ab_sys_area` VALUES ('94', '松原市', 'SYS', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('95', '白城市', 'BCS', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('96', '延边朝鲜族自治州', 'YBCXZZZZ', '7', ',0,7,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('97', '哈尔滨市', 'HEBS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('98', '齐齐哈尔市', 'QQHES', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('99', '鸡西市', 'JXS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('100', '鹤岗市', 'HGS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('101', '双鸭山市', 'SYSS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('102', '大庆市', 'DQS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('103', '伊春市', 'YCS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('104', '佳木斯市', 'JMSS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('105', '七台河市', 'QTHS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('106', '牡丹江市', 'MDJS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('107', '黑河市', 'HHS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('108', '绥化市', 'SHS', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('109', '大兴安岭地区', 'DXALDQ', '8', ',0,8,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('110', '上海市辖区', 'SHSXQ', '9', ',0,9,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('111', '上海市辖县', 'SHSXX', '9', ',0,9,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('112', '南京市', 'NJS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('113', '无锡市', 'WXS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('114', '徐州市', 'XZS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('115', '常州市', 'CZS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('116', '苏州市', 'SZS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('117', '南通市', 'NTS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('118', '连云港市', 'LYGS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('119', '淮安市', 'HAS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('120', '盐城市', 'YCS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('121', '扬州市', 'YZS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('122', '镇江市', 'ZJS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('123', '泰州市', 'TZS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('124', '宿迁市', 'SQS', '10', ',0,10,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('125', '杭州市', 'HZS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('126', '宁波市', 'NBS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('127', '温州市', 'WZS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('128', '嘉兴市', 'JXS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('129', '湖州市', 'HZS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('130', '绍兴市', 'SXS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('131', '金华市', 'JHS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('132', '衢州市', 'QZS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('133', '舟山市', 'ZSS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('134', '台州市', 'TZS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('135', '丽水市', 'LSS', '11', ',0,11,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('136', '合肥市', 'HFS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('137', '芜湖市', 'WHS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('138', '蚌埠市', 'BBS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('139', '淮南市', 'HNS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('140', '马鞍山市', 'MASS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('141', '淮北市', 'HBS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('142', '铜陵市', 'TLS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('143', '安庆市', 'AQS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('144', '黄山市', 'HSS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('145', '滁州市', 'CZS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('146', '阜阳市', 'FYS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('147', '宿州市', 'SZS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('148', '巢湖市', 'CHS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('149', '六安市', 'LAS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('150', '亳州市', 'BZS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('151', '池州市', 'CZS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('152', '宣城市', 'XCS', '12', ',0,12,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('153', '福州市', 'FZS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('154', '厦门市', 'XMS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('155', '莆田市', 'PTS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('156', '三明市', 'SMS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:58');
INSERT INTO `ab_sys_area` VALUES ('157', '泉州市', 'QZS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('158', '漳州市', 'ZZS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('159', '南平市', 'NPS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('160', '龙岩市', 'LYS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('161', '宁德市', 'NDS', '13', ',0,13,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('162', '南昌市', 'NCS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('163', '景德镇市', 'JDZS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('164', '萍乡市', 'PXS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('165', '九江市', 'JJS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('166', '新余市', 'XYS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('167', '鹰潭市', 'YTS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('168', '赣州市', 'GZS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('169', '吉安市', 'JAS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('170', '宜春市', 'YCS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('171', '抚州市', 'FZS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('172', '上饶市', 'SRS', '14', ',0,14,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('173', '济南市', 'JNS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('174', '青岛市', 'QDS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('175', '淄博市', 'ZBS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('176', '枣庄市', 'ZZS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('177', '东营市', 'DYS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('178', '烟台市', 'YTS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('179', '潍坊市', 'WFS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('180', '济宁市', 'JNS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('181', '泰安市', 'TAS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('182', '威海市', 'WHS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('183', '日照市', 'RZS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('184', '莱芜市', 'LWS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('185', '临沂市', 'LYS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('186', '德州市', 'DZS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('187', '聊城市', 'LCS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('188', '滨州市', 'BZS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('189', '荷泽市', 'HZS', '15', ',0,15,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('190', '郑州市', 'ZZS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('191', '开封市', 'KFS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('192', '洛阳市', 'LYS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('193', '平顶山市', 'PDSS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('194', '安阳市', 'AYS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('195', '鹤壁市', 'HBS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('196', '新乡市', 'XXS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('197', '焦作市', 'JZS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('198', '濮阳市', 'PYS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('199', '许昌市', 'XCS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('200', '漯河市', 'LHS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('201', '三门峡市', 'SMXS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('202', '南阳市', 'NYS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('203', '商丘市', 'SQS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('204', '信阳市', 'XYS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('205', '周口市', 'ZKS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('206', '驻马店市', 'ZMDS', '16', ',0,16,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('207', '武汉市', 'WHS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('208', '黄石市', 'HSS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('209', '十堰市', 'SYS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('210', '宜昌市', 'YCS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('211', '襄樊市', 'XFS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('212', '鄂州市', 'EZS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('213', '荆门市', 'JMS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('214', '孝感市', 'XGS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('215', '荆州市', 'JZS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('216', '黄冈市', 'HGS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('217', '咸宁市', 'XNS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('218', '随州市', 'SZS', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('219', '恩施土家族苗族自治州', 'ESTJZMZZZZ', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('220', '省直辖行政单位', 'SZXXZDW', '17', ',0,17,', '0', '2', '0', '0', '2008-11-24 11:03:59');
INSERT INTO `ab_sys_area` VALUES ('221', '长沙市', 'CSS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('222', '株洲市', 'ZZS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('223', '湘潭市', 'XTS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('224', '衡阳市', 'HYS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('225', '邵阳市', 'SYS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('226', '岳阳市', 'YYS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('227', '常德市', 'CDS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('228', '张家界市', 'ZJJS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('229', '益阳市', 'YYS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('230', '郴州市', 'CZS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('231', '永州市', 'YZS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('232', '怀化市', 'HHS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('233', '娄底市', 'LDS', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('234', '湘西土家族苗族自治州', 'XXTJZMZZZZ', '18', ',0,18,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('235', '广州市', 'GZS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('236', '韶关市', 'SGS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('237', '深圳市', 'SZS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('238', '珠海市', 'ZHS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('239', '汕头市', 'STS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('240', '佛山市', 'FSS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('241', '江门市', 'JMS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('242', '湛江市', 'ZJS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('243', '茂名市', 'MMS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('244', '肇庆市', 'ZQS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('245', '惠州市', 'HZS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('246', '梅州市', 'MZS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('247', '汕尾市', 'SWS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('248', '河源市', 'HYS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('249', '阳江市', 'YJS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('250', '清远市', 'QYS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('251', '东莞市', 'DWS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('252', '中山市', 'ZSS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('253', '潮州市', 'CZS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('254', '揭阳市', 'JYS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('255', '云浮市', 'YFS', '19', ',0,19,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('256', '南宁市', 'NNS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('257', '柳州市', 'LZS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('258', '桂林市', 'GLS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('259', '梧州市', 'WZS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('260', '北海市', 'BHS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('261', '防城港市', 'FCGS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('262', '钦州市', 'QZS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('263', '贵港市', 'GGS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('264', '玉林市', 'YLS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('265', '百色市', 'BSS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('266', '贺州市', 'HZS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('267', '河池市', 'HCS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('268', '来宾市', 'LBS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('269', '崇左市', 'CZS', '20', ',0,20,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('270', '海口市', 'HKS', '21', ',0,21,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('271', '三亚市', 'SYS', '21', ',0,21,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('272', '省直辖县级行政单位', 'SZXXJXZDW', '21', ',0,21,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('273', '重庆市辖区', 'ZQSXQ', '22', ',0,22,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('274', '重庆市辖县', 'ZQSXX', '22', ',0,22,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('275', '重庆市辖市', 'ZQSXS', '22', ',0,22,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('276', '成都市', 'CDS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('277', '自贡市', 'ZGS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('278', '攀枝花市', 'PZHS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('279', '泸州市', 'LZS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('280', '德阳市', 'DYS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('281', '绵阳市', 'MYS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('282', '广元市', 'GYS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('283', '遂宁市', 'SNS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('284', '内江市', 'NJS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:00');
INSERT INTO `ab_sys_area` VALUES ('285', '乐山市', 'LSS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('286', '南充市', 'NCS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('287', '眉山市', 'MSS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('288', '宜宾市', 'YBS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('289', '广安市', 'GAS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('290', '达州市', 'DZS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('291', '雅安市', 'YAS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('292', '巴中市', 'BZS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('293', '资阳市', 'ZYS', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('294', '阿坝藏族羌族自治州', 'ABCZQZZZZ', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('295', '甘孜藏族自治州', 'GZCZZZZ', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('296', '凉山彝族自治州', 'LSYZZZZ', '23', ',0,23,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('297', '贵阳市', 'GYS', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('298', '六盘水市', 'LPSS', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('299', '遵义市', 'ZYS', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('300', '安顺市', 'ASS', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('301', '铜仁地区', 'TRDQ', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('302', '黔西南布依族苗族自治州', 'QXNBYZMZZZZ', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('303', '毕节地区', 'BJDQ', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('304', '黔东南苗族侗族自治州', 'QDNMZDZZZZ', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('305', '黔南布依族苗族自治州', 'QNBYZMZZZZ', '24', ',0,24,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('306', '昆明市', 'KMS', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('307', '曲靖市', 'QJS', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('308', '玉溪市', 'YXS', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('309', '保山市', 'BSS', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('310', '昭通市', 'ZTS', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('311', '丽江市', 'LJS', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('312', '思茅市', 'SMS', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('313', '临沧市', 'LCS', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('314', '楚雄彝族自治州', 'CXYZZZZ', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('315', '红河哈尼族彝族自治州', 'HHHNZYZZZZ', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('316', '文山壮族苗族自治州', 'WSZZMZZZZ', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('317', '西双版纳傣族自治州', 'XSBNDZZZZ', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('318', '大理白族自治州', 'DLBZZZZ', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('319', '德宏傣族景颇族自治州', 'DHDZJPZZZZ', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('320', '怒江傈僳族自治州', 'NJLSZZZZ', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('321', '迪庆藏族自治州', 'DQCZZZZ', '25', ',0,25,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('322', '拉萨市', 'LSS', '26', ',0,26,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('323', '昌都地区', 'CDDQ', '26', ',0,26,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('324', '山南地区', 'SNDQ', '26', ',0,26,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('325', '日喀则地区', 'RKZDQ', '26', ',0,26,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('326', '那曲地区', 'NQDQ', '26', ',0,26,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('327', '阿里地区', 'ALDQ', '26', ',0,26,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('328', '林芝地区', 'LZDQ', '26', ',0,26,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('329', '西安市', 'XAS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('330', '铜川市', 'TCS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('331', '宝鸡市', 'BJS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('332', '咸阳市', 'XYS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('333', '渭南市', 'WNS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('334', '延安市', 'YAS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('335', '汉中市', 'HZS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('336', '榆林市', 'YLS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('337', '安康市', 'AKS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('338', '商洛市', 'SLS', '27', ',0,27,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('339', '兰州市', 'LZS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('340', '嘉峪关市', 'JYGS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('341', '金昌市', 'JCS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('342', '白银市', 'BYS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('343', '天水市', 'TSS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('344', '武威市', 'WWS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('345', '张掖市', 'ZYS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:01');
INSERT INTO `ab_sys_area` VALUES ('346', '平凉市', 'PLS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('347', '酒泉市', 'JQS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('348', '庆阳市', 'QYS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('349', '定西市', 'DXS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('350', '陇南市', 'LNS', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('351', '临夏回族自治州', 'LXHZZZZ', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('352', '甘南藏族自治州', 'GNCZZZZ', '28', ',0,28,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('353', '西宁市', 'XNS', '29', ',0,29,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('354', '海东地区', 'HDDQ', '29', ',0,29,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('355', '海北藏族自治州', 'HBCZZZZ', '29', ',0,29,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('356', '黄南藏族自治州', 'HNCZZZZ', '29', ',0,29,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('357', '海南藏族自治州', 'HNCZZZZ', '29', ',0,29,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('358', '果洛藏族自治州', 'GLCZZZZ', '29', ',0,29,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('359', '玉树藏族自治州', 'YSCZZZZ', '29', ',0,29,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('360', '海西蒙古族藏族自治州', 'HXMGZCZZZZ', '29', ',0,29,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('361', '银川市', 'YCS', '30', ',0,30,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('362', '石嘴山市', 'SZSS', '30', ',0,30,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('363', '吴忠市', 'WZS', '30', ',0,30,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('364', '固原市', 'GYS', '30', ',0,30,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('365', '中卫市', 'ZWS', '30', ',0,30,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('366', '乌鲁木齐市', 'WLMQS', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('367', '克拉玛依市', 'KLMYS', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('368', '吐鲁番地区', 'TLFDQ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('369', '哈密地区', 'HMDQ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('370', '昌吉回族自治州', 'CJHZZZZ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('371', '博尔塔拉蒙古自治州', 'BETLMGZZZ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('372', '巴音郭楞蒙古自治州', 'BYGLMGZZZ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('373', '阿克苏地区', 'AKSDQ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('374', '克孜勒苏柯尔克孜自治州', 'KZLSKEKZZZZ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('375', '喀什地区', 'KSDQ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('376', '和田地区', 'HTDQ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('377', '伊犁哈萨克自治州', 'YLHSKZZZ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('378', '塔城地区', 'TCDQ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('379', '阿勒泰地区', 'ALTDQ', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('380', '省直辖行政单位', 'SZXXZDW', '31', ',0,31,', '0', '2', '0', '0', '2008-11-24 11:04:02');
INSERT INTO `ab_sys_area` VALUES ('401', '北京市区_东城区', 'BJSQ_DCQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('402', '北京市区_西城区', 'XCQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('403', '北京市区_崇文区', 'CWQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('404', '北京市区_宣武区', 'XWQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('405', '北京市区_朝阳区', 'CYQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('407', '北京市区_石景山区', 'SJSQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('408', '北京市区_海淀区', 'HDQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('409', '北京市区_门头沟区', 'MTGQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('410', '北京市区_房山区', 'FSQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('411', '北京市区_通州区', 'TZQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('412', '北京市区_顺义区', 'SYQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('413', '北京市区_昌平区', 'CPQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('414', '北京市区_大兴区', 'DXQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('415', '北京市区_怀柔区', 'HRQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('416', '北京市区_平谷区', 'PGQ', '36', ',0,1,36,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('417', '北京郊县_密云县', 'BJJXMYX', '37', ',0,1,37,', '0', '3', '0', '1', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('418', '北京郊县_延庆县', 'YQX', '37', ',0,1,37,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('419', '天津市区_和平区', 'HPQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('420', '天津市区_河东区', 'HDQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('421', '天津市区_河西区', 'HXQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('422', '天津市区_南开区', 'NKQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('423', '天津市区_河北区', 'HBQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('424', '天津市区_红桥区', 'HQQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('425', '天津市区_塘沽区', 'TGQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('426', '天津市区_汉沽区', 'HGQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('427', '天津市区_大港区', 'DGQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('428', '天津市区_东丽区', 'DLQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('429', '天津市区_西青区', 'XQQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('430', '天津市区_津南区', 'JNQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('431', '天津市区_北辰区', 'BCQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('432', '天津市区_武清区', 'WQQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('433', '天津市区_宝坻区', 'BDQ', '38', ',0,2,38,', '0', '3', '0', '0', '2008-11-24 11:05:41');
INSERT INTO `ab_sys_area` VALUES ('434', '天津郊县_宁河县A', 'TJJXNHXA', '39', ',0,2,39,', '0', '3', '0', '1', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('435', '天津郊县_静海县', 'JHX', '39', ',0,2,39,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('436', '天津郊县_蓟县', 'JX', '39', ',0,2,39,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('437', '石家庄市_市辖区', 'SXQ', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('438', '石家庄市_长安区', 'CAQ', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('439', '石家庄市_桥东区', 'QDQ', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('440', '石家庄市_桥西区', 'QXQ', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('441', '石家庄市_新华区', 'XHQ', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('442', '石家庄市_井陉矿区', 'JXKQ', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('443', '石家庄市_裕华区', 'YHQ', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('444', '石家庄市_井陉县', 'JXX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('445', '石家庄市_正定县', 'ZDX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('446', '石家庄市_栾城县', 'LCX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('447', '石家庄市_行唐县', 'XTX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('448', '石家庄市_灵寿县', 'LSX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('449', '石家庄市_高邑县', 'GYX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('450', '石家庄市_深泽县', 'SZX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('451', '石家庄市_赞皇县', 'ZHX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('452', '石家庄市_无极县', 'WJX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('453', '石家庄市_平山县', 'PSX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('454', '石家庄市_元氏县', 'YSX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('455', '石家庄市_赵县', 'ZX', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('456', '石家庄市_辛集市', 'XJS', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('457', '石家庄市_藁城市', 'GCS', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('458', '石家庄市_晋州市', 'JZS', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('459', '石家庄市_新乐市', 'XLS', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('460', '石家庄市_鹿泉市', 'LQS', '40', ',0,3,40,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('461', '唐山市_市辖区', 'SXQ', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('462', '唐山市_路南区', 'LNQ', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('463', '唐山市_路北区', 'LBQ', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('464', '唐山市_古冶区', 'GYQ', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('465', '唐山市_开平区', 'KPQ', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('466', '唐山市_丰南区', 'FNQ', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('467', '唐山市_丰润区', 'FRQ', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('468', '唐山市_滦县', 'LX', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('469', '唐山市_滦南县', 'LNX', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('470', '唐山市_乐亭县', 'LTX', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('471', '唐山市_迁西县', 'QXX', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('472', '唐山市_玉田县', 'YTX', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('473', '唐山市_唐海县', 'THX', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('474', '唐山市_遵化市', 'ZHS', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('475', '唐山市_迁安市', 'QAS', '41', ',0,3,41,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('476', '秦皇岛市_市辖区', 'SXQ', '42', ',0,3,42,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('477', '秦皇岛市_海港区', 'HGQ', '42', ',0,3,42,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('478', '秦皇岛市_山海关区', 'SHGQ', '42', ',0,3,42,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('479', '秦皇岛市_北戴河区', 'BDHQ', '42', ',0,3,42,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('480', '秦皇岛市_青龙满族自治县', 'QLMZZZX', '42', ',0,3,42,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('481', '秦皇岛市_昌黎县', 'CLX', '42', ',0,3,42,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('482', '秦皇岛市_抚宁县', 'FNX', '42', ',0,3,42,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('483', '秦皇岛市_卢龙县', 'LLX', '42', ',0,3,42,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('484', '邯郸市_市辖区', 'SXQ', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('485', '邯郸市_邯山区', 'HSQ', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('486', '邯郸市_丛台区', 'CTQ', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('487', '邯郸市_复兴区', 'FXQ', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('488', '邯郸市_峰峰矿区', 'FFKQ', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('489', '邯郸市_邯郸县', 'HDX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('490', '邯郸市_临漳县', 'LZX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('491', '邯郸市_成安县', 'CAX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('492', '邯郸市_大名县', 'DMX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('493', '邯郸市_涉县', 'SX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('494', '邯郸市_磁县', 'CX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('495', '邯郸市_肥乡县', 'FXX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('496', '邯郸市_永年县', 'YNX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('497', '邯郸市_邱县', 'QX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:42');
INSERT INTO `ab_sys_area` VALUES ('498', '邯郸市_鸡泽县', 'JZX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('499', '邯郸市_广平县', 'GPX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('500', '邯郸市_馆陶县', 'GTX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('501', '邯郸市_魏县', 'WX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('502', '邯郸市_曲周县', 'QZX', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('503', '邯郸市_武安市', 'WAS', '43', ',0,3,43,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('504', '邢台市_市辖区', 'SXQ', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('505', '邢台市_桥东区', 'QDQ', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('506', '邢台市_桥西区', 'QXQ', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('507', '邢台市_邢台县', 'XTX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('508', '邢台市_临城县', 'LCX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('509', '邢台市_内丘县', 'NQX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('510', '邢台市_柏乡县', 'BXX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('511', '邢台市_隆尧县', 'LYX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('512', '邢台市_任县', 'RX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('513', '邢台市_南和县', 'NHX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('514', '邢台市_宁晋县', 'NJX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('515', '邢台市_巨鹿县', 'JLX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('516', '邢台市_新河县', 'XHX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('517', '邢台市_广宗县', 'GZX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('518', '邢台市_平乡县', 'PXX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('519', '邢台市_威县', 'WX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('520', '邢台市_清河县', 'QHX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('521', '邢台市_临西县', 'LXX', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('522', '邢台市_南宫市', 'NGS', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('523', '邢台市_沙河市', 'SHS', '44', ',0,3,44,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('524', '保定市_市辖区', 'SXQ', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('525', '保定市_新市区', 'XSQ', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('526', '保定市_北市区', 'BSQ', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('527', '保定市_南市区', 'NSQ', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('528', '保定市_满城县', 'MCX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('529', '保定市_清苑县', 'QYX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('530', '保定市_涞水县', 'LSX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('531', '保定市_阜平县', 'FPX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('532', '保定市_徐水县', 'XSX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('533', '保定市_定兴县', 'DXX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('534', '保定市_唐县', 'TX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('535', '保定市_高阳县', 'GYX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('536', '保定市_容城县', 'RCX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('537', '保定市_涞源县', 'LYX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('538', '保定市_望都县', 'WDX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('539', '保定市_安新县', 'AXX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('540', '保定市_易县', 'YX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('541', '保定市_曲阳县', 'QYX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('542', '保定市_蠡县', 'LX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('543', '保定市_顺平县', 'SPX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('544', '保定市_博野县', 'BYX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('545', '保定市_雄县', 'XX', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('546', '保定市_涿州市', 'ZZS', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('547', '保定市_定州市', 'DZS', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('548', '保定市_安国市', 'AGS', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('549', '保定市_高碑店市', 'GBDS', '45', ',0,3,45,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('550', '张家口市_市辖区', 'SXQ', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('551', '张家口市_桥东区', 'QDQ', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('552', '张家口市_桥西区', 'QXQ', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('553', '张家口市_宣化区', 'XHQ', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('554', '张家口市_下花园区', 'XHYQ', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('555', '张家口市_宣化县', 'XHX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('556', '张家口市_张北县', 'ZBX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('557', '张家口市_康保县', 'KBX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('558', '张家口市_沽源县', 'GYX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('559', '张家口市_尚义县', 'SYX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('560', '张家口市_蔚县', 'WX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('561', '张家口市_阳原县', 'YYX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:43');
INSERT INTO `ab_sys_area` VALUES ('562', '张家口市_怀安县', 'HAX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('563', '张家口市_万全县', 'WQX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('564', '张家口市_怀来县', 'HLX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('565', '张家口市_涿鹿县', 'ZLX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('566', '张家口市_赤城县', 'CCX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('567', '张家口市_崇礼县', 'CLX', '46', ',0,3,46,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('568', '承德市_市辖区', 'SXQ', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('569', '承德市_双桥区', 'SQQ', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('570', '承德市_双滦区', 'SLQ', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('571', '承德市_鹰手营子矿区', 'YSYZKQ', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('572', '承德市_承德县', 'CDX', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('573', '承德市_兴隆县', 'XLX', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('574', '承德市_平泉县', 'PQX', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('575', '承德市_滦平县', 'LPX', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('576', '承德市_隆化县', 'LHX', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('577', '承德市_丰宁满族自治县', 'FNMZZZX', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('578', '承德市_宽城满族自治县', 'KCMZZZX', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('579', '承德市_围场满族蒙古族自治县', 'WCMZMGZZZX', '47', ',0,3,47,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('580', '沧州市_市辖区', 'SXQ', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('581', '沧州市_新华区', 'XHQ', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('582', '沧州市_运河区', 'YHQ', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('583', '沧州市_沧县', 'CX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('584', '沧州市_青县', 'QX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('585', '沧州市_东光县', 'DGX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('586', '沧州市_海兴县', 'HXX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('587', '沧州市_盐山县', 'YSX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('588', '沧州市_肃宁县', 'SNX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('589', '沧州市_南皮县', 'NPX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('590', '沧州市_吴桥县', 'WQX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('591', '沧州市_献县', 'XX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('592', '沧州市_孟村回族自治县', 'MCHZZZX', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('593', '沧州市_泊头市', 'BTS', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('594', '沧州市_任丘市', 'RQS', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('595', '沧州市_黄骅市', 'HHS', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('596', '沧州市_河间市', 'HJS', '48', ',0,3,48,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('597', '廊坊市_市辖区', 'SXQ', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('598', '廊坊市_安次区', 'ACQ', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('599', '廊坊市_广阳区', 'GYQ', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('600', '廊坊市_固安县', 'GAX', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('601', '廊坊市_永清县', 'YQX', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('602', '廊坊市_香河县', 'XHX', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('603', '廊坊市_大城县', 'DCX', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('604', '廊坊市_文安县', 'WAX', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('605', '廊坊市_大厂回族自治县', 'DCHZZZX', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('606', '廊坊市_霸州市', 'BZS', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('607', '廊坊市_三河市', 'SHS', '49', ',0,3,49,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('608', '衡水市_市辖区', 'SXQ', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('609', '衡水市_桃城区', 'TCQ', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('610', '衡水市_枣强县', 'ZQX', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('611', '衡水市_武邑县', 'WYX', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('612', '衡水市_武强县', 'WQX', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('613', '衡水市_饶阳县', 'RYX', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('614', '衡水市_安平县', 'APX', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('615', '衡水市_故城县', 'GCX', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('616', '衡水市_景县', 'JX', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('617', '衡水市_阜城县', 'FCX', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('618', '衡水市_冀州市', 'JZS', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('619', '衡水市_深州市', 'SZS', '50', ',0,3,50,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('620', '太原市_市辖区', 'SXQ', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('621', '太原市_小店区', 'XDQ', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('622', '太原市_迎泽区', 'YZQ', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('623', '太原市_杏花岭区', 'XHLQ', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('624', '太原市_尖草坪区', 'JCPQ', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('625', '太原市_万柏林区', 'WBLQ', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:44');
INSERT INTO `ab_sys_area` VALUES ('626', '太原市_晋源区', 'JYQ', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('627', '太原市_清徐县', 'QXX', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('628', '太原市_阳曲县', 'YQX', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('629', '太原市_娄烦县', 'LFX', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('630', '太原市_古交市', 'GJS', '51', ',0,4,51,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('631', '大同市_市辖区', 'SXQ', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('632', '大同市_城区', 'CQ', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('633', '大同市_矿区', 'KQ', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('634', '大同市_南郊区', 'NJQ', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('635', '大同市_新荣区', 'XRQ', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('636', '大同市_阳高县', 'YGX', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('637', '大同市_天镇县', 'TZX', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('638', '大同市_广灵县', 'GLX', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('639', '大同市_灵丘县', 'LQX', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('640', '大同市_浑源县', 'HYX', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('641', '大同市_左云县', 'ZYX', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('642', '大同市_大同县', 'DTX', '52', ',0,4,52,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('643', '阳泉市_市辖区', 'SXQ', '53', ',0,4,53,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('644', '阳泉市_城区', 'CQ', '53', ',0,4,53,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('645', '阳泉市_矿区', 'KQ', '53', ',0,4,53,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('646', '阳泉市_郊区', 'JQ', '53', ',0,4,53,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('647', '阳泉市_平定县', 'PDX', '53', ',0,4,53,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('648', '阳泉市_盂县', 'YX', '53', ',0,4,53,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('649', '长治市_市辖区', 'SXQ', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('650', '长治市_城区', 'CQ', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('651', '长治市_郊区', 'JQ', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('652', '长治市_长治县', 'CZX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('653', '长治市_襄垣县', 'XYX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('654', '长治市_屯留县', 'TLX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('655', '长治市_平顺县', 'PSX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('656', '长治市_黎城县', 'LCX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('657', '长治市_壶关县', 'HGX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('658', '长治市_长子县', 'CZX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('659', '长治市_武乡县', 'WXX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('660', '长治市_沁县', 'QX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('661', '长治市_沁源县', 'QYX', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('662', '长治市_潞城市', 'LCS', '54', ',0,4,54,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('663', '晋城市_市辖区', 'SXQ', '55', ',0,4,55,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('664', '晋城市_城区', 'CQ', '55', ',0,4,55,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('665', '晋城市_沁水县', 'QSX', '55', ',0,4,55,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('666', '晋城市_阳城县', 'YCX', '55', ',0,4,55,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('667', '晋城市_陵川县', 'LCX', '55', ',0,4,55,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('668', '晋城市_泽州县', 'ZZX', '55', ',0,4,55,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('669', '晋城市_高平市', 'GPS', '55', ',0,4,55,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('670', '朔州市_市辖区', 'SXQ', '56', ',0,4,56,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('671', '朔州市_朔城区', 'SCQ', '56', ',0,4,56,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('672', '朔州市_平鲁区', 'PLQ', '56', ',0,4,56,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('673', '朔州市_山阴县', 'SYX', '56', ',0,4,56,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('674', '朔州市_应县', 'YX', '56', ',0,4,56,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('675', '朔州市_右玉县', 'YYX', '56', ',0,4,56,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('676', '朔州市_怀仁县', 'HRX', '56', ',0,4,56,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('677', '晋中市_市辖区', 'SXQ', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('678', '晋中市_榆次区', 'YCQ', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('679', '晋中市_榆社县', 'YSX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('680', '晋中市_左权县', 'ZQX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('681', '晋中市_和顺县', 'HSX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('682', '晋中市_昔阳县', 'XYX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('683', '晋中市_寿阳县', 'SYX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('684', '晋中市_太谷县', 'TGX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('685', '晋中市_祁县', 'QX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('686', '晋中市_平遥县', 'PYX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('687', '晋中市_灵石县', 'LSX', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('688', '晋中市_介休市', 'JXS', '57', ',0,4,57,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('689', '运城市_市辖区', 'SXQ', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('690', '运城市_盐湖区', 'YHQ', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:45');
INSERT INTO `ab_sys_area` VALUES ('691', '运城市_临猗县', 'LYX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('692', '运城市_万荣县', 'WRX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('693', '运城市_闻喜县', 'WXX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('694', '运城市_稷山县', 'JSX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('695', '运城市_新绛县', 'XJX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('696', '运城市_绛县', 'JX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('697', '运城市_垣曲县', 'YQX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('698', '运城市_夏县', 'XX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('699', '运城市_平陆县', 'PLX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('700', '运城市_芮城县', 'RCX', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('701', '运城市_永济市', 'YJS', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('702', '运城市_河津市', 'HJS', '58', ',0,4,58,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('703', '忻州市_市辖区', 'SXQ', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('704', '忻州市_忻府区', 'XFQ', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('705', '忻州市_定襄县', 'DXX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('706', '忻州市_五台县', 'WTX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('707', '忻州市_代县', 'DX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('708', '忻州市_繁峙县', 'FZX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('709', '忻州市_宁武县', 'NWX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('710', '忻州市_静乐县', 'JLX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('711', '忻州市_神池县', 'SCX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('712', '忻州市_五寨县', 'WZX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('713', '忻州市_岢岚县', 'KLX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('714', '忻州市_河曲县', 'HQX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('715', '忻州市_保德县', 'BDX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('716', '忻州市_偏关县', 'PGX', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('717', '忻州市_原平市', 'YPS', '59', ',0,4,59,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('718', '临汾市_市辖区', 'SXQ', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('719', '临汾市_尧都区', 'YDQ', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('720', '临汾市_曲沃县', 'QWX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('721', '临汾市_翼城县', 'YCX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('722', '临汾市_襄汾县', 'XFX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('723', '临汾市_洪洞县', 'HDX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('724', '临汾市_古县', 'GX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('725', '临汾市_安泽县', 'AZX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('726', '临汾市_浮山县', 'FSX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('727', '临汾市_吉县', 'JX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('728', '临汾市_乡宁县', 'XNX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('729', '临汾市_大宁县', 'DNX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('730', '临汾市_隰县', 'XX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('731', '临汾市_永和县', 'YHX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('732', '临汾市_蒲县', 'PX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('733', '临汾市_汾西县', 'FXX', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('734', '临汾市_侯马市', 'HMS', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('735', '临汾市_霍州市', 'HZS', '60', ',0,4,60,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('736', '吕梁市_市辖区', 'SXQ', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('737', '吕梁市_离石区', 'LSQ', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('738', '吕梁市_文水县', 'WSX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('739', '吕梁市_交城县', 'JCX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('740', '吕梁市_兴县', 'XX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('741', '吕梁市_临县', 'LX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('742', '吕梁市_柳林县', 'LLX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('743', '吕梁市_石楼县', 'SLX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('744', '吕梁市_岚县', 'LX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('745', '吕梁市_方山县', 'FSX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('746', '吕梁市_中阳县', 'ZYX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('747', '吕梁市_交口县', 'JKX', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('748', '吕梁市_孝义市', 'XYS', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('749', '吕梁市_汾阳市', 'FYS', '61', ',0,4,61,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('750', '呼和浩特市_市辖区', 'SXQ', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('751', '呼和浩特市_新城区', 'XCQ', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('752', '呼和浩特市_回民区', 'HMQ', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('753', '呼和浩特市_玉泉区', 'YQQ', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('754', '呼和浩特市_赛罕区', 'SHQ', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:46');
INSERT INTO `ab_sys_area` VALUES ('755', '呼和浩特市_土默特左旗', 'TMTZQ', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('756', '呼和浩特市_托克托县', 'TKTX', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('757', '呼和浩特市_和林格尔县', 'HLGEX', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('758', '呼和浩特市_清水河县', 'QSHX', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('759', '呼和浩特市_武川县', 'WCX', '62', ',0,5,62,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('760', '包头市_市辖区', 'SXQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('761', '包头市_东河区', 'DHQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('762', '包头市_昆都仑区', 'KDLQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('763', '包头市_青山区', 'QSQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('764', '包头市_石拐区', 'SGQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('765', '包头市_白云矿区', 'BYKQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('766', '包头市_九原区', 'JYQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('767', '包头市_土默特右旗', 'TMTYQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('768', '包头市_固阳县', 'GYX', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('769', '包头市_达尔罕茂明安联合旗', 'DEHMMALHQ', '63', ',0,5,63,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('770', '乌海市_市辖区', 'SXQ', '64', ',0,5,64,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('771', '乌海市_海勃湾区', 'HBWQ', '64', ',0,5,64,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('772', '乌海市_海南区', 'HNQ', '64', ',0,5,64,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('773', '乌海市_乌达区', 'WDQ', '64', ',0,5,64,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('774', '赤峰市_市辖区', 'SXQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('775', '赤峰市_红山区', 'HSQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('776', '赤峰市_元宝山区', 'YBSQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('777', '赤峰市_松山区', 'SSQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('778', '赤峰市_阿鲁科尔沁旗', 'ALKEQQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('779', '赤峰市_巴林左旗', 'BLZQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('780', '赤峰市_巴林右旗', 'BLYQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('781', '赤峰市_林西县', 'LXX', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('782', '赤峰市_克什克腾旗', 'KSKTQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('783', '赤峰市_翁牛特旗', 'WNTQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('784', '赤峰市_喀喇沁旗', 'KLQQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('785', '赤峰市_宁城县', 'NCX', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('786', '赤峰市_敖汉旗', 'AHQ', '65', ',0,5,65,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('787', '通辽市_市辖区', 'SXQ', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('788', '通辽市_科尔沁区', 'KEQQ', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('789', '通辽市_科尔沁左翼中旗', 'KEQZYZQ', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('790', '通辽市_科尔沁左翼后旗', 'KEQZYHQ', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('791', '通辽市_开鲁县', 'KLX', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('792', '通辽市_库伦旗', 'KLQ', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('793', '通辽市_奈曼旗', 'NMQ', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('794', '通辽市_扎鲁特旗', 'ZLTQ', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('795', '通辽市_霍林郭勒市', 'HLGLS', '66', ',0,5,66,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('796', '鄂尔多斯市_东胜区', 'DSQ', '67', ',0,5,67,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('797', '鄂尔多斯市_达拉特旗', 'DLTQ', '67', ',0,5,67,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('798', '鄂尔多斯市_准格尔旗', 'ZGEQ', '67', ',0,5,67,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('799', '鄂尔多斯市_鄂托克前旗', 'ETKQQ', '67', ',0,5,67,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('800', '鄂尔多斯市_鄂托克旗', 'ETKQ', '67', ',0,5,67,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('801', '鄂尔多斯市_杭锦旗', 'HJQ', '67', ',0,5,67,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('802', '鄂尔多斯市_乌审旗', 'WSQ', '67', ',0,5,67,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('803', '鄂尔多斯市_伊金霍洛旗', 'YJHLQ', '67', ',0,5,67,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('804', '呼伦贝尔市_市辖区', 'SXQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('805', '呼伦贝尔市_海拉尔区', 'HLEQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('806', '呼伦贝尔市_阿荣旗', 'ARQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('807', '呼伦贝尔市_莫力达瓦达斡尔族自治旗', 'MLDWDWEZZZQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('808', '呼伦贝尔市_鄂伦春自治旗', 'ELCZZQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('809', '呼伦贝尔市_鄂温克族自治旗', 'EWKZZZQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('810', '呼伦贝尔市_陈巴尔虎旗', 'CBEHQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('811', '呼伦贝尔市_新巴尔虎左旗', 'XBEHZQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('812', '呼伦贝尔市_新巴尔虎右旗', 'XBEHYQ', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('813', '呼伦贝尔市_满洲里市', 'MZLS', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('814', '呼伦贝尔市_牙克石市', 'YKSS', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('815', '呼伦贝尔市_扎兰屯市', 'ZLTS', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('816', '呼伦贝尔市_额尔古纳市', 'EEGNS', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('817', '呼伦贝尔市_根河市', 'GHS', '68', ',0,5,68,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('818', '巴彦淖尔市_市辖区', 'SXQ', '69', ',0,5,69,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('819', '巴彦淖尔市_临河区', 'LHQ', '69', ',0,5,69,', '0', '3', '0', '0', '2008-11-24 11:05:47');
INSERT INTO `ab_sys_area` VALUES ('820', '巴彦淖尔市_五原县', 'WYX', '69', ',0,5,69,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('821', '巴彦淖尔市_磴口县', 'DKX', '69', ',0,5,69,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('822', '巴彦淖尔市_乌拉特前旗', 'WLTQQ', '69', ',0,5,69,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('823', '巴彦淖尔市_乌拉特中旗', 'WLTZQ', '69', ',0,5,69,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('824', '巴彦淖尔市_乌拉特后旗', 'WLTHQ', '69', ',0,5,69,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('825', '巴彦淖尔市_杭锦后旗', 'HJHQ', '69', ',0,5,69,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('826', '乌兰察布市_市辖区', 'SXQ', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('827', '乌兰察布市_集宁区', 'JNQ', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('828', '乌兰察布市_卓资县', 'ZZX', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('829', '乌兰察布市_化德县', 'HDX', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('830', '乌兰察布市_商都县', 'SDX', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('831', '乌兰察布市_兴和县', 'XHX', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('832', '乌兰察布市_凉城县', 'LCX', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('833', '乌兰察布市_察哈尔右翼前旗', 'CHEYYQQ', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('834', '乌兰察布市_察哈尔右翼中旗', 'CHEYYZQ', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('835', '乌兰察布市_察哈尔右翼后旗', 'CHEYYHQ', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('836', '乌兰察布市_四子王旗', 'SZWQ', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('837', '乌兰察布市_丰镇市', 'FZS', '70', ',0,5,70,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('838', '兴安盟_乌兰浩特市', 'WLHTS', '71', ',0,5,71,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('839', '兴安盟_阿尔山市', 'AESS', '71', ',0,5,71,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('840', '兴安盟_科尔沁右翼前旗', 'KEQYYQQ', '71', ',0,5,71,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('841', '兴安盟_科尔沁右翼中旗', 'KEQYYZQ', '71', ',0,5,71,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('842', '兴安盟_扎赉特旗', 'ZLTQ', '71', ',0,5,71,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('843', '兴安盟_突泉县', 'TQX', '71', ',0,5,71,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('844', '锡林郭勒盟_二连浩特市', 'ELHTS', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('845', '锡林郭勒盟_锡林浩特市', 'XLHTS', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('846', '锡林郭勒盟_阿巴嘎旗', 'ABGQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('847', '锡林郭勒盟_苏尼特左旗', 'SNTZQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('848', '锡林郭勒盟_苏尼特右旗', 'SNTYQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('849', '锡林郭勒盟_东乌珠穆沁旗', 'DWZMQQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('850', '锡林郭勒盟_西乌珠穆沁旗', 'XWZMQQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('851', '锡林郭勒盟_太仆寺旗', 'TPSQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('852', '锡林郭勒盟_镶黄旗', 'XHQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('853', '锡林郭勒盟_正镶白旗', 'ZXBQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('854', '锡林郭勒盟_正蓝旗', 'ZLQ', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('855', '锡林郭勒盟_多伦县', 'DLX', '72', ',0,5,72,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('856', '阿拉善盟_阿拉善左旗', 'ALSZQ', '73', ',0,5,73,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('857', '阿拉善盟_阿拉善右旗', 'ALSYQ', '73', ',0,5,73,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('858', '阿拉善盟_额济纳旗', 'EJNQ', '73', ',0,5,73,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('859', '沈阳市_市辖区', 'SXQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('860', '沈阳市_和平区', 'HPQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('861', '沈阳市_沈河区', 'SHQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('862', '沈阳市_大东区', 'DDQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('863', '沈阳市_皇姑区', 'HGQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('864', '沈阳市_铁西区', 'TXQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('865', '沈阳市_苏家屯区', 'SJTQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('866', '沈阳市_东陵区', 'DLQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('867', '沈阳市_新城子区', 'XCZQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('868', '沈阳市_于洪区', 'YHQ', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('869', '沈阳市_辽中县', 'LZX', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('870', '沈阳市_康平县', 'KPX', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('871', '沈阳市_法库县', 'FKX', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('872', '沈阳市_新民市', 'XMS', '74', ',0,6,74,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('873', '大连市_市辖区', 'SXQ', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('874', '大连市_中山区', 'ZSQ', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('875', '大连市_西岗区', 'XGQ', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('876', '大连市_沙河口区', 'SHKQ', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('877', '大连市_甘井子区', 'GJZQ', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('878', '大连市_旅顺口区', 'LSKQ', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('879', '大连市_金州区', 'JZQ', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('880', '大连市_长海县', 'CHX', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('881', '大连市_瓦房店市', 'WFDS', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('882', '大连市_普兰店市', 'PLDS', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('883', '大连市_庄河市', 'ZHS', '75', ',0,6,75,', '0', '3', '0', '0', '2008-11-24 11:05:48');
INSERT INTO `ab_sys_area` VALUES ('884', '鞍山市_市辖区', 'SXQ', '76', ',0,6,76,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('885', '鞍山市_铁东区', 'TDQ', '76', ',0,6,76,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('886', '鞍山市_铁西区', 'TXQ', '76', ',0,6,76,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('887', '鞍山市_立山区', 'LSQ', '76', ',0,6,76,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('888', '鞍山市_千山区', 'QSQ', '76', ',0,6,76,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('889', '鞍山市_台安县', 'TAX', '76', ',0,6,76,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('890', '鞍山市_岫岩满族自治县', 'XYMZZZX', '76', ',0,6,76,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('891', '鞍山市_海城市', 'HCS', '76', ',0,6,76,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('892', '抚顺市_市辖区', 'SXQ', '77', ',0,6,77,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('893', '抚顺市_新抚区', 'XFQ', '77', ',0,6,77,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('894', '抚顺市_东洲区', 'DZQ', '77', ',0,6,77,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('895', '抚顺市_望花区', 'WHQ', '77', ',0,6,77,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('896', '抚顺市_顺城区', 'SCQ', '77', ',0,6,77,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('897', '抚顺市_抚顺县', 'FSX', '77', ',0,6,77,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('898', '抚顺市_新宾满族自治县', 'XBMZZZX', '77', ',0,6,77,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('899', '抚顺市_清原满族自治县', 'QYMZZZX', '77', ',0,6,77,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('900', '本溪市_市辖区', 'SXQ', '78', ',0,6,78,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('901', '本溪市_平山区', 'PSQ', '78', ',0,6,78,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('902', '本溪市_溪湖区', 'XHQ', '78', ',0,6,78,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('903', '本溪市_明山区', 'MSQ', '78', ',0,6,78,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('904', '本溪市_南芬区', 'NFQ', '78', ',0,6,78,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('905', '本溪市_本溪满族自治县', 'BXMZZZX', '78', ',0,6,78,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('906', '本溪市_桓仁满族自治县', 'HRMZZZX', '78', ',0,6,78,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('907', '丹东市_市辖区', 'SXQ', '79', ',0,6,79,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('908', '丹东市_元宝区', 'YBQ', '79', ',0,6,79,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('909', '丹东市_振兴区', 'ZXQ', '79', ',0,6,79,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('910', '丹东市_振安区', 'ZAQ', '79', ',0,6,79,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('911', '丹东市_宽甸满族自治县', 'KDMZZZX', '79', ',0,6,79,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('912', '丹东市_东港市', 'DGS', '79', ',0,6,79,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('913', '丹东市_凤城市', 'FCS', '79', ',0,6,79,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('914', '锦州市_市辖区', 'SXQ', '80', ',0,6,80,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('915', '锦州市_古塔区', 'GTQ', '80', ',0,6,80,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('916', '锦州市_凌河区', 'LHQ', '80', ',0,6,80,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('917', '锦州市_太和区', 'THQ', '80', ',0,6,80,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('918', '锦州市_黑山县', 'HSX', '80', ',0,6,80,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('919', '锦州市_义县', 'YX', '80', ',0,6,80,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('920', '锦州市_凌海市', 'LHS', '80', ',0,6,80,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('921', '锦州市_北宁市', 'BNS', '80', ',0,6,80,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('922', '营口市_市辖区', 'SXQ', '81', ',0,6,81,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('923', '营口市_站前区', 'ZQQ', '81', ',0,6,81,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('924', '营口市_西市区', 'XSQ', '81', ',0,6,81,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('925', '营口市_鲅鱼圈区', 'BYQQ', '81', ',0,6,81,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('926', '营口市_老边区', 'LBQ', '81', ',0,6,81,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('927', '营口市_盖州市', 'GZS', '81', ',0,6,81,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('928', '营口市_大石桥市', 'DSQS', '81', ',0,6,81,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('929', '阜新市_市辖区', 'SXQ', '82', ',0,6,82,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('930', '阜新市_海州区', 'HZQ', '82', ',0,6,82,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('931', '阜新市_新邱区', 'XQQ', '82', ',0,6,82,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('932', '阜新市_太平区', 'TPQ', '82', ',0,6,82,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('933', '阜新市_清河门区', 'QHMQ', '82', ',0,6,82,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('934', '阜新市_细河区', 'XHQ', '82', ',0,6,82,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('935', '阜新市_阜新蒙古族自治县', 'FXMGZZZX', '82', ',0,6,82,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('936', '阜新市_彰武县', 'ZWX', '82', ',0,6,82,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('937', '辽阳市_市辖区', 'SXQ', '83', ',0,6,83,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('938', '辽阳市_白塔区', 'BTQ', '83', ',0,6,83,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('939', '辽阳市_文圣区', 'WSQ', '83', ',0,6,83,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('940', '辽阳市_宏伟区', 'HWQ', '83', ',0,6,83,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('941', '辽阳市_弓长岭区', 'GCLQ', '83', ',0,6,83,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('942', '辽阳市_太子河区', 'TZHQ', '83', ',0,6,83,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('943', '辽阳市_辽阳县', 'LYX', '83', ',0,6,83,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('944', '辽阳市_灯塔市', 'DTS', '83', ',0,6,83,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('945', '盘锦市_市辖区', 'SXQ', '84', ',0,6,84,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('946', '盘锦市_双台子区', 'STZQ', '84', ',0,6,84,', '0', '3', '0', '0', '2008-11-24 11:05:49');
INSERT INTO `ab_sys_area` VALUES ('947', '盘锦市_兴隆台区', 'XLTQ', '84', ',0,6,84,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('948', '盘锦市_大洼县', 'DWX', '84', ',0,6,84,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('949', '盘锦市_盘山县', 'PSX', '84', ',0,6,84,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('950', '铁岭市_市辖区', 'SXQ', '85', ',0,6,85,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('951', '铁岭市_银州区', 'YZQ', '85', ',0,6,85,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('952', '铁岭市_清河区', 'QHQ', '85', ',0,6,85,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('953', '铁岭市_铁岭县', 'TLX', '85', ',0,6,85,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('954', '铁岭市_西丰县', 'XFX', '85', ',0,6,85,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('955', '铁岭市_昌图县', 'CTX', '85', ',0,6,85,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('956', '铁岭市_调兵山市', 'DBSS', '85', ',0,6,85,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('957', '铁岭市_开原市', 'KYS', '85', ',0,6,85,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('958', '朝阳市_市辖区', 'SXQ', '86', ',0,6,86,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('959', '朝阳市_双塔区', 'STQ', '86', ',0,6,86,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('960', '朝阳市_龙城区', 'LCQ', '86', ',0,6,86,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('961', '朝阳市_朝阳县', 'CYX', '86', ',0,6,86,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('962', '朝阳市_建平县', 'JPX', '86', ',0,6,86,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('963', '朝阳市_喀喇沁左翼蒙古族自治县', 'KLQZYMGZZZX', '86', ',0,6,86,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('964', '朝阳市_北票市', 'BPS', '86', ',0,6,86,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('965', '朝阳市_凌源市', 'LYS', '86', ',0,6,86,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('966', '葫芦岛市_市辖区', 'SXQ', '87', ',0,6,87,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('967', '葫芦岛市_连山区', 'LSQ', '87', ',0,6,87,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('968', '葫芦岛市_龙港区', 'LGQ', '87', ',0,6,87,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('969', '葫芦岛市_南票区', 'NPQ', '87', ',0,6,87,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('970', '葫芦岛市_绥中县', 'SZX', '87', ',0,6,87,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('971', '葫芦岛市_建昌县', 'JCX', '87', ',0,6,87,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('972', '葫芦岛市_兴城市', 'XCS', '87', ',0,6,87,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('973', '长春市_市辖区', 'SXQ', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('974', '长春市_南关区', 'NGQ', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('975', '长春市_宽城区', 'KCQ', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('976', '长春市_朝阳区', 'CYQ', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('977', '长春市_二道区', 'EDQ', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('978', '长春市_绿园区', 'LYQ', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('979', '长春市_双阳区', 'SYQ', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('980', '长春市_农安县', 'NAX', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('981', '长春市_九台市', 'JTS', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('982', '长春市_榆树市', 'YSS', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('983', '长春市_德惠市', 'DHS', '88', ',0,7,88,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('984', '吉林市_市辖区', 'SXQ', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('985', '吉林市_昌邑区', 'CYQ', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('986', '吉林市_龙潭区', 'LTQ', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('987', '吉林市_船营区', 'CYQ', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('988', '吉林市_丰满区', 'FMQ', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('989', '吉林市_永吉县', 'YJX', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('990', '吉林市_蛟河市', 'JHS', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('991', '吉林市_桦甸市', 'HDS', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('992', '吉林市_舒兰市', 'SLS', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('993', '吉林市_磐石市', 'PSS', '89', ',0,7,89,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('994', '四平市_市辖区', 'SXQ', '90', ',0,7,90,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('995', '四平市_铁西区', 'TXQ', '90', ',0,7,90,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('996', '四平市_铁东区', 'TDQ', '90', ',0,7,90,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('997', '四平市_梨树县', 'LSX', '90', ',0,7,90,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('998', '四平市_伊通满族自治县', 'YTMZZZX', '90', ',0,7,90,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('999', '四平市_公主岭市', 'GZLS', '90', ',0,7,90,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1000', '四平市_双辽市', 'SLS', '90', ',0,7,90,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1001', '辽源市_市辖区', 'SXQ', '91', ',0,7,91,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1002', '辽源市_龙山区', 'LSQ', '91', ',0,7,91,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1003', '辽源市_西安区', 'XAQ', '91', ',0,7,91,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1004', '辽源市_东丰县', 'DFX', '91', ',0,7,91,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1005', '辽源市_东辽县', 'DLX', '91', ',0,7,91,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1006', '通化市_市辖区', 'SXQ', '92', ',0,7,92,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1007', '通化市_东昌区', 'DCQ', '92', ',0,7,92,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1008', '通化市_二道江区', 'EDJQ', '92', ',0,7,92,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1009', '通化市_通化县', 'THX', '92', ',0,7,92,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1010', '通化市_辉南县', 'HNX', '92', ',0,7,92,', '0', '3', '0', '0', '2008-11-24 11:05:50');
INSERT INTO `ab_sys_area` VALUES ('1011', '通化市_柳河县', 'LHX', '92', ',0,7,92,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1012', '通化市_梅河口市', 'MHKS', '92', ',0,7,92,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1013', '通化市_集安市', 'JAS', '92', ',0,7,92,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1014', '白山市_市辖区', 'SXQ', '93', ',0,7,93,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1015', '白山市_八道江区', 'BDJQ', '93', ',0,7,93,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1016', '白山市_抚松县', 'FSX', '93', ',0,7,93,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1017', '白山市_靖宇县', 'JYX', '93', ',0,7,93,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1018', '白山市_长白朝鲜族自治县', 'CBCXZZZX', '93', ',0,7,93,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1019', '白山市_江源县', 'JYX', '93', ',0,7,93,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1020', '白山市_临江市', 'LJS', '93', ',0,7,93,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1021', '松原市_市辖区', 'SXQ', '94', ',0,7,94,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1022', '松原市_宁江区', 'NJQ', '94', ',0,7,94,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1023', '松原市_前郭尔罗斯蒙古族自治县', 'QGELSMGZZZX', '94', ',0,7,94,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1024', '松原市_长岭县', 'CLX', '94', ',0,7,94,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1025', '松原市_乾安县', 'QAX', '94', ',0,7,94,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1026', '松原市_扶余县', 'FYX', '94', ',0,7,94,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1027', '白城市_市辖区', 'SXQ', '95', ',0,7,95,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1028', '白城市_洮北区', 'TBQ', '95', ',0,7,95,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1029', '白城市_镇赉县', 'ZLX', '95', ',0,7,95,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1030', '白城市_通榆县', 'TYX', '95', ',0,7,95,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1031', '白城市_洮南市', 'TNS', '95', ',0,7,95,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1032', '白城市_大安市', 'DAS', '95', ',0,7,95,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1033', '延边朝鲜族自治州_延吉市', 'YJS', '96', ',0,7,96,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1034', '延边朝鲜族自治州_图们市', 'TMS', '96', ',0,7,96,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1035', '延边朝鲜族自治州_敦化市', 'DHS', '96', ',0,7,96,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1036', '延边朝鲜族自治州_珲春市', 'HCS', '96', ',0,7,96,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1037', '延边朝鲜族自治州_龙井市', 'LJS', '96', ',0,7,96,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1038', '延边朝鲜族自治州_和龙市', 'HLS', '96', ',0,7,96,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1039', '延边朝鲜族自治州_汪清县', 'WQX', '96', ',0,7,96,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1040', '延边朝鲜族自治州_安图县', 'ATX', '96', ',0,7,96,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1041', '哈尔滨市_市辖区', 'SXQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1042', '哈尔滨市_道里区', 'DLQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1043', '哈尔滨市_南岗区', 'NGQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1044', '哈尔滨市_道外区', 'DWQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1045', '哈尔滨市_香坊区', 'XFQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1046', '哈尔滨市_动力区', 'DLQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1047', '哈尔滨市_平房区', 'PFQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1048', '哈尔滨市_松北区', 'SBQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1049', '哈尔滨市_呼兰区', 'HLQ', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1050', '哈尔滨市_依兰县', 'YLX', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1051', '哈尔滨市_方正县', 'FZX', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1052', '哈尔滨市_宾县', 'BX', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1053', '哈尔滨市_巴彦县', 'BYX', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1054', '哈尔滨市_木兰县', 'MLX', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1055', '哈尔滨市_通河县', 'THX', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1056', '哈尔滨市_延寿县', 'YSX', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1057', '哈尔滨市_阿城市', 'ACS', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1058', '哈尔滨市_双城市', 'SCS', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1059', '哈尔滨市_尚志市', 'SZS', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1060', '哈尔滨市_五常市', 'WCS', '97', ',0,8,97,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1061', '齐齐哈尔市_市辖区', 'SXQ', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1062', '齐齐哈尔市_龙沙区', 'LSQ', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1063', '齐齐哈尔市_建华区', 'JHQ', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1064', '齐齐哈尔市_铁锋区', 'TFQ', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1065', '齐齐哈尔市_昂昂溪区', 'AAXQ', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1066', '齐齐哈尔市_富拉尔基区', 'FLEJQ', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1067', '齐齐哈尔市_碾子山区', 'NZSQ', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1068', '齐齐哈尔市_梅里斯达斡尔族区', 'MLSDWEZQ', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1069', '齐齐哈尔市_龙江县', 'LJX', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1070', '齐齐哈尔市_依安县', 'YAX', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1071', '齐齐哈尔市_泰来县', 'TLX', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1072', '齐齐哈尔市_甘南县', 'GNX', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1073', '齐齐哈尔市_富裕县', 'FYX', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1074', '齐齐哈尔市_克山县', 'KSX', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:51');
INSERT INTO `ab_sys_area` VALUES ('1075', '齐齐哈尔市_克东县', 'KDX', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1076', '齐齐哈尔市_拜泉县', 'BQX', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1077', '齐齐哈尔市_讷河市', 'NHS', '98', ',0,8,98,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1078', '鸡西市_市辖区', 'SXQ', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1079', '鸡西市_鸡冠区', 'JGQ', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1080', '鸡西市_恒山区', 'HSQ', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1081', '鸡西市_滴道区', 'DDQ', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1082', '鸡西市_梨树区', 'LSQ', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1083', '鸡西市_城子河区', 'CZHQ', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1084', '鸡西市_麻山区', 'MSQ', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1085', '鸡西市_鸡东县', 'JDX', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1086', '鸡西市_虎林市', 'HLS', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1087', '鸡西市_密山市', 'MSS', '99', ',0,8,99,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1088', '鹤岗市_市辖区', 'SXQ', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1089', '鹤岗市_向阳区', 'XYQ', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1090', '鹤岗市_工农区', 'GNQ', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1091', '鹤岗市_南山区', 'NSQ', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1092', '鹤岗市_兴安区', 'XAQ', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1093', '鹤岗市_东山区', 'DSQ', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1094', '鹤岗市_兴山区', 'XSQ', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1095', '鹤岗市_萝北县', 'LBX', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1096', '鹤岗市_绥滨县', 'SBX', '100', ',0,8,100,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1097', '双鸭山市_市辖区', 'SXQ', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1098', '双鸭山市_尖山区', 'JSQ', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1099', '双鸭山市_岭东区', 'LDQ', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1100', '双鸭山市_四方台区', 'SFTQ', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1101', '双鸭山市_宝山区', 'BSQ', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1102', '双鸭山市_集贤县', 'JXX', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1103', '双鸭山市_友谊县', 'YYX', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1104', '双鸭山市_宝清县', 'BQX', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1105', '双鸭山市_饶河县', 'RHX', '101', ',0,8,101,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1106', '大庆市_市辖区', 'SXQ', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1107', '大庆市_萨尔图区', 'SETQ', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1108', '大庆市_龙凤区', 'LFQ', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1109', '大庆市_让胡路区', 'RHLQ', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1110', '大庆市_红岗区', 'HGQ', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1111', '大庆市_大同区', 'DTQ', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1112', '大庆市_肇州县', 'ZZX', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1113', '大庆市_肇源县', 'ZYX', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1114', '大庆市_林甸县', 'LDX', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1115', '大庆市_杜尔伯特蒙古族自治县', 'DEBTMGZZZX', '102', ',0,8,102,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1116', '伊春市_市辖区', 'SXQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1117', '伊春市_伊春区', 'YCQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1118', '伊春市_南岔区', 'NCQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1119', '伊春市_友好区', 'YHQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1120', '伊春市_西林区', 'XLQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1121', '伊春市_翠峦区', 'CLQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1122', '伊春市_新青区', 'XQQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1123', '伊春市_美溪区', 'MXQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1124', '伊春市_金山屯区', 'JSTQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1125', '伊春市_五营区', 'WYQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1126', '伊春市_乌马河区', 'WMHQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1127', '伊春市_汤旺河区', 'TWHQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1128', '伊春市_带岭区', 'DLQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1129', '伊春市_乌伊岭区', 'WYLQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1130', '伊春市_红星区', 'HXQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1131', '伊春市_上甘岭区', 'SGLQ', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1132', '伊春市_嘉荫县', 'JYX', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1133', '伊春市_铁力市', 'TLS', '103', ',0,8,103,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1134', '佳木斯市_市辖区', 'SXQ', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1135', '佳木斯市_永红区', 'YHQ', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1136', '佳木斯市_向阳区', 'XYQ', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1137', '佳木斯市_前进区', 'QJQ', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:52');
INSERT INTO `ab_sys_area` VALUES ('1138', '佳木斯市_东风区', 'DFQ', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1139', '佳木斯市_郊区', 'JQ', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1140', '佳木斯市_桦南县', 'HNX', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1141', '佳木斯市_桦川县', 'HCX', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1142', '佳木斯市_汤原县', 'TYX', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1143', '佳木斯市_抚远县', 'FYX', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1144', '佳木斯市_同江市', 'TJS', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1145', '佳木斯市_富锦市', 'FJS', '104', ',0,8,104,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1146', '七台河市_市辖区', 'SXQ', '105', ',0,8,105,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1147', '七台河市_新兴区', 'XXQ', '105', ',0,8,105,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1148', '七台河市_桃山区', 'TSQ', '105', ',0,8,105,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1149', '七台河市_茄子河区', 'QZHQ', '105', ',0,8,105,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1150', '七台河市_勃利县', 'BLX', '105', ',0,8,105,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1151', '牡丹江市_市辖区', 'SXQ', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1152', '牡丹江市_东安区', 'DAQ', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1153', '牡丹江市_阳明区', 'YMQ', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1154', '牡丹江市_爱民区', 'AMQ', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1155', '牡丹江市_西安区', 'XAQ', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1156', '牡丹江市_东宁县', 'DNX', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1157', '牡丹江市_林口县', 'LKX', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1158', '牡丹江市_绥芬河市', 'SFHS', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1159', '牡丹江市_海林市', 'HLS', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1160', '牡丹江市_宁安市', 'NAS', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1161', '牡丹江市_穆棱市', 'MLS', '106', ',0,8,106,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1162', '黑河市_市辖区', 'SXQ', '107', ',0,8,107,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1163', '黑河市_爱辉区', 'AHQ', '107', ',0,8,107,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1164', '黑河市_嫩江县', 'NJX', '107', ',0,8,107,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1165', '黑河市_逊克县', 'XKX', '107', ',0,8,107,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1166', '黑河市_孙吴县', 'SWX', '107', ',0,8,107,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1167', '黑河市_北安市', 'BAS', '107', ',0,8,107,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1168', '黑河市_五大连池市', 'WDLCS', '107', ',0,8,107,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1169', '绥化市_市辖区', 'SXQ', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1170', '绥化市_北林区', 'BLQ', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1171', '绥化市_望奎县', 'WKX', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1172', '绥化市_兰西县', 'LXX', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1173', '绥化市_青冈县', 'QGX', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1174', '绥化市_庆安县', 'QAX', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1175', '绥化市_明水县', 'MSX', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1176', '绥化市_绥棱县', 'SLX', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1177', '绥化市_安达市', 'ADS', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1178', '绥化市_肇东市', 'ZDS', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1179', '绥化市_海伦市', 'HLS', '108', ',0,8,108,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1180', '大兴安岭地区_呼玛县', 'HMX', '109', ',0,8,109,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1181', '大兴安岭地区_塔河县', 'THX', '109', ',0,8,109,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1182', '大兴安岭地区_漠河县', 'MHX', '109', ',0,8,109,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1183', '上海市辖区_黄浦区', 'HPQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1184', '上海市辖区_卢湾区', 'LWQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1185', '上海市辖区_徐汇区', 'XHQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1186', '上海市辖区_长宁区', 'CNQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1187', '上海市辖区_静安区', 'JAQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1188', '上海市辖区_普陀区', 'PTQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1189', '上海市辖区_闸北区', 'ZBQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1190', '上海市辖区_虹口区', 'HKQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1191', '上海市辖区_杨浦区', 'YPQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1192', '上海市辖区_闵行区', 'MXQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1193', '上海市辖区_宝山区', 'BSQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1194', '上海市辖区_嘉定区', 'JDQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1195', '上海市辖区_浦东新区', 'PDXQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1196', '上海市辖区_金山区', 'JSQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1197', '上海市辖区_松江区', 'SJQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1198', '上海市辖区_青浦区', 'QPQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1199', '上海市辖区_南汇区', 'NHQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1200', '上海市辖区_奉贤区', 'FXQ', '110', ',0,9,110,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1201', '上海市辖县_崇明县', 'CMX', '111', ',0,9,111,', '0', '3', '0', '0', '2008-11-24 11:05:53');
INSERT INTO `ab_sys_area` VALUES ('1202', '南京市_市辖区', 'SXQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1203', '南京市_玄武区', 'XWQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1204', '南京市_白下区', 'BXQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1205', '南京市_秦淮区', 'QHQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1206', '南京市_建邺区', 'JYQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1207', '南京市_鼓楼区', 'GLQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1208', '南京市_下关区', 'XGQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1209', '南京市_浦口区', 'PKQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1210', '南京市_栖霞区', 'QXQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1211', '南京市_雨花台区', 'YHTQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1212', '南京市_江宁区', 'JNQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1213', '南京市_六合区', 'LHQ', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1214', '南京市_溧水县', 'LSX', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1215', '南京市_高淳县', 'GCX', '112', ',0,10,112,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1216', '无锡市_市辖区', 'SXQ', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1217', '无锡市_崇安区', 'CAQ', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1218', '无锡市_南长区', 'NCQ', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1219', '无锡市_北塘区', 'BTQ', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1220', '无锡市_锡山区', 'XSQ', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1221', '无锡市_惠山区', 'HSQ', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1222', '无锡市_滨湖区', 'BHQ', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1223', '无锡市_江阴市', 'JYS', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1224', '无锡市_宜兴市', 'YXS', '113', ',0,10,113,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1225', '徐州市_市辖区', 'SXQ', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1226', '徐州市_鼓楼区', 'GLQ', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1227', '徐州市_云龙区', 'YLQ', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1228', '徐州市_九里区', 'JLQ', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1229', '徐州市_贾汪区', 'JWQ', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1230', '徐州市_泉山区', 'QSQ', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1231', '徐州市_丰县', 'FX', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1232', '徐州市_沛县', 'PX', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1233', '徐州市_铜山县', 'TSX', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1234', '徐州市_睢宁县', 'SNX', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1235', '徐州市_新沂市', 'XYS', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1236', '徐州市_邳州市', 'PZS', '114', ',0,10,114,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1237', '常州市_市辖区', 'SXQ', '115', ',0,10,115,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1238', '常州市_天宁区', 'TNQ', '115', ',0,10,115,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1239', '常州市_钟楼区', 'ZLQ', '115', ',0,10,115,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1240', '常州市_戚墅堰区', 'QSYQ', '115', ',0,10,115,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1241', '常州市_新北区', 'XBQ', '115', ',0,10,115,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1242', '常州市_武进区', 'WJQ', '115', ',0,10,115,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1243', '常州市_溧阳市', 'LYS', '115', ',0,10,115,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1244', '常州市_金坛市', 'JTS', '115', ',0,10,115,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1245', '苏州市_市辖区', 'SXQ', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1246', '苏州市_沧浪区', 'CLQ', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1247', '苏州市_平江区', 'PJQ', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1248', '苏州市_金阊区', 'JCQ', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1249', '苏州市_虎丘区', 'HQQ', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1250', '苏州市_吴中区', 'WZQ', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1251', '苏州市_相城区', 'XCQ', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1252', '苏州市_常熟市', 'CSS', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1253', '苏州市_张家港市', 'ZJGS', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1254', '苏州市_昆山市', 'KSS', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1255', '苏州市_吴江市', 'WJS', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1256', '苏州市_太仓市', 'TCS', '116', ',0,10,116,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1257', '南通市_市辖区', 'SXQ', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1258', '南通市_崇川区', 'CCQ', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1259', '南通市_港闸区', 'GZQ', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1260', '南通市_海安县', 'HAX', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1261', '南通市_如东县', 'RDX', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1262', '南通市_启东市', 'QDS', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1263', '南通市_如皋市', 'RGS', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1264', '南通市_通州市', 'TZS', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1265', '南通市_海门市', 'HMS', '117', ',0,10,117,', '0', '3', '0', '0', '2008-11-24 11:05:54');
INSERT INTO `ab_sys_area` VALUES ('1266', '连云港市_市辖区', 'SXQ', '118', ',0,10,118,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1267', '连云港市_连云区', 'LYQ', '118', ',0,10,118,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1268', '连云港市_新浦区', 'XPQ', '118', ',0,10,118,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1269', '连云港市_海州区', 'HZQ', '118', ',0,10,118,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1270', '连云港市_赣榆县', 'GYX', '118', ',0,10,118,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1271', '连云港市_东海县', 'DHX', '118', ',0,10,118,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1272', '连云港市_灌云县', 'GYX', '118', ',0,10,118,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1273', '连云港市_灌南县', 'GNX', '118', ',0,10,118,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1274', '淮安市_市辖区', 'SXQ', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1275', '淮安市_清河区', 'QHQ', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1276', '淮安市_楚州区', 'CZQ', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1277', '淮安市_淮阴区', 'HYQ', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1278', '淮安市_清浦区', 'QPQ', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1279', '淮安市_涟水县', 'LSX', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1280', '淮安市_洪泽县', 'HZX', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1281', '淮安市_盱眙县', 'XYX', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1282', '淮安市_金湖县', 'JHX', '119', ',0,10,119,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1283', '盐城市_市辖区', 'SXQ', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1284', '盐城市_亭湖区', 'THQ', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1285', '盐城市_盐都区', 'YDQ', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1286', '盐城市_响水县', 'XSX', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1287', '盐城市_滨海县', 'BHX', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1288', '盐城市_阜宁县', 'FNX', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1289', '盐城市_射阳县', 'SYX', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1290', '盐城市_建湖县', 'JHX', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1291', '盐城市_东台市', 'DTS', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1292', '盐城市_大丰市', 'DFS', '120', ',0,10,120,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1293', '扬州市_市辖区', 'SXQ', '121', ',0,10,121,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1294', '扬州市_广陵区', 'GLQ', '121', ',0,10,121,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1295', '扬州市_邗江区', 'HJQ', '121', ',0,10,121,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1296', '扬州市_郊区', 'JQ', '121', ',0,10,121,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1297', '扬州市_宝应县', 'BYX', '121', ',0,10,121,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1298', '扬州市_仪征市', 'YZS', '121', ',0,10,121,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1299', '扬州市_高邮市', 'GYS', '121', ',0,10,121,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1300', '扬州市_江都市', 'JDS', '121', ',0,10,121,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1301', '镇江市_市辖区', 'SXQ', '122', ',0,10,122,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1302', '镇江市_京口区', 'JKQ', '122', ',0,10,122,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1303', '镇江市_润州区', 'RZQ', '122', ',0,10,122,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1304', '镇江市_丹徒区', 'DTQ', '122', ',0,10,122,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1305', '镇江市_丹阳市', 'DYS', '122', ',0,10,122,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1306', '镇江市_扬中市', 'YZS', '122', ',0,10,122,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1307', '镇江市_句容市', 'JRS', '122', ',0,10,122,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1308', '泰州市_市辖区', 'SXQ', '123', ',0,10,123,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1309', '泰州市_海陵区', 'HLQ', '123', ',0,10,123,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1310', '泰州市_高港区', 'GGQ', '123', ',0,10,123,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1311', '泰州市_兴化市', 'XHS', '123', ',0,10,123,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1312', '泰州市_靖江市', 'JJS', '123', ',0,10,123,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1313', '泰州市_泰兴市', 'TXS', '123', ',0,10,123,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1314', '泰州市_姜堰市', 'JYS', '123', ',0,10,123,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1315', '宿迁市_市辖区', 'SXQ', '124', ',0,10,124,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1316', '宿迁市_宿城区', 'SCQ', '124', ',0,10,124,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1317', '宿迁市_宿豫区', 'SYQ', '124', ',0,10,124,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1318', '宿迁市_沭阳县', 'SYX', '124', ',0,10,124,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1319', '宿迁市_泗阳县', 'SYX', '124', ',0,10,124,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1320', '宿迁市_泗洪县', 'SHX', '124', ',0,10,124,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1321', '杭州市_市辖区', 'SXQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1322', '杭州市_上城区', 'SCQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1323', '杭州市_下城区', 'XCQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1324', '杭州市_江干区', 'JGQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1325', '杭州市_拱墅区', 'GSQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1326', '杭州市_西湖区', 'XHQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1327', '杭州市_滨江区', 'BJQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1328', '杭州市_萧山区', 'XSQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1329', '杭州市_余杭区', 'YHQ', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:55');
INSERT INTO `ab_sys_area` VALUES ('1330', '杭州市_桐庐县', 'TLX', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1331', '杭州市_淳安县', 'CAX', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1332', '杭州市_建德市', 'JDS', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1333', '杭州市_富阳市', 'FYS', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1334', '杭州市_临安市', 'LAS', '125', ',0,11,125,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1335', '宁波市_市辖区', 'SXQ', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1336', '宁波市_海曙区', 'HSQ', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1337', '宁波市_江东区', 'JDQ', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1338', '宁波市_江北区', 'JBQ', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1339', '宁波市_北仑区', 'BLQ', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1340', '宁波市_镇海区', 'ZHQ', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1341', '宁波市_鄞州区', 'YZQ', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1342', '宁波市_象山县', 'XSX', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1343', '宁波市_宁海县', 'NHX', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1344', '宁波市_余姚市', 'YYS', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1345', '宁波市_慈溪市', 'CXS', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1346', '宁波市_奉化市', 'FHS', '126', ',0,11,126,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1347', '温州市_市辖区', 'SXQ', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1348', '温州市_鹿城区', 'LCQ', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1349', '温州市_龙湾区', 'LWQ', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1350', '温州市_瓯海区', 'OHQ', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1351', '温州市_洞头县', 'DTX', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1352', '温州市_永嘉县', 'YJX', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1353', '温州市_平阳县', 'PYX', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1354', '温州市_苍南县', 'CNX', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1355', '温州市_文成县', 'WCX', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1356', '温州市_泰顺县', 'TSX', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1357', '温州市_瑞安市', 'RAS', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1358', '温州市_乐清市', 'LQS', '127', ',0,11,127,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1359', '嘉兴市_市辖区', 'SXQ', '128', ',0,11,128,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1360', '嘉兴市_秀城区', 'XCQ', '128', ',0,11,128,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1361', '嘉兴市_秀洲区', 'XZQ', '128', ',0,11,128,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1362', '嘉兴市_嘉善县', 'JSX', '128', ',0,11,128,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1363', '嘉兴市_海盐县', 'HYX', '128', ',0,11,128,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1364', '嘉兴市_海宁市', 'HNS', '128', ',0,11,128,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1365', '嘉兴市_平湖市', 'PHS', '128', ',0,11,128,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1366', '嘉兴市_桐乡市', 'TXS', '128', ',0,11,128,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1367', '湖州市_市辖区', 'SXQ', '129', ',0,11,129,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1368', '湖州市_吴兴区', 'WXQ', '129', ',0,11,129,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1369', '湖州市_南浔区', 'NXQ', '129', ',0,11,129,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1370', '湖州市_德清县', 'DQX', '129', ',0,11,129,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1371', '湖州市_长兴县', 'CXX', '129', ',0,11,129,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1372', '湖州市_安吉县', 'AJX', '129', ',0,11,129,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1373', '绍兴市_市辖区', 'SXQ', '130', ',0,11,130,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1374', '绍兴市_越城区', 'YCQ', '130', ',0,11,130,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1375', '绍兴市_绍兴县', 'SXX', '130', ',0,11,130,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1376', '绍兴市_新昌县', 'XCX', '130', ',0,11,130,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1377', '绍兴市_诸暨市', 'ZJS', '130', ',0,11,130,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1378', '绍兴市_上虞市', 'SYS', '130', ',0,11,130,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1379', '绍兴市_嵊州市', 'SZS', '130', ',0,11,130,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1380', '金华市_市辖区', 'SXQ', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1381', '金华市_婺城区', 'WCQ', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1382', '金华市_金东区', 'JDQ', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1383', '金华市_武义县', 'WYX', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1384', '金华市_浦江县', 'PJX', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1385', '金华市_磐安县', 'PAX', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1386', '金华市_兰溪市', 'LXS', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1387', '金华市_义乌市', 'YWS', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1388', '金华市_东阳市', 'DYS', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1389', '金华市_永康市', 'YKS', '131', ',0,11,131,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1390', '衢州市_市辖区', 'SXQ', '132', ',0,11,132,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1391', '衢州市_柯城区', 'KCQ', '132', ',0,11,132,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1392', '衢州市_衢江区', 'QJQ', '132', ',0,11,132,', '0', '3', '0', '0', '2008-11-24 11:05:56');
INSERT INTO `ab_sys_area` VALUES ('1393', '衢州市_常山县', 'CSX', '132', ',0,11,132,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1394', '衢州市_开化县', 'KHX', '132', ',0,11,132,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1395', '衢州市_龙游县', 'LYX', '132', ',0,11,132,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1396', '衢州市_江山市', 'JSS', '132', ',0,11,132,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1397', '舟山市_市辖区', 'SXQ', '133', ',0,11,133,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1398', '舟山市_定海区', 'DHQ', '133', ',0,11,133,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1399', '舟山市_普陀区', 'PTQ', '133', ',0,11,133,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1400', '舟山市_岱山县', 'DSX', '133', ',0,11,133,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1401', '舟山市_嵊泗县', 'SSX', '133', ',0,11,133,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1402', '台州市_市辖区', 'SXQ', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1403', '台州市_椒江区', 'JJQ', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1404', '台州市_黄岩区', 'HYQ', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1405', '台州市_路桥区', 'LQQ', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1406', '台州市_玉环县', 'YHX', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1407', '台州市_三门县', 'SMX', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1408', '台州市_天台县', 'TTX', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1409', '台州市_仙居县', 'XJX', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1410', '台州市_温岭市', 'WLS', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1411', '台州市_临海市', 'LHS', '134', ',0,11,134,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1412', '丽水市_市辖区', 'SXQ', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1413', '丽水市_莲都区', 'LDQ', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1414', '丽水市_青田县', 'QTX', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1415', '丽水市_缙云县', 'JYX', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1416', '丽水市_遂昌县', 'SCX', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1417', '丽水市_松阳县', 'SYX', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1418', '丽水市_云和县', 'YHX', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1419', '丽水市_庆元县', 'QYX', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1420', '丽水市_景宁畲族自治县', 'JNSZZZX', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1421', '丽水市_龙泉市', 'LQS', '135', ',0,11,135,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1422', '合肥市_市辖区', 'SXQ', '136', ',0,12,136,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1423', '合肥市_瑶海区', 'YHQ', '136', ',0,12,136,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1424', '合肥市_庐阳区', 'LYQ', '136', ',0,12,136,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1425', '合肥市_蜀山区', 'SSQ', '136', ',0,12,136,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1426', '合肥市_包河区', 'BHQ', '136', ',0,12,136,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1427', '合肥市_长丰县', 'CFX', '136', ',0,12,136,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1428', '合肥市_肥东县', 'FDX', '136', ',0,12,136,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1429', '合肥市_肥西县', 'FXX', '136', ',0,12,136,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1430', '芜湖市_市辖区', 'SXQ', '137', ',0,12,137,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1431', '芜湖市_镜湖区', 'JHQ', '137', ',0,12,137,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1432', '芜湖市_马塘区', 'MTQ', '137', ',0,12,137,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1433', '芜湖市_新芜区', 'XWQ', '137', ',0,12,137,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1434', '芜湖市_鸠江区', 'JJQ', '137', ',0,12,137,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1435', '芜湖市_芜湖县', 'WHX', '137', ',0,12,137,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1436', '芜湖市_繁昌县', 'FCX', '137', ',0,12,137,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1437', '芜湖市_南陵县', 'NLX', '137', ',0,12,137,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1438', '蚌埠市_市辖区', 'SXQ', '138', ',0,12,138,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1439', '蚌埠市_龙子湖区', 'LZHQ', '138', ',0,12,138,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1440', '蚌埠市_蚌山区', 'BSQ', '138', ',0,12,138,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1441', '蚌埠市_禹会区', 'YHQ', '138', ',0,12,138,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1442', '蚌埠市_淮上区', 'HSQ', '138', ',0,12,138,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1443', '蚌埠市_怀远县', 'HYX', '138', ',0,12,138,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1444', '蚌埠市_五河县', 'WHX', '138', ',0,12,138,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1445', '蚌埠市_固镇县', 'GZX', '138', ',0,12,138,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1446', '淮南市_市辖区', 'SXQ', '139', ',0,12,139,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1447', '淮南市_大通区', 'DTQ', '139', ',0,12,139,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1448', '淮南市_田家庵区', 'TJAQ', '139', ',0,12,139,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1449', '淮南市_谢家集区', 'XJJQ', '139', ',0,12,139,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1450', '淮南市_八公山区', 'BGSQ', '139', ',0,12,139,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1451', '淮南市_潘集区', 'PJQ', '139', ',0,12,139,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1452', '淮南市_凤台县', 'FTX', '139', ',0,12,139,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1453', '马鞍山市_市辖区', 'SXQ', '140', ',0,12,140,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1454', '马鞍山市_金家庄区', 'JJZQ', '140', ',0,12,140,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1455', '马鞍山市_花山区', 'HSQ', '140', ',0,12,140,', '0', '3', '0', '0', '2008-11-24 11:05:57');
INSERT INTO `ab_sys_area` VALUES ('1456', '马鞍山市_雨山区', 'YSQ', '140', ',0,12,140,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1457', '马鞍山市_当涂县', 'DTX', '140', ',0,12,140,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1458', '淮北市_市辖区', 'SXQ', '141', ',0,12,141,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1459', '淮北市_杜集区', 'DJQ', '141', ',0,12,141,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1460', '淮北市_相山区', 'XSQ', '141', ',0,12,141,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1461', '淮北市_烈山区', 'LSQ', '141', ',0,12,141,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1462', '淮北市_濉溪县', 'SXX', '141', ',0,12,141,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1463', '铜陵市_市辖区', 'SXQ', '142', ',0,12,142,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1464', '铜陵市_铜官山区', 'TGSQ', '142', ',0,12,142,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1465', '铜陵市_狮子山区', 'SZSQ', '142', ',0,12,142,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1466', '铜陵市_郊区', 'JQ', '142', ',0,12,142,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1467', '铜陵市_铜陵县', 'TLX', '142', ',0,12,142,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1468', '安庆市_市辖区', 'SXQ', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1469', '安庆市_迎江区', 'YJQ', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1470', '安庆市_大观区', 'DGQ', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1471', '安庆市_郊区', 'JQ', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1472', '安庆市_怀宁县', 'HNX', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1473', '安庆市_枞阳县', 'CYX', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1474', '安庆市_潜山县', 'QSX', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1475', '安庆市_太湖县', 'THX', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1476', '安庆市_宿松县', 'SSX', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1477', '安庆市_望江县', 'WJX', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1478', '安庆市_岳西县', 'YXX', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1479', '安庆市_桐城市', 'TCS', '143', ',0,12,143,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1480', '黄山市_市辖区', 'SXQ', '144', ',0,12,144,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1481', '黄山市_屯溪区', 'TXQ', '144', ',0,12,144,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1482', '黄山市_黄山区', 'HSQ', '144', ',0,12,144,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1483', '黄山市_徽州区', 'HZQ', '144', ',0,12,144,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1484', '黄山市_歙县', 'XX', '144', ',0,12,144,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1485', '黄山市_休宁县', 'XNX', '144', ',0,12,144,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1486', '黄山市_黟县', 'YX', '144', ',0,12,144,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1487', '黄山市_祁门县', 'QMX', '144', ',0,12,144,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1488', '滁州市_市辖区', 'SXQ', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1489', '滁州市_琅琊区', 'LYQ', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1490', '滁州市_南谯区', 'NQQ', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1491', '滁州市_来安县', 'LAX', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1492', '滁州市_全椒县', 'QJX', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1493', '滁州市_定远县', 'DYX', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1494', '滁州市_凤阳县', 'FYX', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1495', '滁州市_天长市', 'TCS', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1496', '滁州市_明光市', 'MGS', '145', ',0,12,145,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1497', '阜阳市_市辖区', 'SXQ', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1498', '阜阳市_颍州区', 'YZQ', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1499', '阜阳市_颍东区', 'YDQ', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1500', '阜阳市_颍泉区', 'YQQ', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1501', '阜阳市_临泉县', 'LQX', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1502', '阜阳市_太和县', 'THX', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1503', '阜阳市_阜南县', 'FNX', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1504', '阜阳市_颍上县', 'YSX', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1505', '阜阳市_界首市', 'JSS', '146', ',0,12,146,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1506', '宿州市_市辖区', 'SXQ', '147', ',0,12,147,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1507', '宿州市_墉桥区', 'YQQ', '147', ',0,12,147,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1508', '宿州市_砀山县', 'DSX', '147', ',0,12,147,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1509', '宿州市_萧县', 'XX', '147', ',0,12,147,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1510', '宿州市_灵璧县', 'LBX', '147', ',0,12,147,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1511', '宿州市_泗县', 'SX', '147', ',0,12,147,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1512', '巢湖市_市辖区', 'SXQ', '148', ',0,12,148,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1513', '巢湖市_居巢区', 'JCQ', '148', ',0,12,148,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1514', '巢湖市_庐江县', 'LJX', '148', ',0,12,148,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1515', '巢湖市_无为县', 'WWX', '148', ',0,12,148,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1516', '巢湖市_含山县', 'HSX', '148', ',0,12,148,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1517', '巢湖市_和县', 'HX', '148', ',0,12,148,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1518', '六安市_市辖区', 'SXQ', '149', ',0,12,149,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1519', '六安市_金安区', 'JAQ', '149', ',0,12,149,', '0', '3', '0', '0', '2008-11-24 11:05:58');
INSERT INTO `ab_sys_area` VALUES ('1520', '六安市_裕安区', 'YAQ', '149', ',0,12,149,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1521', '六安市_寿县', 'SX', '149', ',0,12,149,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1522', '六安市_霍邱县', 'HQX', '149', ',0,12,149,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1523', '六安市_舒城县', 'SCX', '149', ',0,12,149,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1524', '六安市_金寨县', 'JZX', '149', ',0,12,149,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1525', '六安市_霍山县', 'HSX', '149', ',0,12,149,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1526', '亳州市_市辖区', 'SXQ', '150', ',0,12,150,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1527', '亳州市_谯城区', 'QCQ', '150', ',0,12,150,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1528', '亳州市_涡阳县', 'WYX', '150', ',0,12,150,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1529', '亳州市_蒙城县', 'MCX', '150', ',0,12,150,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1530', '亳州市_利辛县', 'LXX', '150', ',0,12,150,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1531', '池州市_市辖区', 'SXQ', '151', ',0,12,151,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1532', '池州市_贵池区', 'GCQ', '151', ',0,12,151,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1533', '池州市_东至县', 'DZX', '151', ',0,12,151,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1534', '池州市_石台县', 'STX', '151', ',0,12,151,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1535', '池州市_青阳县', 'QYX', '151', ',0,12,151,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1536', '宣城市_市辖区', 'SXQ', '152', ',0,12,152,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1537', '宣城市_宣州区', 'XZQ', '152', ',0,12,152,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1538', '宣城市_郎溪县', 'LXX', '152', ',0,12,152,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1539', '宣城市_广德县', 'GDX', '152', ',0,12,152,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1540', '宣城市_泾县', 'JX', '152', ',0,12,152,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1541', '宣城市_绩溪县', 'JXX', '152', ',0,12,152,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1542', '宣城市_旌德县', 'JDX', '152', ',0,12,152,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1543', '宣城市_宁国市', 'NGS', '152', ',0,12,152,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1544', '福州市_市辖区', 'SXQ', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1545', '福州市_鼓楼区', 'GLQ', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1546', '福州市_台江区', 'TJQ', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1547', '福州市_仓山区', 'CSQ', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1548', '福州市_马尾区', 'MWQ', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1549', '福州市_晋安区', 'JAQ', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1550', '福州市_闽侯县', 'MHX', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1551', '福州市_连江县', 'LJX', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1552', '福州市_罗源县', 'LYX', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1553', '福州市_闽清县', 'MQX', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1554', '福州市_永泰县', 'YTX', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1555', '福州市_平潭县', 'PTX', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1556', '福州市_福清市', 'FQS', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1557', '福州市_长乐市', 'CLS', '153', ',0,13,153,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1558', '厦门市_市辖区', 'SXQ', '154', ',0,13,154,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1559', '厦门市_思明区', 'SMQ', '154', ',0,13,154,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1560', '厦门市_海沧区', 'HCQ', '154', ',0,13,154,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1561', '厦门市_湖里区', 'HLQ', '154', ',0,13,154,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1562', '厦门市_集美区', 'JMQ', '154', ',0,13,154,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1563', '厦门市_同安区', 'TAQ', '154', ',0,13,154,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1564', '厦门市_翔安区', 'XAQ', '154', ',0,13,154,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1565', '莆田市_市辖区', 'SXQ', '155', ',0,13,155,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1566', '莆田市_城厢区', 'CXQ', '155', ',0,13,155,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1567', '莆田市_涵江区', 'HJQ', '155', ',0,13,155,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1568', '莆田市_荔城区', 'LCQ', '155', ',0,13,155,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1569', '莆田市_秀屿区', 'XYQ', '155', ',0,13,155,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1570', '莆田市_仙游县', 'XYX', '155', ',0,13,155,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1571', '三明市_市辖区', 'SXQ', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1572', '三明市_梅列区', 'MLQ', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1573', '三明市_三元区', 'SYQ', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1574', '三明市_明溪县', 'MXX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1575', '三明市_清流县', 'QLX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1576', '三明市_宁化县', 'NHX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1577', '三明市_大田县', 'DTX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1578', '三明市_尤溪县', 'YXX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1579', '三明市_沙县', 'SX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1580', '三明市_将乐县', 'JLX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1581', '三明市_泰宁县', 'TNX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1582', '三明市_建宁县', 'JNX', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1583', '三明市_永安市', 'YAS', '156', ',0,13,156,', '0', '3', '0', '0', '2008-11-24 11:05:59');
INSERT INTO `ab_sys_area` VALUES ('1584', '泉州市_市辖区', 'SXQ', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1585', '泉州市_鲤城区', 'LCQ', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1586', '泉州市_丰泽区', 'FZQ', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1587', '泉州市_洛江区', 'LJQ', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1588', '泉州市_泉港区', 'QGQ', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1589', '泉州市_惠安县', 'HAX', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1590', '泉州市_安溪县', 'AXX', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1591', '泉州市_永春县', 'YCX', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1592', '泉州市_德化县', 'DHX', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1593', '泉州市_金门县', 'JMX', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1594', '泉州市_石狮市', 'SSS', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1595', '泉州市_晋江市', 'JJS', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1596', '泉州市_南安市', 'NAS', '157', ',0,13,157,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1597', '漳州市_市辖区', 'SXQ', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1598', '漳州市_芗城区', 'XCQ', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1599', '漳州市_龙文区', 'LWQ', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1600', '漳州市_云霄县', 'YXX', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1601', '漳州市_漳浦县', 'ZPX', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1602', '漳州市_诏安县', 'ZAX', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1603', '漳州市_长泰县', 'CTX', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1604', '漳州市_东山县', 'DSX', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1605', '漳州市_南靖县', 'NJX', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1606', '漳州市_平和县', 'PHX', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1607', '漳州市_华安县', 'HAX', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1608', '漳州市_龙海市', 'LHS', '158', ',0,13,158,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1609', '南平市_市辖区', 'SXQ', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1610', '南平市_延平区', 'YPQ', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1611', '南平市_顺昌县', 'SCX', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1612', '南平市_浦城县', 'PCX', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1613', '南平市_光泽县', 'GZX', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1614', '南平市_松溪县', 'SXX', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1615', '南平市_政和县', 'ZHX', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1616', '南平市_邵武市', 'SWS', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1617', '南平市_武夷山市', 'WYSS', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1618', '南平市_建瓯市', 'JOS', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1619', '南平市_建阳市', 'JYS', '159', ',0,13,159,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1620', '龙岩市_市辖区', 'SXQ', '160', ',0,13,160,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1621', '龙岩市_新罗区', 'XLQ', '160', ',0,13,160,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1622', '龙岩市_长汀县', 'CTX', '160', ',0,13,160,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1623', '龙岩市_永定县', 'YDX', '160', ',0,13,160,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1624', '龙岩市_上杭县', 'SHX', '160', ',0,13,160,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1625', '龙岩市_武平县', 'WPX', '160', ',0,13,160,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1626', '龙岩市_连城县', 'LCX', '160', ',0,13,160,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1627', '龙岩市_漳平市', 'ZPS', '160', ',0,13,160,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1628', '宁德市_市辖区', 'SXQ', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1629', '宁德市_蕉城区', 'JCQ', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1630', '宁德市_霞浦县', 'XPX', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1631', '宁德市_古田县', 'GTX', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1632', '宁德市_屏南县', 'PNX', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1633', '宁德市_寿宁县', 'SNX', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1634', '宁德市_周宁县', 'ZNX', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1635', '宁德市_柘荣县', 'ZRX', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1636', '宁德市_福安市', 'FAS', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1637', '宁德市_福鼎市', 'FDS', '161', ',0,13,161,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1638', '南昌市_市辖区', 'SXQ', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1639', '南昌市_东湖区', 'DHQ', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1640', '南昌市_西湖区', 'XHQ', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1641', '南昌市_青云谱区', 'QYPQ', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1642', '南昌市_湾里区', 'WLQ', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1643', '南昌市_青山湖区', 'QSHQ', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1644', '南昌市_南昌县', 'NCX', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1645', '南昌市_新建县', 'XJX', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1646', '南昌市_安义县', 'AYX', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1647', '南昌市_进贤县', 'JXX', '162', ',0,14,162,', '0', '3', '0', '0', '2008-11-24 11:06:00');
INSERT INTO `ab_sys_area` VALUES ('1648', '景德镇市_市辖区', 'SXQ', '163', ',0,14,163,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1649', '景德镇市_昌江区', 'CJQ', '163', ',0,14,163,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1650', '景德镇市_珠山区', 'ZSQ', '163', ',0,14,163,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1651', '景德镇市_浮梁县', 'FLX', '163', ',0,14,163,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1652', '景德镇市_乐平市', 'LPS', '163', ',0,14,163,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1653', '萍乡市_市辖区', 'SXQ', '164', ',0,14,164,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1654', '萍乡市_安源区', 'AYQ', '164', ',0,14,164,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1655', '萍乡市_湘东区', 'XDQ', '164', ',0,14,164,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1656', '萍乡市_莲花县', 'LHX', '164', ',0,14,164,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1657', '萍乡市_上栗县', 'SLX', '164', ',0,14,164,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1658', '萍乡市_芦溪县', 'LXX', '164', ',0,14,164,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1659', '九江市_市辖区', 'SXQ', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1660', '九江市_庐山区', 'LSQ', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1661', '九江市_浔阳区', 'XYQ', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1662', '九江市_九江县', 'JJX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1663', '九江市_武宁县', 'WNX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1664', '九江市_修水县', 'XSX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1665', '九江市_永修县', 'YXX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1666', '九江市_德安县', 'DAX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1667', '九江市_星子县', 'XZX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1668', '九江市_都昌县', 'DCX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1669', '九江市_湖口县', 'HKX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1670', '九江市_彭泽县', 'PZX', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1671', '九江市_瑞昌市', 'RCS', '165', ',0,14,165,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1672', '新余市_市辖区', 'SXQ', '166', ',0,14,166,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1673', '新余市_渝水区', 'YSQ', '166', ',0,14,166,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1674', '新余市_分宜县', 'FYX', '166', ',0,14,166,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1675', '鹰潭市_市辖区', 'SXQ', '167', ',0,14,167,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1676', '鹰潭市_月湖区', 'YHQ', '167', ',0,14,167,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1677', '鹰潭市_余江县', 'YJX', '167', ',0,14,167,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1678', '鹰潭市_贵溪市', 'GXS', '167', ',0,14,167,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1679', '赣州市_市辖区', 'SXQ', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1680', '赣州市_章贡区', 'ZGQ', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1681', '赣州市_赣县', 'GX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1682', '赣州市_信丰县', 'XFX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1683', '赣州市_大余县', 'DYX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1684', '赣州市_上犹县', 'SYX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1685', '赣州市_崇义县', 'CYX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1686', '赣州市_安远县', 'AYX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1687', '赣州市_龙南县', 'LNX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1688', '赣州市_定南县', 'DNX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1689', '赣州市_全南县', 'QNX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1690', '赣州市_宁都县', 'NDX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1691', '赣州市_于都县', 'YDX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1692', '赣州市_兴国县', 'XGX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1693', '赣州市_会昌县', 'HCX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1694', '赣州市_寻乌县', 'XWX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1695', '赣州市_石城县', 'SCX', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1696', '赣州市_瑞金市', 'RJS', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1697', '赣州市_南康市', 'NKS', '168', ',0,14,168,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1698', '吉安市_市辖区', 'SXQ', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1699', '吉安市_吉州区', 'JZQ', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1700', '吉安市_青原区', 'QYQ', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1701', '吉安市_吉安县', 'JAX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1702', '吉安市_吉水县', 'JSX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1703', '吉安市_峡江县', 'XJX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1704', '吉安市_新干县', 'XGX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1705', '吉安市_永丰县', 'YFX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1706', '吉安市_泰和县', 'THX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1707', '吉安市_遂川县', 'SCX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1708', '吉安市_万安县', 'WAX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1709', '吉安市_安福县', 'AFX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1710', '吉安市_永新县', 'YXX', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:01');
INSERT INTO `ab_sys_area` VALUES ('1711', '吉安市_井冈山市', 'JGSS', '169', ',0,14,169,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1712', '宜春市_市辖区', 'SXQ', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1713', '宜春市_袁州区', 'YZQ', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1714', '宜春市_奉新县', 'FXX', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1715', '宜春市_万载县', 'WZX', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1716', '宜春市_上高县', 'SGX', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1717', '宜春市_宜丰县', 'YFX', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1718', '宜春市_靖安县', 'JAX', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1719', '宜春市_铜鼓县', 'TGX', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1720', '宜春市_丰城市', 'FCS', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1721', '宜春市_樟树市', 'ZSS', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1722', '宜春市_高安市', 'GAS', '170', ',0,14,170,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1723', '抚州市_市辖区', 'SXQ', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1724', '抚州市_临川区', 'LCQ', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1725', '抚州市_南城县', 'NCX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1726', '抚州市_黎川县', 'LCX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1727', '抚州市_南丰县', 'NFX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1728', '抚州市_崇仁县', 'CRX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1729', '抚州市_乐安县', 'LAX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1730', '抚州市_宜黄县', 'YHX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1731', '抚州市_金溪县', 'JXX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1732', '抚州市_资溪县', 'ZXX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1733', '抚州市_东乡县', 'DXX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1734', '抚州市_广昌县', 'GCX', '171', ',0,14,171,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1735', '上饶市_市辖区', 'SXQ', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1736', '上饶市_信州区', 'XZQ', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1737', '上饶市_上饶县', 'SRX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1738', '上饶市_广丰县', 'GFX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1739', '上饶市_玉山县', 'YSX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1740', '上饶市_铅山县', 'QSX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1741', '上饶市_横峰县', 'HFX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1742', '上饶市_弋阳县', 'YYX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1743', '上饶市_余干县', 'YGX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1744', '上饶市_鄱阳县', 'PYX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1745', '上饶市_万年县', 'WNX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1746', '上饶市_婺源县', 'WYX', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1747', '上饶市_德兴市', 'DXS', '172', ',0,14,172,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1748', '济南市_市辖区', 'SXQ', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1749', '济南市_历下区', 'LXQ', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1750', '济南市_市中区', 'SZQ', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1751', '济南市_槐荫区', 'HYQ', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1752', '济南市_天桥区', 'TQQ', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1753', '济南市_历城区', 'LCQ', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1754', '济南市_长清区', 'CQQ', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1755', '济南市_平阴县', 'PYX', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1756', '济南市_济阳县', 'JYX', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1757', '济南市_商河县', 'SHX', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1758', '济南市_章丘市', 'ZQS', '173', ',0,15,173,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1759', '青岛市_市辖区', 'SXQ', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1760', '青岛市_市南区', 'SNQ', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1761', '青岛市_市北区', 'SBQ', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1762', '青岛市_四方区', 'SFQ', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1763', '青岛市_黄岛区', 'HDQ', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1764', '青岛市_崂山区', 'LSQ', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1765', '青岛市_李沧区', 'LCQ', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1766', '青岛市_城阳区', 'CYQ', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1767', '青岛市_胶州市', 'JZS', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1768', '青岛市_即墨市', 'JMS', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1769', '青岛市_平度市', 'PDS', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1770', '青岛市_胶南市', 'JNS', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1771', '青岛市_莱西市', 'LXS', '174', ',0,15,174,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1772', '淄博市_市辖区', 'SXQ', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1773', '淄博市_淄川区', 'ZCQ', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:02');
INSERT INTO `ab_sys_area` VALUES ('1774', '淄博市_张店区', 'ZDQ', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1775', '淄博市_博山区', 'BSQ', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1776', '淄博市_临淄区', 'LZQ', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1777', '淄博市_周村区', 'ZCQ', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1778', '淄博市_桓台县', 'HTX', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1779', '淄博市_高青县', 'GQX', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1780', '淄博市_沂源县', 'YYX', '175', ',0,15,175,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1781', '枣庄市_市辖区', 'SXQ', '176', ',0,15,176,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1782', '枣庄市_市中区', 'SZQ', '176', ',0,15,176,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1783', '枣庄市_薛城区', 'XCQ', '176', ',0,15,176,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1784', '枣庄市_峄城区', 'YCQ', '176', ',0,15,176,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1785', '枣庄市_台儿庄区', 'TEZQ', '176', ',0,15,176,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1786', '枣庄市_山亭区', 'STQ', '176', ',0,15,176,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1787', '枣庄市_滕州市', 'TZS', '176', ',0,15,176,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1788', '东营市_市辖区', 'SXQ', '177', ',0,15,177,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1789', '东营市_东营区', 'DYQ', '177', ',0,15,177,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1790', '东营市_河口区', 'HKQ', '177', ',0,15,177,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1791', '东营市_垦利县', 'KLX', '177', ',0,15,177,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1792', '东营市_利津县', 'LJX', '177', ',0,15,177,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1793', '东营市_广饶县', 'GRX', '177', ',0,15,177,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1794', '烟台市_市辖区', 'SXQ', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1795', '烟台市_芝罘区', 'ZFQ', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1796', '烟台市_福山区', 'FSQ', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1797', '烟台市_牟平区', 'MPQ', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1798', '烟台市_莱山区', 'LSQ', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1799', '烟台市_长岛县', 'CDX', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1800', '烟台市_龙口市', 'LKS', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1801', '烟台市_莱阳市', 'LYS', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1802', '烟台市_莱州市', 'LZS', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1803', '烟台市_蓬莱市', 'PLS', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1804', '烟台市_招远市', 'ZYS', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1805', '烟台市_栖霞市', 'QXS', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1806', '烟台市_海阳市', 'HYS', '178', ',0,15,178,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1807', '潍坊市_市辖区', 'SXQ', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1808', '潍坊市_潍城区', 'WCQ', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1809', '潍坊市_寒亭区', 'HTQ', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1810', '潍坊市_坊子区', 'FZQ', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1811', '潍坊市_奎文区', 'KWQ', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1812', '潍坊市_临朐县', 'LQX', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1813', '潍坊市_昌乐县', 'CLX', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1814', '潍坊市_青州市', 'QZS', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1815', '潍坊市_诸城市', 'ZCS', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1816', '潍坊市_寿光市', 'SGS', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1817', '潍坊市_安丘市', 'AQS', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1818', '潍坊市_高密市', 'GMS', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1819', '潍坊市_昌邑市', 'CYS', '179', ',0,15,179,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1820', '济宁市_市辖区', 'SXQ', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1821', '济宁市_市中区', 'SZQ', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1822', '济宁市_任城区', 'RCQ', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1823', '济宁市_微山县', 'WSX', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1824', '济宁市_鱼台县', 'YTX', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1825', '济宁市_金乡县', 'JXX', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1826', '济宁市_嘉祥县', 'JXX', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1827', '济宁市_汶上县', 'WSX', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1828', '济宁市_泗水县', 'SSX', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1829', '济宁市_梁山县', 'LSX', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1830', '济宁市_曲阜市', 'QFS', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1831', '济宁市_兖州市', 'YZS', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1832', '济宁市_邹城市', 'ZCS', '180', ',0,15,180,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1833', '泰安市_市辖区', 'SXQ', '181', ',0,15,181,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1834', '泰安市_泰山区', 'TSQ', '181', ',0,15,181,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1835', '泰安市_岱岳区', 'DYQ', '181', ',0,15,181,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1836', '泰安市_宁阳县', 'NYX', '181', ',0,15,181,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1837', '泰安市_东平县', 'DPX', '181', ',0,15,181,', '0', '3', '0', '0', '2008-11-24 11:06:03');
INSERT INTO `ab_sys_area` VALUES ('1838', '泰安市_新泰市', 'XTS', '181', ',0,15,181,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1839', '泰安市_肥城市', 'FCS', '181', ',0,15,181,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1840', '威海市_市辖区', 'SXQ', '182', ',0,15,182,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1841', '威海市_环翠区', 'HCQ', '182', ',0,15,182,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1842', '威海市_文登市', 'WDS', '182', ',0,15,182,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1843', '威海市_荣成市', 'RCS', '182', ',0,15,182,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1844', '威海市_乳山市', 'RSS', '182', ',0,15,182,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1845', '日照市_市辖区', 'SXQ', '183', ',0,15,183,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1846', '日照市_东港区', 'DGQ', '183', ',0,15,183,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1847', '日照市_岚山区', 'LSQ', '183', ',0,15,183,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1848', '日照市_五莲县', 'WLX', '183', ',0,15,183,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1849', '日照市_莒县', 'JX', '183', ',0,15,183,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1850', '莱芜市_市辖区', 'SXQ', '184', ',0,15,184,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1851', '莱芜市_莱城区', 'LCQ', '184', ',0,15,184,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1852', '莱芜市_钢城区', 'GCQ', '184', ',0,15,184,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1853', '临沂市_市辖区', 'SXQ', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1854', '临沂市_兰山区', 'LSQ', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1855', '临沂市_罗庄区', 'LZQ', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1856', '临沂市_河东区', 'HDQ', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1857', '临沂市_沂南县', 'YNX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1858', '临沂市_郯城县', 'TCX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1859', '临沂市_沂水县', 'YSX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1860', '临沂市_苍山县', 'CSX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1861', '临沂市_费县', 'FX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1862', '临沂市_平邑县', 'PYX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1863', '临沂市_莒南县', 'JNX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1864', '临沂市_蒙阴县', 'MYX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1865', '临沂市_临沭县', 'LSX', '185', ',0,15,185,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1866', '德州市_市辖区', 'SXQ', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1867', '德州市_德城区', 'DCQ', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1868', '德州市_陵县', 'LX', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1869', '德州市_宁津县', 'NJX', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1870', '德州市_庆云县', 'QYX', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1871', '德州市_临邑县', 'LYX', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1872', '德州市_齐河县', 'QHX', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1873', '德州市_平原县', 'PYX', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1874', '德州市_夏津县', 'XJX', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1875', '德州市_武城县', 'WCX', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1876', '德州市_乐陵市', 'LLS', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1877', '德州市_禹城市', 'YCS', '186', ',0,15,186,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1878', '聊城市_市辖区', 'SXQ', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1879', '聊城市_东昌府区', 'DCFQ', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1880', '聊城市_阳谷县', 'YGX', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1881', '聊城市_莘县', 'XX', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1882', '聊城市_茌平县', 'CPX', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1883', '聊城市_东阿县', 'DAX', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1884', '聊城市_冠县', 'GX', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1885', '聊城市_高唐县', 'GTX', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1886', '聊城市_临清市', 'LQS', '187', ',0,15,187,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1887', '滨州市_市辖区', 'SXQ', '188', ',0,15,188,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1888', '滨州市_滨城区', 'BCQ', '188', ',0,15,188,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1889', '滨州市_惠民县', 'HMX', '188', ',0,15,188,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1890', '滨州市_阳信县', 'YXX', '188', ',0,15,188,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1891', '滨州市_无棣县', 'WDX', '188', ',0,15,188,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1892', '滨州市_沾化县', 'ZHX', '188', ',0,15,188,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1893', '滨州市_博兴县', 'BXX', '188', ',0,15,188,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1894', '滨州市_邹平县', 'ZPX', '188', ',0,15,188,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1895', '荷泽市_市辖区', 'SXQ', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1896', '荷泽市_牡丹区', 'MDQ', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1897', '荷泽市_曹县', 'CX', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1898', '荷泽市_单县', 'DX', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1899', '荷泽市_成武县', 'CWX', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:04');
INSERT INTO `ab_sys_area` VALUES ('1900', '荷泽市_巨野县', 'JYX', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1901', '荷泽市_郓城县', 'YCX', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1902', '荷泽市_鄄城县', 'JCX', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1903', '荷泽市_定陶县', 'DTX', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1904', '荷泽市_东明县', 'DMX', '189', ',0,15,189,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1905', '郑州市_市辖区', 'SXQ', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1906', '郑州市_中原区', 'ZYQ', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1907', '郑州市_二七区', 'EQQ', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1908', '郑州市_管城回族区', 'GCHZQ', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1909', '郑州市_金水区', 'JSQ', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1910', '郑州市_上街区', 'SJQ', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1911', '郑州市_邙山区', 'MSQ', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1912', '郑州市_中牟县', 'ZMX', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1913', '郑州市_巩义市', 'GYS', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1914', '郑州市_荥阳市', 'YYS', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1915', '郑州市_新密市', 'XMS', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1916', '郑州市_新郑市', 'XZS', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1917', '郑州市_登封市', 'DFS', '190', ',0,16,190,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1918', '开封市_市辖区', 'SXQ', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1919', '开封市_龙亭区', 'LTQ', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1920', '开封市_顺河回族区', 'SHHZQ', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1921', '开封市_鼓楼区', 'GLQ', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1922', '开封市_南关区', 'NGQ', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1923', '开封市_郊区', 'JQ', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1924', '开封市_杞县', 'QX', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1925', '开封市_通许县', 'TXX', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1926', '开封市_尉氏县', 'WSX', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1927', '开封市_开封县', 'KFX', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1928', '开封市_兰考县', 'LKX', '191', ',0,16,191,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1929', '洛阳市_市辖区', 'SXQ', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1930', '洛阳市_老城区', 'LCQ', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1931', '洛阳市_西工区', 'XGQ', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1932', '洛阳市_廛河回族区', 'CHHZQ', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1933', '洛阳市_涧西区', 'JXQ', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1934', '洛阳市_吉利区', 'JLQ', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1935', '洛阳市_洛龙区', 'LLQ', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1936', '洛阳市_孟津县', 'MJX', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1937', '洛阳市_新安县', 'XAX', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1938', '洛阳市_栾川县', 'LCX', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1939', '洛阳市_嵩县', 'SX', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1940', '洛阳市_汝阳县', 'RYX', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1941', '洛阳市_宜阳县', 'YYX', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1942', '洛阳市_洛宁县', 'LNX', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1943', '洛阳市_伊川县', 'YCX', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1944', '洛阳市_偃师市', 'YSS', '192', ',0,16,192,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1945', '平顶山市_市辖区', 'SXQ', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1946', '平顶山市_新华区', 'XHQ', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1947', '平顶山市_卫东区', 'WDQ', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1948', '平顶山市_石龙区', 'SLQ', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1949', '平顶山市_湛河区', 'ZHQ', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1950', '平顶山市_宝丰县', 'BFX', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1951', '平顶山市_叶县', 'YX', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1952', '平顶山市_鲁山县', 'LSX', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1953', '平顶山市_郏县', 'JX', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1954', '平顶山市_舞钢市', 'WGS', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1955', '平顶山市_汝州市', 'RZS', '193', ',0,16,193,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1956', '安阳市_市辖区', 'SXQ', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1957', '安阳市_文峰区', 'WFQ', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1958', '安阳市_北关区', 'BGQ', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1959', '安阳市_殷都区', 'YDQ', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1960', '安阳市_龙安区', 'LAQ', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1961', '安阳市_安阳县', 'AYX', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1962', '安阳市_汤阴县', 'TYX', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1963', '安阳市_滑县', 'HX', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:05');
INSERT INTO `ab_sys_area` VALUES ('1964', '安阳市_内黄县', 'NHX', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1965', '安阳市_林州市', 'LZS', '194', ',0,16,194,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1966', '鹤壁市_市辖区', 'SXQ', '195', ',0,16,195,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1967', '鹤壁市_鹤山区', 'HSQ', '195', ',0,16,195,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1968', '鹤壁市_山城区', 'SCQ', '195', ',0,16,195,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1969', '鹤壁市_淇滨区', 'QBQ', '195', ',0,16,195,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1970', '鹤壁市_浚县', 'JX', '195', ',0,16,195,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1971', '鹤壁市_淇县', 'QX', '195', ',0,16,195,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1972', '新乡市_市辖区', 'SXQ', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1973', '新乡市_红旗区', 'HQQ', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1974', '新乡市_卫滨区', 'WBQ', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1975', '新乡市_凤泉区', 'FQQ', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1976', '新乡市_牧野区', 'MYQ', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1977', '新乡市_新乡县', 'XXX', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1978', '新乡市_获嘉县', 'HJX', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1979', '新乡市_原阳县', 'YYX', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1980', '新乡市_延津县', 'YJX', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1981', '新乡市_封丘县', 'FQX', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1982', '新乡市_长垣县', 'CYX', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1983', '新乡市_卫辉市', 'WHS', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1984', '新乡市_辉县市', 'HXS', '196', ',0,16,196,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1985', '焦作市_市辖区', 'SXQ', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1986', '焦作市_解放区', 'JFQ', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1987', '焦作市_中站区', 'ZZQ', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1988', '焦作市_马村区', 'MCQ', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1989', '焦作市_山阳区', 'SYQ', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1990', '焦作市_修武县', 'XWX', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1991', '焦作市_博爱县', 'BAX', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1992', '焦作市_武陟县', 'WZX', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1993', '焦作市_温县', 'WX', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1994', '焦作市_济源市', 'JYS', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1995', '焦作市_沁阳市', 'QYS', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1996', '焦作市_孟州市', 'MZS', '197', ',0,16,197,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1997', '濮阳市_市辖区', 'SXQ', '198', ',0,16,198,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1998', '濮阳市_华龙区', 'HLQ', '198', ',0,16,198,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('1999', '濮阳市_清丰县', 'QFX', '198', ',0,16,198,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2000', '濮阳市_南乐县', 'NLX', '198', ',0,16,198,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2001', '濮阳市_范县', 'FX', '198', ',0,16,198,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2002', '濮阳市_台前县', 'TQX', '198', ',0,16,198,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2003', '濮阳市_濮阳县', 'PYX', '198', ',0,16,198,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2004', '许昌市_市辖区', 'SXQ', '199', ',0,16,199,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2005', '许昌市_魏都区', 'WDQ', '199', ',0,16,199,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2006', '许昌市_许昌县', 'XCX', '199', ',0,16,199,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2007', '许昌市_鄢陵县', 'YLX', '199', ',0,16,199,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2008', '许昌市_襄城县', 'XCX', '199', ',0,16,199,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2009', '许昌市_禹州市', 'YZS', '199', ',0,16,199,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2010', '许昌市_长葛市', 'CGS', '199', ',0,16,199,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2011', '漯河市_市辖区', 'SXQ', '200', ',0,16,200,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2012', '漯河市_源汇区', 'YHQ', '200', ',0,16,200,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2013', '漯河市_郾城区', 'YCQ', '200', ',0,16,200,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2014', '漯河市_召陵区', 'ZLQ', '200', ',0,16,200,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2015', '漯河市_舞阳县', 'WYX', '200', ',0,16,200,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2016', '漯河市_临颍县', 'LYX', '200', ',0,16,200,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2017', '三门峡市_市辖区', 'SXQ', '201', ',0,16,201,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2018', '三门峡市_湖滨区', 'HBQ', '201', ',0,16,201,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2019', '三门峡市_渑池县', 'SCX', '201', ',0,16,201,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2020', '三门峡市_陕县', 'SX', '201', ',0,16,201,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2021', '三门峡市_卢氏县', 'LSX', '201', ',0,16,201,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2022', '三门峡市_义马市', 'YMS', '201', ',0,16,201,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2023', '三门峡市_灵宝市', 'LBS', '201', ',0,16,201,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2024', '南阳市_市辖区', 'SXQ', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2025', '南阳市_宛城区', 'WCQ', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2026', '南阳市_卧龙区', 'WLQ', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:06');
INSERT INTO `ab_sys_area` VALUES ('2027', '南阳市_南召县', 'NZX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2028', '南阳市_方城县', 'FCX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2029', '南阳市_西峡县', 'XXX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2030', '南阳市_镇平县', 'ZPX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2031', '南阳市_内乡县', 'NXX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2032', '南阳市_淅川县', 'XCX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2033', '南阳市_社旗县', 'SQX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2034', '南阳市_唐河县', 'THX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2035', '南阳市_新野县', 'XYX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2036', '南阳市_桐柏县', 'TBX', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2037', '南阳市_邓州市', 'DZS', '202', ',0,16,202,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2038', '商丘市_市辖区', 'SXQ', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2039', '商丘市_梁园区', 'LYQ', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2040', '商丘市_睢阳区', 'SYQ', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2041', '商丘市_民权县', 'MQX', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2042', '商丘市_睢县', 'SX', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2043', '商丘市_宁陵县', 'NLX', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2044', '商丘市_柘城县', 'ZCX', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2045', '商丘市_虞城县', 'YCX', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2046', '商丘市_夏邑县', 'XYX', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2047', '商丘市_永城市', 'YCS', '203', ',0,16,203,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2048', '信阳市_市辖区', 'SXQ', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2049', '信阳市_师河区', 'SHQ', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2050', '信阳市_平桥区', 'PQQ', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2051', '信阳市_罗山县', 'LSX', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2052', '信阳市_光山县', 'GSX', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2053', '信阳市_新县', 'XX', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2054', '信阳市_商城县', 'SCX', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2055', '信阳市_固始县', 'GSX', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2056', '信阳市_潢川县', 'HCX', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2057', '信阳市_淮滨县', 'HBX', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2058', '信阳市_息县', 'XX', '204', ',0,16,204,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2059', '周口市_市辖区', 'SXQ', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2060', '周口市_川汇区', 'CHQ', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2061', '周口市_扶沟县', 'FGX', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2062', '周口市_西华县', 'XHX', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2063', '周口市_商水县', 'SSX', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2064', '周口市_沈丘县', 'SQX', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2065', '周口市_郸城县', 'DCX', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2066', '周口市_淮阳县', 'HYX', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2067', '周口市_太康县', 'TKX', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2068', '周口市_鹿邑县', 'LYX', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2069', '周口市_项城市', 'XCS', '205', ',0,16,205,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2070', '驻马店市_市辖区', 'SXQ', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2071', '驻马店市_驿城区', 'YCQ', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2072', '驻马店市_西平县', 'XPX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2073', '驻马店市_上蔡县', 'SCX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2074', '驻马店市_平舆县', 'PYX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2075', '驻马店市_正阳县', 'ZYX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2076', '驻马店市_确山县', 'QSX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2077', '驻马店市_泌阳县', 'MYX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2078', '驻马店市_汝南县', 'RNX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2079', '驻马店市_遂平县', 'SPX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2080', '驻马店市_新蔡县', 'XCX', '206', ',0,16,206,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2081', '武汉市_市辖区', 'SXQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2082', '武汉市_江岸区', 'JAQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2083', '武汉市_江汉区', 'JHQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2084', '武汉市_乔口区', 'QKQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2085', '武汉市_汉阳区', 'HYQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2086', '武汉市_武昌区', 'WCQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2087', '武汉市_青山区', 'QSQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2088', '武汉市_洪山区', 'HSQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2089', '武汉市_东西湖区', 'DXHQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:07');
INSERT INTO `ab_sys_area` VALUES ('2090', '武汉市_汉南区', 'HNQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2091', '武汉市_蔡甸区', 'CDQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2092', '武汉市_江夏区', 'JXQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2093', '武汉市_黄陂区', 'HBQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2094', '武汉市_新洲区', 'XZQ', '207', ',0,17,207,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2095', '黄石市_市辖区', 'SXQ', '208', ',0,17,208,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2096', '黄石市_黄石港区', 'HSGQ', '208', ',0,17,208,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2097', '黄石市_西塞山区', 'XSSQ', '208', ',0,17,208,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2098', '黄石市_下陆区', 'XLQ', '208', ',0,17,208,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2099', '黄石市_铁山区', 'TSQ', '208', ',0,17,208,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2100', '黄石市_阳新县', 'YXX', '208', ',0,17,208,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2101', '黄石市_大冶市', 'DYS', '208', ',0,17,208,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2102', '十堰市_市辖区', 'SXQ', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2103', '十堰市_茅箭区', 'MJQ', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2104', '十堰市_张湾区', 'ZWQ', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2105', '十堰市_郧县', 'YX', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2106', '十堰市_郧西县', 'YXX', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2107', '十堰市_竹山县', 'ZSX', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2108', '十堰市_竹溪县', 'ZXX', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2109', '十堰市_房县', 'FX', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2110', '十堰市_丹江口市', 'DJKS', '209', ',0,17,209,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2111', '宜昌市_市辖区', 'SXQ', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2112', '宜昌市_西陵区', 'XLQ', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2113', '宜昌市_伍家岗区', 'WJGQ', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2114', '宜昌市_点军区', 'DJQ', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2115', '宜昌市_猇亭区', 'XTQ', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2116', '宜昌市_夷陵区', 'YLQ', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2117', '宜昌市_远安县', 'YAX', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2118', '宜昌市_兴山县', 'XSX', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2119', '宜昌市_秭归县', 'ZGX', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2120', '宜昌市_长阳土家族自治县', 'CYTJZZZX', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2121', '宜昌市_五峰土家族自治县', 'WFTJZZZX', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2122', '宜昌市_宜都市', 'YDS', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2123', '宜昌市_当阳市', 'DYS', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2124', '宜昌市_枝江市', 'ZJS', '210', ',0,17,210,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2125', '襄樊市_市辖区', 'SXQ', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2126', '襄樊市_襄城区', 'XCQ', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2127', '襄樊市_樊城区', 'FCQ', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2128', '襄樊市_襄阳区', 'XYQ', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2129', '襄樊市_南漳县', 'NZX', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2130', '襄樊市_谷城县', 'GCX', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2131', '襄樊市_保康县', 'BKX', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2132', '襄樊市_老河口市', 'LHKS', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2133', '襄樊市_枣阳市', 'ZYS', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2134', '襄樊市_宜城市', 'YCS', '211', ',0,17,211,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2135', '鄂州市_市辖区', 'SXQ', '212', ',0,17,212,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2136', '鄂州市_梁子湖区', 'LZHQ', '212', ',0,17,212,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2137', '鄂州市_华容区', 'HRQ', '212', ',0,17,212,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2138', '鄂州市_鄂城区', 'ECQ', '212', ',0,17,212,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2139', '荆门市_市辖区', 'SXQ', '213', ',0,17,213,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2140', '荆门市_东宝区', 'DBQ', '213', ',0,17,213,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2141', '荆门市_掇刀区', 'DDQ', '213', ',0,17,213,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2142', '荆门市_京山县', 'JSX', '213', ',0,17,213,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2143', '荆门市_沙洋县', 'SYX', '213', ',0,17,213,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2144', '荆门市_钟祥市', 'ZXS', '213', ',0,17,213,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2145', '孝感市_市辖区', 'SXQ', '214', ',0,17,214,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2146', '孝感市_孝南区', 'XNQ', '214', ',0,17,214,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2147', '孝感市_孝昌县', 'XCX', '214', ',0,17,214,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2148', '孝感市_大悟县', 'DWX', '214', ',0,17,214,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2149', '孝感市_云梦县', 'YMX', '214', ',0,17,214,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2150', '孝感市_应城市', 'YCS', '214', ',0,17,214,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2151', '孝感市_安陆市', 'ALS', '214', ',0,17,214,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2152', '孝感市_汉川市', 'HCS', '214', ',0,17,214,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2153', '荆州市_市辖区', 'SXQ', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:08');
INSERT INTO `ab_sys_area` VALUES ('2154', '荆州市_沙市区', 'SSQ', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2155', '荆州市_荆州区', 'JZQ', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2156', '荆州市_公安县', 'GAX', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2157', '荆州市_监利县', 'JLX', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2158', '荆州市_江陵县', 'JLX', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2159', '荆州市_石首市', 'SSS', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2160', '荆州市_洪湖市', 'HHS', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2161', '荆州市_松滋市', 'SZS', '215', ',0,17,215,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2162', '黄冈市_市辖区', 'SXQ', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2163', '黄冈市_黄州区', 'HZQ', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2164', '黄冈市_团风县', 'TFX', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2165', '黄冈市_红安县', 'HAX', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2166', '黄冈市_罗田县', 'LTX', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2167', '黄冈市_英山县', 'YSX', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2168', '黄冈市_浠水县', 'XSX', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2169', '黄冈市_蕲春县', 'QCX', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2170', '黄冈市_黄梅县', 'HMX', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2171', '黄冈市_麻城市', 'MCS', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2172', '黄冈市_武穴市', 'WXS', '216', ',0,17,216,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2173', '咸宁市_市辖区', 'SXQ', '217', ',0,17,217,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2174', '咸宁市_咸安区', 'XAQ', '217', ',0,17,217,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2175', '咸宁市_嘉鱼县', 'JYX', '217', ',0,17,217,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2176', '咸宁市_通城县', 'TCX', '217', ',0,17,217,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2177', '咸宁市_崇阳县', 'CYX', '217', ',0,17,217,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2178', '咸宁市_通山县', 'TSX', '217', ',0,17,217,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2179', '咸宁市_赤壁市', 'CBS', '217', ',0,17,217,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2180', '随州市_市辖区', 'SXQ', '218', ',0,17,218,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2181', '随州市_曾都区', 'ZDQ', '218', ',0,17,218,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2182', '随州市_广水市', 'GSS', '218', ',0,17,218,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2183', '恩施土家族苗族自治州_恩施市', 'ESS', '219', ',0,17,219,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2184', '恩施土家族苗族自治州_利川市', 'LCS', '219', ',0,17,219,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2185', '恩施土家族苗族自治州_建始县', 'JSX', '219', ',0,17,219,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2186', '恩施土家族苗族自治州_巴东县', 'BDX', '219', ',0,17,219,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2187', '恩施土家族苗族自治州_宣恩县', 'XEX', '219', ',0,17,219,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2188', '恩施土家族苗族自治州_咸丰县', 'XFX', '219', ',0,17,219,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2189', '恩施土家族苗族自治州_来凤县', 'LFX', '219', ',0,17,219,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2190', '恩施土家族苗族自治州_鹤峰县', 'HFX', '219', ',0,17,219,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2191', '省直辖行政单位_仙桃市', 'XTS', '220', ',0,17,220,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2192', '省直辖行政单位_潜江市', 'QJS', '220', ',0,17,220,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2193', '省直辖行政单位_天门市', 'TMS', '220', ',0,17,220,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2194', '省直辖行政单位_神农架林区', 'SNJLQ', '220', ',0,17,220,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2195', '长沙市_市辖区', 'SXQ', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2196', '长沙市_芙蓉区', 'FRQ', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2197', '长沙市_天心区', 'TXQ', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2198', '长沙市_岳麓区', 'YLQ', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2199', '长沙市_开福区', 'KFQ', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2200', '长沙市_雨花区', 'YHQ', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2201', '长沙市_长沙县', 'CSX', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2202', '长沙市_望城县', 'WCX', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2203', '长沙市_宁乡县', 'NXX', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2204', '长沙市_浏阳市', 'LYS', '221', ',0,18,221,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2205', '株洲市_市辖区', 'SXQ', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2206', '株洲市_荷塘区', 'HTQ', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2207', '株洲市_芦淞区', 'LSQ', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2208', '株洲市_石峰区', 'SFQ', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2209', '株洲市_天元区', 'TYQ', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2210', '株洲市_株洲县', 'ZZX', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2211', '株洲市_攸县', 'YX', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2212', '株洲市_茶陵县', 'CLX', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2213', '株洲市_炎陵县', 'YLX', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2214', '株洲市_醴陵市', 'LLS', '222', ',0,18,222,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2215', '湘潭市_市辖区', 'SXQ', '223', ',0,18,223,', '0', '3', '0', '0', '2008-11-24 11:06:09');
INSERT INTO `ab_sys_area` VALUES ('2216', '湘潭市_雨湖区', 'YHQ', '223', ',0,18,223,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2217', '湘潭市_岳塘区', 'YTQ', '223', ',0,18,223,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2218', '湘潭市_湘潭县', 'XTX', '223', ',0,18,223,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2219', '湘潭市_湘乡市', 'XXS', '223', ',0,18,223,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2220', '湘潭市_韶山市', 'SSS', '223', ',0,18,223,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2221', '衡阳市_市辖区', 'SXQ', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2222', '衡阳市_珠晖区', 'ZHQ', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2223', '衡阳市_雁峰区', 'YFQ', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2224', '衡阳市_石鼓区', 'SGQ', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2225', '衡阳市_蒸湘区', 'ZXQ', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2226', '衡阳市_南岳区', 'NYQ', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2227', '衡阳市_衡阳县', 'HYX', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2228', '衡阳市_衡南县', 'HNX', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2229', '衡阳市_衡山县', 'HSX', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2230', '衡阳市_衡东县', 'HDX', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2231', '衡阳市_祁东县', 'QDX', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2232', '衡阳市_耒阳市', 'LYS', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2233', '衡阳市_常宁市', 'CNS', '224', ',0,18,224,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2234', '邵阳市_市辖区', 'SXQ', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2235', '邵阳市_双清区', 'SQQ', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2236', '邵阳市_大祥区', 'DXQ', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2237', '邵阳市_北塔区', 'BTQ', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2238', '邵阳市_邵东县', 'SDX', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2239', '邵阳市_新邵县', 'XSX', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2240', '邵阳市_邵阳县', 'SYX', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2241', '邵阳市_隆回县', 'LHX', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2242', '邵阳市_洞口县', 'DKX', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2243', '邵阳市_绥宁县', 'SNX', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2244', '邵阳市_新宁县', 'XNX', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2245', '邵阳市_城步苗族自治县', 'CBMZZZX', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2246', '邵阳市_武冈市', 'WGS', '225', ',0,18,225,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2247', '岳阳市_市辖区', 'SXQ', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2248', '岳阳市_岳阳楼区', 'YYLQ', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2249', '岳阳市_云溪区', 'YXQ', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2250', '岳阳市_君山区', 'JSQ', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2251', '岳阳市_岳阳县', 'YYX', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2252', '岳阳市_华容县', 'HRX', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2253', '岳阳市_湘阴县', 'XYX', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2254', '岳阳市_平江县', 'PJX', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2255', '岳阳市_汨罗市', 'MLS', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2256', '岳阳市_临湘市', 'LXS', '226', ',0,18,226,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2257', '常德市_市辖区', 'SXQ', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2258', '常德市_武陵区', 'WLQ', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2259', '常德市_鼎城区', 'DCQ', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2260', '常德市_安乡县', 'AXX', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2261', '常德市_汉寿县', 'HSX', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2262', '常德市_澧县', 'LX', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2263', '常德市_临澧县', 'LLX', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2264', '常德市_桃源县', 'TYX', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2265', '常德市_石门县', 'SMX', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2266', '常德市_津市市', 'JSS', '227', ',0,18,227,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2267', '张家界市_市辖区', 'SXQ', '228', ',0,18,228,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2268', '张家界市_永定区', 'YDQ', '228', ',0,18,228,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2269', '张家界市_武陵源区', 'WLYQ', '228', ',0,18,228,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2270', '张家界市_慈利县', 'CLX', '228', ',0,18,228,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2271', '张家界市_桑植县', 'SZX', '228', ',0,18,228,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2272', '益阳市_市辖区', 'SXQ', '229', ',0,18,229,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2273', '益阳市_资阳区', 'ZYQ', '229', ',0,18,229,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2274', '益阳市_赫山区', 'HSQ', '229', ',0,18,229,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2275', '益阳市_南县', 'NX', '229', ',0,18,229,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2276', '益阳市_桃江县', 'TJX', '229', ',0,18,229,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2277', '益阳市_安化县', 'AHX', '229', ',0,18,229,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2278', '益阳市_沅江市', 'YJS', '229', ',0,18,229,', '0', '3', '0', '0', '2008-11-24 11:06:10');
INSERT INTO `ab_sys_area` VALUES ('2279', '郴州市_市辖区', 'SXQ', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2280', '郴州市_北湖区', 'BHQ', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2281', '郴州市_苏仙区', 'SXQ', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2282', '郴州市_桂阳县', 'GYX', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2283', '郴州市_宜章县', 'YZX', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2284', '郴州市_永兴县', 'YXX', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2285', '郴州市_嘉禾县', 'JHX', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2286', '郴州市_临武县', 'LWX', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2287', '郴州市_汝城县', 'RCX', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2288', '郴州市_桂东县', 'GDX', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2289', '郴州市_安仁县', 'ARX', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2290', '郴州市_资兴市', 'ZXS', '230', ',0,18,230,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2291', '永州市_市辖区', 'SXQ', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2292', '永州市_芝山区', 'ZSQ', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2293', '永州市_冷水滩区', 'LSTQ', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2294', '永州市_祁阳县', 'QYX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2295', '永州市_东安县', 'DAX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2296', '永州市_双牌县', 'SPX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2297', '永州市_道县', 'DX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2298', '永州市_江永县', 'JYX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2299', '永州市_宁远县', 'NYX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2300', '永州市_蓝山县', 'LSX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2301', '永州市_新田县', 'XTX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2302', '永州市_江华瑶族自治县', 'JHYZZZX', '231', ',0,18,231,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2303', '怀化市_市辖区', 'SXQ', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2304', '怀化市_鹤城区', 'HCQ', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2305', '怀化市_中方县', 'ZFX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2306', '怀化市_沅陵县', 'YLX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2307', '怀化市_辰溪县', 'CXX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2308', '怀化市_溆浦县', 'XPX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2309', '怀化市_会同县', 'HTX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2310', '怀化市_麻阳苗族自治县', 'MYMZZZX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2311', '怀化市_新晃侗族自治县', 'XHDZZZX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2312', '怀化市_芷江侗族自治县', 'ZJDZZZX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2313', '怀化市_靖州苗族侗族自治县', 'JZMZDZZZX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2314', '怀化市_通道侗族自治县', 'TDDZZZX', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2315', '怀化市_洪江市', 'HJS', '232', ',0,18,232,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2316', '娄底市_市辖区', 'SXQ', '233', ',0,18,233,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2317', '娄底市_娄星区', 'LXQ', '233', ',0,18,233,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2318', '娄底市_双峰县', 'SFX', '233', ',0,18,233,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2319', '娄底市_新化县', 'XHX', '233', ',0,18,233,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2320', '娄底市_冷水江市', 'LSJS', '233', ',0,18,233,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2321', '娄底市_涟源市', 'LYS', '233', ',0,18,233,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2322', '湘西土家族苗族自治州_吉首市', 'JSS', '234', ',0,18,234,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2323', '湘西土家族苗族自治州_泸溪县', 'LXX', '234', ',0,18,234,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2324', '湘西土家族苗族自治州_凤凰县', 'FHX', '234', ',0,18,234,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2325', '湘西土家族苗族自治州_花垣县', 'HYX', '234', ',0,18,234,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2326', '湘西土家族苗族自治州_保靖县', 'BJX', '234', ',0,18,234,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2327', '湘西土家族苗族自治州_古丈县', 'GZX', '234', ',0,18,234,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2328', '湘西土家族苗族自治州_永顺县', 'YSX', '234', ',0,18,234,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2329', '湘西土家族苗族自治州_龙山县', 'LSX', '234', ',0,18,234,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2330', '广州市_市辖区', 'SXQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2331', '广州市_东山区', 'DSQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2332', '广州市_荔湾区', 'LWQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2333', '广州市_越秀区', 'YXQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2334', '广州市_海珠区', 'HZQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2335', '广州市_天河区', 'THQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2336', '广州市_芳村区', 'FCQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2337', '广州市_白云区', 'BYQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2338', '广州市_黄埔区', 'HPQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2339', '广州市_番禺区', 'FYQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2340', '广州市_花都区', 'HDQ', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2341', '广州市_增城市', 'ZCS', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:11');
INSERT INTO `ab_sys_area` VALUES ('2342', '广州市_从化市', 'CHS', '235', ',0,19,235,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2343', '韶关市_市辖区', 'SXQ', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2344', '韶关市_武江区', 'WJQ', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2345', '韶关市_浈江区', 'ZJQ', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2346', '韶关市_曲江区', 'QJQ', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2347', '韶关市_始兴县', 'SXX', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2348', '韶关市_仁化县', 'RHX', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2349', '韶关市_翁源县', 'WYX', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2350', '韶关市_乳源瑶族自治县', 'RYYZZZX', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2351', '韶关市_新丰县', 'XFX', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2352', '韶关市_乐昌市', 'LCS', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2353', '韶关市_南雄市', 'NXS', '236', ',0,19,236,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2354', '深圳市_市辖区', 'SXQ', '237', ',0,19,237,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2355', '深圳市_罗湖区', 'LHQ', '237', ',0,19,237,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2356', '深圳市_福田区', 'FTQ', '237', ',0,19,237,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2357', '深圳市_南山区', 'NSQ', '237', ',0,19,237,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2358', '深圳市_宝安区', 'BAQ', '237', ',0,19,237,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2359', '深圳市_龙岗区', 'LGQ', '237', ',0,19,237,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2360', '深圳市_盐田区', 'YTQ', '237', ',0,19,237,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2361', '珠海市_市辖区', 'SXQ', '238', ',0,19,238,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2362', '珠海市_香洲区', 'XZQ', '238', ',0,19,238,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2363', '珠海市_斗门区', 'DMQ', '238', ',0,19,238,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2364', '珠海市_金湾区', 'JWQ', '238', ',0,19,238,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2365', '汕头市_市辖区', 'SXQ', '239', ',0,19,239,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2366', '汕头市_龙湖区', 'LHQ', '239', ',0,19,239,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2367', '汕头市_金平区', 'JPQ', '239', ',0,19,239,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2368', '汕头市_濠江区', 'HJQ', '239', ',0,19,239,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2369', '汕头市_潮阳区', 'CYQ', '239', ',0,19,239,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2370', '汕头市_潮南区', 'CNQ', '239', ',0,19,239,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2371', '汕头市_澄海区', 'CHQ', '239', ',0,19,239,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2372', '汕头市_南澳县', 'NAX', '239', ',0,19,239,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2373', '佛山市_市辖区', 'SXQ', '240', ',0,19,240,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2374', '佛山市_禅城区', 'CCQ', '240', ',0,19,240,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2375', '佛山市_南海区', 'NHQ', '240', ',0,19,240,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2376', '佛山市_顺德区', 'SDQ', '240', ',0,19,240,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2377', '佛山市_三水区', 'SSQ', '240', ',0,19,240,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2378', '佛山市_高明区', 'GMQ', '240', ',0,19,240,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2379', '江门市_市辖区', 'SXQ', '241', ',0,19,241,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2380', '江门市_蓬江区', 'PJQ', '241', ',0,19,241,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2381', '江门市_江海区', 'JHQ', '241', ',0,19,241,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2382', '江门市_新会区', 'XHQ', '241', ',0,19,241,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2383', '江门市_台山市', 'TSS', '241', ',0,19,241,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2384', '江门市_开平市', 'KPS', '241', ',0,19,241,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2385', '江门市_鹤山市', 'HSS', '241', ',0,19,241,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2386', '江门市_恩平市', 'EPS', '241', ',0,19,241,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2387', '湛江市_市辖区', 'SXQ', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2388', '湛江市_赤坎区', 'CKQ', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2389', '湛江市_霞山区', 'XSQ', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2390', '湛江市_坡头区', 'PTQ', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2391', '湛江市_麻章区', 'MZQ', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2392', '湛江市_遂溪县', 'SXX', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2393', '湛江市_徐闻县', 'XWX', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2394', '湛江市_廉江市', 'LJS', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2395', '湛江市_雷州市', 'LZS', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2396', '湛江市_吴川市', 'WCS', '242', ',0,19,242,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2397', '茂名市_市辖区', 'SXQ', '243', ',0,19,243,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2398', '茂名市_茂南区', 'MNQ', '243', ',0,19,243,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2399', '茂名市_茂港区', 'MGQ', '243', ',0,19,243,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2400', '茂名市_电白县', 'DBX', '243', ',0,19,243,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2401', '茂名市_高州市', 'GZS', '243', ',0,19,243,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2402', '茂名市_化州市', 'HZS', '243', ',0,19,243,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2403', '茂名市_信宜市', 'XYS', '243', ',0,19,243,', '0', '3', '0', '0', '2008-11-24 11:06:12');
INSERT INTO `ab_sys_area` VALUES ('2404', '肇庆市_市辖区', 'SXQ', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2405', '肇庆市_端州区', 'DZQ', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2406', '肇庆市_鼎湖区', 'DHQ', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2407', '肇庆市_广宁县', 'GNX', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2408', '肇庆市_怀集县', 'HJX', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2409', '肇庆市_封开县', 'FKX', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2410', '肇庆市_德庆县', 'DQX', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2411', '肇庆市_高要市', 'GYS', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2412', '肇庆市_四会市', 'SHS', '244', ',0,19,244,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2413', '惠州市_市辖区', 'SXQ', '245', ',0,19,245,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2414', '惠州市_惠城区', 'HCQ', '245', ',0,19,245,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2415', '惠州市_惠阳区', 'HYQ', '245', ',0,19,245,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2416', '惠州市_博罗县', 'BLX', '245', ',0,19,245,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2417', '惠州市_惠东县', 'HDX', '245', ',0,19,245,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2418', '惠州市_龙门县', 'LMX', '245', ',0,19,245,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2419', '梅州市_市辖区', 'SXQ', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2420', '梅州市_梅江区', 'MJQ', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2421', '梅州市_梅县', 'MX', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2422', '梅州市_大埔县', 'DPX', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2423', '梅州市_丰顺县', 'FSX', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2424', '梅州市_五华县', 'WHX', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2425', '梅州市_平远县', 'PYX', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2426', '梅州市_蕉岭县', 'JLX', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2427', '梅州市_兴宁市', 'XNS', '246', ',0,19,246,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2428', '汕尾市_市辖区', 'SXQ', '247', ',0,19,247,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2429', '汕尾市_城区', 'CQ', '247', ',0,19,247,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2430', '汕尾市_海丰县', 'HFX', '247', ',0,19,247,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2431', '汕尾市_陆河县', 'LHX', '247', ',0,19,247,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2432', '汕尾市_陆丰市', 'LFS', '247', ',0,19,247,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2433', '河源市_市辖区', 'SXQ', '248', ',0,19,248,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2434', '河源市_源城区', 'YCQ', '248', ',0,19,248,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2435', '河源市_紫金县', 'ZJX', '248', ',0,19,248,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2436', '河源市_龙川县', 'LCX', '248', ',0,19,248,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2437', '河源市_连平县', 'LPX', '248', ',0,19,248,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2438', '河源市_和平县', 'HPX', '248', ',0,19,248,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2439', '河源市_东源县', 'DYX', '248', ',0,19,248,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2440', '阳江市_市辖区', 'SXQ', '249', ',0,19,249,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2441', '阳江市_江城区', 'JCQ', '249', ',0,19,249,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2442', '阳江市_阳西县', 'YXX', '249', ',0,19,249,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2443', '阳江市_阳东县', 'YDX', '249', ',0,19,249,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2444', '阳江市_阳春市', 'YCS', '249', ',0,19,249,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2445', '清远市_市辖区', 'SXQ', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2446', '清远市_清城区', 'QCQ', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2447', '清远市_佛冈县', 'FGX', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2448', '清远市_阳山县', 'YSX', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2449', '清远市_连山壮族瑶族自治县', 'LSZZYZZZX', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2450', '清远市_连南瑶族自治县', 'LNYZZZX', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2451', '清远市_清新县', 'QXX', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2452', '清远市_英德市', 'YDS', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2453', '清远市_连州市', 'LZS', '250', ',0,19,250,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2454', '潮州市_市辖区', 'SXQ', '253', ',0,19,253,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2455', '潮州市_湘桥区', 'XQQ', '253', ',0,19,253,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2456', '潮州市_潮安县', 'CAX', '253', ',0,19,253,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2457', '潮州市_饶平县', 'RPX', '253', ',0,19,253,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2458', '揭阳市_市辖区', 'SXQ', '254', ',0,19,254,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2459', '揭阳市_榕城区', 'RCQ', '254', ',0,19,254,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2460', '揭阳市_揭东县', 'JDX', '254', ',0,19,254,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2461', '揭阳市_揭西县', 'JXX', '254', ',0,19,254,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2462', '揭阳市_惠来县', 'HLX', '254', ',0,19,254,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2463', '揭阳市_普宁市', 'PNS', '254', ',0,19,254,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2464', '云浮市_市辖区', 'SXQ', '255', ',0,19,255,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2465', '云浮市_云城区', 'YCQ', '255', ',0,19,255,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2466', '云浮市_新兴县', 'XXX', '255', ',0,19,255,', '0', '3', '0', '0', '2008-11-24 11:06:13');
INSERT INTO `ab_sys_area` VALUES ('2467', '云浮市_郁南县', 'YNX', '255', ',0,19,255,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2468', '云浮市_云安县', 'YAX', '255', ',0,19,255,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2469', '云浮市_罗定市', 'LDS', '255', ',0,19,255,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2470', '南宁市_市辖区', 'SXQ', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2471', '南宁市_兴宁区', 'XNQ', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2472', '南宁市_青秀区', 'QXQ', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2473', '南宁市_江南区', 'JNQ', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2474', '南宁市_西乡塘区', 'XXTQ', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2475', '南宁市_良庆区', 'LQQ', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2476', '南宁市_邕宁区', 'YNQ', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2477', '南宁市_武鸣县', 'WMX', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2478', '南宁市_隆安县', 'LAX', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2479', '南宁市_马山县', 'MSX', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2480', '南宁市_上林县', 'SLX', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2481', '南宁市_宾阳县', 'BYX', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2482', '南宁市_横县', 'HX', '256', ',0,20,256,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2483', '柳州市_市辖区', 'SXQ', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2484', '柳州市_城中区', 'CZQ', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2485', '柳州市_鱼峰区', 'YFQ', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2486', '柳州市_柳南区', 'LNQ', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2487', '柳州市_柳北区', 'LBQ', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2488', '柳州市_柳江县', 'LJX', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2489', '柳州市_柳城县', 'LCX', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2490', '柳州市_鹿寨县', 'LZX', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2491', '柳州市_融安县', 'RAX', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2492', '柳州市_融水苗族自治县', 'RSMZZZX', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2493', '柳州市_三江侗族自治县', 'SJDZZZX', '257', ',0,20,257,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2494', '桂林市_市辖区', 'SXQ', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2495', '桂林市_秀峰区', 'XFQ', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2496', '桂林市_叠彩区', 'DCQ', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2497', '桂林市_象山区', 'XSQ', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2498', '桂林市_七星区', 'QXQ', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2499', '桂林市_雁山区', 'YSQ', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2500', '桂林市_阳朔县', 'YSX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2501', '桂林市_临桂县', 'LGX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2502', '桂林市_灵川县', 'LCX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2503', '桂林市_全州县', 'QZX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2504', '桂林市_兴安县', 'XAX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2505', '桂林市_永福县', 'YFX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2506', '桂林市_灌阳县', 'GYX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2507', '桂林市_龙胜各族自治县', 'LSGZZZX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2508', '桂林市_资源县', 'ZYX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2509', '桂林市_平乐县', 'PLX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2510', '桂林市_荔蒲县', 'LPX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2511', '桂林市_恭城瑶族自治县', 'GCYZZZX', '258', ',0,20,258,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2512', '梧州市_市辖区', 'SXQ', '259', ',0,20,259,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2513', '梧州市_万秀区', 'WXQ', '259', ',0,20,259,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2514', '梧州市_蝶山区', 'DSQ', '259', ',0,20,259,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2515', '梧州市_长洲区', 'CZQ', '259', ',0,20,259,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2516', '梧州市_苍梧县', 'CWX', '259', ',0,20,259,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2517', '梧州市_藤县', 'TX', '259', ',0,20,259,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2518', '梧州市_蒙山县', 'MSX', '259', ',0,20,259,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2519', '梧州市_岑溪市', 'CXS', '259', ',0,20,259,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2520', '北海市_市辖区', 'SXQ', '260', ',0,20,260,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2521', '北海市_海城区', 'HCQ', '260', ',0,20,260,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2522', '北海市_银海区', 'YHQ', '260', ',0,20,260,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2523', '北海市_铁山港区', 'TSGQ', '260', ',0,20,260,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2524', '北海市_合浦县', 'HPX', '260', ',0,20,260,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2525', '防城港市_市辖区', 'SXQ', '261', ',0,20,261,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2526', '防城港市_港口区', 'GKQ', '261', ',0,20,261,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2527', '防城港市_防城区', 'FCQ', '261', ',0,20,261,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2528', '防城港市_上思县', 'SSX', '261', ',0,20,261,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2529', '防城港市_东兴市', 'DXS', '261', ',0,20,261,', '0', '3', '0', '0', '2008-11-24 11:06:14');
INSERT INTO `ab_sys_area` VALUES ('2530', '钦州市_市辖区', 'SXQ', '262', ',0,20,262,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2531', '钦州市_钦南区', 'QNQ', '262', ',0,20,262,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2532', '钦州市_钦北区', 'QBQ', '262', ',0,20,262,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2533', '钦州市_灵山县', 'LSX', '262', ',0,20,262,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2534', '钦州市_浦北县', 'PBX', '262', ',0,20,262,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2535', '贵港市_市辖区', 'SXQ', '263', ',0,20,263,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2536', '贵港市_港北区', 'GBQ', '263', ',0,20,263,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2537', '贵港市_港南区', 'GNQ', '263', ',0,20,263,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2538', '贵港市_覃塘区', 'TTQ', '263', ',0,20,263,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2539', '贵港市_平南县', 'PNX', '263', ',0,20,263,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2540', '贵港市_桂平市', 'GPS', '263', ',0,20,263,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2541', '玉林市_市辖区', 'SXQ', '264', ',0,20,264,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2542', '玉林市_玉州区', 'YZQ', '264', ',0,20,264,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2543', '玉林市_容县', 'RX', '264', ',0,20,264,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2544', '玉林市_陆川县', 'LCX', '264', ',0,20,264,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2545', '玉林市_博白县', 'BBX', '264', ',0,20,264,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2546', '玉林市_兴业县', 'XYX', '264', ',0,20,264,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2547', '玉林市_北流市', 'BLS', '264', ',0,20,264,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2548', '百色市_市辖区', 'SXQ', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2549', '百色市_右江区', 'YJQ', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2550', '百色市_田阳县', 'TYX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2551', '百色市_田东县', 'TDX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2552', '百色市_平果县', 'PGX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2553', '百色市_德保县', 'DBX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2554', '百色市_靖西县', 'JXX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2555', '百色市_那坡县', 'NPX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2556', '百色市_凌云县', 'LYX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2557', '百色市_乐业县', 'LYX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2558', '百色市_田林县', 'TLX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2559', '百色市_西林县', 'XLX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2560', '百色市_隆林各族自治县', 'LLGZZZX', '265', ',0,20,265,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2561', '贺州市_市辖区', 'SXQ', '266', ',0,20,266,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2562', '贺州市_八步区', 'BBQ', '266', ',0,20,266,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2563', '贺州市_昭平县', 'ZPX', '266', ',0,20,266,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2564', '贺州市_钟山县', 'ZSX', '266', ',0,20,266,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2565', '贺州市_富川瑶族自治县', 'FCYZZZX', '266', ',0,20,266,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2566', '河池市_市辖区', 'SXQ', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2567', '河池市_金城江区', 'JCJQ', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2568', '河池市_南丹县', 'NDX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2569', '河池市_天峨县', 'TEX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2570', '河池市_凤山县', 'FSX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2571', '河池市_东兰县', 'DLX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2572', '河池市_罗城仫佬族自治县', 'LCMLZZZX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2573', '河池市_环江毛南族自治县', 'HJMNZZZX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2574', '河池市_巴马瑶族自治县', 'BMYZZZX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2575', '河池市_都安瑶族自治县', 'DAYZZZX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2576', '河池市_大化瑶族自治县', 'DHYZZZX', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2577', '河池市_宜州市', 'YZS', '267', ',0,20,267,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2578', '来宾市_市辖区', 'SXQ', '268', ',0,20,268,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2579', '来宾市_兴宾区', 'XBQ', '268', ',0,20,268,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2580', '来宾市_忻城县', 'XCX', '268', ',0,20,268,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2581', '来宾市_象州县', 'XZX', '268', ',0,20,268,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2582', '来宾市_武宣县', 'WXX', '268', ',0,20,268,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2583', '来宾市_金秀瑶族自治县', 'JXYZZZX', '268', ',0,20,268,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2584', '来宾市_合山市', 'HSS', '268', ',0,20,268,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2585', '崇左市_市辖区', 'SXQ', '269', ',0,20,269,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2586', '崇左市_江洲区', 'JZQ', '269', ',0,20,269,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2587', '崇左市_扶绥县', 'FSX', '269', ',0,20,269,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2588', '崇左市_宁明县', 'NMX', '269', ',0,20,269,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2589', '崇左市_龙州县', 'LZX', '269', ',0,20,269,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2590', '崇左市_大新县', 'DXX', '269', ',0,20,269,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2591', '崇左市_天等县', 'TDX', '269', ',0,20,269,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2592', '崇左市_凭祥市', 'PXS', '269', ',0,20,269,', '0', '3', '0', '0', '2008-11-24 11:06:15');
INSERT INTO `ab_sys_area` VALUES ('2593', '海口市_市辖区', 'SXQ', '270', ',0,21,270,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2594', '海口市_秀英区', 'XYQ', '270', ',0,21,270,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2595', '海口市_龙华区', 'LHQ', '270', ',0,21,270,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2596', '海口市_琼山区', 'QSQ', '270', ',0,21,270,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2597', '海口市_美兰区', 'MLQ', '270', ',0,21,270,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2598', '三亚市_市辖区', 'SXQ', '271', ',0,21,271,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2599', '省直辖县级行政单位_五指山市', 'WZSS', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2600', '省直辖县级行政单位_琼海市', 'QHS', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2601', '省直辖县级行政单位_儋州市', 'DZS', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2602', '省直辖县级行政单位_文昌市', 'WCS', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2603', '省直辖县级行政单位_万宁市', 'WNS', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2604', '省直辖县级行政单位_东方市', 'DFS', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2605', '省直辖县级行政单位_定安县', 'DAX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2606', '省直辖县级行政单位_屯昌县', 'TCX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2607', '省直辖县级行政单位_澄迈县', 'CMX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2608', '省直辖县级行政单位_临高县', 'LGX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2609', '省直辖县级行政单位_白沙黎族自治县', 'BSLZZZX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2610', '省直辖县级行政单位_昌江黎族自治县', 'CJLZZZX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2611', '省直辖县级行政单位_乐东黎族自治县', 'LDLZZZX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2612', '省直辖县级行政单位_陵水黎族自治县', 'LSLZZZX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2613', '省直辖县级行政单位_保亭黎族苗族自治县', 'BTLZMZZZX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2614', '省直辖县级行政单位_琼中黎族苗族自治县', 'QZLZMZZZX', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2615', '省直辖县级行政单位_西沙群岛', 'XSQD', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2616', '省直辖县级行政单位_南沙群岛', 'NSQD', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2617', '省直辖县级行政单位_中沙群岛的岛礁及其海域', 'ZSQDDDJJQHY', '272', ',0,21,272,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2618', '重庆市辖区_万州区', 'WZQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2619', '重庆市辖区_涪陵区', 'FLQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2620', '重庆市辖区_渝中区', 'YZQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2621', '重庆市辖区_大渡口区', 'DDKQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2622', '重庆市辖区_江北区', 'JBQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2623', '重庆市辖区_沙坪坝区', 'SPBQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2624', '重庆市辖区_九龙坡区', 'JLPQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2625', '重庆市辖区_南岸区', 'NAQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2626', '重庆市辖区_北碚区', 'BBQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2627', '重庆市辖区_万盛区', 'WSQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2628', '重庆市辖区_双桥区', 'SQQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2629', '重庆市辖区_渝北区', 'YBQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2630', '重庆市辖区_巴南区', 'BNQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2631', '重庆市辖区_黔江区', 'QJQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2632', '重庆市辖区_长寿区', 'CSQ', '273', ',0,22,273,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2633', '重庆市辖县_綦江县', 'QJX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2634', '重庆市辖县_潼南县', 'TNX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2635', '重庆市辖县_铜梁县', 'TLX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2636', '重庆市辖县_大足县', 'DZX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2637', '重庆市辖县_荣昌县', 'RCX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2638', '重庆市辖县_璧山县', 'BSX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2639', '重庆市辖县_梁平县', 'LPX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2640', '重庆市辖县_城口县', 'CKX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2641', '重庆市辖县_丰都县', 'FDX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2642', '重庆市辖县_垫江县', 'DJX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2643', '重庆市辖县_武隆县', 'WLX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2644', '重庆市辖县_忠县', 'ZX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2645', '重庆市辖县_开县', 'KX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2646', '重庆市辖县_云阳县', 'YYX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2647', '重庆市辖县_奉节县', 'FJX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2648', '重庆市辖县_巫山县', 'WSX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2649', '重庆市辖县_巫溪县', 'WXX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2650', '重庆市辖县_石柱土家族自治县', 'SZTJZZZX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2651', '重庆市辖县_秀山土家族苗族自治县', 'XSTJZMZZZX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2652', '重庆市辖县_酉阳土家族苗族自治县', 'YYTJZMZZZX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2653', '重庆市辖县_彭水苗族土家族自治县', 'PSMZTJZZZX', '274', ',0,22,274,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2654', '重庆市辖市_江津市', 'JJS', '275', ',0,22,275,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2655', '重庆市辖市_合川市', 'HCS', '275', ',0,22,275,', '0', '3', '0', '0', '2008-11-24 11:06:16');
INSERT INTO `ab_sys_area` VALUES ('2656', '重庆市辖市_永川市', 'YCS', '275', ',0,22,275,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2657', '重庆市辖市_南川市', 'NCS', '275', ',0,22,275,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2658', '成都市_市辖区', 'SXQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2659', '成都市_锦江区', 'JJQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2660', '成都市_青羊区', 'QYQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2661', '成都市_金牛区', 'JNQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2662', '成都市_武侯区', 'WHQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2663', '成都市_成华区', 'CHQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2664', '成都市_龙泉驿区', 'LQYQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2665', '成都市_青白江区', 'QBJQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2666', '成都市_新都区', 'XDQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2667', '成都市_温江区', 'WJQ', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2668', '成都市_金堂县', 'JTX', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2669', '成都市_双流县', 'SLX', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2670', '成都市_郫县', 'PX', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2671', '成都市_大邑县', 'DYX', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2672', '成都市_蒲江县', 'PJX', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2673', '成都市_新津县', 'XJX', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2674', '成都市_都江堰市', 'DJYS', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2675', '成都市_彭州市', 'PZS', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2676', '成都市_邛崃市', 'QLS', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2677', '成都市_崇州市', 'CZS', '276', ',0,23,276,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2678', '自贡市_市辖区', 'SXQ', '277', ',0,23,277,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2679', '自贡市_自流井区', 'ZLJQ', '277', ',0,23,277,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2680', '自贡市_贡井区', 'GJQ', '277', ',0,23,277,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2681', '自贡市_大安区', 'DAQ', '277', ',0,23,277,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2682', '自贡市_沿滩区', 'YTQ', '277', ',0,23,277,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2683', '自贡市_荣县', 'RX', '277', ',0,23,277,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2684', '自贡市_富顺县', 'FSX', '277', ',0,23,277,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2685', '攀枝花市_市辖区', 'SXQ', '278', ',0,23,278,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2686', '攀枝花市_东区', 'DQ', '278', ',0,23,278,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2687', '攀枝花市_西区', 'XQ', '278', ',0,23,278,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2688', '攀枝花市_仁和区', 'RHQ', '278', ',0,23,278,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2689', '攀枝花市_米易县', 'MYX', '278', ',0,23,278,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2690', '攀枝花市_盐边县', 'YBX', '278', ',0,23,278,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2691', '泸州市_市辖区', 'SXQ', '279', ',0,23,279,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2692', '泸州市_江阳区', 'JYQ', '279', ',0,23,279,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2693', '泸州市_纳溪区', 'NXQ', '279', ',0,23,279,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2694', '泸州市_龙马潭区', 'LMTQ', '279', ',0,23,279,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2695', '泸州市_泸县', 'LX', '279', ',0,23,279,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2696', '泸州市_合江县', 'HJX', '279', ',0,23,279,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2697', '泸州市_叙永县', 'XYX', '279', ',0,23,279,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2698', '泸州市_古蔺县', 'GLX', '279', ',0,23,279,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2699', '德阳市_市辖区', 'SXQ', '280', ',0,23,280,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2700', '德阳市_旌阳区', 'JYQ', '280', ',0,23,280,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2701', '德阳市_中江县', 'ZJX', '280', ',0,23,280,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2702', '德阳市_罗江县', 'LJX', '280', ',0,23,280,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2703', '德阳市_广汉市', 'GHS', '280', ',0,23,280,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2704', '德阳市_什邡市', 'SFS', '280', ',0,23,280,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2705', '德阳市_绵竹市', 'MZS', '280', ',0,23,280,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2706', '绵阳市_市辖区', 'SXQ', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2707', '绵阳市_涪城区', 'FCQ', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2708', '绵阳市_游仙区', 'YXQ', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2709', '绵阳市_三台县', 'STX', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2710', '绵阳市_盐亭县', 'YTX', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2711', '绵阳市_安县', 'AX', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2712', '绵阳市_梓潼县', 'ZTX', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2713', '绵阳市_北川羌族自治县', 'BCQZZZX', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2714', '绵阳市_平武县', 'PWX', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2715', '绵阳市_江油市', 'JYS', '281', ',0,23,281,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2716', '广元市_市辖区', 'SXQ', '282', ',0,23,282,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2717', '广元市_市中区', 'SZQ', '282', ',0,23,282,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2718', '广元市_元坝区', 'YBQ', '282', ',0,23,282,', '0', '3', '0', '0', '2008-11-24 11:06:17');
INSERT INTO `ab_sys_area` VALUES ('2719', '广元市_朝天区', 'CTQ', '282', ',0,23,282,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2720', '广元市_旺苍县', 'WCX', '282', ',0,23,282,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2721', '广元市_青川县', 'QCX', '282', ',0,23,282,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2722', '广元市_剑阁县', 'JGX', '282', ',0,23,282,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2723', '广元市_苍溪县', 'CXX', '282', ',0,23,282,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2724', '遂宁市_市辖区', 'SXQ', '283', ',0,23,283,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2725', '遂宁市_船山区', 'CSQ', '283', ',0,23,283,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2726', '遂宁市_安居区', 'AJQ', '283', ',0,23,283,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2727', '遂宁市_蓬溪县', 'PXX', '283', ',0,23,283,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2728', '遂宁市_射洪县', 'SHX', '283', ',0,23,283,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2729', '遂宁市_大英县', 'DYX', '283', ',0,23,283,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2730', '内江市_市辖区', 'SXQ', '284', ',0,23,284,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2731', '内江市_市中区', 'SZQ', '284', ',0,23,284,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2732', '内江市_东兴区', 'DXQ', '284', ',0,23,284,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2733', '内江市_威远县', 'WYX', '284', ',0,23,284,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2734', '内江市_资中县', 'ZZX', '284', ',0,23,284,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2735', '内江市_隆昌县', 'LCX', '284', ',0,23,284,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2736', '乐山市_市辖区', 'SXQ', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2737', '乐山市_市中区', 'SZQ', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2738', '乐山市_沙湾区', 'SWQ', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2739', '乐山市_五通桥区', 'WTQQ', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2740', '乐山市_金口河区', 'JKHQ', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2741', '乐山市_犍为县', 'JWX', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2742', '乐山市_井研县', 'JYX', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2743', '乐山市_夹江县', 'JJX', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2744', '乐山市_沐川县', 'MCX', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2745', '乐山市_峨边彝族自治县', 'EBYZZZX', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2746', '乐山市_马边彝族自治县', 'MBYZZZX', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2747', '乐山市_峨眉山市', 'EMSS', '285', ',0,23,285,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2748', '南充市_市辖区', 'SXQ', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2749', '南充市_顺庆区', 'SQQ', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2750', '南充市_高坪区', 'GPQ', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2751', '南充市_嘉陵区', 'JLQ', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2752', '南充市_南部县', 'NBX', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2753', '南充市_营山县', 'YSX', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2754', '南充市_蓬安县', 'PAX', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2755', '南充市_仪陇县', 'YLX', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2756', '南充市_西充县', 'XCX', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2757', '南充市_阆中市', 'LZS', '286', ',0,23,286,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2758', '眉山市_市辖区', 'SXQ', '287', ',0,23,287,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2759', '眉山市_东坡区', 'DPQ', '287', ',0,23,287,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2760', '眉山市_仁寿县', 'RSX', '287', ',0,23,287,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2761', '眉山市_彭山县', 'PSX', '287', ',0,23,287,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2762', '眉山市_洪雅县', 'HYX', '287', ',0,23,287,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2763', '眉山市_丹棱县', 'DLX', '287', ',0,23,287,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2764', '眉山市_青神县', 'QSX', '287', ',0,23,287,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2765', '宜宾市_市辖区', 'SXQ', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2766', '宜宾市_翠屏区', 'CPQ', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2767', '宜宾市_宜宾县', 'YBX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2768', '宜宾市_南溪县', 'NXX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2769', '宜宾市_江安县', 'JAX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2770', '宜宾市_长宁县', 'CNX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2771', '宜宾市_高县', 'GX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2772', '宜宾市_珙县', 'GX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2773', '宜宾市_筠连县', 'JLX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2774', '宜宾市_兴文县', 'XWX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2775', '宜宾市_屏山县', 'PSX', '288', ',0,23,288,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2776', '广安市_市辖区', 'SXQ', '289', ',0,23,289,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2777', '广安市_广安区', 'GAQ', '289', ',0,23,289,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2778', '广安市_岳池县', 'YCX', '289', ',0,23,289,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2779', '广安市_武胜县', 'WSX', '289', ',0,23,289,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2780', '广安市_邻水县', 'LSX', '289', ',0,23,289,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2781', '广安市_华莹市', 'HYS', '289', ',0,23,289,', '0', '3', '0', '0', '2008-11-24 11:06:18');
INSERT INTO `ab_sys_area` VALUES ('2782', '达州市_市辖区', 'SXQ', '290', ',0,23,290,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2783', '达州市_通川区', 'TCQ', '290', ',0,23,290,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2784', '达州市_达县', 'DX', '290', ',0,23,290,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2785', '达州市_宣汉县', 'XHX', '290', ',0,23,290,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2786', '达州市_开江县', 'KJX', '290', ',0,23,290,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2787', '达州市_大竹县', 'DZX', '290', ',0,23,290,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2788', '达州市_渠县', 'QX', '290', ',0,23,290,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2789', '达州市_万源市', 'WYS', '290', ',0,23,290,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2790', '雅安市_市辖区', 'SXQ', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2791', '雅安市_雨城区', 'YCQ', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2792', '雅安市_名山县', 'MSX', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2793', '雅安市_荥经县', 'YJX', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2794', '雅安市_汉源县', 'HYX', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2795', '雅安市_石棉县', 'SMX', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2796', '雅安市_天全县', 'TQX', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2797', '雅安市_芦山县', 'LSX', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2798', '雅安市_宝兴县', 'BXX', '291', ',0,23,291,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2799', '巴中市_市辖区', 'SXQ', '292', ',0,23,292,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2800', '巴中市_巴州区', 'BZQ', '292', ',0,23,292,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2801', '巴中市_通江县', 'TJX', '292', ',0,23,292,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2802', '巴中市_南江县', 'NJX', '292', ',0,23,292,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2803', '巴中市_平昌县', 'PCX', '292', ',0,23,292,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2804', '资阳市_市辖区', 'SXQ', '293', ',0,23,293,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2805', '资阳市_雁江区', 'YJQ', '293', ',0,23,293,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2806', '资阳市_安岳县', 'AYX', '293', ',0,23,293,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2807', '资阳市_乐至县', 'LZX', '293', ',0,23,293,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2808', '资阳市_简阳市', 'JYS', '293', ',0,23,293,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2809', '阿坝藏族羌族自治州_汶川县', 'WCX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2810', '阿坝藏族羌族自治州_理县', 'LX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2811', '阿坝藏族羌族自治州_茂县', 'MX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2812', '阿坝藏族羌族自治州_松潘县', 'SPX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2813', '阿坝藏族羌族自治州_九寨沟县', 'JZGX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2814', '阿坝藏族羌族自治州_金川县', 'JCX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2815', '阿坝藏族羌族自治州_小金县', 'XJX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2816', '阿坝藏族羌族自治州_黑水县', 'HSX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2817', '阿坝藏族羌族自治州_马尔康县', 'MEKX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2818', '阿坝藏族羌族自治州_壤塘县', 'RTX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2819', '阿坝藏族羌族自治州_阿坝县', 'ABX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2820', '阿坝藏族羌族自治州_若尔盖县', 'REGX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2821', '阿坝藏族羌族自治州_红原县', 'HYX', '294', ',0,23,294,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2822', '甘孜藏族自治州_康定县', 'KDX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2823', '甘孜藏族自治州_泸定县', 'LDX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2824', '甘孜藏族自治州_丹巴县', 'DBX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2825', '甘孜藏族自治州_九龙县', 'JLX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2826', '甘孜藏族自治州_雅江县', 'YJX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2827', '甘孜藏族自治州_道孚县', 'DFX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2828', '甘孜藏族自治州_炉霍县', 'LHX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2829', '甘孜藏族自治州_甘孜县', 'GZX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2830', '甘孜藏族自治州_新龙县', 'XLX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2831', '甘孜藏族自治州_德格县', 'DGX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2832', '甘孜藏族自治州_白玉县', 'BYX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2833', '甘孜藏族自治州_石渠县', 'SQX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2834', '甘孜藏族自治州_色达县', 'SDX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2835', '甘孜藏族自治州_理塘县', 'LTX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2836', '甘孜藏族自治州_巴塘县', 'BTX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2837', '甘孜藏族自治州_乡城县', 'XCX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2838', '甘孜藏族自治州_稻城县', 'DCX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2839', '甘孜藏族自治州_得荣县', 'DRX', '295', ',0,23,295,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2840', '凉山彝族自治州_西昌市', 'XCS', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2841', '凉山彝族自治州_木里藏族自治县', 'MLCZZZX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2842', '凉山彝族自治州_盐源县', 'YYX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2843', '凉山彝族自治州_德昌县', 'DCX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2844', '凉山彝族自治州_会理县', 'HLX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:19');
INSERT INTO `ab_sys_area` VALUES ('2845', '凉山彝族自治州_会东县', 'HDX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2846', '凉山彝族自治州_宁南县', 'NNX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2847', '凉山彝族自治州_普格县', 'PGX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2848', '凉山彝族自治州_布拖县', 'BTX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2849', '凉山彝族自治州_金阳县', 'JYX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2850', '凉山彝族自治州_昭觉县', 'ZJX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2851', '凉山彝族自治州_喜德县', 'XDX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2852', '凉山彝族自治州_冕宁县', 'MNX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2853', '凉山彝族自治州_越西县', 'YXX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2854', '凉山彝族自治州_甘洛县', 'GLX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2855', '凉山彝族自治州_美姑县', 'MGX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2856', '凉山彝族自治州_雷波县', 'LBX', '296', ',0,23,296,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2857', '贵阳市_市辖区', 'SXQ', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2858', '贵阳市_南明区', 'NMQ', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2859', '贵阳市_云岩区', 'YYQ', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2860', '贵阳市_花溪区', 'HXQ', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2861', '贵阳市_乌当区', 'WDQ', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2862', '贵阳市_白云区', 'BYQ', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2863', '贵阳市_小河区', 'XHQ', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2864', '贵阳市_开阳县', 'KYX', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2865', '贵阳市_息烽县', 'XFX', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2866', '贵阳市_修文县', 'XWX', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2867', '贵阳市_清镇市', 'QZS', '297', ',0,24,297,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2868', '六盘水市_钟山区', 'ZSQ', '298', ',0,24,298,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2869', '六盘水市_六枝特区', 'LZTQ', '298', ',0,24,298,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2870', '六盘水市_水城县', 'SCX', '298', ',0,24,298,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2871', '六盘水市_盘县', 'PX', '298', ',0,24,298,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2872', '遵义市_市辖区', 'SXQ', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2873', '遵义市_红花岗区', 'HHGQ', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2874', '遵义市_汇川区', 'HCQ', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2875', '遵义市_遵义县', 'ZYX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2876', '遵义市_桐梓县', 'TZX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2877', '遵义市_绥阳县', 'SYX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2878', '遵义市_正安县', 'ZAX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2879', '遵义市_道真仡佬族苗族自治县', 'DZYLZMZZZX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2880', '遵义市_务川仡佬族苗族自治县', 'WCYLZMZZZX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2881', '遵义市_凤冈县', 'FGX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2882', '遵义市_湄潭县', 'MTX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2883', '遵义市_余庆县', 'YQX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2884', '遵义市_习水县', 'XSX', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2885', '遵义市_赤水市', 'CSS', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2886', '遵义市_仁怀市', 'RHS', '299', ',0,24,299,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2887', '安顺市_市辖区', 'SXQ', '300', ',0,24,300,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2888', '安顺市_西秀区', 'XXQ', '300', ',0,24,300,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2889', '安顺市_平坝县', 'PBX', '300', ',0,24,300,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2890', '安顺市_普定县', 'PDX', '300', ',0,24,300,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2891', '安顺市_镇宁布依族苗族自治县', 'ZNBYZMZZZX', '300', ',0,24,300,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2892', '安顺市_关岭布依族苗族自治县', 'GLBYZMZZZX', '300', ',0,24,300,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2893', '安顺市_紫云苗族布依族自治县', 'ZYMZBYZZZX', '300', ',0,24,300,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2894', '铜仁地区_铜仁市', 'TRS', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2895', '铜仁地区_江口县', 'JKX', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2896', '铜仁地区_玉屏侗族自治县', 'YPDZZZX', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2897', '铜仁地区_石阡县', 'SQX', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2898', '铜仁地区_思南县', 'SNX', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2899', '铜仁地区_印江土家族苗族自治县', 'YJTJZMZZZX', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2900', '铜仁地区_德江县', 'DJX', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2901', '铜仁地区_沿河土家族自治县', 'YHTJZZZX', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2902', '铜仁地区_松桃苗族自治县', 'STMZZZX', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2903', '铜仁地区_万山特区', 'WSTQ', '301', ',0,24,301,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2904', '黔西南布依族苗族自治州_兴义市', 'XYS', '302', ',0,24,302,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2905', '黔西南布依族苗族自治州_兴仁县', 'XRX', '302', ',0,24,302,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2906', '黔西南布依族苗族自治州_普安县', 'PAX', '302', ',0,24,302,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2907', '黔西南布依族苗族自治州_晴隆县', 'QLX', '302', ',0,24,302,', '0', '3', '0', '0', '2008-11-24 11:06:20');
INSERT INTO `ab_sys_area` VALUES ('2908', '黔西南布依族苗族自治州_贞丰县', 'ZFX', '302', ',0,24,302,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2909', '黔西南布依族苗族自治州_望谟县', 'WMX', '302', ',0,24,302,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2910', '黔西南布依族苗族自治州_册亨县', 'CHX', '302', ',0,24,302,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2911', '黔西南布依族苗族自治州_安龙县', 'ALX', '302', ',0,24,302,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2912', '毕节地区_毕节市', 'BJS', '303', ',0,24,303,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2913', '毕节地区_大方县', 'DFX', '303', ',0,24,303,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2914', '毕节地区_黔西县', 'QXX', '303', ',0,24,303,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2915', '毕节地区_金沙县', 'JSX', '303', ',0,24,303,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2916', '毕节地区_织金县', 'ZJX', '303', ',0,24,303,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2917', '毕节地区_纳雍县', 'NYX', '303', ',0,24,303,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2918', '毕节地区_威宁彝族回族苗族自治县', 'WNYZHZMZZZX', '303', ',0,24,303,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2919', '毕节地区_赫章县', 'HZX', '303', ',0,24,303,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2920', '黔东南苗族侗族自治州_凯里市', 'KLS', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2921', '黔东南苗族侗族自治州_黄平县', 'HPX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2922', '黔东南苗族侗族自治州_施秉县', 'SBX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2923', '黔东南苗族侗族自治州_三穗县', 'SSX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2924', '黔东南苗族侗族自治州_镇远县', 'ZYX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2925', '黔东南苗族侗族自治州_岑巩县', 'CGX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2926', '黔东南苗族侗族自治州_天柱县', 'TZX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2927', '黔东南苗族侗族自治州_锦屏县', 'JPX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2928', '黔东南苗族侗族自治州_剑河县', 'JHX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2929', '黔东南苗族侗族自治州_台江县', 'TJX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2930', '黔东南苗族侗族自治州_黎平县', 'LPX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2931', '黔东南苗族侗族自治州_榕江县', 'RJX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2932', '黔东南苗族侗族自治州_从江县', 'CJX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2933', '黔东南苗族侗族自治州_雷山县', 'LSX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2934', '黔东南苗族侗族自治州_麻江县', 'MJX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2935', '黔东南苗族侗族自治州_丹寨县', 'DZX', '304', ',0,24,304,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2936', '黔南布依族苗族自治州_都匀市', 'DYS', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2937', '黔南布依族苗族自治州_福泉市', 'FQS', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2938', '黔南布依族苗族自治州_荔波县', 'LBX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2939', '黔南布依族苗族自治州_贵定县', 'GDX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2940', '黔南布依族苗族自治州_瓮安县', 'WAX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2941', '黔南布依族苗族自治州_独山县', 'DSX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2942', '黔南布依族苗族自治州_平塘县', 'PTX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2943', '黔南布依族苗族自治州_罗甸县', 'LDX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2944', '黔南布依族苗族自治州_长顺县', 'CSX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2945', '黔南布依族苗族自治州_龙里县', 'LLX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2946', '黔南布依族苗族自治州_惠水县', 'HSX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2947', '黔南布依族苗族自治州_三都水族自治县', 'SDSZZZX', '305', ',0,24,305,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2948', '昆明市_市辖区', 'SXQ', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2949', '昆明市_五华区', 'WHQ', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2950', '昆明市_盘龙区', 'PLQ', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2951', '昆明市_官渡区', 'GDQ', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2952', '昆明市_西山区', 'XSQ', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2953', '昆明市_东川区', 'DCQ', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2954', '昆明市_呈贡县', 'CGX', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2955', '昆明市_晋宁县', 'JNX', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2956', '昆明市_富民县', 'FMX', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2957', '昆明市_宜良县', 'YLX', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2958', '昆明市_石林彝族自治县', 'SLYZZZX', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2959', '昆明市_嵩明县', 'SMX', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2960', '昆明市_禄劝彝族苗族自治县', 'LQYZMZZZX', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2961', '昆明市_寻甸回族彝族自治县', 'XDHZYZZZX', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2962', '昆明市_安宁市', 'ANS', '306', ',0,25,306,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2963', '曲靖市_市辖区', 'SXQ', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2964', '曲靖市_麒麟区', 'QLQ', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2965', '曲靖市_马龙县', 'MLX', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2966', '曲靖市_陆良县', 'LLX', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2967', '曲靖市_师宗县', 'SZX', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2968', '曲靖市_罗平县', 'LPX', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2969', '曲靖市_富源县', 'FYX', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:21');
INSERT INTO `ab_sys_area` VALUES ('2970', '曲靖市_会泽县', 'HZX', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2971', '曲靖市_沾益县', 'ZYX', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2972', '曲靖市_宣威市', 'XWS', '307', ',0,25,307,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2973', '玉溪市_市辖区', 'SXQ', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2974', '玉溪市_红塔区', 'HTQ', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2975', '玉溪市_江川县', 'JCX', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2976', '玉溪市_澄江县', 'CJX', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2977', '玉溪市_通海县', 'THX', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2978', '玉溪市_华宁县', 'HNX', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2979', '玉溪市_易门县', 'YMX', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2980', '玉溪市_峨山彝族自治县', 'ESYZZZX', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2981', '玉溪市_新平彝族傣族自治县', 'XPYZDZZZX', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2982', '玉溪市_元江哈尼族彝族傣族自治县', 'YJHNZYZDZZZX', '308', ',0,25,308,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2983', '保山市_市辖区', 'SXQ', '309', ',0,25,309,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2984', '保山市_隆阳区', 'LYQ', '309', ',0,25,309,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2985', '保山市_施甸县', 'SDX', '309', ',0,25,309,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2986', '保山市_腾冲县', 'TCX', '309', ',0,25,309,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2987', '保山市_龙陵县', 'LLX', '309', ',0,25,309,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2988', '保山市_昌宁县', 'CNX', '309', ',0,25,309,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2989', '昭通市_市辖区', 'SXQ', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2990', '昭通市_昭阳区', 'ZYQ', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2991', '昭通市_鲁甸县', 'LDX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2992', '昭通市_巧家县', 'QJX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2993', '昭通市_盐津县', 'YJX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2994', '昭通市_大关县', 'DGX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2995', '昭通市_永善县', 'YSX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2996', '昭通市_绥江县', 'SJX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2997', '昭通市_镇雄县', 'ZXX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2998', '昭通市_彝良县', 'YLX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('2999', '昭通市_威信县', 'WXX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3000', '昭通市_水富县', 'SFX', '310', ',0,25,310,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3001', '丽江市_市辖区', 'SXQ', '311', ',0,25,311,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3002', '丽江市_古城区', 'GCQ', '311', ',0,25,311,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3003', '丽江市_玉龙纳西族自治县', 'YLNXZZZX', '311', ',0,25,311,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3004', '丽江市_永胜县', 'YSX', '311', ',0,25,311,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3005', '丽江市_华坪县', 'HPX', '311', ',0,25,311,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3006', '丽江市_宁蒗彝族自治县', 'NLYZZZX', '311', ',0,25,311,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3007', '思茅市_市辖区', 'SXQ', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3008', '思茅市_翠云区', 'CYQ', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3009', '思茅市_普洱哈尼族彝族自治县', 'PEHNZYZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3010', '思茅市_墨江哈尼族自治县', 'MJHNZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3011', '思茅市_景东彝族自治县', 'JDYZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3012', '思茅市_景谷傣族彝族自治县', 'JGDZYZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3013', '思茅市_镇沅彝族哈尼族拉祜族自治县', 'ZYYZHNZLHZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3014', '思茅市_江城哈尼族彝族自治县', 'JCHNZYZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3015', '思茅市_孟连傣族拉祜族佤族自治县', 'MLDZLHZWZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3016', '思茅市_澜沧拉祜族自治县', 'LCLHZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3017', '思茅市_西盟佤族自治县', 'XMWZZZX', '312', ',0,25,312,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3018', '临沧市_市辖区', 'SXQ', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3019', '临沧市_临翔区', 'LXQ', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3020', '临沧市_凤庆县', 'FQX', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3021', '临沧市_云县', 'YX', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3022', '临沧市_永德县', 'YDX', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3023', '临沧市_镇康县', 'ZKX', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3024', '临沧市_双江拉祜族佤族布朗族傣族自治县', 'SJLHZWZBLZDZZZX', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3025', '临沧市_耿马傣族佤族自治县', 'GMDZWZZZX', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3026', '临沧市_沧源佤族自治县', 'CYWZZZX', '313', ',0,25,313,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3027', '楚雄彝族自治州_楚雄市', 'CXS', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3028', '楚雄彝族自治州_双柏县', 'SBX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3029', '楚雄彝族自治州_牟定县', 'MDX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3030', '楚雄彝族自治州_南华县', 'NHX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3031', '楚雄彝族自治州_姚安县', 'YAX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:22');
INSERT INTO `ab_sys_area` VALUES ('3032', '楚雄彝族自治州_大姚县', 'DYX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3033', '楚雄彝族自治州_永仁县', 'YRX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3034', '楚雄彝族自治州_元谋县', 'YMX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3035', '楚雄彝族自治州_武定县', 'WDX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3036', '楚雄彝族自治州_禄丰县', 'LFX', '314', ',0,25,314,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3037', '红河哈尼族彝族自治州_个旧市', 'GJS', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3038', '红河哈尼族彝族自治州_开远市', 'KYS', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3039', '红河哈尼族彝族自治州_蒙自县', 'MZX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3040', '红河哈尼族彝族自治州_屏边苗族自治县', 'PBMZZZX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3041', '红河哈尼族彝族自治州_建水县', 'JSX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3042', '红河哈尼族彝族自治州_石屏县', 'SPX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3043', '红河哈尼族彝族自治州_弥勒县', 'MLX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3044', '红河哈尼族彝族自治州_泸西县', 'LXX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3045', '红河哈尼族彝族自治州_元阳县', 'YYX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3046', '红河哈尼族彝族自治州_红河县', 'HHX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3047', '红河哈尼族彝族自治州_金平苗族瑶族傣族自治县', 'JPMZYZDZZZX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3048', '红河哈尼族彝族自治州_绿春县', 'LCX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3049', '红河哈尼族彝族自治州_河口瑶族自治县', 'HKYZZZX', '315', ',0,25,315,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3050', '文山壮族苗族自治州_文山县', 'WSX', '316', ',0,25,316,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3051', '文山壮族苗族自治州_砚山县', 'YSX', '316', ',0,25,316,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3052', '文山壮族苗族自治州_西畴县', 'XCX', '316', ',0,25,316,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3053', '文山壮族苗族自治州_麻栗坡县', 'MLPX', '316', ',0,25,316,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3054', '文山壮族苗族自治州_马关县', 'MGX', '316', ',0,25,316,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3055', '文山壮族苗族自治州_丘北县', 'QBX', '316', ',0,25,316,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3056', '文山壮族苗族自治州_广南县', 'GNX', '316', ',0,25,316,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3057', '文山壮族苗族自治州_富宁县', 'FNX', '316', ',0,25,316,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3058', '西双版纳傣族自治州_景洪市', 'JHS', '317', ',0,25,317,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3059', '西双版纳傣族自治州_勐海县', 'MHX', '317', ',0,25,317,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3060', '西双版纳傣族自治州_勐腊县', 'MLX', '317', ',0,25,317,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3061', '大理白族自治州_大理市', 'DLS', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3062', '大理白族自治州_漾濞彝族自治县', 'YBYZZZX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3063', '大理白族自治州_祥云县', 'XYX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3064', '大理白族自治州_宾川县', 'BCX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3065', '大理白族自治州_弥渡县', 'MDX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3066', '大理白族自治州_南涧彝族自治县', 'NJYZZZX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3067', '大理白族自治州_巍山彝族回族自治县', 'WSYZHZZZX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3068', '大理白族自治州_永平县', 'YPX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3069', '大理白族自治州_云龙县', 'YLX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3070', '大理白族自治州_洱源县', 'EYX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3071', '大理白族自治州_剑川县', 'JCX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3072', '大理白族自治州_鹤庆县', 'HQX', '318', ',0,25,318,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3073', '德宏傣族景颇族自治州_瑞丽市', 'RLS', '319', ',0,25,319,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3074', '德宏傣族景颇族自治州_潞西市', 'LXS', '319', ',0,25,319,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3075', '德宏傣族景颇族自治州_梁河县', 'LHX', '319', ',0,25,319,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3076', '德宏傣族景颇族自治州_盈江县', 'YJX', '319', ',0,25,319,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3077', '德宏傣族景颇族自治州_陇川县', 'LCX', '319', ',0,25,319,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3078', '怒江傈僳族自治州_泸水县', 'LSX', '320', ',0,25,320,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3079', '怒江傈僳族自治州_福贡县', 'FGX', '320', ',0,25,320,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3080', '怒江傈僳族自治州_贡山独龙族怒族自治县', 'GSDLZNZZZX', '320', ',0,25,320,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3081', '怒江傈僳族自治州_兰坪白族普米族自治县', 'LPBZPMZZZX', '320', ',0,25,320,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3082', '迪庆藏族自治州_香格里拉县', 'XGLLX', '321', ',0,25,321,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3083', '迪庆藏族自治州_德钦县', 'DQX', '321', ',0,25,321,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3084', '迪庆藏族自治州_维西傈僳族自治县', 'WXLSZZZX', '321', ',0,25,321,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3085', '拉萨市_市辖区', 'SXQ', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3086', '拉萨市_城关区', 'CGQ', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3087', '拉萨市_林周县', 'LZX', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3088', '拉萨市_当雄县', 'DXX', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3089', '拉萨市_尼木县', 'NMX', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3090', '拉萨市_曲水县', 'QSX', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3091', '拉萨市_堆龙德庆县', 'DLDQX', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3092', '拉萨市_达孜县', 'DZX', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3093', '拉萨市_墨竹工卡县', 'MZGKX', '322', ',0,26,322,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3094', '昌都地区_昌都县', 'CDX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:23');
INSERT INTO `ab_sys_area` VALUES ('3095', '昌都地区_江达县', 'JDX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3096', '昌都地区_贡觉县', 'GJX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3097', '昌都地区_类乌齐县', 'LWQX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3098', '昌都地区_丁青县', 'DQX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3099', '昌都地区_察雅县', 'CYX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3100', '昌都地区_八宿县', 'BSX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3101', '昌都地区_左贡县', 'ZGX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3102', '昌都地区_芒康县', 'MKX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3103', '昌都地区_洛隆县', 'LLX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3104', '昌都地区_边坝县', 'BBX', '323', ',0,26,323,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3105', '山南地区_乃东县', 'NDX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3106', '山南地区_扎囊县', 'ZNX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3107', '山南地区_贡嘎县', 'GGX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3108', '山南地区_桑日县', 'SRX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3109', '山南地区_琼结县', 'QJX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3110', '山南地区_曲松县', 'QSX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3111', '山南地区_措美县', 'CMX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3112', '山南地区_洛扎县', 'LZX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3113', '山南地区_加查县', 'JCX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3114', '山南地区_隆子县', 'LZX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3115', '山南地区_错那县', 'CNX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3116', '山南地区_浪卡子县', 'LKZX', '324', ',0,26,324,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3117', '日喀则地区_日喀则市', 'RKZS', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3118', '日喀则地区_南木林县', 'NMLX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3119', '日喀则地区_江孜县', 'JZX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3120', '日喀则地区_定日县', 'DRX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3121', '日喀则地区_萨迦县', 'SJX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3122', '日喀则地区_拉孜县', 'LZX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3123', '日喀则地区_昂仁县', 'ARX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3124', '日喀则地区_谢通门县', 'XTMX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3125', '日喀则地区_白朗县', 'BLX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3126', '日喀则地区_仁布县', 'RBX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3127', '日喀则地区_康马县', 'KMX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3128', '日喀则地区_定结县', 'DJX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3129', '日喀则地区_仲巴县', 'ZBX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3130', '日喀则地区_亚东县', 'YDX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3131', '日喀则地区_吉隆县', 'JLX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3132', '日喀则地区_聂拉木县', 'NLMX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3133', '日喀则地区_萨嘎县', 'SGX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3134', '日喀则地区_岗巴县', 'GBX', '325', ',0,26,325,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3135', '那曲地区_那曲县', 'NQX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3136', '那曲地区_嘉黎县', 'JLX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3137', '那曲地区_比如县', 'BRX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3138', '那曲地区_聂荣县', 'NRX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3139', '那曲地区_安多县', 'ADX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3140', '那曲地区_申扎县', 'SZX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3141', '那曲地区_索县', 'SX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3142', '那曲地区_班戈县', 'BGX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3143', '那曲地区_巴青县', 'BQX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3144', '那曲地区_尼玛县', 'NMX', '326', ',0,26,326,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3145', '阿里地区_普兰县', 'PLX', '327', ',0,26,327,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3146', '阿里地区_札达县', 'ZDX', '327', ',0,26,327,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3147', '阿里地区_噶尔县', 'GEX', '327', ',0,26,327,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3148', '阿里地区_日土县', 'RTX', '327', ',0,26,327,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3149', '阿里地区_革吉县', 'GJX', '327', ',0,26,327,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3150', '阿里地区_改则县', 'GZX', '327', ',0,26,327,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3151', '阿里地区_措勤县', 'CQX', '327', ',0,26,327,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3152', '林芝地区_林芝县', 'LZX', '328', ',0,26,328,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3153', '林芝地区_工布江达县', 'GBJDX', '328', ',0,26,328,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3154', '林芝地区_米林县', 'MLX', '328', ',0,26,328,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3155', '林芝地区_墨脱县', 'MTX', '328', ',0,26,328,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3156', '林芝地区_波密县', 'BMX', '328', ',0,26,328,', '0', '3', '0', '0', '2008-11-24 11:06:24');
INSERT INTO `ab_sys_area` VALUES ('3157', '林芝地区_察隅县', 'CYX', '328', ',0,26,328,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3158', '林芝地区_朗县', 'LX', '328', ',0,26,328,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3159', '西安市_市辖区', 'SXQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3160', '西安市_新城区', 'XCQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3161', '西安市_碑林区', 'BLQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3162', '西安市_莲湖区', 'LHQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3163', '西安市_灞桥区', 'BQQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3164', '西安市_未央区', 'WYQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3165', '西安市_雁塔区', 'YTQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3166', '西安市_阎良区', 'YLQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3167', '西安市_临潼区', 'LTQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3168', '西安市_长安区', 'CAQ', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3169', '西安市_蓝田县', 'LTX', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3170', '西安市_周至县', 'ZZX', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3171', '西安市_户县', 'HX', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3172', '西安市_高陵县', 'GLX', '329', ',0,27,329,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3173', '铜川市_市辖区', 'SXQ', '330', ',0,27,330,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3174', '铜川市_王益区', 'WYQ', '330', ',0,27,330,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3175', '铜川市_印台区', 'YTQ', '330', ',0,27,330,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3176', '铜川市_耀州区', 'YZQ', '330', ',0,27,330,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3177', '铜川市_宜君县', 'YJX', '330', ',0,27,330,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3178', '宝鸡市_市辖区', 'SXQ', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3179', '宝鸡市_渭滨区', 'WBQ', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3180', '宝鸡市_金台区', 'JTQ', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3181', '宝鸡市_陈仓区', 'CCQ', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3182', '宝鸡市_凤翔县', 'FXX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3183', '宝鸡市_岐山县', 'QSX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3184', '宝鸡市_扶风县', 'FFX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3185', '宝鸡市_眉县', 'MX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3186', '宝鸡市_陇县', 'LX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3187', '宝鸡市_千阳县', 'QYX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3188', '宝鸡市_麟游县', 'LYX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3189', '宝鸡市_凤县', 'FX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3190', '宝鸡市_太白县', 'TBX', '331', ',0,27,331,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3191', '咸阳市_市辖区', 'SXQ', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3192', '咸阳市_秦都区', 'QDQ', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3193', '咸阳市_杨凌区', 'YLQ', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3194', '咸阳市_渭城区', 'WCQ', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3195', '咸阳市_三原县', 'SYX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3196', '咸阳市_泾阳县', 'JYX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3197', '咸阳市_乾县', 'QX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3198', '咸阳市_礼泉县', 'LQX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3199', '咸阳市_永寿县', 'YSX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3200', '咸阳市_彬县', 'BX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3201', '咸阳市_长武县', 'CWX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3202', '咸阳市_旬邑县', 'XYX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3203', '咸阳市_淳化县', 'CHX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3204', '咸阳市_武功县', 'WGX', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3205', '咸阳市_兴平市', 'XPS', '332', ',0,27,332,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3206', '渭南市_市辖区', 'SXQ', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3207', '渭南市_临渭区', 'LWQ', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3208', '渭南市_华县', 'HX', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3209', '渭南市_潼关县', 'TGX', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3210', '渭南市_大荔县', 'DLX', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3211', '渭南市_合阳县', 'HYX', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3212', '渭南市_澄城县', 'CCX', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3213', '渭南市_蒲城县', 'PCX', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3214', '渭南市_白水县', 'BSX', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3215', '渭南市_富平县', 'FPX', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3216', '渭南市_韩城市', 'HCS', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3217', '渭南市_华阴市', 'HYS', '333', ',0,27,333,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3218', '延安市_市辖区', 'SXQ', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3219', '延安市_宝塔区', 'BTQ', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:25');
INSERT INTO `ab_sys_area` VALUES ('3220', '延安市_延长县', 'YCX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3221', '延安市_延川县', 'YCX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3222', '延安市_子长县', 'ZCX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3223', '延安市_安塞县', 'ASX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3224', '延安市_志丹县', 'ZDX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3225', '延安市_吴旗县', 'WQX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3226', '延安市_甘泉县', 'GQX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3227', '延安市_富县', 'FX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3228', '延安市_洛川县', 'LCX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3229', '延安市_宜川县', 'YCX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3230', '延安市_黄龙县', 'HLX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3231', '延安市_黄陵县', 'HLX', '334', ',0,27,334,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3232', '汉中市_市辖区', 'SXQ', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3233', '汉中市_汉台区', 'HTQ', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3234', '汉中市_南郑县', 'NZX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3235', '汉中市_城固县', 'CGX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3236', '汉中市_洋县', 'YX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3237', '汉中市_西乡县', 'XXX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3238', '汉中市_勉县', 'MX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3239', '汉中市_宁强县', 'NQX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3240', '汉中市_略阳县', 'LYX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3241', '汉中市_镇巴县', 'ZBX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3242', '汉中市_留坝县', 'LBX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3243', '汉中市_佛坪县', 'FPX', '335', ',0,27,335,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3244', '榆林市_市辖区', 'SXQ', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3245', '榆林市_榆阳区', 'YYQ', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3246', '榆林市_神木县', 'SMX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3247', '榆林市_府谷县', 'FGX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3248', '榆林市_横山县', 'HSX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3249', '榆林市_靖边县', 'JBX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3250', '榆林市_定边县', 'DBX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3251', '榆林市_绥德县', 'SDX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3252', '榆林市_米脂县', 'MZX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3253', '榆林市_佳县', 'JX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3254', '榆林市_吴堡县', 'WBX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3255', '榆林市_清涧县', 'QJX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3256', '榆林市_子洲县', 'ZZX', '336', ',0,27,336,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3257', '安康市_市辖区', 'SXQ', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3258', '安康市_汉滨区', 'HBQ', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3259', '安康市_汉阴县', 'HYX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3260', '安康市_石泉县', 'SQX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3261', '安康市_宁陕县', 'NSX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3262', '安康市_紫阳县', 'ZYX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3263', '安康市_岚皋县', 'LGX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3264', '安康市_平利县', 'PLX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3265', '安康市_镇坪县', 'ZPX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3266', '安康市_旬阳县', 'XYX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3267', '安康市_白河县', 'BHX', '337', ',0,27,337,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3268', '商洛市_市辖区', 'SXQ', '338', ',0,27,338,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3269', '商洛市_商州区', 'SZQ', '338', ',0,27,338,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3270', '商洛市_洛南县', 'LNX', '338', ',0,27,338,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3271', '商洛市_丹凤县', 'DFX', '338', ',0,27,338,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3272', '商洛市_商南县', 'SNX', '338', ',0,27,338,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3273', '商洛市_山阳县', 'SYX', '338', ',0,27,338,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3274', '商洛市_镇安县', 'ZAX', '338', ',0,27,338,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3275', '商洛市_柞水县', 'ZSX', '338', ',0,27,338,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3276', '兰州市_市辖区', 'SXQ', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3277', '兰州市_城关区', 'CGQ', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3278', '兰州市_七里河区', 'QLHQ', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3279', '兰州市_西固区', 'XGQ', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3280', '兰州市_安宁区', 'ANQ', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3281', '兰州市_红古区', 'HGQ', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3282', '兰州市_永登县', 'YDX', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:26');
INSERT INTO `ab_sys_area` VALUES ('3283', '兰州市_皋兰县', 'GLX', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3284', '兰州市_榆中县', 'YZX', '339', ',0,28,339,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3285', '嘉峪关市_市辖区', 'SXQ', '340', ',0,28,340,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3286', '金昌市_市辖区', 'SXQ', '341', ',0,28,341,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3287', '金昌市_金川区', 'JCQ', '341', ',0,28,341,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3288', '金昌市_永昌县', 'YCX', '341', ',0,28,341,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3289', '白银市_市辖区', 'SXQ', '342', ',0,28,342,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3290', '白银市_白银区', 'BYQ', '342', ',0,28,342,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3291', '白银市_平川区', 'PCQ', '342', ',0,28,342,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3292', '白银市_靖远县', 'JYX', '342', ',0,28,342,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3293', '白银市_会宁县', 'HNX', '342', ',0,28,342,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3294', '白银市_景泰县', 'JTX', '342', ',0,28,342,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3295', '天水市_市辖区', 'SXQ', '343', ',0,28,343,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3296', '天水市_秦城区', 'QCQ', '343', ',0,28,343,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3297', '天水市_北道区', 'BDQ', '343', ',0,28,343,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3298', '天水市_清水县', 'QSX', '343', ',0,28,343,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3299', '天水市_秦安县', 'QAX', '343', ',0,28,343,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3300', '天水市_甘谷县', 'GGX', '343', ',0,28,343,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3301', '天水市_武山县', 'WSX', '343', ',0,28,343,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3302', '天水市_张家川回族自治县', 'ZJCHZZZX', '343', ',0,28,343,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3303', '武威市_市辖区', 'SXQ', '344', ',0,28,344,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3304', '武威市_凉州区', 'LZQ', '344', ',0,28,344,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3305', '武威市_民勤县', 'MQX', '344', ',0,28,344,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3306', '武威市_古浪县', 'GLX', '344', ',0,28,344,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3307', '武威市_天祝藏族自治县', 'TZCZZZX', '344', ',0,28,344,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3308', '张掖市_市辖区', 'SXQ', '345', ',0,28,345,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3309', '张掖市_甘州区', 'GZQ', '345', ',0,28,345,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3310', '张掖市_肃南裕固族自治县', 'SNYGZZZX', '345', ',0,28,345,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3311', '张掖市_民乐县', 'MLX', '345', ',0,28,345,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3312', '张掖市_临泽县', 'LZX', '345', ',0,28,345,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3313', '张掖市_高台县', 'GTX', '345', ',0,28,345,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3314', '张掖市_山丹县', 'SDX', '345', ',0,28,345,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3315', '平凉市_市辖区', 'SXQ', '346', ',0,28,346,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3316', '平凉市_崆峒区', 'KDQ', '346', ',0,28,346,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3317', '平凉市_泾川县', 'JCX', '346', ',0,28,346,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3318', '平凉市_灵台县', 'LTX', '346', ',0,28,346,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3319', '平凉市_崇信县', 'CXX', '346', ',0,28,346,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3320', '平凉市_华亭县', 'HTX', '346', ',0,28,346,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3321', '平凉市_庄浪县', 'ZLX', '346', ',0,28,346,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3322', '平凉市_静宁县', 'JNX', '346', ',0,28,346,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3323', '酒泉市_市辖区', 'SXQ', '347', ',0,28,347,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3324', '酒泉市_肃州区', 'SZQ', '347', ',0,28,347,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3325', '酒泉市_金塔县', 'JTX', '347', ',0,28,347,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3326', '酒泉市_安西县', 'AXX', '347', ',0,28,347,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3327', '酒泉市_肃北蒙古族自治县', 'SBMGZZZX', '347', ',0,28,347,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3328', '酒泉市_阿克塞哈萨克族自治县', 'AKSHSKZZZX', '347', ',0,28,347,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3329', '酒泉市_玉门市', 'YMS', '347', ',0,28,347,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3330', '酒泉市_敦煌市', 'DHS', '347', ',0,28,347,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3331', '庆阳市_市辖区', 'SXQ', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3332', '庆阳市_西峰区', 'XFQ', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3333', '庆阳市_庆城县', 'QCX', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3334', '庆阳市_环县', 'HX', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3335', '庆阳市_华池县', 'HCX', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3336', '庆阳市_合水县', 'HSX', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3337', '庆阳市_正宁县', 'ZNX', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3338', '庆阳市_宁县', 'NX', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3339', '庆阳市_镇原县', 'ZYX', '348', ',0,28,348,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3340', '定西市_市辖区', 'SXQ', '349', ',0,28,349,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3341', '定西市_安定区', 'ADQ', '349', ',0,28,349,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3342', '定西市_通渭县', 'TWX', '349', ',0,28,349,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3343', '定西市_陇西县', 'LXX', '349', ',0,28,349,', '0', '3', '0', '0', '2008-11-24 11:06:27');
INSERT INTO `ab_sys_area` VALUES ('3344', '定西市_渭源县', 'WYX', '349', ',0,28,349,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3345', '定西市_临洮县', 'LTX', '349', ',0,28,349,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3346', '定西市_漳县', 'ZX', '349', ',0,28,349,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3347', '定西市_岷县', 'MX', '349', ',0,28,349,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3348', '陇南市_市辖区', 'SXQ', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3349', '陇南市_武都区', 'WDQ', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3350', '陇南市_成县', 'CX', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3351', '陇南市_文县', 'WX', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3352', '陇南市_宕昌县', 'DCX', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3353', '陇南市_康县', 'KX', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3354', '陇南市_西和县', 'XHX', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3355', '陇南市_礼县', 'LX', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3356', '陇南市_徽县', 'HX', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3357', '陇南市_两当县', 'LDX', '350', ',0,28,350,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3358', '临夏回族自治州_临夏市', 'LXS', '351', ',0,28,351,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3359', '临夏回族自治州_临夏县', 'LXX', '351', ',0,28,351,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3360', '临夏回族自治州_康乐县', 'KLX', '351', ',0,28,351,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3361', '临夏回族自治州_永靖县', 'YJX', '351', ',0,28,351,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3362', '临夏回族自治州_广河县', 'GHX', '351', ',0,28,351,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3363', '临夏回族自治州_和政县', 'HZX', '351', ',0,28,351,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3364', '临夏回族自治州_东乡族自治县', 'DXZZZX', '351', ',0,28,351,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3365', '临夏回族自治州_积石山保安族东乡族撒拉族自治县', 'JSSBAZDXZSLZZZX', '351', ',0,28,351,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3366', '甘南藏族自治州_合作市', 'HZS', '352', ',0,28,352,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3367', '甘南藏族自治州_临潭县', 'LTX', '352', ',0,28,352,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3368', '甘南藏族自治州_卓尼县', 'ZNX', '352', ',0,28,352,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3369', '甘南藏族自治州_舟曲县', 'ZQX', '352', ',0,28,352,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3370', '甘南藏族自治州_迭部县', 'DBX', '352', ',0,28,352,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3371', '甘南藏族自治州_玛曲县', 'MQX', '352', ',0,28,352,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3372', '甘南藏族自治州_碌曲县', 'LQX', '352', ',0,28,352,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3373', '甘南藏族自治州_夏河县', 'XHX', '352', ',0,28,352,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3374', '西宁市_市辖区', 'SXQ', '353', ',0,29,353,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3375', '西宁市_城东区', 'CDQ', '353', ',0,29,353,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3376', '西宁市_城中区', 'CZQ', '353', ',0,29,353,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3377', '西宁市_城西区', 'CXQ', '353', ',0,29,353,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3378', '西宁市_城北区', 'CBQ', '353', ',0,29,353,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3379', '西宁市_大通回族土族自治县', 'DTHZTZZZX', '353', ',0,29,353,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3380', '西宁市_湟中县', 'HZX', '353', ',0,29,353,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3381', '西宁市_湟源县', 'HYX', '353', ',0,29,353,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3382', '海东地区_平安县', 'PAX', '354', ',0,29,354,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3383', '海东地区_民和回族土族自治县', 'MHHZTZZZX', '354', ',0,29,354,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3384', '海东地区_乐都县', 'LDX', '354', ',0,29,354,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3385', '海东地区_互助土族自治县', 'HZTZZZX', '354', ',0,29,354,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3386', '海东地区_化隆回族自治县', 'HLHZZZX', '354', ',0,29,354,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3387', '海东地区_循化撒拉族自治县', 'XHSLZZZX', '354', ',0,29,354,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3388', '海北藏族自治州_门源回族自治县', 'MYHZZZX', '355', ',0,29,355,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3389', '海北藏族自治州_祁连县', 'QLX', '355', ',0,29,355,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3390', '海北藏族自治州_海晏县', 'HYX', '355', ',0,29,355,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3391', '海北藏族自治州_刚察县', 'GCX', '355', ',0,29,355,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3392', '黄南藏族自治州_同仁县', 'TRX', '356', ',0,29,356,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3393', '黄南藏族自治州_尖扎县', 'JZX', '356', ',0,29,356,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3394', '黄南藏族自治州_泽库县', 'ZKX', '356', ',0,29,356,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3395', '黄南藏族自治州_河南蒙古族自治县', 'HNMGZZZX', '356', ',0,29,356,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3396', '海南藏族自治州_共和县', 'GHX', '357', ',0,29,357,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3397', '海南藏族自治州_同德县', 'TDX', '357', ',0,29,357,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3398', '海南藏族自治州_贵德县', 'GDX', '357', ',0,29,357,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3399', '海南藏族自治州_兴海县', 'XHX', '357', ',0,29,357,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3400', '海南藏族自治州_贵南县', 'GNX', '357', ',0,29,357,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3401', '果洛藏族自治州_玛沁县', 'MQX', '358', ',0,29,358,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3402', '果洛藏族自治州_班玛县', 'BMX', '358', ',0,29,358,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3403', '果洛藏族自治州_甘德县', 'GDX', '358', ',0,29,358,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3404', '果洛藏族自治州_达日县', 'DRX', '358', ',0,29,358,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3405', '果洛藏族自治州_久治县', 'JZX', '358', ',0,29,358,', '0', '3', '0', '0', '2008-11-24 11:06:28');
INSERT INTO `ab_sys_area` VALUES ('3406', '果洛藏族自治州_玛多县', 'MDX', '358', ',0,29,358,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3407', '玉树藏族自治州_玉树县', 'YSX', '359', ',0,29,359,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3408', '玉树藏族自治州_杂多县', 'ZDX', '359', ',0,29,359,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3409', '玉树藏族自治州_称多县', 'CDX', '359', ',0,29,359,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3410', '玉树藏族自治州_治多县', 'ZDX', '359', ',0,29,359,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3411', '玉树藏族自治州_囊谦县', 'NQX', '359', ',0,29,359,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3412', '玉树藏族自治州_曲麻莱县', 'QMLX', '359', ',0,29,359,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3413', '海西蒙古族藏族自治州_格尔木市', 'GEMS', '360', ',0,29,360,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3414', '海西蒙古族藏族自治州_德令哈市', 'DLHS', '360', ',0,29,360,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3415', '海西蒙古族藏族自治州_乌兰县', 'WLX', '360', ',0,29,360,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3416', '海西蒙古族藏族自治州_都兰县', 'DLX', '360', ',0,29,360,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3417', '海西蒙古族藏族自治州_天峻县', 'TJX', '360', ',0,29,360,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3418', '银川市_市辖区', 'SXQ', '361', ',0,30,361,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3419', '银川市_兴庆区', 'XQQ', '361', ',0,30,361,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3420', '银川市_西夏区', 'XXQ', '361', ',0,30,361,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3421', '银川市_金凤区', 'JFQ', '361', ',0,30,361,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3422', '银川市_永宁县', 'YNX', '361', ',0,30,361,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3423', '银川市_贺兰县', 'HLX', '361', ',0,30,361,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3424', '银川市_灵武市', 'LWS', '361', ',0,30,361,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3425', '石嘴山市_市辖区', 'SXQ', '362', ',0,30,362,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3426', '石嘴山市_大武口区', 'DWKQ', '362', ',0,30,362,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3427', '石嘴山市_惠农区', 'HNQ', '362', ',0,30,362,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3428', '石嘴山市_平罗县', 'PLX', '362', ',0,30,362,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3429', '吴忠市_市辖区', 'SXQ', '363', ',0,30,363,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3430', '吴忠市_利通区', 'LTQ', '363', ',0,30,363,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3431', '吴忠市_盐池县', 'YCX', '363', ',0,30,363,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3432', '吴忠市_同心县', 'TXX', '363', ',0,30,363,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3433', '吴忠市_青铜峡市', 'QTXS', '363', ',0,30,363,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3434', '固原市_市辖区', 'SXQ', '364', ',0,30,364,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3435', '固原市_原州区', 'YZQ', '364', ',0,30,364,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3436', '固原市_西吉县', 'XJX', '364', ',0,30,364,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3437', '固原市_隆德县', 'LDX', '364', ',0,30,364,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3438', '固原市_泾源县', 'JYX', '364', ',0,30,364,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3439', '固原市_彭阳县', 'PYX', '364', ',0,30,364,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3440', '中卫市_市辖区', 'SXQ', '365', ',0,30,365,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3441', '中卫市_沙坡头区', 'SPTQ', '365', ',0,30,365,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3442', '中卫市_中宁县', 'ZNX', '365', ',0,30,365,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3443', '中卫市_海原县', 'HYX', '365', ',0,30,365,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3444', '乌鲁木齐市_市辖区', 'SXQ', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3445', '乌鲁木齐市_天山区', 'TSQ', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3446', '乌鲁木齐市_沙依巴克区', 'SYBKQ', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3447', '乌鲁木齐市_新市区', 'XSQ', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3448', '乌鲁木齐市_水磨沟区', 'SMGQ', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3449', '乌鲁木齐市_头屯河区', 'TTHQ', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3450', '乌鲁木齐市_达坂城区', 'DBCQ', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3451', '乌鲁木齐市_东山区', 'DSQ', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3452', '乌鲁木齐市_乌鲁木齐县', 'WLMQX', '366', ',0,31,366,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3453', '克拉玛依市_市辖区', 'SXQ', '367', ',0,31,367,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3454', '克拉玛依市_独山子区', 'DSZQ', '367', ',0,31,367,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3455', '克拉玛依市_克拉玛依区', 'KLMYQ', '367', ',0,31,367,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3456', '克拉玛依市_白碱滩区', 'BJTQ', '367', ',0,31,367,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3457', '克拉玛依市_乌尔禾区', 'WEHQ', '367', ',0,31,367,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3458', '吐鲁番地区_吐鲁番市', 'TLFS', '368', ',0,31,368,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3459', '吐鲁番地区_鄯善县', 'SSX', '368', ',0,31,368,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3460', '吐鲁番地区_托克逊县', 'TKXX', '368', ',0,31,368,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3461', '哈密地区_哈密市', 'HMS', '369', ',0,31,369,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3462', '哈密地区_巴里坤哈萨克自治县', 'BLKHSKZZX', '369', ',0,31,369,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3463', '哈密地区_伊吾县', 'YWX', '369', ',0,31,369,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3464', '昌吉回族自治州_昌吉市', 'CJS', '370', ',0,31,370,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3465', '昌吉回族自治州_阜康市', 'FKS', '370', ',0,31,370,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3466', '昌吉回族自治州_米泉市', 'MQS', '370', ',0,31,370,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3467', '昌吉回族自治州_呼图壁县', 'HTBX', '370', ',0,31,370,', '0', '3', '0', '0', '2008-11-24 11:06:29');
INSERT INTO `ab_sys_area` VALUES ('3468', '昌吉回族自治州_玛纳斯县', 'MNSX', '370', ',0,31,370,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3469', '昌吉回族自治州_奇台县', 'QTX', '370', ',0,31,370,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3470', '昌吉回族自治州_吉木萨尔县', 'JMSEX', '370', ',0,31,370,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3471', '昌吉回族自治州_木垒哈萨克自治县', 'MLHSKZZX', '370', ',0,31,370,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3472', '博尔塔拉蒙古自治州_博乐市', 'BLS', '371', ',0,31,371,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3473', '博尔塔拉蒙古自治州_精河县', 'JHX', '371', ',0,31,371,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3474', '博尔塔拉蒙古自治州_温泉县', 'WQX', '371', ',0,31,371,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3475', '巴音郭楞蒙古自治州_库尔勒市', 'KELS', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3476', '巴音郭楞蒙古自治州_轮台县', 'LTX', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3477', '巴音郭楞蒙古自治州_尉犁县', 'WLX', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3478', '巴音郭楞蒙古自治州_若羌县', 'RQX', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3479', '巴音郭楞蒙古自治州_且末县', 'QMX', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3480', '巴音郭楞蒙古自治州_焉耆回族自治县', 'YQHZZZX', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3481', '巴音郭楞蒙古自治州_和静县', 'HJX', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3482', '巴音郭楞蒙古自治州_和硕县', 'HSX', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3483', '巴音郭楞蒙古自治州_博湖县', 'BHX', '372', ',0,31,372,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3484', '阿克苏地区_阿克苏市', 'AKSS', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3485', '阿克苏地区_温宿县', 'WSX', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3486', '阿克苏地区_库车县', 'KCX', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3487', '阿克苏地区_沙雅县', 'SYX', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3488', '阿克苏地区_新和县', 'XHX', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3489', '阿克苏地区_拜城县', 'BCX', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3490', '阿克苏地区_乌什县', 'WSX', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3491', '阿克苏地区_阿瓦提县', 'AWTX', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3492', '阿克苏地区_柯坪县', 'KPX', '373', ',0,31,373,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3493', '克孜勒苏柯尔克孜自治州_阿图什市', 'ATSS', '374', ',0,31,374,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3494', '克孜勒苏柯尔克孜自治州_阿克陶县', 'AKTX', '374', ',0,31,374,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3495', '克孜勒苏柯尔克孜自治州_阿合奇县', 'AHQX', '374', ',0,31,374,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3496', '克孜勒苏柯尔克孜自治州_乌恰县', 'WQX', '374', ',0,31,374,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3497', '喀什地区_喀什市', 'KSS', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3498', '喀什地区_疏附县', 'SFX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3499', '喀什地区_疏勒县', 'SLX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3500', '喀什地区_英吉沙县', 'YJSX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3501', '喀什地区_泽普县', 'ZPX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3502', '喀什地区_莎车县', 'SCX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3503', '喀什地区_叶城县', 'YCX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3504', '喀什地区_麦盖提县', 'MGTX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3505', '喀什地区_岳普湖县', 'YPHX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3506', '喀什地区_伽师县', 'GSX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3507', '喀什地区_巴楚县', 'BCX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3508', '喀什地区_塔什库尔干塔吉克自治县', 'TSKEGTJKZZX', '375', ',0,31,375,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3509', '和田地区_和田市', 'HTS', '376', ',0,31,376,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3510', '和田地区_和田县', 'HTX', '376', ',0,31,376,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3511', '和田地区_墨玉县', 'MYX', '376', ',0,31,376,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3512', '和田地区_皮山县', 'PSX', '376', ',0,31,376,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3513', '和田地区_洛浦县', 'LPX', '376', ',0,31,376,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3514', '和田地区_策勒县', 'CLX', '376', ',0,31,376,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3515', '和田地区_于田县', 'YTX', '376', ',0,31,376,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3516', '和田地区_民丰县', 'MFX', '376', ',0,31,376,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3517', '伊犁哈萨克自治州_伊宁市', 'YNS', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3518', '伊犁哈萨克自治州_奎屯市', 'KTS', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3519', '伊犁哈萨克自治州_伊宁县', 'YNX', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3520', '伊犁哈萨克自治州_察布查尔锡伯自治县', 'CBCEXBZZX', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3521', '伊犁哈萨克自治州_霍城县', 'HCX', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3522', '伊犁哈萨克自治州_巩留县', 'GLX', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3523', '伊犁哈萨克自治州_新源县', 'XYX', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3524', '伊犁哈萨克自治州_昭苏县', 'ZSX', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3525', '伊犁哈萨克自治州_特克斯县', 'TKSX', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3526', '伊犁哈萨克自治州_尼勒克县', 'NLKX', '377', ',0,31,377,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3527', '塔城地区_塔城市', 'TCS', '378', ',0,31,378,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3528', '塔城地区_乌苏市', 'WSS', '378', ',0,31,378,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3529', '塔城地区_额敏县', 'EMX', '378', ',0,31,378,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3530', '塔城地区_沙湾县', 'SWX', '378', ',0,31,378,', '0', '3', '0', '0', '2008-11-24 11:06:30');
INSERT INTO `ab_sys_area` VALUES ('3531', '塔城地区_托里县', 'TLX', '378', ',0,31,378,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3532', '塔城地区_裕民县', 'YMX', '378', ',0,31,378,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3533', '塔城地区_和布克赛尔蒙古自治县', 'HBKSEMGZZX', '378', ',0,31,378,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3534', '阿勒泰地区_阿勒泰市', 'ALTS', '379', ',0,31,379,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3535', '阿勒泰地区_布尔津县', 'BEJX', '379', ',0,31,379,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3536', '阿勒泰地区_富蕴县', 'FYX', '379', ',0,31,379,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3537', '阿勒泰地区_福海县', 'FHX', '379', ',0,31,379,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3538', '阿勒泰地区_哈巴河县', 'HBHX', '379', ',0,31,379,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3539', '阿勒泰地区_青河县', 'QHX', '379', ',0,31,379,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3540', '阿勒泰地区_吉木乃县', 'JMNX', '379', ',0,31,379,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3541', '省直辖行政单位_石河子市', 'SHZS', '380', ',0,31,380,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3542', '省直辖行政单位_阿拉尔市', 'ALES', '380', ',0,31,380,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3543', '省直辖行政单位_图木舒克市', 'TMSKS', '380', ',0,31,380,', '0', '3', '0', '0', '2008-11-24 11:06:31');
INSERT INTO `ab_sys_area` VALUES ('3544', '省直辖行政单位_五家渠市', 'WJQS', '380', ',0,31,380,', '0', '3', '0', '0', '2008-11-24 11:06:31');

-- ----------------------------
-- Table structure for `ab_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ab_sys_menu`;
CREATE TABLE `ab_sys_menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MENU_NAME` varchar(255) NOT NULL COMMENT '菜单名称',
  `TYPE_ID` int(11) NOT NULL COMMENT '类型 1 平台菜单 2 个人中菜单',
  `PARENT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `MENU_URL` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `ORDER_ID` int(11) NOT NULL DEFAULT '0' COMMENT '序号',
  `MENU_ICON` varchar(30) DEFAULT NULL COMMENT '图标',
  `IS_DEL` int(1) NOT NULL DEFAULT '0' COMMENT '是否逻辑删除',
  `VERSION` int(1) NOT NULL DEFAULT '0' COMMENT '版本',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `DELETE_TIME` datetime DEFAULT NULL COMMENT '删除时间',
  `OPT_ID` int(11) DEFAULT NULL COMMENT '操作员ID。界面录入时需填写',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='ab_sys_menu/系统菜单';

-- ----------------------------
-- Records of ab_sys_menu
-- ----------------------------
INSERT INTO `ab_sys_menu` VALUES ('1', '系统管理', '1', '0', '#', '1', 'icon-envelope-alt', '0', '0', '2015-08-20 16:16:15', '2016-07-08 15:44:19', '2016-06-21 09:56:58', '0');
INSERT INTO `ab_sys_menu` VALUES ('2', '权限管理', '1', '1', 'role.do', '2', '', '0', '0', '2015-08-20 16:16:21', '2015-08-24 14:23:14', '2016-06-21 09:57:04', '1');
INSERT INTO `ab_sys_menu` VALUES ('4', '菜单管理', '1', '1', 'menu', '1', '', '0', '0', '2015-08-20 16:16:24', '2016-07-08 15:46:07', '2016-06-21 09:57:07', '0');
INSERT INTO `ab_sys_menu` VALUES ('5', '系统用户管理', '1', '1', 'usersOpt/listUsers.do', '3', '', '0', '0', '2015-08-20 16:16:26', '2016-06-21 14:54:14', '2016-06-21 09:57:12', '0');

-- ----------------------------
-- Table structure for `ab_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `ab_sys_role`;
CREATE TABLE `ab_sys_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PARENT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `ROLE_NAME` varchar(20) NOT NULL COMMENT '角色名称',
  `MENU_RIGHTS` varchar(50) DEFAULT NULL COMMENT '菜单权限/URL   _menu的ID     2的全和',
  `ADD_QX` varchar(50) DEFAULT NULL COMMENT '增加的权限',
  `DEL_QX` varchar(50) DEFAULT NULL COMMENT '删除',
  `EDIT_QX` varchar(50) DEFAULT NULL COMMENT '编辑',
  `CHA_QX` varchar(50) DEFAULT NULL COMMENT '查询',
  `AUDIT_QX` varchar(50) DEFAULT NULL COMMENT '审核',
  `FX_QX` int(10) DEFAULT NULL COMMENT '发信权限',
  `FW_QX` int(10) DEFAULT NULL COMMENT '服务权限',
  `QX1` int(10) DEFAULT NULL COMMENT '操作权限',
  `QX2` int(10) DEFAULT NULL COMMENT '产品权限',
  `QX3` int(10) DEFAULT NULL COMMENT '预留权限',
  `QX4` int(10) DEFAULT NULL COMMENT '预留权限',
  `C1` int(10) DEFAULT NULL COMMENT 'C1',
  `C2` int(10) DEFAULT NULL COMMENT 'C2',
  `C3` int(10) DEFAULT NULL COMMENT 'C3',
  `C4` int(10) DEFAULT NULL COMMENT 'C4',
  `Q1` int(10) DEFAULT NULL COMMENT 'Q1',
  `Q2` int(10) DEFAULT NULL COMMENT 'Q2',
  `Q3` int(10) DEFAULT NULL COMMENT 'Q3',
  `Q4` int(10) DEFAULT NULL COMMENT 'Q4',
  `IS_DEL` int(1) NOT NULL DEFAULT '0' COMMENT '是否逻辑删除',
  `VERSION` int(1) NOT NULL DEFAULT '0' COMMENT '版本',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `DELETE_TIME` datetime DEFAULT NULL COMMENT '删除时间',
  `OPT_ID` int(11) DEFAULT NULL COMMENT '操作员ID。界面录入时需填写',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='ab_sys_role/角色菜单权限表';

-- ----------------------------
-- Records of ab_sys_role
-- ----------------------------
INSERT INTO `ab_sys_role` VALUES ('1', '0', '系统管理员', '4914039257387654589250908717110', '1', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-07-20 00:00:00', '2016-07-08 15:47:55', '2015-07-20 00:00:00', '0');
INSERT INTO `ab_sys_role` VALUES ('2', '1', '超级管理员', '4914039257387654589250908717110', '315710981462109558138111787062', '315710981462109558138111787062', '315674712380108133038706130998', '315674710018924891603883524150', '504403158265495606', '0', '0', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '2015-07-20 00:00:00', '2015-12-08 16:00:21', '2015-07-20 00:00:00', '0');
INSERT INTO `ab_sys_role` VALUES ('4', '7', '特级会员', '498', '0', '0', '0', '0', '', '0', '0', '1', '1', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '1');
INSERT INTO `ab_sys_role` VALUES ('6', '7', '中级会员', '498', '0', '0', '0', '0', '', '1', '1', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '1');
INSERT INTO `ab_sys_role` VALUES ('7', '0', '会员组', '498', '0', '0', '0', '1', '', '1', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '1');
INSERT INTO `ab_sys_role` VALUES ('8', '1', '管理员B', '4914039257387654589250908717110', '20768058354828872876607792576725046', '20768058354828872876607792576725046', '20768058354828872876607792576725046', '20768058354828872876607792576725046', '20768058354828872876607792576725046', '1', '1', '1', '1', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '1');
INSERT INTO `ab_sys_role` VALUES ('9', '1', '管理员A', '4914039257387654589250908717110', '54', '54', '0', '246', '', '1', '1', '1', '1', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '1');
INSERT INTO `ab_sys_role` VALUES ('10', '7', '高级会员', '498', '0', '0', '0', '0', '', '1', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '1');
INSERT INTO `ab_sys_role` VALUES ('12', '7', '初级会员', '498', '1', '1', '1', '1', '', '0', '1', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '2015-07-20 00:00:00', '1');
INSERT INTO `ab_sys_role` VALUES ('13', '1', '测试角色', '4914039257387654589250908717110', '72057594037927990', '3386706919782613046', '3314649325744685056', '15393164853440', '15393162788864', '0', '1', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-08-21 15:05:08', '2016-06-22 13:03:38', '2015-08-21 15:05:20', '0');
INSERT INTO `ab_sys_role` VALUES ('22', '0', '测试组', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-08-21 15:05:24', '2015-08-21 15:05:27', '2015-08-21 15:05:30', '1');
INSERT INTO `ab_sys_role` VALUES ('28', '1', '开发人员', '4914039257387654589250908717110', '76823456718344289691631670', '77352361764425689955565622', '77352361764425689955565622', '76823456718344289691631670', '77352361764425689955565622', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-08-24 13:33:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1');
INSERT INTO `ab_sys_role` VALUES ('29', '1', '测试A', '4914039257387654589250908717110', '53016014525435289272374', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2015-10-19 16:03:46', '2015-10-19 16:03:54', '0000-00-00 00:00:00', '0');
INSERT INTO `ab_sys_role` VALUES ('30', '22', '212', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '2016-07-08 15:48:11', null, '2016-07-08 15:48:15', '0');

-- ----------------------------
-- Table structure for `ab_sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `ab_sys_user_role`;
CREATE TABLE `ab_sys_user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT '用户基表id',
  `ROLE_ID` int(11) NOT NULL COMMENT '角色ID',
  `IS_DEL` int(1) NOT NULL COMMENT '是否逻辑删除 0否',
  `VERSION` int(1) NOT NULL DEFAULT '0' COMMENT '版本号默认0',
  `OPT_ID` int(11) DEFAULT NULL COMMENT '操作员ID。界面录入时需填写',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `DELETE_TIME` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='ab_sys_user_role/用户角色';

-- ----------------------------
-- Records of ab_sys_user_role
-- ----------------------------
INSERT INTO `ab_sys_user_role` VALUES ('32', '0', '1', '0', '0', null, '2016-04-08 16:15:13', '2016-06-21 09:58:38', '2016-06-21 09:58:42');
INSERT INTO `ab_sys_user_role` VALUES ('34', '4', '2', '0', '0', null, '2016-06-22 10:40:30', null, null);
INSERT INTO `ab_sys_user_role` VALUES ('35', '3', '2', '0', '0', null, '2016-06-22 14:38:12', null, null);
INSERT INTO `ab_sys_user_role` VALUES ('36', '5', '2', '0', '0', null, '2016-06-22 14:58:28', null, null);
INSERT INTO `ab_sys_user_role` VALUES ('37', '6', '2', '0', '0', null, '2016-06-22 14:59:37', null, null);
INSERT INTO `ab_sys_user_role` VALUES ('38', '7', '2', '0', '0', null, '2016-06-22 15:00:45', null, null);
INSERT INTO `ab_sys_user_role` VALUES ('39', '8', '8', '0', '0', null, '2016-06-22 16:02:27', null, null);
INSERT INTO `ab_sys_user_role` VALUES ('80', '1', '8', '0', '0', null, '2016-07-08 16:48:12', null, null);

-- ----------------------------
-- Table structure for `ab_user`
-- ----------------------------
DROP TABLE IF EXISTS `ab_user`;
CREATE TABLE `ab_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户名',
  `USERNAME` varchar(30) NOT NULL COMMENT '登录名',
  `PASSWORD` varchar(50) NOT NULL COMMENT '密码',
  `PHONE_STATUS` int(2) NOT NULL DEFAULT '0' COMMENT 'PHONE_STATUS',
  `PHONE` varchar(20) DEFAULT NULL COMMENT '手机号',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `EMAIL_STATUS` int(2) NOT NULL DEFAULT '0' COMMENT 'PHONE_STATUS',
  `TYPE_ID` int(11) NOT NULL COMMENT '用户类型（configid=1,用户/后台管理员',
  `STATUS` int(2) NOT NULL COMMENT '状态/configid=18',
  `REALNAME` varchar(200) DEFAULT NULL COMMENT 'REALNAME',
  `REALNAME_STATUS` int(2) NOT NULL DEFAULT '0' COMMENT 'REALNAME_STATUS',
  `CREATE_IP` varchar(20) DEFAULT NULL COMMENT '创建时IP',
  `IS_DEL` int(1) NOT NULL DEFAULT '0' COMMENT '是否逻辑删除 0否',
  `OPT_ID` int(11) DEFAULT NULL COMMENT '操作员ID。界面录入时需填写',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `DELETE_TIME` datetime DEFAULT NULL COMMENT '删除时间',
  `PASSWORD_LEVEL` int(1) DEFAULT '1' COMMENT '密码级别3:高；2：中；1：低',
  `NRP_USR_ID` varchar(32) DEFAULT NULL COMMENT '商户下的平台用号 ，在每个商户下唯一（必须是 6-25',
  `IS_UPDATED_USERNAME` int(2) NOT NULL DEFAULT '0' COMMENT '是否修改过用户名 默认否0   ',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Index_userbase` (`USERNAME`) USING BTREE,
  KEY `PASSWORD` (`PASSWORD`) USING BTREE,
  KEY `TYPE_ID` (`TYPE_ID`) USING BTREE,
  KEY `STATUS` (`STATUS`) USING BTREE,
  KEY `IS_DEL` (`IS_DEL`) USING BTREE,
  KEY `CREATE_TIME` (`CREATE_TIME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_user/统一登录用户基表(会员/平台统一/企业)';



-- ----------------------------
-- Table structure for `ab_users_add`
-- ----------------------------
DROP TABLE IF EXISTS `ab_users_add`;
CREATE TABLE `ab_users_add` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `AREAID` int(11) NOT NULL COMMENT '地区ID',
  `USER_ID` int(11) NOT NULL COMMENT '帐户ID',
  `REALNAME` varchar(50) DEFAULT NULL COMMENT '收货联系人名称',
  `TEL` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  `POST` varchar(50) DEFAULT NULL COMMENT '联系人邮编',
  `ADDR` varchar(50) DEFAULT NULL COMMENT '联系人地址',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`) USING BTREE,
  KEY `AREAID` (`AREAID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_users_add/收货地址';



-- ----------------------------
-- Table structure for `ab_users_black`
-- ----------------------------
DROP TABLE IF EXISTS `ab_users_black`;
CREATE TABLE `ab_users_black` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT 'USER_ID',
  `MEMO` varchar(30) DEFAULT NULL COMMENT 'CODE',
  `CREATE_IP` varchar(20) NOT NULL COMMENT '创建时IP',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `OPT_ID` int(11) NOT NULL DEFAULT '0' COMMENT '操作员ID。界面录入时需填写',
  `CHARGE` int(11) NOT NULL DEFAULT '0' COMMENT '限制返佣  0/1',
  `LIMITE_TENDER` int(11) NOT NULL DEFAULT '0' COMMENT '限制投标  0/1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ab_USERS_BLACK';



-- ----------------------------
-- Table structure for `ab_users_info`
-- ----------------------------
DROP TABLE IF EXISTS `ab_users_info`;
CREATE TABLE `ab_users_info` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT '关联的帐户基表ID--ab_user_base',
  `LOGIN_ID` int(11) NOT NULL COMMENT '关联的用户基表ID2',
  `AREAID` int(11) DEFAULT NULL COMMENT 'AREA',
  `NINAME` varchar(50) DEFAULT NULL COMMENT 'NINAME',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT 'BIRTHDAY',
  `SEX` int(1) DEFAULT NULL COMMENT '性别 0女1男',
  `INVITE_USERID` int(11) DEFAULT NULL COMMENT '邀请人ID',
  `INVITE_MONEY` decimal(11,2) DEFAULT NULL COMMENT 'INVITE_MONEY',
  `QUESTION` varchar(100) DEFAULT NULL COMMENT 'QUESTION',
  `ANSWER` varchar(100) DEFAULT NULL COMMENT 'ANSWER',
  `LAST_TIME` datetime NOT NULL COMMENT '最后登录时间',
  `LAST_IP` varchar(20) DEFAULT NULL COMMENT '最后IP',
  `INVITE_CODE` varchar(20) DEFAULT NULL COMMENT '本人邀请码/唯一',
  `INTRODUCTION` varchar(600) DEFAULT NULL COMMENT '个人简介',
  `BASEINFO_OPEN` int(1) DEFAULT '0' COMMENT '基本信息开放状态。0不开放，1开放',
  `QQ` varchar(15) DEFAULT NULL COMMENT 'QQ号码',
  `BLOOD` varchar(2) DEFAULT NULL COMMENT '血型A,B,AB,O',
  `FAITH` int(1) DEFAULT '0' COMMENT '信仰。1佛教，2道教，3基督教，4天主教，5伊斯兰教，6无神论',
  `EDUCATION` int(1) DEFAULT '0' COMMENT '学历。1小学，2初中，3高中，4大学，5硕士，6博士',
  `UNIVERSITY` varchar(24) DEFAULT NULL COMMENT '毕业院校',
  `MARRIAGE` int(1) DEFAULT '0' COMMENT '婚姻状况。2已婚，1未婚，0未知或者保密',
  `INFO_OPEN` int(1) DEFAULT NULL COMMENT '会员真实资料开放状态。0不开放，1开放',
  `HEAD_PIC` varchar(200) DEFAULT NULL COMMENT '会员头像地址',
  `SOURCE` varchar(16) DEFAULT NULL COMMENT '渠道来源',
  `PLATFORM` int(11) DEFAULT NULL COMMENT '平台来源  1:PC  2:H5   3:IOS  4:安卓 ',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`) USING BTREE,
  UNIQUE KEY `LOGIN_ID` (`LOGIN_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_USERS_INFO';



-- ----------------------------
-- Table structure for `ab_users_invite`
-- ----------------------------
DROP TABLE IF EXISTS `ab_users_invite`;
CREATE TABLE `ab_users_invite` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `INVITE_TYPE` int(10) NOT NULL DEFAULT '0' COMMENT '类型 CONFIG_ID=42',
  `USER_ID` int(50) NOT NULL COMMENT '被邀请人',
  `INVITE_USER_ID` int(11) NOT NULL COMMENT '上级邀请人',
  `INVITE_CODE` varchar(10) NOT NULL DEFAULT '1' COMMENT '上级邀请人的邀请码',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建日期',
  `CREATE_IP` varchar(20) NOT NULL COMMENT '创建时IP',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`) USING BTREE,
  KEY `INVITE_USER_ID` (`INVITE_USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ab_users_invite/用户邀请信息表';



-- ----------------------------
-- Table structure for `ab_users_log`
-- ----------------------------
DROP TABLE IF EXISTS `ab_users_log`;
CREATE TABLE `ab_users_log` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT 'USER_ID',
  `TYPE_ID` int(11) NOT NULL COMMENT 'TYPE',
  `RESULT` int(1) NOT NULL DEFAULT '0' COMMENT 'OPERATING',
  `CONTENT` text COMMENT 'CONTENT',
  `CREATE_IP` varchar(20) NOT NULL COMMENT '创建时IP',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`) USING BTREE,
  KEY `TYPE_ID` (`TYPE_ID`) USING BTREE,
  KEY `RESULT` (`RESULT`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_USERS_LOG';



-- ----------------------------
-- Table structure for `ab_users_message`
-- ----------------------------
DROP TABLE IF EXISTS `ab_users_message`;
CREATE TABLE `ab_users_message` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `TYPE` int(11) NOT NULL COMMENT '消息类型 CONFIG=28',
  `STATUS` int(11) NOT NULL COMMENT '状态  CONFIGID=29',
  `SEND_LOGINID` int(11) DEFAULT '0' COMMENT '发送者ID  ab_USER表ID ',
  `RECEIVE_LOGINID` int(11) DEFAULT NULL COMMENT '接受者ID-ab_USER表ID ',
  `MSG_TITLE` varchar(255) DEFAULT NULL COMMENT '消息题目',
  `CONTENTS` text NOT NULL COMMENT '消息内容',
  `PARENT_ID` int(11) DEFAULT '0' COMMENT '父消息ID',
  `OPT_ID` int(11) DEFAULT NULL COMMENT '操作员ID。界面录入时需填写',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `TYPE` (`TYPE`) USING BTREE,
  KEY `SEND_LOGINID` (`SEND_LOGINID`) USING BTREE,
  KEY `RECEIVE_LOGINID` (`RECEIVE_LOGINID`) USING BTREE,
  KEY `STATUS` (`STATUS`) USING BTREE,
  KEY `PARENT_ID` (`PARENT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_users_message/系统消息/用户消息';



-- ----------------------------
-- Table structure for `ab_users_opt`
-- ----------------------------
DROP TABLE IF EXISTS `ab_users_opt`;
CREATE TABLE `ab_users_opt` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LOGIN_ID` int(11) NOT NULL COMMENT '统一登录ID',
  `ENT_ID` int(11) NOT NULL COMMENT '企业ID',
  `OPT_USERNAME` varchar(50) NOT NULL COMMENT '密码',
  `REMARK` varchar(200) NOT NULL COMMENT '备注',
  `QQ` varchar(20) NOT NULL COMMENT 'QQ',
  `SEX` int(1) DEFAULT NULL COMMENT '性别 0女1男',
  `LAST_TIME` datetime NOT NULL COMMENT '最后登录时间',
  `LAST_IP` varchar(20) DEFAULT NULL COMMENT '最后IP',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN_ID` (`LOGIN_ID`) USING BTREE,
  KEY `ENT_ID` (`ENT_ID`) USING BTREE,
  KEY `OPT_USERNAME` (`OPT_USERNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;




-- ----------------------------
-- Table structure for `ab_users_opt_log`
-- ----------------------------
DROP TABLE IF EXISTS `ab_users_opt_log`;
CREATE TABLE `ab_users_opt_log` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `USER_ID` int(11) NOT NULL COMMENT '用户ID',
  `TYPE_ID` int(11) NOT NULL COMMENT '操作类型  CONFIGID=6',
  `RESULT` int(1) NOT NULL DEFAULT '0' COMMENT '操作结果0失败1成功',
  `CONTENT` text COMMENT '操作内容',
  `CREATE_IP` varchar(20) NOT NULL COMMENT '创建时IP',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`) USING BTREE,
  KEY `TYPE_ID` (`TYPE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT=' ';


-- ----------------------------
-- Table structure for `ab_user_base`
-- ----------------------------
DROP TABLE IF EXISTS `ab_user_base`;
CREATE TABLE `ab_user_base` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TYPE_ID` int(11) unsigned NOT NULL COMMENT 'CONFIGID=26/账户类型',
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '创建者登录用户名',
  `PAY_PASSWORD` varchar(50) DEFAULT NULL COMMENT '密码',
  `TOTAL` decimal(11,2) DEFAULT '0.00' COMMENT '账户总额=余额+待收',
  `BALANCE` decimal(11,2) DEFAULT '0.00' COMMENT '账户余额=可用+冻结',
  `AVL_BALANCE` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '可用余额',
  `FROST` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '冻结总额',
  `AWAIT` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '待收总额',
  `TENDER_NUM` int(11) NOT NULL DEFAULT '0' COMMENT '投资总次数',
  `TENDER_ACCOUNT` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '投资总额',
  `INCOME` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总收入',
  `EXPEND` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总支出',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `CREATE_IP` varchar(20) DEFAULT NULL COMMENT '创建时IP',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_IP` varchar(20) DEFAULT NULL COMMENT '更新时IP',
  `OPT_ID` int(11) DEFAULT NULL COMMENT '操作员ID  后台界面录入时需填写',
  `AWAIT_INTEREST` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '待收利息总额',
  `AWAIT_CAPITAL` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '待收本金总额',
  `USR_CUST_ID` varchar(16) DEFAULT NULL COMMENT '由汇付生成 ，用户的唯一性标识',
  `IS_NEW` int(2) NOT NULL DEFAULT '1' COMMENT '是否新手  默认是新手:1    否，不是新手:0 ',
  `FADADA_CA_ID` varchar(100) DEFAULT NULL COMMENT '法大大客户编号-CA证书客户编号',
  `AUTHOR_END_DATE` datetime DEFAULT NULL COMMENT '授权截至日期',
  `AUTHOR_TRADE_ID` varchar(50) DEFAULT NULL COMMENT '授权交易号',
  `AUTHOR_CONTRACT_ID` varchar(50) DEFAULT NULL COMMENT '授权合同号',
  PRIMARY KEY (`ID`),
  KEY `TYPE_ID` (`TYPE_ID`) USING BTREE,
  KEY `PAY_PASSWORD` (`PAY_PASSWORD`) USING BTREE,
  KEY `USR_CUST_ID` (`USR_CUST_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='ab_user_base/用户账户信息/每用户一条记录';


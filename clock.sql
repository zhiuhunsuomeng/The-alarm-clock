/*
Navicat MySQL Data Transfer

Source Server         : clock
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : clock

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-07-09 23:20:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `configuration`
-- ----------------------------
DROP TABLE IF EXISTS `configuration`;
CREATE TABLE `configuration` (
  `version_id` int(8) NOT NULL,
  `Version` varchar(255) DEFAULT NULL COMMENT '版本介绍',
  `image_back` varchar(255) DEFAULT NULL COMMENT '背景图',
  `questionnaire` varchar(255) DEFAULT NULL COMMENT '问卷链接',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置';

-- ----------------------------
-- Records of configuration
-- ----------------------------

-- ----------------------------
-- Table structure for `opinion`
-- ----------------------------
DROP TABLE IF EXISTS `opinion`;
CREATE TABLE `opinion` (
  `opinion_id` int(8) NOT NULL,
  `opinion` varchar(255) NOT NULL,
  `user_id` int(8) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`opinion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈';

-- ----------------------------
-- Records of opinion
-- ----------------------------

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `task_id` int(8) NOT NULL AUTO_INCREMENT,
  `label` varchar(25) NOT NULL COMMENT '标签',
  `frequency` varchar(2) NOT NULL DEFAULT '0' COMMENT '频率(天：0 周：1 月：2 年：3)',
  `bell` varchar(225) NOT NULL COMMENT '铃声',
  `open` int(2) NOT NULL DEFAULT '0' COMMENT '状态（开启：0 关闭：1）',
  `note` varchar(225) NOT NULL COMMENT '备注',
  `week_id` int(2) DEFAULT NULL COMMENT '周',
  `year` datetime DEFAULT NULL COMMENT '年',
  `month` datetime DEFAULT NULL COMMENT '月',
  `day` datetime DEFAULT NULL COMMENT '天',
  `user_id` int(8) NOT NULL,
  `vibration` int(2) DEFAULT '0' COMMENT '震动（开启：0  关闭：1）',
  PRIMARY KEY (`task_id`),
  KEY `week` (`week_id`),
  CONSTRAINT `week` FOREIGN KEY (`week_id`) REFERENCES `week` (`week_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(50) NOT NULL COMMENT '微信唯一识别码',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `image` varchar(500) NOT NULL COMMENT '头像',
  `time` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1001', '张三', 'https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=false&word=%E5%A4%B4%E5%83%8F%E5%9B%BE%E7%89%87&step_word=&hs=2&pn=1&spn=0&di=23183294420&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=3710871698%2C554835617&os=384477889%2C2842323222&simid=1314737%2C734524653&adpicid=0&lpn=0&ln=3960&fr=&fmq=1530798226544_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face', '2018-07-05 21:46:03');

-- ----------------------------
-- Table structure for `week`
-- ----------------------------
DROP TABLE IF EXISTS `week`;
CREATE TABLE `week` (
  `Monday` int(2) DEFAULT '0',
  `Tuesday` int(2) DEFAULT NULL,
  `Wednesday` int(2) DEFAULT NULL,
  `Thursday` int(2) DEFAULT NULL,
  `Friday` int(2) DEFAULT NULL,
  `Saturday` int(2) DEFAULT NULL,
  `Sunday` int(2) DEFAULT NULL,
  `week_id` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`week_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of week
-- ----------------------------

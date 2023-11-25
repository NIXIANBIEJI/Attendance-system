/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : student-attendance-system

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2023-06-02 21:29:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course_application`
-- ----------------------------
DROP TABLE IF EXISTS `course_application`;
CREATE TABLE `course_application` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '课程申请id',
  `time` varchar(100) NOT NULL COMMENT '申请时间',
  `userId` varchar(100) NOT NULL COMMENT '申请人id',
  `teacherId` varchar(100) NOT NULL COMMENT '授课老师id',
  `curriculumId` varchar(100) NOT NULL COMMENT '课程id',
  `content` text COMMENT '申请内容',
  `state` varchar(100) DEFAULT '申请' COMMENT '申请状态',
  `remarks` text COMMENT '审核回复',
  PRIMARY KEY (`userId`,`teacherId`,`curriculumId`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_application
-- ----------------------------
INSERT INTO `course_application` VALUES ('51', '2023-05-18', '31', '32', '29', '我喜欢', '同意', null);

-- ----------------------------
-- Table structure for `curriculum`
-- ----------------------------
DROP TABLE IF EXISTS `curriculum`;
CREATE TABLE `curriculum` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `teacherId` varchar(100) NOT NULL DEFAULT '' COMMENT '老师Id',
  `curriculumName` varchar(100) NOT NULL COMMENT '课程名称',
  `place` varchar(100) DEFAULT NULL COMMENT '地点',
  `introduce` text COMMENT '课程介绍',
  `timeStartNum` int(100) DEFAULT NULL,
  `timeStart` varchar(100) DEFAULT NULL COMMENT '课程开始时间',
  `timeEndNum` int(100) DEFAULT NULL,
  `timeEnd` varchar(100) DEFAULT NULL COMMENT '课程开始时间',
  `timeLength` int(11) DEFAULT NULL COMMENT '课程时长',
  `userNum` int(11) DEFAULT '0' COMMENT '课程人数',
  `joinUserNum` int(11) DEFAULT '0' COMMENT '课程加入人数',
  PRIMARY KEY (`curriculumName`,`teacherId`),
  KEY `Id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of curriculum
-- ----------------------------
INSERT INTO `curriculum` VALUES ('29', '32', 'java', '教室102', '好玩的java你不喜欢吗', '20230518', '2023-05-18', '20230520', '2023-05-20', '3', '12', '1');

-- ----------------------------
-- Table structure for `leave_application`
-- ----------------------------
DROP TABLE IF EXISTS `leave_application`;
CREATE TABLE `leave_application` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `timeEnd` varchar(100) NOT NULL COMMENT '请假结束时间',
  `timeLength` varchar(100) DEFAULT NULL COMMENT '请假时长',
  `timeStart` varchar(100) NOT NULL COMMENT '请假开始时间',
  `time` varchar(100) DEFAULT NULL COMMENT '申请时间',
  `userId` varchar(100) NOT NULL COMMENT '学生id',
  `teacherId` varchar(100) NOT NULL COMMENT '老师id',
  `curriculumId` varchar(100) NOT NULL COMMENT '课程id',
  `content` text COMMENT '请假原因',
  `state` varchar(100) DEFAULT '申请' COMMENT '状态',
  `remarks` text COMMENT '审核回复',
  PRIMARY KEY (`timeEnd`,`timeStart`,`userId`,`teacherId`,`curriculumId`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_application
-- ----------------------------
INSERT INTO `leave_application` VALUES ('22', '2023-05-22', '2', '2023-05-21', '2023-05-18', '31', '32', '29', '112', '同意', null);

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `timeNum` int(100) DEFAULT NULL,
  `time` varchar(100) NOT NULL COMMENT '考勤日期',
  `userId` varchar(100) NOT NULL COMMENT '学生id',
  `teacherId` varchar(100) NOT NULL COMMENT '老师id',
  `curriculumId` varchar(100) NOT NULL COMMENT '课程id',
  `state` varchar(100) DEFAULT '待打卡' COMMENT '状态',
  `content` text COMMENT '考勤内容',
  `remarks` text,
  PRIMARY KEY (`time`,`userId`,`teacherId`,`curriculumId`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('159', '20230518', '2023-05-18', '31', '32', '29', '上课', null, null);
INSERT INTO `record` VALUES ('160', '20230519', '2023-05-19', '31', '32', '29', '缺勤', null, null);
INSERT INTO `record` VALUES ('161', '20230520', '2023-05-20', '31', '32', '29', '缺勤', null, null);
INSERT INTO `record` VALUES ('162', '20230521', '2023-05-21', '31', '32', '29', '请假', null, null);
INSERT INTO `record` VALUES ('163', '20230522', '2023-05-22', '31', '32', '29', '请假', null, null);
INSERT INTO `record` VALUES ('164', '20230523', '2023-05-23', '31', '32', '29', '上课', null, null);
INSERT INTO `record` VALUES ('165', '20230524', '2023-05-24', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('166', '20230525', '2023-05-25', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('167', '20230526', '2023-05-26', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('168', '20230527', '2023-05-27', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('169', '20230528', '2023-05-28', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('170', '20230529', '2023-05-29', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('171', '20230530', '2023-05-30', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('172', '20230531', '2023-05-31', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('173', '20230601', '2023-06-01', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('174', '20230602', '2023-06-02', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('175', '20230603', '2023-06-03', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('176', '20230604', '2023-06-04', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('177', '20230605', '2023-06-05', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('178', '20230606', '2023-06-06', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('179', '20230607', '2023-06-07', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('180', '20230608', '2023-06-08', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('181', '20230609', '2023-06-09', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('182', '20230610', '2023-06-10', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('183', '20230611', '2023-06-11', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('184', '20230612', '2023-06-12', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('185', '20230613', '2023-06-13', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('186', '20230614', '2023-06-14', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('187', '20230615', '2023-06-15', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('188', '20230616', '2023-06-16', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('189', '20230617', '2023-06-17', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('190', '20230618', '2023-06-18', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('191', '20230619', '2023-06-19', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('192', '20230620', '2023-06-20', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('193', '20230621', '2023-06-21', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('194', '20230622', '2023-06-22', '31', '32', '29', '待打卡', null, null);
INSERT INTO `record` VALUES ('195', '20230623', '2023-06-23', '31', '32', '29', '待打卡', null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(100) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userAccount` varchar(100) NOT NULL COMMENT '用户账号',
  `userName` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `userPw` varchar(30) DEFAULT NULL COMMENT '用户密码',
  `userLv` varchar(1) DEFAULT NULL COMMENT '用户身份',
  `userSex` varchar(1) DEFAULT NULL COMMENT '用户性别',
  `userIphone` varchar(11) DEFAULT NULL COMMENT '用户手机号',
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('30', 'admin', '管理员', '111', '0', '女', '22222222221');
INSERT INTO `user` VALUES ('31', '201701037', '学生', '111', '2', '男', '');
INSERT INTO `user` VALUES ('32', 'teacher1', 'teacher1', '111', '1', null, null);

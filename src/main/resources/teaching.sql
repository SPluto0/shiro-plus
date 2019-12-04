/*
 Navicat Premium Data Transfer

 Source Server         : hzy
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : teaching

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 29/11/2019 16:26:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `course_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `course_hour` int(11) NOT NULL DEFAULT 0 COMMENT '课时',
  `term_id` int(11) NOT NULL COMMENT '所属阶段',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `flag` tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除标识 -1已删除 1正常',
  PRIMARY KEY (`course_id`) USING BTREE,
  UNIQUE INDEX `course_name`(`course_name`) USING BTREE,
  INDEX `fk_course_termid`(`term_id`) USING BTREE,
  CONSTRAINT `fk_course_termid` FOREIGN KEY (`term_id`) REFERENCES `term` (`term_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (2, 'HTML', 399, 1, NULL, '2019-08-10 14:49:38', 1);
INSERT INTO `course` VALUES (3, 'C#', 2, 1, NULL, '2019-08-10 14:49:55', 1);
INSERT INTO `course` VALUES (4, 'WinForm', 44, 1, NULL, '2019-08-10 14:50:07', 1);
INSERT INTO `course` VALUES (5, 'C#OOP', 20, 2, NULL, '2019-08-10 14:50:29', 1);
INSERT INTO `course` VALUES (6, 'JavaOOP', 30, 2, NULL, '2019-08-10 14:50:40', 1);
INSERT INTO `course` VALUES (7, 'Jquery', 10, 2, NULL, '2019-08-10 14:50:52', 1);
INSERT INTO `course` VALUES (8, 'Mysql', 50, 2, NULL, '2019-08-10 14:51:17', 1);
INSERT INTO `course` VALUES (9, 'JSP/servlet', 100, 2, NULL, '2019-08-10 14:51:35', 1);
INSERT INTO `course` VALUES (10, 'Mybatis', 20, 3, NULL, '2019-08-10 14:51:48', 1);
INSERT INTO `course` VALUES (11, 'Spring', 66, 3, NULL, '2019-08-10 14:52:02', 1);
INSERT INTO `course` VALUES (12, 'SpringMVC', 30, 3, '这是mvc框架', '2019-08-10 14:52:11', 1);
INSERT INTO `course` VALUES (13, 'SSM整合', 2, 3, NULL, '2019-08-10 14:52:24', 1);
INSERT INTO `course` VALUES (14, 'SpringBoot', 30, 3, NULL, '2019-08-10 14:52:40', 1);
INSERT INTO `course` VALUES (15, 'redis', 2, 3, NULL, '2019-08-10 14:52:50', 1);
INSERT INTO `course` VALUES (16, 'thymeleaf', 2, 3, NULL, '2019-08-10 14:53:00', 1);
INSERT INTO `course` VALUES (17, 'sso', 2, 3, NULL, '2019-08-10 14:53:17', 1);
INSERT INTO `course` VALUES (18, '1', 1, 1, '1', '2019-08-10 16:46:34', 1);

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `flag` tinyint(4) NULL DEFAULT 1 COMMENT '删除标识 -1已删除 1已删除',
  PRIMARY KEY (`dept_id`) USING BTREE,
  UNIQUE INDEX `dept_name`(`dept_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '唐宇鹏战队', '2019-08-09 12:22:23', 1);
INSERT INTO `dept` VALUES (2, 'T80班', '2019-09-03 17:42:43', 1);
INSERT INTO `dept` VALUES (3, 'T81班', '2019-09-03 17:42:50', 1);
INSERT INTO `dept` VALUES (4, 'T82班', '2019-09-03 17:42:57', 1);
INSERT INTO `dept` VALUES (5, 'T83班', '2019-09-03 17:43:19', 1);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `m_from` int(11) NOT NULL COMMENT '发送者ID',
  `m_to` int(11) NOT NULL COMMENT '接受者ID',
  `m_poster_type` int(11) NOT NULL COMMENT '消息发送者类型 1管理员 2老师 3用户',
  `m_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息标题',
  `m_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `m_attachment` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息附件',
  `m_read` int(11) NOT NULL DEFAULT -1 COMMENT '阅读标记 -1否  1已阅读',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `is_del` int(11) NOT NULL DEFAULT 1 COMMENT '是否删除 1否 -1是',
  `del_time` timestamp(0) NULL DEFAULT NULL COMMENT '删除时间',
  `leavel` int(11) NOT NULL DEFAULT 1 COMMENT '优先级别 1置顶 2按照时间排序',
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `fk_message_mfrom`(`m_from`) USING BTREE,
  INDEX `fk_message_mto`(`m_to`) USING BTREE,
  CONSTRAINT `fk_message_mfrom` FOREIGN KEY (`m_from`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_message_mto` FOREIGN KEY (`m_to`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站内消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `permission_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '允许访问的URL',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父权限节点',
  PRIMARY KEY (`permission_id`) USING BTREE,
  UNIQUE INDEX `permission_name`(`permission_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'ROLE_WORK_ADD', '作业布置', '/work/add', NULL);
INSERT INTO `permission` VALUES (2, 'ROLE_WORK_LIST', '作业列表', '/work/list.html', NULL);
INSERT INTO `permission` VALUES (3, 'ROLE_WORK_LIST_DETAIL', '作业详情', '/work/list/*', NULL);
INSERT INTO `permission` VALUES (4, 'ROLE_ADMIN', '所有功能', '/work/list', NULL);

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin');
INSERT INTO `role` VALUES (3, 'student');
INSERT INTO `role` VALUES (2, 'teacher');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `rp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`rp_id`) USING BTREE,
  INDEX `fk_rp_permissionid`(`permission_id`) USING BTREE,
  INDEX `fk_rp_roleid`(`role_id`) USING BTREE,
  CONSTRAINT `fk_rp_permissionid` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rp_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (39, 1, 1);
INSERT INTO `role_permission` VALUES (40, 2, 1);
INSERT INTO `role_permission` VALUES (41, 3, 1);
INSERT INTO `role_permission` VALUES (43, 4, 1);
INSERT INTO `role_permission` VALUES (45, 1, 2);
INSERT INTO `role_permission` VALUES (46, 2, 2);
INSERT INTO `role_permission` VALUES (49, 3, 2);
INSERT INTO `role_permission` VALUES (51, 2, 3);
INSERT INTO `role_permission` VALUES (52, 3, 3);

-- ----------------------------
-- Table structure for term
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term`  (
  `term_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `term_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '阶段名',
  PRIMARY KEY (`term_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of term
-- ----------------------------
INSERT INTO `term` VALUES (1, 'S1');
INSERT INTO `term` VALUES (2, 'S2');
INSERT INTO `term` VALUES (3, 'Y2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `urgency_tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系电话',
  `wx` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息推送微信号',
  `open_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号对应用户id',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息推送QQ号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息推送邮箱号',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `born_date` int(11) NULL DEFAULT NULL COMMENT '出生日期',
  `head_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统头像',
  `signature` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `dept_id` int(11) NOT NULL COMMENT '部门编号',
  `prof` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `flag` tinyint(4) NULL DEFAULT 1 COMMENT '删除标识 -1已删除 1已删除',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `tel`(`tel`) USING BTREE,
  INDEX `fk_user_deptid`(`dept_id`) USING BTREE,
  CONSTRAINT `fk_user_deptid` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123', NULL, '15570898378', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, '2019-08-09 12:22:27', '2019-08-09 12:22:27');
INSERT INTO `user` VALUES (2, '教员', '123', NULL, '15581647696', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, '2019-10-12 15:36:58', '2019-10-12 15:36:58');
INSERT INTO `user` VALUES (3, '小明', '123', NULL, '17670394363', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, '2019-10-21 20:59:51', '2019-10-21 20:59:51');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`ur_id`) USING BTREE,
  INDEX `fk_ur_userid`(`user_id`) USING BTREE,
  INDEX `fk_ur_roleid`(`role_id`) USING BTREE,
  CONSTRAINT `fk_ur_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ur_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 2, 2);
INSERT INTO `user_role` VALUES (3, 3, 3);

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work`  (
  `work_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `work_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业标题',
  `teacher_id` int(11) NOT NULL COMMENT '下发作业的老师',
  `dept_id` int(11) NOT NULL COMMENT '布置给哪个班级',
  `course_id` int(11) NOT NULL COMMENT '布置给哪个部门',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '应完成人数',
  `actual_count` int(11) NOT NULL DEFAULT 0 COMMENT '实际完成人数',
  `decorate_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '下发时间',
  `taking_time` timestamp(0) NOT NULL COMMENT '上收时间',
  `actual_taking_time` timestamp(0) NOT NULL COMMENT '实际上收时间',
  `is_start` int(11) NULL DEFAULT 1 COMMENT '-1暂不下发 1下发作业',
  `status` int(11) NULL DEFAULT 1 COMMENT '1、暂未下发   2、作业中  3、已到指定时间只有部分同学已上交作业  4、已到指定时间所有部分同学都已上交作业  5、上交的作业已检查并反馈',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '如：部分同学没上交，需要备注名字以及原由',
  `is_sns_notice` int(11) NOT NULL DEFAULT -1 COMMENT '是否启动短信通知 -1不启动 1启动',
  `is_wx_notice` int(11) NOT NULL DEFAULT -1 COMMENT '是否启动微信通知 -1不启动 1启动',
  `is_timeing_remind` int(11) NOT NULL DEFAULT -1 COMMENT '是否启动站内计时通知 -1不启动 1启动',
  `is_accessory` int(11) NOT NULL DEFAULT -1 COMMENT '是否上传附件 -1否 1是',
  `accessory_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件路径',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 1 COMMENT '-1已删除 1正常',
  PRIMARY KEY (`work_id`) USING BTREE,
  UNIQUE INDEX `work_name`(`work_name`) USING BTREE,
  INDEX `fk_work_teacherid`(`teacher_id`) USING BTREE,
  INDEX `fk_work_deptid`(`dept_id`) USING BTREE,
  INDEX `fk_work_courseid`(`course_id`) USING BTREE,
  CONSTRAINT `fk_work_courseid` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_work_deptid` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_work_teacherid` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES (1, 'JAVA第一章作业', '暂无详情', 1, 3, 2, 30, 0, '2019-09-03 17:52:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, NULL, -1, -1, -1, -1, NULL, '2019-09-03 17:42:19', '2019-09-03 17:42:19', 1);
INSERT INTO `work` VALUES (2, 'JAVA第二章作业', '暂无详情', 1, 3, 2, 32, 0, '2019-09-04 12:03:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, NULL, -1, -1, -1, -1, NULL, '2019-09-04 12:03:16', '2019-09-04 12:03:16', 1);
INSERT INTO `work` VALUES (3, 'JAVA第三章作业', '暂无详情', 1, 3, 2, 32, 0, '2019-09-04 12:03:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, '', -1, -1, -1, -1, '', '2019-09-04 12:03:16', '2019-09-04 12:03:16', 1);
INSERT INTO `work` VALUES (4, 'JAVA第四章作业', '暂无详情', 1, 3, 2, 32, 0, '2019-09-04 12:03:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, '', -1, -1, -1, -1, '', '2019-09-04 12:03:16', '2019-09-04 12:03:16', 1);
INSERT INTO `work` VALUES (5, 'JAVA第五章作业', '暂无详情', 1, 3, 2, 32, 0, '2019-09-04 12:03:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, '', -1, -1, -1, -1, '', '2019-09-04 12:03:16', '2019-09-04 12:03:16', 1);
INSERT INTO `work` VALUES (6, 'JAVA第六章作业', '暂无详情', 1, 3, 2, 32, 0, '2019-09-04 12:03:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, '', -1, -1, -1, -1, '', '2019-09-04 12:03:16', '2019-09-04 12:03:16', 1);
INSERT INTO `work` VALUES (7, 'JAVA第七章作业', '暂无详情', 1, 3, 2, 32, 0, '2019-09-04 12:03:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, '', -1, -1, -1, -1, '', '2019-09-04 12:03:16', '2019-09-04 12:03:16', 1);

-- ----------------------------
-- Table structure for work_done_result
-- ----------------------------
DROP TABLE IF EXISTS `work_done_result`;
CREATE TABLE `work_done_result`  (
  `wds_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增列',
  `wid` int(11) NOT NULL COMMENT '作业编号',
  `uid` int(11) NOT NULL COMMENT '用户编号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '作业答案',
  `accessory` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业附件',
  `status` int(11) NOT NULL DEFAULT -1 COMMENT '完成情况 -1未完成 1已完成',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`wds_id`) USING BTREE,
  INDEX `fk_wdr_wid`(`wid`) USING BTREE,
  INDEX `fk_wdr_uid`(`uid`) USING BTREE,
  CONSTRAINT `fk_wdr_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_wdr_wid` FOREIGN KEY (`wid`) REFERENCES `work` (`work_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

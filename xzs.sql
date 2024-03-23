/*
 Navicat Premium Data Transfer

 Source Server         : 192
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:55001
 Source Schema         : xzs

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 23/03/2024 22:33:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_attendance
-- ----------------------------
DROP TABLE IF EXISTS `t_attendance`;
CREATE TABLE `t_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classroomName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endTime` timestamp NULL DEFAULT NULL,
  `aStatus` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_attendance
-- ----------------------------
BEGIN;
INSERT INTO `t_attendance` (`id`, `classroomName`, `userName`, `startTime`, `endTime`, `aStatus`) VALUES (1, 'Classroom 1', 'User 1', '2024-03-25 08:00:00', '2024-03-25 10:00:00', 0);
INSERT INTO `t_attendance` (`id`, `classroomName`, `userName`, `startTime`, `endTime`, `aStatus`) VALUES (2, 'Classroom 2', 'User 2', '2024-03-25 09:00:00', '2024-03-25 11:00:00', 1);
INSERT INTO `t_attendance` (`id`, `classroomName`, `userName`, `startTime`, `endTime`, `aStatus`) VALUES (4, 'BM101', '学生', '2000-11-10 02:10:00', '2000-11-11 02:10:00', 0);
INSERT INTO `t_attendance` (`id`, `classroomName`, `userName`, `startTime`, `endTime`, `aStatus`) VALUES (5, 'BM101', '学生', '2000-11-10 02:10:00', '2000-11-11 02:10:00', 0);
INSERT INTO `t_attendance` (`id`, `classroomName`, `userName`, `startTime`, `endTime`, `aStatus`) VALUES (6, 'BM101', '学生', '2000-11-10 02:10:00', '2000-11-11 02:10:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_classroom
-- ----------------------------
DROP TABLE IF EXISTS `t_classroom`;
CREATE TABLE `t_classroom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hasNum` int DEFAULT '0',
  `totalNum` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_classroom
-- ----------------------------
BEGIN;
INSERT INTO `t_classroom` (`id`, `name`, `hasNum`, `totalNum`) VALUES (5, 'BM101', 3, 12);
INSERT INTO `t_classroom` (`id`, `name`, `hasNum`, `totalNum`) VALUES (7, 'BM102', 0, 12);
COMMIT;

-- ----------------------------
-- Table structure for t_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper`;
CREATE TABLE `t_exam_paper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `paper_type` int DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `suggest_time` int DEFAULT NULL,
  `limit_start_time` datetime DEFAULT NULL,
  `limit_end_time` datetime DEFAULT NULL,
  `frame_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `task_exam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
BEGIN;
INSERT INTO `t_exam_paper` (`id`, `name`, `subject_id`, `paper_type`, `grade_level`, `score`, `question_count`, `suggest_time`, `limit_start_time`, `limit_end_time`, `frame_text_content_id`, `create_user`, `create_time`, `deleted`, `task_exam_id`) VALUES (1, '语文测试', 1, 1, 1, 10, 1, 1, NULL, NULL, 2, 2, '2024-03-23 16:20:15', b'0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_exam_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_answer`;
CREATE TABLE `t_exam_paper_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_paper_id` int DEFAULT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `paper_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `system_score` int DEFAULT NULL,
  `user_score` int DEFAULT NULL,
  `paper_score` int DEFAULT NULL,
  `question_correct` int DEFAULT NULL,
  `question_count` int DEFAULT NULL,
  `do_time` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `task_exam_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_exam_paper_question_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_question_customer_answer`;
CREATE TABLE `t_exam_paper_question_customer_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `exam_paper_id` int DEFAULT NULL,
  `exam_paper_answer_id` int DEFAULT NULL,
  `question_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `customer_score` int DEFAULT NULL,
  `question_score` int DEFAULT NULL,
  `question_text_content_id` int DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_content_id` int DEFAULT NULL,
  `do_right` bit(1) DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper_question_customer_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `send_user_id` int DEFAULT NULL,
  `send_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `send_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive_user_count` int DEFAULT NULL,
  `read_count` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_message_user
-- ----------------------------
DROP TABLE IF EXISTS `t_message_user`;
CREATE TABLE `t_message_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int DEFAULT NULL,
  `receive_user_id` int DEFAULT NULL,
  `receive_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `readed` bit(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_type` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `difficult` int DEFAULT NULL,
  `correct` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `info_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_question
-- ----------------------------
BEGIN;
INSERT INTO `t_question` (`id`, `question_type`, `subject_id`, `score`, `grade_level`, `difficult`, `correct`, `info_text_content_id`, `create_user`, `status`, `create_time`, `deleted`) VALUES (1, 1, 1, 10, 1, 5, 'B', 1, 2, 1, '2024-03-23 16:19:33', b'0');
COMMIT;

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
BEGIN;
INSERT INTO `t_subject` (`id`, `name`, `level`, `level_name`, `item_order`, `deleted`) VALUES (1, '语文', 1, '一年级', NULL, b'0');
INSERT INTO `t_subject` (`id`, `name`, `level`, `level_name`, `item_order`, `deleted`) VALUES (2, '数学', 1, '一年级', NULL, b'0');
INSERT INTO `t_subject` (`id`, `name`, `level`, `level_name`, `item_order`, `deleted`) VALUES (3, '台球', 1, '一年级', NULL, b'0');
COMMIT;

-- ----------------------------
-- Table structure for t_task_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam`;
CREATE TABLE `t_task_exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grade_level` int DEFAULT NULL,
  `frame_text_content_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_task_exam
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_task_exam_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam_customer_answer`;
CREATE TABLE `t_task_exam_customer_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_exam_id` int DEFAULT NULL,
  `create_user` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `text_content_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_task_exam_customer_answer
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_text_content
-- ----------------------------
DROP TABLE IF EXISTS `t_text_content`;
CREATE TABLE `t_text_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
BEGIN;
INSERT INTO `t_text_content` (`id`, `content`, `create_time`) VALUES (1, '{\"titleContent\":\"爸爸的爸爸叫什么\",\"analyze\":\"爸爸的爸爸叫爷爷\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"爸爸\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"爷爷\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"邵磊\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"妈妈\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2024-03-23 16:19:33');
INSERT INTO `t_text_content` (`id`, `content`, `create_time`) VALUES (2, '[{\"name\":\"单选题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]}]', '2024-03-23 16:20:15');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `birth_day` datetime DEFAULT NULL,
  `user_level` int DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `last_active_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`id`, `user_uuid`, `user_name`, `password`, `real_name`, `age`, `sex`, `birth_day`, `user_level`, `phone`, `role`, `status`, `image_path`, `create_time`, `modify_time`, `last_active_time`, `deleted`, `wx_open_id`) VALUES (1, 'd2d29da2-dcb3-4013-b874-727626236f47', 'student', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '学生', 18, 1, '2019-09-01 16:00:00', 1, '19171171610', 1, 1, 'https://www.mindskip.net:9008/image/ba607a75-83ba-4530-8e23-660b72dc4953/头像.jpg', '2019-09-07 18:55:02', '2020-02-04 08:26:54', NULL, b'0', NULL);
INSERT INTO `t_user` (`id`, `user_uuid`, `user_name`, `password`, `real_name`, `age`, `sex`, `birth_day`, `user_level`, `phone`, `role`, `status`, `image_path`, `create_time`, `modify_time`, `last_active_time`, `deleted`, `wx_open_id`) VALUES (2, '52045f5f-a13f-4ccc-93dd-f7ee8270ad4c', 'admin', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '管理员', 30, 1, '2019-09-07 18:56:07', NULL, NULL, 3, 1, NULL, '2019-09-07 18:56:21', NULL, NULL, b'0', NULL);
INSERT INTO `t_user` (`id`, `user_uuid`, `user_name`, `password`, `real_name`, `age`, `sex`, `birth_day`, `user_level`, `phone`, `role`, `status`, `image_path`, `create_time`, `modify_time`, `last_active_time`, `deleted`, `wx_open_id`) VALUES (4, '298f12d5-2a63-4c68-97ca-d9dac74b7072', 'teacher', 'KFclGTMzoIthymmxVU2xKNNda/IH9YcNvzfmpIt0r9RSAzUwAkpZY4s+ETI4ZKzRdMTJBcakIYmzatVH3BuBm2GoTPUIyfIiNgFf//iHdd3AwVLe2rPCo11TQVrWvBDsT5M+4grGFzXoZpHDL25L6ITnH4hFYhmuB51fFqq/ub8=', '老师', NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, '2024-03-23 10:32:17', '2024-03-23 10:32:40', '2024-03-23 10:32:17', b'0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_user_event_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_event_log`;
CREATE TABLE `t_user_event_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_event_log
-- ----------------------------
BEGIN;
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (1, 3, 'hahaha', NULL, '欢迎 hahaha 注册来到学之思开源考试系统', '2024-03-22 17:08:39');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (2, 3, 'hahaha', NULL, 'hahaha 登录了学之思开源考试系统', '2024-03-22 17:09:00');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (3, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:12:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (4, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:13:02');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (5, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:13:22');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (6, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:17:17');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (7, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:17:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (8, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:20:29');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (9, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:20:41');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (10, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:25:25');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (11, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:25:49');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (12, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-22 17:26:35');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (13, 1, 'student', '学生', 'student 登出了学之思开源考试系统', '2024-03-22 17:34:20');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (14, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-22 17:35:43');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (15, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 10:22:54');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (16, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 12:03:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (17, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 13:12:47');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (18, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 13:47:56');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (19, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:08:07');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (20, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:18:48');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (21, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:26:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (22, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:33:59');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (23, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:53:25');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (24, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 15:57:35');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (25, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2024-03-23 16:04:52');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (26, 2, 'admin', '管理员', 'admin 登出了学之思开源考试系统', '2024-03-23 16:44:54');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (27, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 16:45:04');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (28, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:51:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (29, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:51:55');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (30, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:57:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (31, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:59:10');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (32, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 16:59:32');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (33, 4, 'teacher', '老师', 'teacher 登录了学之思开源考试系统', '2024-03-23 17:01:09');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (34, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 17:01:59');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (35, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 17:37:30');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (36, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:19:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (37, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:21:56');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (38, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:22:44');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (39, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:35:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (40, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:38:42');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (41, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 18:40:35');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (42, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 19:13:16');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (43, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 19:17:11');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (44, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 20:12:06');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (45, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 21:38:54');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (46, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 21:40:15');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (47, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 22:10:28');
INSERT INTO `t_user_event_log` (`id`, `user_id`, `user_name`, `real_name`, `content`, `create_time`) VALUES (48, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2024-03-23 22:12:50');
COMMIT;

-- ----------------------------
-- Table structure for t_user_token
-- ----------------------------
DROP TABLE IF EXISTS `t_user_token`;
CREATE TABLE `t_user_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_token
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

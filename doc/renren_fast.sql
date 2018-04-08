/*
Navicat MySQL Data Transfer

Source Server         : local3307
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : renren_fast

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-08 16:40:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'sds', 'sd', '11', '11');
INSERT INTO `goods` VALUES ('2', '2', '2', '2', '2');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B67B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A2272656E72656E222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A302C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A47B226A6F624964223A322C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320332C203230313620323A35353A353620504D227D7800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-2C8EB591523176305686', '1523176836075', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1523178000000', '-1', '5', 'WAITING', 'CRON', '1523172390000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B67B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A2272656E72656E222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A302C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1523172600000', '-1', '5', 'PAUSED', 'CRON', '1523172390000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A47B226A6F624964223A322C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320332C203230313620323A35353A353620504D227D7800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1070', '2018-04-08 15:28:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2018-04-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2018-04-08 16:30:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '立即执行任务', 'io.renren.modules.job.controller.ScheduleJobController.run()', '[1]', '102', '127.0.0.1', '2018-04-08 15:27:59');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"功能\",\"type\":0,\"orderNum\":0}', '32', '127.0.0.1', '2018-04-08 16:01:13');
INSERT INTO `sys_log` VALUES ('3', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"功能\",\"url\":\"modules/generator/userprofile.html\",\"perms\":\"\",\"type\":1,\"orderNum\":0}', '30', '127.0.0.1', '2018-04-08 16:04:44');
INSERT INTO `sys_log` VALUES ('4', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"功能\",\"url\":\"modules/generator/userprofile.html\",\"perms\":\"\",\"type\":1,\"orderNum\":0}', '38', '127.0.0.1', '2018-04-08 16:05:47');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":31,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"功能\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"orderNum\":0}', '25', '127.0.0.1', '2018-04-08 16:06:05');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"parentId\":31,\"parentName\":\"功能\",\"name\":\"测试\",\"url\":\"modules/generator/userprofile.html\",\"type\":1,\"orderNum\":0}', '60', '127.0.0.1', '2018-04-08 16:06:22');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":32,\"parentId\":31,\"parentName\":\"功能\",\"name\":\"测试\",\"url\":\"modules/generator/goods.html\",\"type\":1,\"orderNum\":0}', '35', '127.0.0.1', '2018-04-08 16:15:47');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '0', '功能', '', '', '0', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '测试', 'modules/generator/goods.html', null, '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('34', '33', '查看', null, 'generator:goods:list,generator:goods:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('35', '33', '新增', null, 'generator:goods:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('36', '33', '修改', null, 'generator:goods:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('37', '33', '删除', null, 'generator:goods:delete', '2', null, '6');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'e49c50ca43dcdfeae66a6955568edeec', '2018-04-09 03:27:36', '2018-04-08 15:27:36');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Table structure for userprofile
-- ----------------------------
DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE `userprofile` (
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(10) NOT NULL,
  `exp` int(11) NOT NULL,
  `gold` bigint(20) NOT NULL DEFAULT '0',
  `paidGold` bigint(20) DEFAULT '0',
  `payTotal` bigint(20) NOT NULL DEFAULT '0',
  `parseRegisterId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gcmRegisterId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `openedPos` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picVer` int(11) DEFAULT '0',
  `country` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `allianceId` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chNameCount` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `worldPoint` int(11) DEFAULT NULL,
  `deviceId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gaid` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `platform` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pf` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'market_global',
  `lang` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `appVersion` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gmFlag` int(11) DEFAULT '0',
  `regTime` bigint(20) NOT NULL DEFAULT '0',
  `offLineTime` bigint(20) DEFAULT '0',
  `banTime` bigint(20) DEFAULT '0',
  `chatBanTime` bigint(20) DEFAULT '0',
  `banGMName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noticeBanTime` bigint(20) DEFAULT '0',
  `lastOnlineTime` bigint(20) DEFAULT '0',
  `gmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serverId` int(11) DEFAULT NULL,
  `crossFightSrcServerId` int(11) NOT NULL DEFAULT '-1',
  `lastModGoldGetTime` bigint(20) DEFAULT '0',
  `modGoldGetTimeInterval` bigint(20) DEFAULT '0',
  `modGoldAmount` bigint(10) DEFAULT '0',
  `beTrainingModTime` bigint(20) DEFAULT '0',
  `guideStep` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `payRiskFactor` int(11) DEFAULT '0',
  `phoneDevice` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crystal` bigint(20) NOT NULL DEFAULT '0',
  `flag` int(11) NOT NULL DEFAULT '-1',
  `taskId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstDragonEggFetchTime` int(11) NOT NULL DEFAULT '0',
  `uploadPicCnt` int(11) NOT NULL DEFAULT '0',
  `regVersion` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alsignrewardlog` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allianceOffical` int(11) NOT NULL DEFAULT '0',
  `contributeRewardLog` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alivedays` int(11) NOT NULL DEFAULT '0',
  `totalScore` int(11) NOT NULL DEFAULT '0',
  `alsignts` bigint(20) DEFAULT NULL,
  `krakenAwardId` int(11) NOT NULL DEFAULT '0',
  `krakenNextTime` bigint(20) NOT NULL DEFAULT '0',
  `adUserFlag` int(4) NOT NULL DEFAULT '0',
  `dragonData` text COLLATE utf8_unicode_ci,
  `krakenQuality` int(11) NOT NULL DEFAULT '-1',
  `secretaryFlag` int(11) NOT NULL DEFAULT '0',
  `energySendData` text COLLATE utf8_unicode_ci,
  `mysteriousData` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`uid`),
  KEY `name_index` (`name`) USING BTREE,
  KEY `time_level_index` (`regTime`,`level`,`lastOnlineTime`,`pf`) USING BTREE,
  KEY `allianceid_lasttime_index` (`allianceId`,`lastOnlineTime`),
  KEY `lang_index` (`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of userprofile
-- ----------------------------
INSERT INTO `userprofile` VALUES ('10052382000001', 'Kingdom829641', '1', '0', '90', '0', '0', 'ba5b1d29-9b79-4b78-b760-619a4a315cd0', '', '9985', 'g026', '0', '8000', '', '0', null, '868809023073526-dc6dcd6d4d0a', 'ed44887067388f3e', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512916425240', '1512916470301', '0', '0', null, '0', '1512916470301', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512918225,\"sellIds\":\"700022,700010,700022,700004\"}');
INSERT INTO `userprofile` VALUES ('1011557564000001', 'Kingdom859651', '4', '2746', '340', '0', '0', '6f1b3367-3ab0-42c5-9c6b-e16f1bef7bdc', '', '9981,9984,9985,9990', 'g026', '0', '8000', '', '0', null, '863455036671156-020000000000', '7b2d4bf856f4a3e1', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512916921560', '1512917872784', '0', '0', null, '0', '1512917872784', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1512917137,\"level\":2,\"last_recover_energy_time\":1512917137,\"limit_energy\":100,\"uuid\":\"4c94188fe45845719d9def42eae24323\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512917137,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"200\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512918722,\"sellIds\":\"710002,710001,710001,710001\"}');
INSERT INTO `userprofile` VALUES ('102399306000001', 'Kingdom525661', '1', '0', '90', '0', '0', '95fcd12f-a74d-480d-9cd5-e7b13fb895f6', '', '9985', 'g026', '0', '8000', '', '0', null, '864225033734946-020000000000', '15c323914fb0450d', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512917120401', '1512917144169', '0', '0', null, '0', '1512917144169', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512993368,\"sellIds\":\"710003,710002,710001,710002\"}');
INSERT INTO `userprofile` VALUES ('1035438858000001', 'Kingdom746671', '1', '5', '90', '0', '0', 'd3926c67-13f0-4fb1-8add-7f5999a2d306', '', '9985', 'g026', '0', '8000', '', '0', null, '2a6ea3132d134c03a0a55e804fda8de6', '9f976f6c6daab82', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512924265440', '1512924362648', '0', '0', null, '0', '1512924362648', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512926066,\"sellIds\":\"700020,700028,700035,700018\"}');
INSERT INTO `userprofile` VALUES ('1045437964000001', 'Kingdom670681', '1', '0', '90', '0', '0', '955f4375-e03a-441d-8e66-201eab5139fd', '', '9985', 'g026', '0', '8000', '', '0', null, '868826021750202-28faa067f97a', '11aa38f53c1aee62', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512926325439', '1512989199132', '0', '0', null, '0', '1512989199132', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512990957,\"sellIds\":\"710001,710001,710001,710003\"}');
INSERT INTO `userprofile` VALUES ('1058003580000001', 'Kingdom832691', '1', '0', '90', '0', '0', '0af0c4bd-4036-468d-a948-5dc072a644ae', '', '9985', 'g026', '0', '8000', '', '0', null, 'A00000552D9F47-f4e3fb55840b', '8efbed17ef28f607', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512929788005', '1512929815085', '0', '0', null, '0', '1512929815085', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512931588,\"sellIds\":\"700002,700002,700003,700029\"}');
INSERT INTO `userprofile` VALUES ('106142768000001', 'Kingdom726a1', '4', '2756', '148', '0', '0', 'a1d28e6a-aae2-4ed6-837f-7287c86b6f64', '', '9983,9986,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '12e6e71063814a00926aaa6784ff6efe', '61de85188f888566', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512990590144', '1512992964710', '0', '0', null, '0', '1512992964710', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '21', '2206801', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512992160716', '0', null, '1', '0', '1512992092559', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512995426,\"sellIds\":\"700010,700031,700020,700007\"}');
INSERT INTO `userprofile` VALUES ('1078691813000001', 'Kingdom6696b1', '4', '337', '160', '0', '0', '42df6f8b-9414-4f61-bd75-0b241aa92d07', '', '9983,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '862841035492762-020000000000', '201a9834e9704b43', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512990788693', '1512991705554', '0', '0', null, '0', '1512991705554', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512991169704', '0', null, '1', '0', '1512991149133', '0', '0', '0', '[{\"limit_forces\":2500,\"create_time\":1512991525,\"level\":3,\"last_recover_energy_time\":1512991525,\"limit_energy\":100,\"uuid\":\"b66e3339cdea4b8ab4bf524df432dfec\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512991525,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2500,\"exp\":\"500\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513062567,\"sellIds\":\"700024,700016,700007,700016\"}');
INSERT INTO `userprofile` VALUES ('108132938000001', 'Kingdom633a1', '2', '196', '90', '0', '0', 'eec94143-6938-40b5-b489-78a5788df7ad', '', '9985,9990', 'g026', '0', '8000', '', '0', null, '867068021112494-f48b321adb7b', 'e500cda0d3c9bb9f', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512743218134', '1512744112835', '0', '0', null, '0', '1512744112835', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2404208', '1512748800', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512745021,\"sellIds\":\"700024,700021,700003,700001\"}');
INSERT INTO `userprofile` VALUES ('108329443000001', 'Kingdom3136c1', '1', '0', '90', '0', '0', '78b5ca75-082a-4bfa-b43b-06847935fad8', '', '9985', 'g026', '0', '8000', '', '0', null, '867640022409986-f48e9215652e', 'e1fcb84488333ddb', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512994760331', '1512994833363', '0', '0', null, '0', '1512994833363', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512996560,\"sellIds\":\"700003,700017,700012,700029\"}');
INSERT INTO `userprofile` VALUES ('1094366118000001', 'Kingdom6306d1', '2', '230', '100', '0', '0', '64018e4e-4e02-446d-b6f2-da9a38ea1552', '', '9985,9990', 'g026', '0', '8000', '', '0', null, 'b7be898c3bb24d178cd9c51b839051cc', '527ffd8619a7e877', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512994874368', '1512995175140', '0', '0', null, '0', '1512995175140', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200602', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1512995109,\"level\":2,\"last_recover_energy_time\":1512995109,\"limit_energy\":100,\"uuid\":\"a4d18e85b6054cd6970fa5d16a2080b2\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512995109,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"100\",\"marchid\":\"\",\"energy\":100}]', '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512996674,\"sellIds\":\"710002,710002,710002,710002\"}');
INSERT INTO `userprofile` VALUES ('1107197480000001', 'wt4162503', '3', '584', '150', '0', '0', 'fe508d9b-7557-47b2-be82-7b117b01d6b6', '', '9982,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, 'f9db796f2ab142e4af652ddd6f709c57', '1987c76490412ac6', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513009747200', '1513031469935', '0', '0', null, '0', '1513031469935', 'wt4162503@gmail.com', '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2102502', '1513053760', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1513009989648', '0', null, '1', '35', '1513009968448', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513095477,\"sellIds\":\"700031,700028,700029,700021\"}');
INSERT INTO `userprofile` VALUES ('1111371551000001', 'Kingdom3656f1', '4', '289', '160', '0', '0', '71794e1c-c07e-4eee-8d12-fcef2f1bce3d', '', '9983,9985,9990', 'g026', '0', '8000', '', '0', null, 'd99ef59c1fc54ba48b1aff72bd3e1aab', 'dd25756400939b39', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513012241373', '1513012846368', '0', '0', null, '0', '1513012846368', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1513081056', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513014042,\"sellIds\":\"700007,700009,700028,700024\"}');
INSERT INTO `userprofile` VALUES ('112875413000001', 'Kingdom682701', '1', '235', '90', '0', '0', '0e9dccae-170f-479a-874f-388b9baf41f9', '', '9985', 'g026', '0', '8000', '', '0', null, '866790039529515-020000000000', '5df3a08a-00ff-40e3-8030-344dd774f736', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513051650878', '1513051850254', '0', '0', null, '0', '1513051850254', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201001', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513053451,\"sellIds\":\"700031,700019,700011,700007\"}');
INSERT INTO `userprofile` VALUES ('1131218384000001', 'Kingdom500711', '2', '230', '100', '0', '0', '373defbc-2cd9-4d9e-98b4-7c53294844e5', '', '9985,9990', 'g026', '0', '8000', '', '0', null, '860735039294905-4813f300d151', '48c26c3e3428b9d6', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513075871229', '1513076128018', '0', '0', null, '0', '1513076128018', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200602', '1513081216', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513077671,\"sellIds\":\"700005,700031,700009,700029\"}');
INSERT INTO `userprofile` VALUES ('1149557427000001', 'Kingdom773721', '1', '5', '90', '0', '0', 'd91e9460-8fb9-4ffd-bb88-608e0ec409b1', '', '9985', 'g026', '0', '8000', '', '0', null, '998e552fa3264803b2ab6d1937e569f4', '35a23d7ae4b8a422', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513084809559', '1513084846066', '0', '0', null, '0', '1513084846066', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513086610,\"sellIds\":\"710001,710002,710001,710001\"}');
INSERT INTO `userprofile` VALUES ('1158990727000001', 'Kingdom112731', '3', '900', '360', '0', '0', '8dfe2f50-239c-4bcb-b01e-1c7d1c22c389', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '864074032082018-020000000000', 'e2f3e47b9ea21aa8', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513093128992', '1513093885952', '0', '0', null, '0', '1513093885952', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200802', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1513093667382', '0', null, '1', '0', '1513093646708', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1513093411,\"level\":2,\"last_recover_energy_time\":1513093411,\"limit_energy\":100,\"uuid\":\"fa62410222c542d6943a361665852f1d\",\"itemid\":\"211001\",\"last_recover_forces_time\":1513093411,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"200\",\"marchid\":\"\",\"energy\":100}]', '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513666725,\"sellIds\":\"710002,710002,710001,710003\"}');
INSERT INTO `userprofile` VALUES ('1163670396000001', 'Kingdom355741', '5', '8675', '280', '0', '0', '0a5c8b6a-8b17-4d48-99a7-54a7be12ad8a', '', '9983,9984,9985,9996,9990', 'g026', '0', '8000', '', '0', null, '99000712046696-020000000000', '3bf9b655072d962c', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513100633672', '1513102046017', '0', '0', null, '0', '1513102046017', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200106', '1513171872', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513111167,\"sellIds\":\"700016,700016,700003,700026\"}');
INSERT INTO `userprofile` VALUES ('117395178000001', 'Kingdom481751', '3', '957', '160', '0', '0', '2db51d53-f94d-4a5e-bdb7-8c758f16ccac', '', '9981,9985,9990', 'g026', '0', '8000', '', '0', null, 'a0000055c87999-241fa0059e9c', '972f41d295b75d56', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513165763954', '1513166196383', '0', '0', null, '0', '1513166196383', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2100202', '1513167456', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513167564,\"sellIds\":\"700002,700009,700009,700024\"}');
INSERT INTO `userprofile` VALUES ('118378454000001', 'Kingdom46761', '4', '608', '180', '0', '0', '1c9e20c2-0477-44ec-8af8-aa1f4cb4432a', '', '9981,9986,9998,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '03efa169707649609b993670d59da500', '4ad9396d2a2fc014', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513177863786', '1513178750266', '0', '0', null, '0', '1513178750266', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1513178584449', '0', null, '1', '0', '1513178562276', '0', '0', '0', '[{\"limit_forces\":2500,\"create_time\":1513178135,\"level\":3,\"last_recover_energy_time\":1513178135,\"limit_energy\":100,\"uuid\":\"ff2687e86f294c28a998120547345256\",\"itemid\":\"211001\",\"last_recover_forces_time\":1513178135,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2500,\"exp\":\"500\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513179664,\"sellIds\":\"710001,710001,710002,710001\"}');
INSERT INTO `userprofile` VALUES ('11867068000001', 'Kingdom60b1', '1', '0', '90', '0', '0', '71b74587-f40c-425f-a857-75a97a5113b9', '', '9985', 'g026', '0', '8000', '', '0', null, '869800028167222-dc6dcd69e677', 'fae80288a6a3dc50', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512743728672', '1512743966126', '0', '0', null, '0', '1512743966126', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512745529,\"sellIds\":\"700030,700016,700008,700035\"}');
INSERT INTO `userprofile` VALUES ('1192774809000001', '沐槿', '4', '1078', '161', '0', '0', '2f6eee68-1520-406b-bb71-f380bd1257ad', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, '861257034819742-045604437ba0', 'a9b6b8a530166472', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513180992777', '1513182665254', '0', '0', null, '0', '1513182665254', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '21', '2206801', '1513246656', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1513181298244', '0', null, '1', '0', '1513181277105', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":2,\"endTime\":1513183693,\"sellIds\":\"710001,710001,710003,710001\"}');
INSERT INTO `userprofile` VALUES ('1201141932000001', 'Kingdom994781', '4', '3594', '170', '0', '0', '20c0c804-16f4-4ed8-bfa8-d62d7fea7ea4', '', '9982,9981,9998,9985,9996,9990', 'g026', '0', '8000', '', '0', null, '864412034569774-020000000000', '367651b4f5e5e92f', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513221921143', '1513231467790', '0', '0', null, '0', '1513231467790', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200502', '1513253280', '0', '0.1.86', '', '0', null, '1', '38', '0', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513233401,\"sellIds\":\"700030,700027,700008,700014\"}');
INSERT INTO `userprofile` VALUES ('12101927000001', 'Kingdom94611', '8', '4753', '293', '0', '0', 'ed010677-183b-4ec0-a28c-cb0cfd9f551f', '', '9981,9983,9982,9985,9996,9986,9990', 'g026', '0', '8000', '3fa195a4b79a49608a0ef06bb6080268', '0', null, '358811059293082-080027a120fc', '5051044308908385', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1478261772105', '1478591587654', '0', '0', null, '0', '1478591587654', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2300206', '0', '0', '0.1.86', '1_3fa195a4b79a49608a0ef06bb6080268_1478585410158', '0', null, '3', '112', '1478585391084', '0', '0', '0', '[{\"last_recover_forces_time\":1478584492,\"exp\":\"666\",\"marchid\":\"\",\"last_dead_time\":0,\"level\":3,\"defence_num\":0,\"last_recover_energy_time\":1478591353,\"create_time\":1478584492,\"uuid\":\"7b74b3ad1ed84c5ba688878545e6921e\",\"itemid\":\"211001\",\"forces\":2500,\"energy\":16,\"limit_energy\":100,\"limit_forces\":2500}]', '-1', '1', null, '{\"buyId\":\"\",\"buyTime\":0,\"traderType\":1,\"state\":2,\"sellIds\":\"700008,700032,700014,700028\",\"endTime\":1478592179}');
INSERT INTO `userprofile` VALUES ('1211885703000001', 'Kingdom258791', '1', '105', '90', '0', '0', '2147d92d-2c06-46e0-8505-3111ea5da63d', '', '9985', 'g026', '0', '8000', '', '0', null, '008796748777779-080027160933', '6e0b348402a6596e', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513226721887', '1513226772609', '0', '0', null, '0', '1513226772609', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513228522,\"sellIds\":\"700011,700007,700025,700017\"}');
INSERT INTO `userprofile` VALUES ('122499264000001', 'Kingdom1087a1', '3', '1737', '108', '0', '0', '59c5e15f-ceb6-49e8-967b-82309836dc13', '', '9981,9985,9990', 'g026', '0', '8000', '', '0', null, '12439d8182f44ae78a497e82699f8f85', '14ad5202b79cf4e9', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513603110508', '1513607211903', '0', '0', null, '0', '1513607211903', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200103', '1513611104', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":2,\"endTime\":1513608511,\"sellIds\":\"700028,700026,700025,700012\"}');
INSERT INTO `userprofile` VALUES ('1233020742000001', 'Kingdom4017b1', '5', '9603', '420', '0', '0', '66eebcde-ba69-4c60-8165-51c998d19e45', '', '9983,9981,9986,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '864693010216205-D8CB8A5901C4', '0d7001a4-f00b-4c28-917c-29ad600e22ea', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513664173022', '1513669644850', '0', '0', null, '0', '1513669644850', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2300106', '1513690208', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1513664415093', '0', null, '1', '0', '1513664390115', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":2,\"endTime\":1513670571,\"sellIds\":\"700024,700017,700017,700024\"}');
INSERT INTO `userprofile` VALUES ('1244026223000001', 'Kingdom6067c1', '1', '0', '90', '0', '0', '516ed408-5775-4d49-b7ab-ec6ddd01af67', '', '9985', 'g026', '0', '8000', '', '0', null, '866374010282715-1C1B0DC9736C', '70c0ee59-0a83-4395-92a4-665732a9008e', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1513680474029', '1513680499109', '0', '0', null, '0', '1513680499109', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513682274,\"sellIds\":\"700030,700013,700011,700026\"}');
INSERT INTO `userprofile` VALUES ('1255086858000001', 'Kingdom5327d1', '4', '1515', '80', '0', '0', '0f58f400-7f7c-4c74-aa38-8550fa5c6753', '', '9981,9985,9996,9990', 'g026', '0', '8000', '', '0', null, '7071a93c2c9c4d04a6e5e1938f8723aa', 'eb3d8ad1ea49f7e5', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1515059625089', '1515060488398', '0', '0', null, '0', '1515060488398', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1515065376', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1515061425,\"sellIds\":\"700004,700026,700010,700021\"}');
INSERT INTO `userprofile` VALUES ('1263300430000001', 'Kingdom2827e1', '1', '245', '90', '0', '0', 'e9b4d967-f07a-46c2-893f-ab86a5a5c677', '', '9985', 'g026', '0', '8000', '', '0', null, '82767c2e290049778958ea30050af497', 'ccd1f480b67db94e', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1522656433312', '1522657375467', '0', '0', null, '0', '1522657375467', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', null, '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1522658235,\"sellIds\":\"710001,710002,710001,710001\"}');
INSERT INTO `userprofile` VALUES ('1271321962000001', 'Kingdom207f1', '1', '0', '79990', '0', '0', '187362a7-2183-4235-90ed-26c082602537', '', '9985', 'g026', '0', '8000', '', '0', null, 'a8e664372c5b4fefb8d71ee91a3afa5b', '309d27bdf64a015a', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1523162681646', '1523162877644', '0', '0', null, '0', '1523162877644', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1523164483,\"sellIds\":\"700013,700018,700017,700027\"}');
INSERT INTO `userprofile` VALUES ('12855498000001', 'Kingdom234c1', '1', '175', '90', '0', '0', '4755f2dc-911c-4fdc-aebd-1a9a6fa471bf', '', '9985', 'g026', '0', '8000', '', '0', null, '866345182252629-0800278ac788', '3055046666213828', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512743770858', '1512745228663', '0', '0', null, '0', '1512745228663', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201001', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512745571,\"sellIds\":\"700011,700010,700028,700005\"}');
INSERT INTO `userprofile` VALUES ('132023170000001', 'Kingdom809d1', '1', '105', '90', '0', '0', 'cb4cc1bf-64b9-410b-b714-f289f05b89c1', '', '9985', 'g026', '0', '8000', '', '0', null, 'a5ee27c4bdd6408980983fba5a9fb1dd', 'b9c3a69f5f9a8430', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512745322025', '1512745412705', '0', '0', null, '0', '1512745412705', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747123,\"sellIds\":\"700011,700004,700007,700013\"}');
INSERT INTO `userprofile` VALUES ('14359050000001', 'Kingdom297e1', '1', '105', '90', '0', '0', '69b4d71d-cfc7-43b8-9103-2c47d1e61955', '', '9985', 'g026', '0', '8000', '', '0', null, '783744025251260-B1A6772898E7', 'b5edf326beaa5d60', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512745323592', '1512745396256', '0', '0', null, '0', '1512745396256', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747124,\"sellIds\":\"700021,700011,700022,700030\"}');
INSERT INTO `userprofile` VALUES ('155864962000001', 'Kingdom256f1', '1', '105', '90', '0', '0', '8919c6c0-f0da-4752-96e5-8c42095b7a97', '', '9985', 'g026', '0', '8000', '', '0', null, '6d7a7eac2b7047d58978d5b29b06d7c4', 'e8c722331d16d08e', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512745335866', '1512745416931', '0', '0', null, '0', '1512745416931', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747136,\"sellIds\":\"700035,700024,700015,700011\"}');
INSERT INTO `userprofile` VALUES ('168383722000001', 'Kingdom326101', '1', '105', '90', '0', '0', '9c62c442-1416-4515-ae25-447ca0f2fb23', '', '9985', 'g026', '0', '8000', '', '0', null, '862535036732024-020000000000', 'ffc3fe22e07aad28', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512745348385', '1512745462982', '0', '0', null, '0', '1512745462982', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747149,\"sellIds\":\"700020,700005,700009,700021\"}');
INSERT INTO `userprofile` VALUES ('174444000001', 'Kingdom462111', '1', '0', '90', '0', '0', '33f31105-383c-427c-bdc2-20f18ee42325', '', '9985', 'g026', '0', '8000', '', '0', null, '861206036159862-020000000000', '8ae221b6dcc49437', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512745620046', '1512745637385', '0', '0', null, '0', '1512745637385', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747420,\"sellIds\":\"700022,700015,700017,700030\"}');
INSERT INTO `userprofile` VALUES ('186317766000001', 'Kingdom845121', '1', '0', '90', '0', '0', 'd581b952-34d8-4bab-a29a-de6eec462366', '', '9985', 'g026', '0', '8000', '', '0', null, '8ecf4870d0474867b321a0231de7828b', '389fe002-8f1e-4b00-aba3-7a1384883a94', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512745686320', '1512745712345', '0', '0', null, '0', '1512745712345', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747487,\"sellIds\":\"700028,700033,700030,700029\"}');
INSERT INTO `userprofile` VALUES ('19852842000001', 'Kingdom425131', '1', '0', '100', '0', '0', '2ff36593-636e-4301-b725-d5cd1c3d1b9d', '', null, 'g026', '0', '8000', '', '0', null, '862668036892637-020000000000', null, '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512745710855', '1512745736482', '0', '0', null, '0', '1512745736482', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747512,\"sellIds\":\"710001,710001,710003,710002\"}');
INSERT INTO `userprofile` VALUES ('204078608000001', 'Kingdom845141', '1', '0', '90', '0', '0', '2ff36593-636e-4301-b725-d5cd1c3d1b9d', '', '9985', 'g026', '0', '8000', '', '0', null, '862668036892637-020000000000', '88d3092e8e3b81fe', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512745714080', '1512745741879', '0', '0', null, '0', '1512745741879', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747514,\"sellIds\":\"710001,710002,710001,710003\"}');
INSERT INTO `userprofile` VALUES ('212146833000001', 'Kingdom798151', '1', '105', '90', '0', '0', 'a0befdc2-1d9e-4b2e-9e03-3421c599dd33', '', '9985', 'g026', '0', '8000', '', '0', null, '866048010942227-94DE8032C5B0', '324928b5-98b8-497d-aef7-bf2ceb7ebdcb', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512745732148', '1512745817203', '0', '0', null, '0', '1512745817203', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747532,\"sellIds\":\"700007,700019,700014,700011\"}');
INSERT INTO `userprofile` VALUES ('224914318000001', 'Kingdom331161', '4', '680', '280', '0', '0', '8ac4641c-d798-483b-a111-4dcdd4cca856', '', '9981,9986,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '66c9467b7b8443f1a7709e730ffb233f', '9dba4ca0-3659-449e-a790-2aed73b8bb5f', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512745994916', '1512790072982', '0', '0', null, '0', '1512790072982', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512789639088', '0', null, '2', '0', '1512789614118', '1000036', '1512791699644', '0', '[{\"limit_forces\":2000,\"create_time\":1512746433,\"level\":2,\"last_recover_energy_time\":1512746433,\"limit_energy\":100,\"uuid\":\"9fa77e848f5d4743b780ac1c066dabfa\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512746433,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"200\",\"marchid\":\"\",\"energy\":100}]', '2', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512791414,\"sellIds\":\"700004,700020,700003,700030\"}');
INSERT INTO `userprofile` VALUES ('233064856000001', 'Kingdom644171', '1', '0', '90', '0', '0', '0a51fa68-b257-4389-a851-bd36033e9b24', '', '9985', 'g026', '0', '8000', '', '0', null, '908191238803822-DA11820DF8AB', '6a487b4b-7d25-4b65-9aa6-f37554e81a5c', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512746123066', '1512746308877', '0', '0', null, '0', '1512746308877', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512747924,\"sellIds\":\"700033,700001,700035,700024\"}');
INSERT INTO `userprofile` VALUES ('24278538000001', 'Kingdom87181', '1', '0', '100', '0', '0', 'a52f39d1-fe53-42bf-ac51-80d64cc23f35', '', null, 'g026', '0', '8000', '', '0', null, '5af23930d5b449f19bc12fd5936047f1', null, '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512746410280', '0', '0', '0', null, '0', '1512746410280', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512748262,\"sellIds\":\"700023,700014,700002,700027\"}');
INSERT INTO `userprofile` VALUES ('253399751000001', 'Kingdom117191', '2', '598', '310', '0', '0', 'a52f39d1-fe53-42bf-ac51-80d64cc23f35', '', '9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '5af23930d5b449f19bc12fd5936047f1', 'f99ad2c80fe1faab', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512746443402', '1512746884469', '0', '0', null, '0', '1512746884469', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201002', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512746845843', '0', null, '1', '0', '1512746823811', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1512746726,\"level\":2,\"last_recover_energy_time\":1512746726,\"limit_energy\":100,\"uuid\":\"67bbd0ecbb7741b9b74b69504c3be692\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512746726,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"200\",\"marchid\":\"\",\"energy\":100}]', '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512748262,\"sellIds\":\"700007,700030,700009,700023\"}');
INSERT INTO `userprofile` VALUES ('264488471000001', 'Kingdom5761a1', '3', '102', '73', '0', '0', 'c23b0acb-2445-4609-9a1b-ea8e80319260', '', '9985,9990', 'g026', '0', '8000', '', '0', null, 'fc89facd16a34672ad2aed2db2dabb21', 'b1a2b66c2c342f12', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512747184491', '1512747486773', '0', '0', null, '0', '1512747486773', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200302', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1512747360,\"level\":2,\"last_recover_energy_time\":1512747360,\"limit_energy\":100,\"uuid\":\"ba72680b9454454196fcf66fc2c758d7\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512747360,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"200\",\"marchid\":\"\",\"energy\":100}]', '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512748985,\"sellIds\":\"700027,700032,700020,700011\"}');
INSERT INTO `userprofile` VALUES ('272186123000001', 'Kingdom4541b1', '3', '1274', '160', '0', '0', 'b16a69e9-8703-4988-89e4-72986a02dac6', '', '9981,9985,9990', 'g026', '0', '8000', '', '0', null, '862458033851830-440444d27dc1', 'a4be763eea7c6813', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512747632189', '1512755432892', '0', '0', null, '0', '1512755432892', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200603', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', '[{\"limit_forces\":2500,\"create_time\":1512747926,\"level\":3,\"last_recover_energy_time\":1512747926,\"limit_energy\":100,\"uuid\":\"08d818b85c5641cdbc893c09653e49df\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512747926,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2500,\"exp\":\"600\",\"marchid\":\"\",\"energy\":100}]', '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512757820,\"sellIds\":\"700027,700011,700007,700030\"}');
INSERT INTO `userprofile` VALUES ('2853956000001', '烟雨烟雨', '4', '3039', '352', '0', '0', '0c72aec8-864c-4d94-bb0a-8bad554d23b7', '', '9982,9981,9986,9985,9990', 'g012', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, 'ac343f568a0244d7a1fcf21469aa5346', 'a3a620cdf047fb1e', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512747920055', '1512749366522', '0', '0', null, '0', '1512749366522', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1512748800', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512748764142', '0', null, '1', '7', '1512748742664', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1514078493,\"sellIds\":\"700034,700027,700002,700019\"}');
INSERT INTO `userprofile` VALUES ('28899383000001', 'Kingdom12021', '2', '360', '210', '0', '0', '', null, '9985,9986,9990', 'g026', '0', '8000', '75cbfe4b765a44eaa3aa87037c3d46c0', '0', null, 'de94e426e96f02aec3f627fee16c522df47cc45d', '117F7EFE-6A63-45AA-AF25-507DD1568856', '0', 'AppStore', 'en', null, '0.1.86', '0', '1478677148901', '1478697120724', '0', '0', null, '0', '1478697120724', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200102', '1478703808', '0', '0.1.86', '1_75cbfe4b765a44eaa3aa87037c3d46c0_1478682671636', '0', null, '1', '0', '1478682649332', '0', '0', '0', null, '-1', '0', null, '{\"buyId\":\"\",\"buyTime\":0,\"traderType\":1,\"state\":1,\"sellIds\":\"700030,700030,700003,700030\",\"endTime\":1478698745}');
INSERT INTO `userprofile` VALUES ('29340279000001', 'Kingdom331d1', '1', '0', '90', '0', '0', 'eb507643-198a-422c-ac65-919e621c3e64', '', '9985', 'g026', '0', '8000', '', '0', null, '866938037847559-020000000000', '16149ef5fd318534', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512748023404', '1512748075082', '0', '0', null, '0', '1512748075082', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512749825,\"sellIds\":\"700030,700026,700028,700003\"}');
INSERT INTO `userprofile` VALUES ('301207606000001', 'Kingdom4111e1', '1', '0', '90', '0', '0', '74bc10a4-3f7d-4a2f-bbd1-c271185e5716', '', '9985', 'g026', '0', '8000', '', '0', null, '28fa395eb6ed4099a64d4e9e86229e8a', 'e31032d56048ecae', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512748191209', '1512748215313', '0', '0', null, '0', '1512748215313', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512993368,\"sellIds\":\"700018,700025,700014,700027\"}');
INSERT INTO `userprofile` VALUES ('317441243000001', 'Kingdom7581f1', '4', '1292', '180', '0', '0', '264dc42e-3a55-4cda-8f80-658cf6047103', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, 'ac0972a8fa8f4ce3915e40687af39313', '1994143dfe6aff0b', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512748297443', '1512750238505', '0', '0', null, '0', '1512750238505', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512749447380', '0', null, '2', '0', '1512749427382', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1512748680,\"level\":2,\"last_recover_energy_time\":1512748680,\"limit_energy\":100,\"uuid\":\"f6be15893b6e4f2a9e89706f8408c9d1\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512748680,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"200\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":2,\"endTime\":1512750998,\"sellIds\":\"710003,710001,710002,710001\"}');
INSERT INTO `userprofile` VALUES ('32454681000001', 'Kingdom60201', '2', '598', '110', '0', '0', '3bc2e979-3296-4de8-8e47-d22604b38fdd', '', '9985,9990', 'g026', '0', '8000', '', '0', null, 'd947aa8dc12a451781b565ee629f904f', '6d5524f969b35450', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512750364549', '1512750673800', '0', '0', null, '0', '1512750673800', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201002', '1512833216', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512839716,\"sellIds\":\"700007,700024,700028,700015\"}');
INSERT INTO `userprofile` VALUES ('332844583000001', 'Kingdom732211', '1', '0', '90', '0', '0', '6a6dc13e-d059-40d2-9b31-2814936bc8d8', '', '9985', 'g026', '0', '8000', '', '0', null, '863478030948545-a444d1bc888f', 'ac8f66ac748c3ee9', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512751812846', '1512751859070', '0', '0', null, '0', '1512751859070', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512753613,\"sellIds\":\"700035,700008,700014,700018\"}');
INSERT INTO `userprofile` VALUES ('345512327000001', 'Kingdom915221', '1', '175', '90', '0', '0', '8c331911-4521-4534-91ac-57fa5497710b', '', '9985', 'g026', '0', '8000', '', '0', null, 'e693c7b6677245d58f3cc31853886437', 'ad18734ef82c45cb', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512752795515', '1512752966589', '0', '0', null, '0', '1512752966589', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201001', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512754596,\"sellIds\":\"700027,700027,700020,700011\"}');
INSERT INTO `userprofile` VALUES ('353179809000001', 'Kingdom267231', '6', '2571', '100', '0', '0', '5275a76f-acd4-463e-9a99-4b36966dc099', '', '9982,9981,9986,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, 'c4380a2a6a274a8eb8e62b3aa532457e', 'c820e7dc-06c2-4961-b685-0f916147eb17', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512753053181', '1512805365622', '0', '0', null, '0', '1513216941666', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201006', '1512808192', '0', '0.1.86', '', '0', null, '2', '16', '1513216941586', '1000034', '1512810204002', '0', null, '0', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513218741,\"sellIds\":\"700021,700028,700011,700033\"}');
INSERT INTO `userprofile` VALUES ('35982907000001', 'Kingdom78231', '1', '0', '100', '0', '0', '76aff6b5f8e8df955297c3b23731858604890c642b8541832ddaa29b94fb46a1', null, null, 'g026', '0', '8000', '', '0', null, 'ddec8e968aa7eefe5cdc1e1466d317dddeb22001', '2E314D4B-5CDA-4B35-80E3-F523D138C324', '0', 'AppStore', 'zh_CN', null, '0.1.86', '0', '1478687385983', '1478859243242', '0', '0', null, '0', '1478859243242', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '', '0', '0', '0.1.86', '', '0', null, '2', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"buyId\":\"\",\"buyTime\":0,\"traderType\":1,\"state\":1,\"sellIds\":\"700023,700022,700028,700007\",\"endTime\":1478861019}');
INSERT INTO `userprofile` VALUES ('366909791000001', 'Kingdom220241', '5', '8355', '84', '0', '0', 'f6a54174-17f1-4670-b7e3-4406b7857361', '', '9982,9983,9998,9985,9996,9990', 'g026', '0', '8000', '', '0', null, '694d6c5bc51c4b9c9abb43ce8c57e5df', '035ae770-b51b-403b-b31c-f7c84eaa722a', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512767906911', '1512813061339', '0', '0', null, '0', '1512813061339', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2400105', '1512814496', '0', '0.1.86', '', '0', null, '1', '75', '0', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512814643,\"sellIds\":\"700025,700018,700005,700016\"}');
INSERT INTO `userprofile` VALUES ('371856356000001', 'Kingdom259251', '2', '614', '110', '0', '0', '32676732-3338-4ee6-9996-b118ee3afaff', '', '9985,9990', 'g026', '0', '8000', '', '0', null, '865029039896447-020000000000', '742bade6fcf06128', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512769041858', '1512769432868', '0', '0', null, '0', '1512769432868', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201002', '1512835200', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512770842,\"sellIds\":\"710002,710001,710002,710001\"}');
INSERT INTO `userprofile` VALUES ('389703859000001', 'Kingdom244261', '3', '1313', '129', '0', '0', '04c30662-1dd7-455f-be42-869690a69fda', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, 'f46857ee32a74facb1320920158525dc', 'b6f0122f68a05ff9', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512776139706', '1512776557928', '0', '0', null, '0', '1512776557928', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200203', '1512826592', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512776549971', '0', null, '1', '0', '1512776531129', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512777940,\"sellIds\":\"700028,700015,700010,700026\"}');
INSERT INTO `userprofile` VALUES ('393277466000001', 'Kingdom307271', '1', '0', '90', '0', '0', '382fc062-5dba-4e49-8ea1-7b15836f0fdf', '', '9985', 'g026', '0', '8000', '', '0', null, '860077030823535-020000000000', 'a907ccc7a3082106', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512777143279', '1512777171189', '0', '0', null, '0', '1512777171189', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512839717,\"sellIds\":\"710001,710003,710001,710003\"}');
INSERT INTO `userprofile` VALUES ('404398773000001', 'Kingdom522281', '1', '0', '90', '0', '0', 'b9837658-d2ea-4cf6-ac2c-b0f98df876f2', '', '9985', 'g026', '0', '8000', '', '0', null, '869545024645594-102ab330f580', 'f4512906fd551fe6', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512778074400', '1512778108920', '0', '0', null, '0', '1512778108920', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512779875,\"sellIds\":\"700017,700030,700010,700025\"}');
INSERT INTO `userprofile` VALUES ('413040943000001', 'Kingdom98291', '1', '105', '90', '0', '0', '51fb62e1-0be1-471e-844c-e335f1a31455', '', '9985', 'g026', '0', '8000', '', '0', null, '69844341b6d843d1a5908e533773224e', '143f0e1b459c4bd9', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512778883042', '1512778920586', '0', '0', null, '0', '1512778920586', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512780683,\"sellIds\":\"700014,700006,700022,700031\"}');
INSERT INTO `userprofile` VALUES ('428766827000001', 'Kingdom1432a1', '2', '603', '91', '0', '0', '8ae394c8-ee61-4e6c-aeb1-d2d67f441d93', '', '9985,9990', 'g026', '0', '8000', '', '0', null, '9df2f4f2a43e4603ace887cd0921adad', '3c6aa5b4f27b8e74', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512782648768', '1512782863077', '0', '0', null, '0', '1512782863077', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201002', '1512835200', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512784449,\"sellIds\":\"700007,700015,700030,700018\"}');
INSERT INTO `userprofile` VALUES ('437735234000001', 'Kingdom8632b1', '2', '718', '45', '0', '0', 'f1a1ddf5-267c-4a9e-86fd-3ecc6c0bd1e7', '', '9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '862813030935293-c09f05be811a', '5f41a06e22772754', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512782727737', '1512799068295', '0', '0', null, '0', '1512799068295', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201002', '1512807808', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512796024042', '0', null, '1', '0', '1512796003426', '1000038', '1512799782174', '0', null, '4', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512800801,\"sellIds\":\"700007,700021,700006,700033\"}');
INSERT INTO `userprofile` VALUES ('449017302000001', '雪深迷了影', '4', '318', '50110', '0', '0', '3fc236f5-393e-428f-a3c7-41d0f638f3fe', '', '9982,9986,9998,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, '864938026523122-3c4711cee53c', '8dcce5d968704695', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512783119021', '1512797737360', '0', '0', null, '0', '1512797737360', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1512835072', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512786763007', '0', null, '1', '32', '1512786741725', '1000036', '1512791699644', '0', null, '2', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512799144,\"sellIds\":\"700028,700017,700031,700024\"}');
INSERT INTO `userprofile` VALUES ('45020693000001', 'Kingdom71341', '5', '7493', '43', '0', '0', '', null, '9981,9982,9985,9996,9986,9989,9990', 'g026', '0', '8000', '3fa195a4b79a49608a0ef06bb6080268', '0', null, 'ed98bd2ea1248604ae2a4734e4116cdfc58dcd55', 'DE12EFA2-7BD6-439A-9C45-6D174CFE4093', '0', 'AppStore', 'zh_CN', null, '0.1.86', '0', '1478687705021', '1479029542749', '0', '0', null, '0', '1479029542749', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200505', '0', '0', '0.1.86', '1_3fa195a4b79a49608a0ef06bb6080268_1479029525390', '0', null, '5', '37', '1478972393367', '0', '0', '0', '[{\"last_recover_forces_time\":1478853840,\"exp\":\"100\",\"marchid\":\"\",\"last_dead_time\":0,\"level\":2,\"defence_num\":0,\"last_recover_energy_time\":1478853840,\"create_time\":1478853840,\"uuid\":\"55dc605ec25249a89666d9944f2dd108\",\"itemid\":\"211001\",\"forces\":2000,\"energy\":100,\"limit_energy\":100,\"limit_forces\":2000}]', '-1', '1', null, '{\"buyId\":\"\",\"buyTime\":0,\"traderType\":2,\"state\":1,\"sellIds\":\"710002,710002,710002,710001\",\"endTime\":1479031299}');
INSERT INTO `userprofile` VALUES ('45131200000001', 'Kingdom6362d1', '2', '196', '90', '0', '0', '52df3255-4dc7-43aa-9278-f1a2050f63a6', '', '9985,9990', 'g026', '0', '8000', '', '0', null, '688202598011772-078F01689F33', '4be9faaa-3366-4d9c-82ad-bf7e383532b2', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512784400134', '1512784666307', '0', '0', null, '0', '1512784666307', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2404208', '1512822368', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512993369,\"sellIds\":\"700017,700003,700018,700006\"}');
INSERT INTO `userprofile` VALUES ('46579780000001', 'Kingdom5032e1', '1', '0', '90', '0', '0', '6391f875-920d-4430-a534-ce4d0f34ceb5', '', '9985', 'g026', '0', '8000', '', '0', null, '8347a166c6834aedbfff4dd72a9d6c0e', '25a48da0-a4fb-4a2c-905d-28ac311ca188', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512786575799', '1512786595113', '0', '0', null, '0', '1512786595113', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512788376,\"sellIds\":\"700007,700016,700027,700019\"}');
INSERT INTO `userprofile` VALUES ('478881615000001', '农耕社会', '14', '7177', '45367', '0', '0', 'dfe39eb8-75b8-48f5-a96a-e26db7c0ba9f', '', '9982,9983,9994,9981,9986,9998,9984,9995,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, '865368033761920-020000000000', '4773f0edb7a60768', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512788448884', '1513578024048', '0', '0', null, '0', '1513578024048', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '21', '2300207', '0', '0', '0.1.86', '', '0', null, '7', '139', '1513577754261', '0', '1512799963733', '0', '[{\"limit_forces\":10700,\"create_time\":1512814085,\"level\":10,\"last_recover_energy_time\":1513040937,\"limit_energy\":100,\"uuid\":\"77c778a5692a42679adae6f7a6a49a50\",\"itemid\":\"211001\",\"last_recover_forces_time\":1513001855,\"defence_num\":0,\"last_dead_time\":0,\"forces\":10700,\"exp\":\"46844\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513583167,\"sellIds\":\"710001,710001,710001,710002\"}');
INSERT INTO `userprofile` VALUES ('48575759000001', 'Kingdom596301', '2', '515', '90', '0', '0', 'b1a4111a-9c98-4f8d-ab98-f2485fe0bead', '', '9984,9985,9990', 'g026', '0', '8000', '', '0', null, '864702033304060-020000000000', 'd3258008ec7065d9', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512789830577', '1512790171876', '0', '0', null, '0', '1512790171876', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2100602', '1512835200', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512791633,\"sellIds\":\"700021,700012,700011,700004\"}');
INSERT INTO `userprofile` VALUES ('498726714000001', 'Kingdom164311', '4', '1106', '180', '0', '0', 'cbe9a629-bab7-4104-bb6e-155fb70e3f0e', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '864288037355688-020000000000', '218117c65898eabd', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512790858728', '1512791808320', '0', '0', null, '0', '1512791808320', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1512821792', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512791334417', '0', null, '1', '0', '1512791313055', '1000038', '1512799782174', '0', null, '4', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512792659,\"sellIds\":\"700003,700017,700026,700003\"}');
INSERT INTO `userprofile` VALUES ('503956305000001', 'Kingdom344321', '3', '759', '140', '0', '0', '4dab4910-b62c-4f8b-b1d4-97f1c592b632', '', '9983,9985,9990', 'g026', '0', '8000', '', '0', null, '864248038424602-020000000000', '94a129017009e769', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512791183958', '1512793682623', '0', '0', null, '0', '1512793682623', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200803', '1512835200', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":2,\"endTime\":1512793884,\"sellIds\":\"710002,710004,710001,710001\"}');
INSERT INTO `userprofile` VALUES ('516185321000001', 'Kingdom698331', '3', '1799', '370', '0', '0', '1d516938-293a-4988-9ba2-43ce3b960dec', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '863187035874628-9cfbd530facc', 'd78dd49e68d2df4f', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512793216188', '1512794020412', '0', '0', null, '0', '1512794020412', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2100203', '1512822080', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512793676468', '0', null, '1', '0', '1512793645512', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512795017,\"sellIds\":\"710001,710002,710002,710002\"}');
INSERT INTO `userprofile` VALUES ('524916399000001', 'Kingdom126341', '5', '13281', '280', '0', '0', '30c6b80d-e7f4-4306-b96d-5852b941d212', '', '9982,9981,9986,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, 'd0b1cddf8ff54e1c9c597e9b0ff81fad', 'a8d886bb4b67906d', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512793624918', '1512795938031', '0', '0', null, '0', '1512795938031', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200806', '1512821568', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512794298259', '0', null, '1', '103', '1512794278401', '1000038', '1512799782174', '0', null, '4', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512798622,\"sellIds\":\"700010,700007,700024,700027\"}');
INSERT INTO `userprofile` VALUES ('53858016000001', 'Kingdom801351', '1', '5', '90', '0', '0', '4a313436-d79e-4b59-a4f1-1a6400ae1861', '', '9985', 'g026', '0', '8000', '', '0', null, '6cd0ecf0e35240dc977b22f6b4308f64', '298efded-1d5d-43a8-823a-ac0777d7f590', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512795168583', '1512795260406', '0', '0', null, '0', '1512795260406', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512796969,\"sellIds\":\"700024,700007,700016,700003\"}');
INSERT INTO `userprofile` VALUES ('544090211000001', 'Kingdom872361', '4', '216', '300', '0', '0', '435f3571-0b15-468e-9da5-2143ae5b7706', '', '9986,9984,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '8c99813692d249caadc7b9e505601426', 'ed28b771262cf493', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512795204092', '1512796307951', '0', '0', null, '0', '1512796307951', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1512808192', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512795570717', '0', null, '1', '0', '1512795563019', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512797004,\"sellIds\":\"710001,710001,710003,710001\"}');
INSERT INTO `userprofile` VALUES ('556820808000001', 'Kingdom875371', '4', '4547', '450', '0', '0', '7a5a087f-85a6-475d-9166-5dc1798041ba', '', '9982,9986,9984,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '2f90465030d74c45b4e45e7ba22d4556', 'f0093d60-1b49-4cf1-bd1c-7949de2ae9b6', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512796356823', '1512873183841', '0', '0', null, '0', '1512873509156', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200503', '1512908096', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512869995248', '0', null, '2', '68', '1512869974233', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512875145,\"sellIds\":\"700024,700020,700021,700003\"}');
INSERT INTO `userprofile` VALUES ('564424938000001', 'Kingdom305381', '4', '603', '380', '0', '0', '90ae7bfc-5cdb-448e-9b1f-9c8030db2048', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '861464033639614-1c77f61fafa8', '8477ae446efba8e9', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512796854426', '1512797978563', '0', '0', null, '0', '1512797978563', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1512821952', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512797850851', '0', null, '1', '0', '1512797830508', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512798655,\"sellIds\":\"700004,700026,700031,700030\"}');
INSERT INTO `userprofile` VALUES ('575920916000001', '狼牙横扫', '7', '9103', '41179', '0', '0', 'af1e93de-55e6-4409-8400-cf2d0e15bda4', '', '9982,9983,9981,9986,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, '2ea53e70de044814b7c5017ad3ab377f', '26540c49953b006c', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512797975922', '1512804085988', '0', '0', null, '0', '1512804085988', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2400107', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512798082751', '0', null, '1', '77', '1512798059833', '1000034', '1512802657849', '0', '[{\"limit_forces\":3000,\"create_time\":1512801950,\"level\":4,\"last_recover_energy_time\":1512804042,\"limit_energy\":100,\"uuid\":\"2fd2b0711bcc4f50a8b1d5cc9db9887e\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512801950,\"defence_num\":0,\"last_dead_time\":0,\"forces\":3000,\"exp\":\"1006\",\"marchid\":\"\",\"energy\":54}]', '0', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":2,\"endTime\":1512804546,\"sellIds\":\"710003,710001,710002,710003\"}');
INSERT INTO `userprofile` VALUES ('587024263000001', 'Kingdom3883a1', '5', '11910', '430', '0', '0', '681f6947-ed0b-4b34-ac6d-1c6f7a27c09a', '', '9981,9986,9984,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, 'd470096b06054f9a8a86b690ceff6263', 'd51f3cc3b8184c84', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512798477026', '1512876789660', '0', '0', null, '0', '1512876789660', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200106', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512876445672', '0', null, '2', '0', '1512876225403', '1000035', '1512819784232', '0', '[{\"limit_forces\":3000,\"create_time\":1512817850,\"level\":4,\"last_recover_energy_time\":1512876690,\"limit_energy\":100,\"uuid\":\"c91b6b1ca1654eafb33c786d7d7a1ac9\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512817850,\"defence_num\":0,\"last_dead_time\":0,\"forces\":3000,\"exp\":\"703\",\"marchid\":\"\",\"energy\":50}]', '1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512878025,\"sellIds\":\"700021,700005,700017,700022\"}');
INSERT INTO `userprofile` VALUES ('591766466000001', 'hao', '8', '13258', '25673', '0', '0', '57f39e9a-9986-4332-9b85-c2c8636e14c2', '', '9982,9983,9981,9986,9984,9995,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, 'b3b927eef1064a30aa105c937950fc64', '2e270489e00aa545', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512798561768', '1512916356115', '0', '0', null, '0', '1512916356115', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2100506', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512864176511', '0', null, '2', '154', '1512863805712', '0', '1512802657849', '0', '[{\"limit_forces\":2500,\"create_time\":1512799321,\"level\":3,\"last_recover_energy_time\":1512916311,\"limit_energy\":100,\"uuid\":\"fa17e95c5f87432687aa74b1138b366e\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512799321,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2500,\"exp\":\"551\",\"marchid\":\"\",\"energy\":50}]', '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512918068,\"sellIds\":\"700033,700020,700015,700014\"}');
INSERT INTO `userprofile` VALUES ('5990929000001', 'Kingdom66251', '1', '0', '100', '0', '0', '', null, null, 'g026', '0', '8000', '', '0', null, '33726e7cf55dfac7c7b3ffc0f0888b4ba51f8c7d', 'D1269450-8FB5-4626-ACC8-E9B856086F57', '0', 'AppStore', 'en', null, '0.1.86', '0', '1478688629911', '1478688692600', '0', '0', null, '0', '1478688692600', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"buyId\":\"\",\"buyTime\":0,\"traderType\":1,\"state\":1,\"sellIds\":\"700004,700016,700020,700029\",\"endTime\":1478690430}');
INSERT INTO `userprofile` VALUES ('608913538000001', 'Kingdom7943c1', '4', '593', '163', '0', '0', '0443746c-c836-4575-b305-f9e030da8483', '', '9981,9985,9990', 'g026', '0', '8000', '', '0', null, '6958752c893a46e793dd3355f322198f', '6fded1158bb647bb', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512800748915', '1512801553737', '0', '0', null, '0', '1512801553737', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1512821824', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512802550,\"sellIds\":\"710001,710001,710002,710003\"}');
INSERT INTO `userprofile` VALUES ('6186907000001', 'Kingdom1593d1', '1', '0', '90', '0', '0', 'e2c876a7-a3ed-41f0-adb5-581fc698e5c9', '', '9985', 'g026', '0', '8000', '', '0', null, 'A0000060AF5792-cc2d831a0a53', '37dc6dfcb1d2e889', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512802128693', '1512802159047', '0', '0', null, '0', '1512802159047', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512803929,\"sellIds\":\"700003,700026,700008,700026\"}');
INSERT INTO `userprofile` VALUES ('625860215000001', 'Kingdom8763e1', '2', '224', '290', '0', '0', 'a17c7898-89e2-4e84-8951-6c1558ddf092', '', '9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '869270024386947-020000000000', 'c9a04e8ffd8206bc', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512805295862', '1512805563108', '0', '0', null, '0', '1512805563108', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2404208', '1512822208', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512805377015', '0', null, '1', '0', '1512805358041', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512807096,\"sellIds\":\"700024,700006,700022,700019\"}');
INSERT INTO `userprofile` VALUES ('636506589000001', 'Kingdom9543f1', '1', '105', '90', '0', '0', 'a86f9759-759d-4378-b4c5-f0dbd7aeab43', '', '9985', 'g026', '0', '8000', '', '0', null, '864167036663427-020000000000', '3f3243d08b8fb00c', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512805496508', '1512805553752', '0', '0', null, '0', '1512805553752', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512807297,\"sellIds\":\"710002,710001,710001,710002\"}');
INSERT INTO `userprofile` VALUES ('643412408000001', 'Kingdom615401', '2', '344', '100', '0', '0', 'eb8256a7-eeae-436b-b822-ebcc12a53b5a', '', '9985,9990', 'g026', '0', '8000', '', '0', null, '51b0f0280a4f4152a17b922235efdaab', '84ca9c31a2c60357', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512805663415', '1512805888479', '0', '0', null, '0', '1512805888479', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200602', '1512821792', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512807464,\"sellIds\":\"700029,700013,700007,700008\"}');
INSERT INTO `userprofile` VALUES ('658439728000001', 'Kingdom150411', '1', '170', '7', '0', '0', '40520b06-4f7b-4c13-9cbe-85bec9814373', '', '9985', 'g026', '0', '8000', '', '0', null, 'A0000070B8FBC5-020000000000', 'f8b7ab6da2809493', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512806058441', '1512806344717', '0', '0', null, '0', '1512806344717', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201001', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512807859,\"sellIds\":\"710003,710002,710001,710002\"}');
INSERT INTO `userprofile` VALUES ('663394720000001', 'Kingdom740421', '4', '262', '310', '0', '0', '39b856b0-0114-46e3-b4a4-60250c276c59', '', '9986,9984,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '861305033751364-020000000000', '496b690a6d072bac', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512809273396', '1512810595938', '0', '0', null, '0', '1512810595938', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1512821920', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512809783618', '0', null, '1', '0', '1512809763730', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512811074,\"sellIds\":\"700029,700022,700003,700015\"}');
INSERT INTO `userprofile` VALUES ('66873716000001', 'Kingdom21561', '1', '0', '100', '0', '0', '', null, null, 'g026', '0', '8000', '', '0', null, '4e64eb3652bb0c82270c8935c3091aee85d8959e', '245BD436-EF3A-45A9-9ADE-735E83267776', '0', 'AppStore', 'en', null, '0.1.86', '0', '1478689106877', '1478690113842', '0', '0', null, '0', '1478690113842', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"buyId\":\"\",\"buyTime\":0,\"traderType\":1,\"state\":1,\"sellIds\":\"700030,700019,700024,700015\",\"endTime\":1478690907}');
INSERT INTO `userprofile` VALUES ('67449979000001', '泥羽', '5', '5037', '50071', '0', '0', 'a4bbeac2-0d4c-4b58-8307-33522afd94b4', '', '9981,9986,9984,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, '862238038794700-020000000000', '10655693-ac43-4c6b-8a99-c69ffbaa6c86', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512810540451', '1512843023535', '0', '0', null, '0', '1512843023535', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201105', '1512831328', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512842955958', '0', null, '2', '0', '1512842897897', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512844697,\"sellIds\":\"710003,710001,710002,710001\"}');
INSERT INTO `userprofile` VALUES ('68208232000001', 'Kingdom735441', '2', '240', '100', '0', '0', 'adc576e7-7f4b-4666-9930-548e19d2064e', '', '9985,9990', 'g026', '0', '8000', '', '0', null, 'ec915718c4d64f679e00fc0180ee2b8a', '93fda861c73b25da', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512814952084', '1512815389333', '0', '0', null, '0', '1512815389333', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200602', '1512830624', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512816752,\"sellIds\":\"700015,700006,700015,700034\"}');
INSERT INTO `userprofile` VALUES ('692711148000001', 'Kingdom525451', '1', '165', '90', '0', '0', '6d08bb35-828e-4521-a957-be7c6d53b67b', '', '9985', 'g026', '0', '8000', '', '0', null, '866445034982728-020000000000', '42fd1571ad69735c', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512814962713', '1512815115709', '0', '0', null, '0', '1512815115709', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512816763,\"sellIds\":\"700021,700011,700019,700004\"}');
INSERT INTO `userprofile` VALUES ('706396118000001', 'Kingdom87461', '4', '314', '40', '0', '0', '56778e21-5f53-4063-8e77-9ab737eb1317', '', '9982,9986,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '867516026351970-5844984bbb47', '11b1e5d57f5709d7', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512818556398', '1512819389839', '0', '0', null, '0', '1512819389839', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200104', '1512821632', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512819092893', '0', null, '1', '43', '1512819071465', '1000035', '1512819784232', '0', null, '1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512820357,\"sellIds\":\"700032,700016,700001,700018\"}');
INSERT INTO `userprofile` VALUES ('716871731000001', 'Kingdom628471', '1', '0', '90', '0', '0', '9eb743b3-c83f-472e-b83c-8c91e6712324', '', '9985', 'g026', '0', '8000', '', '0', null, '866921039212717-020000000000', '831dd523c8aedc1b', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512819736874', '1512819762672', '0', '0', null, '0', '1512819762672', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512821538,\"sellIds\":\"700003,700027,700024,700022\"}');
INSERT INTO `userprofile` VALUES ('728681975000001', 'Kingdom970481', '4', '473', '279', '0', '0', '1ad06624-fedd-4938-b2e5-70d6d68a63c1', '', '9986,9984,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '862561038727762-020000000000', '345b6c73-989e-4123-8875-ef7ca22ba750', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512821588684', '1512822715966', '0', '0', null, '0', '1512822715966', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512821771130', '0', null, '1', '0', '1512821750878', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1512822061,\"level\":2,\"last_recover_energy_time\":1512822061,\"limit_energy\":100,\"uuid\":\"699fded36c9e43f8ba3b97ffcc1320ba\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512822061,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"200\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512823389,\"sellIds\":\"710003,710001,710001,710002\"}');
INSERT INTO `userprofile` VALUES ('733417614000001', 'Kingdom111491', '5', '3285', '37', '0', '0', '6e86feb4-9b2b-46d3-8da0-b927b70a409a', '', '9983,9986,9984,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '351539070097466-800184b58bcc', 'cf159f89895e572b', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512822193419', '1512824326812', '0', '0', null, '0', '1512824326812', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2100505', '1512827040', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512822539660', '0', null, '1', '0', '1512822518153', '0', '1512823270289', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512832823,\"sellIds\":\"700014,700008,700011,700028\"}');
INSERT INTO `userprofile` VALUES ('741690752000001', 'Kingdom4614a1', '1', '105', '90', '0', '0', '5c6ad11e-6f27-4aee-ab32-67f8bb61654f', '', '9985', 'g026', '0', '8000', '', '0', null, '8fecd8ac3de64de9acc948ac6d4357ac', 'd0079aa2085793d5', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512824061692', '1512824172595', '0', '0', null, '0', '1512824172595', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512825862,\"sellIds\":\"710002,710001,710001,710002\"}');
INSERT INTO `userprofile` VALUES ('75365953000001', 'Kingdom40371', '1', '0', '100', '0', '0', '', null, null, 'g026', '0', '8000', '', '0', null, 'dfdc70994fb8105ca1d91b4957f26deba8026325', 'E9E1F525-4A0C-4312-8E3E-56FD8937500A', '0', 'AppStore', 'en', null, '0.1.86', '0', '1478694865367', '1478696789689', '0', '0', null, '0', '1478696789689', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"buyId\":\"\",\"buyTime\":0,\"traderType\":1,\"state\":1,\"sellIds\":\"700034,700006,700006,700009\",\"endTime\":1478696665}');
INSERT INTO `userprofile` VALUES ('755903397000001', 'Kingdom4734b1', '1', '0', '90', '0', '0', '527f309e-69f4-4ecf-bd49-edafeac78556', '', '9985', 'g026', '0', '8000', '', '0', null, 'A10000524CCA3D-e0ddc04e309e', 'e754b715c24c13b5', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512824455905', '1512824477349', '0', '0', null, '0', '1512824477349', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512826257,\"sellIds\":\"710001,710002,710002,710003\"}');
INSERT INTO `userprofile` VALUES ('768950834000001', 'Kingdom3224c1', '4', '396', '100', '0', '0', '54a5597b-ed46-4ba9-8e5c-5c2bad1e9abc', '', '9986,9984,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '864337030442819-020000000000', '6dd8d90fb7d46c65', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512824998953', '1512825782259', '0', '0', null, '0', '1512825782259', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200104', '1512825664', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512825458193', '0', null, '1', '0', '1512825437930', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512826800,\"sellIds\":\"710001,710001,710002,710001\"}');
INSERT INTO `userprofile` VALUES ('774953868000001', 'Kingdom2874d1', '1', '0', '100', '0', '0', '7dafa5d1-da6d-4e5b-a8a0-5d20ae6a58d0', '', null, 'g026', '0', '8000', '', '0', null, '865982029608372-3480b3788ab4', '988c7e35f70522aa', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512827254956', '1512827268690', '0', '0', null, '0', '1512827268690', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512829056,\"sellIds\":\"710003,710003,710002,710002\"}');
INSERT INTO `userprofile` VALUES ('783442928000001', 'Kingdom134e1', '2', '180', '90', '0', '0', 'd08d6c89-1049-44e8-8be2-d9fdd1a5a719', '', '9985', 'g026', '0', '8000', '', '0', null, '862746037041584-020000000000', 'b89f4c7a8e31bf86', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512827673445', '1512877283343', '0', '0', null, '0', '1512877283343', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2300102', '0', '0', '0.1.86', '', '0', null, '2', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512879063,\"sellIds\":\"710001,710001,710001,710002\"}');
INSERT INTO `userprofile` VALUES ('794473936000001', 'Kingdom834f1', '1', '0', '100', '0', '0', '70ab78dd-8753-4c8e-8cd7-45c0ace60324', '', null, 'g026', '0', '8000', '', '0', null, '178f297e17a14212b8388df08d45f4cf', null, '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512829564475', '1512829680990', '0', '0', null, '0', '1512829680990', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512831365,\"sellIds\":\"700017,700033,700020,700027\"}');
INSERT INTO `userprofile` VALUES ('803588168000001', 'Kingdom482501', '1', '175', '90', '0', '0', '6874083d-4a9d-4f66-8e1d-ee3e6f8ece37', '', '9985', 'g026', '0', '8000', '', '0', null, 'b2552bda60d34cfe92bc25243c91b414', '65c28abaa6e6a203', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512830423591', '1512830841271', '0', '0', null, '0', '1512830841271', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2201001', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512832224,\"sellIds\":\"700010,700013,700021,700002\"}');
INSERT INTO `userprofile` VALUES ('817952502000001', 'Kingdom568511', '1', '0', '90', '0', '0', 'abedb77c-61ba-44cc-8c82-6a8a3cfc9a71', '', '9985', 'g026', '0', '8000', '', '0', null, 'c9f6e820f2544749868bb56f8fa40018', 'a7567ca689a58abe', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512831307954', '1512831330482', '0', '0', null, '0', '1512831330482', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512833108,\"sellIds\":\"700022,700022,700004,700004\"}');
INSERT INTO `userprofile` VALUES ('828100319000001', 'Kingdom212521', '3', '707', '140', '0', '0', 'f0e1e261-9d23-4602-9f2f-9ef5298207c1', '', '9982,9985,9990', 'g026', '0', '8000', '', '0', null, 'b2c2d1b191e3443496e4bd165ad1f5e4', '4e2b822439a0446b', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512832618103', '1512909197491', '0', '0', null, '0', '1512909197491', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200603', '0', '0', '0.1.86', '', '0', null, '1', '30', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512910732,\"sellIds\":\"700025,700017,700034,700022\"}');
INSERT INTO `userprofile` VALUES ('83607831000001', 'Kingdom735531', '2', '230', '71', '0', '0', 'cfe8a0d2-a79c-476d-9a00-600084983e81', '', '9985,9990', 'g026', '0', '8000', '', '0', null, '863454030400621-020000000000', 'b4eb07c815044dcf', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512833390609', '1512839918419', '0', '0', null, '0', '1512839918419', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200602', '1512908096', '0', '0.1.86', '', '0', null, '2', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512841379,\"sellIds\":\"710001,710002,710003,710001\"}');
INSERT INTO `userprofile` VALUES ('848695298000001', 'Kingdom270541', '3', '481', '140', '0', '0', 'e5965160-285a-434b-856c-a2f195a141c6', '', '9982,9985,9990', 'g026', '0', '8000', '', '0', null, '2796ef4f12ad4c138393dfbc50d3a6a4', '9c5711d2-5968-49ba-846e-c24ae73bdb84', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512833978697', '1512834324219', '0', '0', null, '0', '1512834324219', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2102502', '0', '0', '0.1.86', '', '0', null, '1', '30', '0', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1512834233,\"level\":2,\"last_recover_energy_time\":1512834233,\"limit_energy\":100,\"uuid\":\"620020212aaa4f189842aa97a65f7967\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512834233,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"200\",\"marchid\":\"\",\"energy\":100}]', '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512838479,\"sellIds\":\"710002,710002,710003,710002\"}');
INSERT INTO `userprofile` VALUES ('85020787000001', '诺言', '18', '25645', '219431', '0', '0', 'aac8a377-66a3-4d39-aabf-cd9ea9a51687', '', '9982,9993,9983,9994,9981,9992,9986,9984,9995,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, '008796752351572-0800274c9154', 'b5fac42505b1001a', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512742195025', '1515047676598', '0', '0', null, '0', '1515047676598', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2400116', '0', '0', '0.1.86', '', '0', '1_1512810267189', '8', '38', '1515047654956', '0', '1512823270289', '0', '[{\"limit_forces\":6100,\"create_time\":1512745194,\"level\":7,\"last_recover_energy_time\":1512913411,\"limit_energy\":100,\"uuid\":\"b0e1e2b6ee1b498faf0f59c9a88672fd\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512745194,\"defence_num\":0,\"last_dead_time\":0,\"forces\":6100,\"exp\":\"9130\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1515049454,\"sellIds\":\"710002,710002,710001,710001\"}');
INSERT INTO `userprofile` VALUES ('85325338000001', 'Kingdom151551', '2', '463', '310', '0', '0', '2361210e-8be3-409a-b5e0-14aecd8ff7e5', '', '9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '862561036936357-020000000000', 'b6992f50-4a29-4403-ab72-7b3e5f8221ae', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512835973256', '1512837403853', '0', '0', null, '0', '1512837403853', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200102', '1512908192', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512837226616', '0', null, '1', '0', '1512837207098', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512837774,\"sellIds\":\"710001,710002,710002,710001\"}');
INSERT INTO `userprofile` VALUES ('86180541000001', 'Kingdom805561', '4', '672', '378', '0', '0', 'e1caa7ed-5f7b-42b3-aa18-01766d6aa2e8', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '867909023178761-bc3aea20e214', 'c904ca7435b09c94', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512848290183', '1512849629776', '0', '0', null, '0', '1512849629776', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206101', '1512921600', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512848876656', '0', null, '1', '0', '1512848855049', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512850090,\"sellIds\":\"710001,710001,710001,710003\"}');
INSERT INTO `userprofile` VALUES ('873273940000001', 'Kingdom866571', '1', '268', '90', '0', '0', '6a60715b-a43a-489e-9674-69bc0b0a6a5f', '', '9985', 'g026', '0', '8000', '', '0', null, '862561030827511-020000000000', '5859dd4ab52cb287', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512859463276', '1512859787065', '0', '0', null, '0', '1512859787065', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2300102', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512861264,\"sellIds\":\"700026,700014,700016,700006\"}');
INSERT INTO `userprofile` VALUES ('884177308000001', 'Kingdom673581', '1', '0', '90', '0', '0', '38a0ebdb-7b75-44d0-921c-4f42b47d639a', '', '9985', 'g026', '0', '8000', '', '0', null, '861874039484692-1c77f69a4c39', 'ebc9f815616e8e8', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512863244179', '1512863270991', '0', '0', null, '0', '1512863270991', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512865045,\"sellIds\":\"710001,710001,710002,710001\"}');
INSERT INTO `userprofile` VALUES ('897235329000001', 'Kingdom524591', '1', '105', '90', '0', '0', '3d58f860-858d-434c-b408-658d3f1a20f9', '', '9985', 'g026', '0', '8000', '', '0', null, '99000869062930-020000000000', 'efb853efcb5e3327', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512870977237', '1512871029477', '0', '0', null, '0', '1512871029477', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512872779,\"sellIds\":\"700002,700022,700029,700027\"}');
INSERT INTO `userprofile` VALUES ('903388360000001', 'Kingdom6275a1', '4', '325', '60', '0', '0', 'c91d06ff-8387-42d6-81af-d0967b5412d1', '', '9983,9985,9996,9990', 'g026', '0', '8000', '', '0', null, '866657023207715-020000000000', 'e566e0f4eaf457ff', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512872663390', '1512873401868', '0', '0', null, '0', '1512873401868', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '1512908416', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512874464,\"sellIds\":\"700025,700010,700004,700002\"}');
INSERT INTO `userprofile` VALUES ('917040713000001', 'Kingdom9165b1', '1', '0', '90', '0', '0', '23bd66eb-1b6f-41a9-9e0d-2a04714bd14e', '', '9986,9985', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '864394010806398-803F5D20E286', '66204ae9-0216-4ef2-826d-65d51c690a69', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512873357043', '1512873609325', '0', '0', null, '0', '1512873609325', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512873522147', '0', null, '1', '0', '1512873480651', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512875168,\"sellIds\":\"700029,700003,700027,700031\"}');
INSERT INTO `userprofile` VALUES ('9262714000001', 'Kingdom5545c1', '3', '1770', '154', '0', '0', 'f3444019-1a5d-4ce5-ade2-077a345c3cbb', '', '9981,9985,9990', 'g026', '0', '8000', '', '0', null, 'A0000059DBF7BC-94fe2288a459', 'c0e071a78fb1d34', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512880300064', '1512880807473', '0', '0', null, '0', '1512880807473', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2100203', '1512913376', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512882100,\"sellIds\":\"700013,700018,700004,700012\"}');
INSERT INTO `userprofile` VALUES ('933187449000001', 'Kingdom445d1', '3', '2077', '170', '0', '0', '5341e69c-def8-462b-aace-7a7ddf6423e6', '', '9981,9985,9990', 'g026', '0', '8000', '', '0', null, '28b5660522274cc4bab151c71b2b0e43', 'f4bb91c5b0155e4c', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512894623190', '1512895430702', '0', '0', null, '0', '1512895430702', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200103', '1512907776', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512896423,\"sellIds\":\"700019,700022,700003,700016\"}');
INSERT INTO `userprofile` VALUES ('946014374000001', 'Kingdom265e1', '1', '105', '90', '0', '0', '2bc709c2-590b-467f-b463-96d4dc598b90', '', '9985', 'g026', '0', '8000', '', '0', null, '864084033235796-1c48ceeb7a8d', 'e76cf6820be4d6b5', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512898286016', '1512898360739', '0', '0', null, '0', '1512898360739', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512900086,\"sellIds\":\"710001,710002,710002,710002\"}');
INSERT INTO `userprofile` VALUES ('959124580000001', '虚无', '9', '28347', '30', '0', '0', 'fdbca942-a8f3-4d0b-b0b5-5ef870e279ca', '', '9982,9983,9981,9986,9984,9995,9985,9996,9990', 'g007', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, '1e0d407019734419b88f53c1f82fd7de', '9d58c39a34a51be3', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512901549126', '1513658863809', '0', '0', null, '0', '1513658863809', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200506', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1513646800353', '0', null, '7', '242', '1513646772492', '0', '0', '0', '[{\"limit_forces\":3000,\"create_time\":1512911979,\"level\":4,\"last_recover_energy_time\":1513164620,\"limit_energy\":100,\"uuid\":\"d39ae68fa1a04df5b73b1a8df5cb2f6d\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512911979,\"defence_num\":1,\"last_dead_time\":0,\"forces\":3000,\"exp\":\"1800\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513671475,\"sellIds\":\"710003,710002,710002,710003\"}');
INSERT INTO `userprofile` VALUES ('96035221000001', '无敌', '4', '1295', '100118', '0', '0', 'f6c1108d-0cc3-4944-a34c-a7b7336d25e3', '', '9981,9986,9998,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, '5deb80f942ed4b7a8652f4fb7161e502', 'bbf9afb709ac4419', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512743046037', '1512746222859', '0', '0', null, '0', '1512746222859', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512745267575', '0', null, '1', '0', '1512745246150', '0', '0', '0', '[{\"limit_forces\":2500,\"create_time\":1512744987,\"level\":3,\"last_recover_energy_time\":1512744987,\"limit_energy\":100,\"uuid\":\"b716b3d0c0fc47779db147cf60dd7c7b\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512744987,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2500,\"exp\":\"600\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512748223,\"sellIds\":\"710002,710001,710001,710002\"}');
INSERT INTO `userprofile` VALUES ('961313243000001', '神之领域', '5', '4651', '353', '0', '0', '749807c2-d1af-4a99-9fb8-c2b1d5b9e585', '', '9983,9981,9986,9998,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '1', null, 'c18528184d924d2aaa6759c3b6ccc883', '9733a37fb7b8b0e9', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512903451316', '1513052183624', '0', '0', null, '0', '1513052183624', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200904', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1513052141418', '0', null, '3', '0', '1513052017795', '0', '0', '0', '[{\"limit_forces\":3000,\"create_time\":1512905079,\"level\":4,\"last_recover_energy_time\":1512905079,\"limit_energy\":100,\"uuid\":\"7c4613b6e90349b793499dfbdf6dd9bc\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512905079,\"defence_num\":0,\"last_dead_time\":0,\"forces\":3000,\"exp\":\"800\",\"marchid\":\"\",\"energy\":100}]', '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1513053817,\"sellIds\":\"700002,700026,700031,700009\"}');
INSERT INTO `userprofile` VALUES ('979553825000001', 'Kingdom588611', '5', '8722', '430', '0', '0', '0c431314-7ad9-4da0-b388-800d9b2e0f55', '', '9983,9997,9986,9984,9985,9996,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '6d44ca59a9cb469bbf438915824dc523', '31846cb23e32a51e', '1', 'market_global', 'zh_TW', null, '0.1.86', '0', '1512906499555', '1512908077924', '0', '0', null, '0', '1512908077924', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200106', '1512921600', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512907142001', '0', null, '1', '0', '1512907134048', '0', '0', '0', null, '-1', '1', null, '{\"traderType\":2,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512919223,\"sellIds\":\"710001,710002,710001,710001\"}');
INSERT INTO `userprofile` VALUES ('986552418000001', 'Kingdom204621', '1', '105', '90', '0', '0', 'b61505fe-5fc9-4022-879c-d66416384b1b', '', '9985', 'g026', '0', '8000', '', '0', null, '34a51094dc394b67940f41d5c1f57552', '9972ba50e592b6e1', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512911856554', '1512912132064', '0', '0', null, '0', '1512912132064', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2200301', '0', '0', '0.1.86', '', '0', null, '1', '0', '0', '0', '0', '0', null, '-1', '0', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":1,\"endTime\":1512913657,\"sellIds\":\"700016,700030,700013,700027\"}');
INSERT INTO `userprofile` VALUES ('991374620000001', 'Kingdom347631', '4', '648', '380', '0', '0', 'd7a8fbbb-d462-4dba-88f5-057814353b93', '', '9981,9986,9985,9990', 'g026', '0', '8000', '931feabfbbce474ab2554a1e07b0924d', '0', null, '866042039371013-020000000000', '3feb2295cfd723de', '1', 'market_global', 'zh_CN', null, '0.1.86', '0', '1512916201377', '1512923411827', '0', '0', null, '0', '1512923411827', null, '1', '-1', '0', '0', '0', '0', '', '0', null, '0', '-1', '2206801', '0', '0', '0.1.86', '1_931feabfbbce474ab2554a1e07b0924d_1512923229976', '0', null, '2', '0', '1512923208890', '0', '0', '0', '[{\"limit_forces\":2000,\"create_time\":1512920214,\"level\":2,\"last_recover_energy_time\":1512923365,\"limit_energy\":100,\"uuid\":\"484b74a9677d45be8dc7c1985cb4f3fc\",\"itemid\":\"211001\",\"last_recover_forces_time\":1512920214,\"defence_num\":0,\"last_dead_time\":0,\"forces\":2000,\"exp\":\"232\",\"marchid\":\"\",\"energy\":50}]', '-1', '1', null, '{\"traderType\":1,\"buyTime\":0,\"buyId\":\"\",\"state\":2,\"endTime\":1512924302,\"sellIds\":\"700029,700030,700016,700011\"}');

SET NAMES utf8;

CREATE TABLE `id_manual_verify_case_trans` (
  `id`                   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `job_id`              INT(10) UNSIGNED          NOT NULL
  COMMENT 'id card job job id',
  `seq_no`               VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `image_seq_no_front`   VARCHAR(32)               DEFAULT NULL
  COMMENT '用户上传身份证影像时的seq no',
  `image_seq_no_back`    VARCHAR(32)               DEFAULT NULL
  COMMENT '用户上传身份证影像时的seq no',
  `openid`               VARCHAR(48)               DEFAULT NULL
  COMMENT '微信openid',
  `ecif_no`              VARCHAR(48)               DEFAULT NULL
  COMMENT 'ECIF号',
  `card_no`              VARCHAR(36)               DEFAULT NULL
  COMMENT '卡号',
  `risk_level`           VARCHAR(255)              DEFAULT NULL
  COMMENT '风险等级',
  `biz_seq_no`           VARCHAR(32)               DEFAULT NULL
  COMMENT '发送给审核系统时的seq no',
  `biz_type`             VARCHAR(1)                DEFAULT NULL
  COMMENT '业务场景：1-开户，2-身份证重传',
  `status`               VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：00-已发送至异步审核系统，10-已接收异步审核结果，但未将结果反应到客户或账户，90-处理完成',
  `check_result`         INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '审核结论',
  `id_card_surface`      INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证表面审核结果',
  `head_portrait`        INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证头像审核结果',
  `id_card_name`         INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证姓名审核结果',
  `gender`               INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证性别审核结果',
  `birthday`             INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证出生年月审核结果',
  `id_card_no`           INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证证件号审核结果',
  `validity`             INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证有效期审核结果',
  `address_formats`      INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证住址格式审核结果',
  `font_of_card_no`      INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证证件号码字体审核结果',
  `font_of_reverse_side` INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '身份证背面字体审核结果',
  `created_by`           VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`         TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`     VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date`   TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_job_id_status` (`job_id`, `status`),
  KEY `idx_seq_no_status` (`biz_seq_no`, `status`),
  KEY `idx_openid` (`openid`, `biz_type`, `status`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '异步人工审核流水表';
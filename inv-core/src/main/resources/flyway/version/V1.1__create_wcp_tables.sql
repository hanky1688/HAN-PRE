DROP TABLE IF EXISTS `wcp_account_open_trans`;
CREATE TABLE `wcp_account_open_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`      VARCHAR(48)               DEFAULT NULL
  COMMENT '微信openid',
  `wechat_pay_openid`  VARCHAR(64)      NOT NULL
  COMMENT '微信支付openid',
  `card_no`            VARCHAR(36)      NOT NULL
  COMMENT '预分配的卡号',
  `mobile`             VARCHAR(16)      NOT NULL
  COMMENT '预分配卡号时使用的手机号',
  `name`               VARCHAR(100)     NOT NULL
  COMMENT '预分配卡号时使用的姓名',
  `id_no`              VARCHAR(20)      NOT NULL
  COMMENT '预分配卡号时使用的证件号码',
  `id_type`            VARCHAR(2)       NOT NULL
  COMMENT '预分配卡号时使用的证件的类型',
  `open_card_type`     TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '开卡类型： 1，新开卡，2换绑卡 (前端透传) 3、换手机号',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_req_id` (`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '财付通签约时发起的开户请求流水';


DROP TABLE IF EXISTS `wcp_anti_fraud_assess_trans`;
CREATE TABLE `wcp_anti_fraud_assess_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `quality_check_no`   VARCHAR(32)               DEFAULT NULL
  COMMENT '开户时，资格检查的编号，包括 联网核查、4要素实名认证、安全、反欺诈',
  `owner_id`           VARCHAR(18)               DEFAULT NULL
  COMMENT '客户身份证号码',
  `owner_name`         VARCHAR(30)               DEFAULT NULL
  COMMENT '客户姓名',
  `card_new`           VARCHAR(30)               DEFAULT NULL
  COMMENT '新申请绑定的银行卡',
  `phone_new`          VARCHAR(11)               DEFAULT NULL
  COMMENT '新申请的手机号码',
  `event_flag`         VARCHAR(2)                DEFAULT NULL
  COMMENT '事件标识',
  `ecif_no`            VARCHAR(32)               DEFAULT NULL
  COMMENT '客户号',
  `highest_rule_code`  VARCHAR(4)                DEFAULT NULL
  COMMENT '命中风险级别最高的规则代码',
  `method`             VARCHAR(2)                DEFAULT NULL
  COMMENT '核身类型',
  `scene`              VARCHAR(2)                DEFAULT NULL
  COMMENT '场景码',
  `risk_var`           TEXT COMMENT '微信风控变量',
  `mobile_phone`       VARCHAR(20)               DEFAULT NULL
  COMMENT '手机号码',
  `org`                VARCHAR(20)               DEFAULT NULL
  COMMENT '机构号',
  `product_id`         VARCHAR(20)               DEFAULT NULL
  COMMENT '产品号',
  `chanl_code`         VARCHAR(4)                DEFAULT NULL
  COMMENT '请求渠道',
  `scence_ip`          VARCHAR(39)               DEFAULT NULL
  COMMENT '设备IP',
  `name`               VARCHAR(30)               DEFAULT NULL
  COMMENT '姓名-财付通传递的绑卡信息',
  `id_no`              VARCHAR(30)               DEFAULT NULL
  COMMENT '证件号码-财付通传递的绑卡信息',
  `id_type`            VARCHAR(1)                DEFAULT NULL
  COMMENT '证件类型-财付通传递的绑卡信息,I|身份证 ,T|临时身份证 ,S|军官证 ,P|护照 ,L|营业执照 ,O|其他有效证件',
  `id_no_18`           VARCHAR(30)               DEFAULT NULL
  COMMENT '财付通传递的绑卡证件号，如果为15位证件号，则系统按照升位逻辑转出18位身份证；如果本身为19位证件号，则该变量与cus_id_no送入取值一致',
  `name_check`         VARCHAR(30)               DEFAULT NULL
  COMMENT '通过上传的身份证OCR识别获取的姓名',
  `id_no_check`        VARCHAR(30)               DEFAULT NULL
  COMMENT '通过上传的身份证OCR识别获取的证件号',
  `id_valid_date`      VARCHAR(8)                DEFAULT NULL
  COMMENT '身份证失效日期,例如：20170123',
  `sus_case1`          VARCHAR(10)               DEFAULT NULL
  COMMENT '通过上传的身份证OCR识别合法性校验后的输出值',
  `sus_case2`          VARCHAR(10)               DEFAULT NULL
  COMMENT '通过上传的身份证OCR识别合法性校验后的输出值',
  `sus_case3`          VARCHAR(10)               DEFAULT NULL
  COMMENT '通过上传的身份证OCR识别合法性校验后的输出值',
  `bind_type`          VARCHAR(2)                DEFAULT NULL
  COMMENT '根据微信支付绑卡状态及开户时选卡操作实时计算出账户绑卡标签，开户成功后需标记在账户上，在后续的交易决策引擎中作为入参送入',
  `result`             VARCHAR(2)                DEFAULT '0'
  COMMENT '决策引擎决策结果，1—通过；2—拒绝；3—身份证异步审核',
  `refused_reason`     VARCHAR(64)               DEFAULT NULL
  COMMENT '拒绝码，到前端用于文案展示',
  `block_code`         VARCHAR(100)              DEFAULT NULL
  COMMENT '使用“|”分格多个冻结止付码，即账户或客户层级的属性控制码（可支持5组），由4部分组成：属性类型+属性子类型+属性位+属性位枚举值，例如ACCTACCT061，06表示属性位为6,1表示属性位枚举值为1',
  `risk_code`          VARCHAR(30)               DEFAULT NULL
  COMMENT '使用“|”分格多个风险标识码，风险标识码层级（01-账户层；02-客户层）+风险标识码，例如：01FCCD标识在账户上风险标识码FCCD',
  `hit_rules`          VARCHAR(160)              DEFAULT NULL
  COMMENT '所有击中规则的规则代码列表',
  `risk_level`         VARCHAR(4)                DEFAULT NULL
  COMMENT '风险等级',
  `status`             VARCHAR(2)                DEFAULT 'I'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `account_opened`     TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '客户账户是否已经成功开出，如果开出，则需要进行相应的打标或发送异步审核',
  `id_photo_appr_send` TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '身份证照片异步审核是否已经发送',
  `risk_code_applied`  TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '是否已经完成了风险标识打标',
  `block_code_applied` TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '是否已经完成了冻结止付标识打标',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`, `scene`, `method`),
  KEY `idx_trans_id` (`quality_check_no`, `status`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_req_id` (`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '防欺诈评估请求及结果';


DROP TABLE IF EXISTS `wcp_card_issue_trans`;
CREATE TABLE `wcp_card_issue_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `card_no`            VARCHAR(32)      NOT NULL
  COMMENT '卡号',
  `name`               VARCHAR(100)     NOT NULL
  COMMENT '分配卡号时使用的姓名',
  `id_no`              VARCHAR(20)      NOT NULL
  COMMENT '分配卡号时使用的证件号码',
  `mobile`             VARCHAR(16)      NOT NULL
  COMMENT '分配卡号时使用的手机号',
  `co_date`            VARCHAR(10)               DEFAULT NULL
  COMMENT '生效日期',
  `expiry_date`        VARCHAR(10)               DEFAULT NULL
  COMMENT '卡片有效期',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '卡管开卡流水';


DROP TABLE IF EXISTS `wcp_card_no_issue_result`;
CREATE TABLE `wcp_card_no_issue_result` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `id_no`              VARCHAR(20)      NOT NULL
  COMMENT '预分配卡号时使用的证件号码',
  `card_no`            VARCHAR(36)      NOT NULL
  COMMENT '微信存款二类户卡号',
  `status`             VARCHAR(1)                DEFAULT 'N'
  COMMENT '卡对应的账户状态：N-已分配卡号，但未开户，O-已开户，C-已销户',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',

  PRIMARY KEY (`id`),
  KEY `idx_card_no` (`card_no`),
  KEY `idx_idno_status` (`id_no`, `status`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '为用户预分配卡号的结果';


DROP TABLE IF EXISTS `wcp_card_no_issue_trans`;
CREATE TABLE `wcp_card_no_issue_trans` (
  `id`                   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`               VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `src_biz_seq_no`       VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `quality_check_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '开户时，资格检查的编号，包括 联网核查、4要素实名认证、安全、反欺诈',
  `risk_var_seq_no`      VARCHAR(32)               DEFAULT NULL
  COMMENT '微信传递风控变量时的seq no',
  `id_card_image_seq_no` VARCHAR(32)               DEFAULT NULL
  COMMENT '用户上传身份证影像时的seq no',
  `wechat_openid`        VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `wechat_pay_openid`    VARCHAR(64)      NOT NULL
  COMMENT '微信支付openid',
  `wechat_unionid`       VARCHAR(48)      NOT NULL
  COMMENT '微信UnionId',
  `bind_card_no`         VARCHAR(36)      NOT NULL
  COMMENT '绑定一类卡卡号',
  `bind_card_type`       VARCHAR(1)                DEFAULT NULL
  COMMENT '绑定一类卡卡类型',
  `bind_bank_name`       VARCHAR(20)      NOT NULL
  COMMENT '绑定一类卡开户行名称',
  `bind_bank_code`       VARCHAR(20)      NOT NULL
  COMMENT '绑定一类卡开户行行号',
  `bind_mobile`          VARCHAR(16)      NOT NULL
  COMMENT '绑定一类卡开户时使用的手机号',
  `bind_name`            VARCHAR(100)     NOT NULL
  COMMENT '绑定一类卡开户时使用的姓名',
  `bind_id_no`           VARCHAR(20)      NOT NULL
  COMMENT '绑定一类卡开户时使用的证件号码',
  `bind_id_type`         VARCHAR(2)       NOT NULL
  COMMENT '绑定一类卡开户时使用的证件类型',
  `user_type`            TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '用户类型',
  `open_card_type`       TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '开卡类型： 1，新开卡，2换绑卡 (前端透传) 3、换手机号',
  `tenpay_id_no`         VARCHAR(18)               DEFAULT NULL
  COMMENT '财付通传入的身份证号',
  `bumped_up_id_no`      VARCHAR(18)               DEFAULT NULL
  COMMENT '升位为18位的身份证',
  `ocr_id_no`            VARCHAR(18)               DEFAULT NULL
  COMMENT 'OCR识别出的身份证号',
  `card_no`              VARCHAR(36)               DEFAULT NULL
  COMMENT '预分配的卡号',
  `afa_comp_require`     TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '反欺诈评估是否需要补偿',
  `ocr_comp_require`     TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT 'OCR是否需要补偿',
  `fetch_comp_require`   TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '身份证照片拉取是否需要补偿',
  `status`               VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`          VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`           VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`           VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`         TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`     VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date`   TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`, `open_card_type`),
  KEY `idx_src_trans_id` (`src_biz_seq_no`),
  KEY `idx_issued` (`bind_id_no`, `card_no`, `bind_mobile`, `bind_name`, `status`, `result_code`, `open_card_type`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_req_id` (`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '用户开户时预分配卡号请求流水表';


DROP TABLE IF EXISTS `wcp_citizen_id_check_trans`;
CREATE TABLE `wcp_citizen_id_check_trans` (
  `id`                  INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`              VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`       VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `quality_check_no`    VARCHAR(32)               DEFAULT NULL
  COMMENT '开户时，资格检查的编号，包括 联网核查、4要素实名认证、安全、反欺诈',
  `trans_code`          VARCHAR(6)                DEFAULT NULL
  COMMENT '交易码',
  `service_id`          VARCHAR(8)                DEFAULT NULL
  COMMENT '返回服务/事件ID',
  `scenario`            VARCHAR(2)                DEFAULT NULL
  COMMENT '返回场景ID',
  `sys_seq`             VARCHAR(32)               DEFAULT NULL
  COMMENT '返回流水号',
  `product_id`          VARCHAR(20)               DEFAULT NULL
  COMMENT '产品编号',
  `do_update_cache`     VARCHAR(1)                DEFAULT NULL
  COMMENT '本地缓存更新方式',
  `do_return_photo`     VARCHAR(1)                DEFAULT NULL
  COMMENT '照片需求方式',
  `is_simple_check`     VARCHAR(1)                DEFAULT NULL
  COMMENT '核查方式',
  `check_channel`       VARCHAR(1)                DEFAULT NULL
  COMMENT '要求查询渠道',
  `business_place`      VARCHAR(6)                DEFAULT NULL
  COMMENT '业务发生地',
  `business_type`       VARCHAR(2)                DEFAULT NULL
  COMMENT '业务类型',
  `id_type`             VARCHAR(2)                DEFAULT NULL
  COMMENT '证件类型',
  `expiry_date`         TINYINT(11) UNSIGNED      DEFAULT NULL
  COMMENT '缓存有效期，单位为天，最小值为1，不传则不判断有效期',
  `msg_serv_error`      VARCHAR(40)               DEFAULT NULL
  COMMENT '服务异常描述',
  `handle_result`       VARCHAR(2)                DEFAULT NULL
  COMMENT '处理结果',
  `flag`                VARCHAR(1)                DEFAULT NULL
  COMMENT '数据更新痕迹',
  `update_time`         VARCHAR(8)                DEFAULT NULL
  COMMENT '数据最新时间',
  `msg_id_error`        VARCHAR(40)               DEFAULT NULL
  COMMENT '查询结果描述',
  `msg_id_result`       VARCHAR(40)               DEFAULT NULL
  COMMENT '查询结果描述',
  `result_person_id`    VARCHAR(1)                DEFAULT NULL
  COMMENT '证件号码核查结果',
  `result_person_name`  VARCHAR(1)                DEFAULT NULL
  COMMENT '姓名核查结果',
  `photoid`             VARCHAR(100)              DEFAULT NULL
  COMMENT '证件照片id',
  `photo_md5`           VARCHAR(32)               DEFAULT NULL
  COMMENT '照片md5值',
  `photo_flag`          VARCHAR(1)                DEFAULT NULL
  COMMENT '照片获取渠道',
  `person_id`           VARCHAR(18)               DEFAULT NULL
  COMMENT '公民证件号码',
  `person_name`         VARCHAR(40)               DEFAULT NULL
  COMMENT '公民姓名',
  `old_name`            VARCHAR(40)               DEFAULT NULL
  COMMENT '曾用名',
  `sex`                 VARCHAR(2)                DEFAULT NULL
  COMMENT '性别',
  `nation`              VARCHAR(40)               DEFAULT NULL
  COMMENT '民族',
  `birth`               VARCHAR(8)                DEFAULT NULL
  COMMENT '出生日期',
  `native_place`        VARCHAR(100)              DEFAULT NULL
  COMMENT '籍贯省市县（区）',
  `address`             VARCHAR(100)              DEFAULT NULL
  COMMENT '住址',
  `work_place`          VARCHAR(100)              DEFAULT NULL
  COMMENT '服务处所',
  `marital_status`      VARCHAR(40)               DEFAULT NULL
  COMMENT '婚姻状况',
  `degree_of_education` VARCHAR(100)              DEFAULT NULL
  COMMENT '文化程度',
  `bl0`                 VARCHAR(30)               DEFAULT NULL
  COMMENT '在逃人员类型',
  `bl1`                 VARCHAR(30)               DEFAULT NULL
  COMMENT '违法人员类型',
  `status`              VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `delayed`             TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '在开立活期存款户时，核查结果仍未返回，需要后续补充打标时，该列值为true；未成功开户，或开户时核查结果已经返回，则该列值为false',
  `timing_start_at`     TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '异步请求发起的时间',
  `responding_at`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '异步返回的时间',
  `timeout_threshold`   INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '超时阈值',
  `applied`             TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '是否已经完成了补充打标',
  `created_by`          VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`        TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`    VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date`  TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_trans_id` (`quality_check_no`, `status`),
  KEY `idx_unapplied` (`delayed`, `applied`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_req_id` (`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '联网核查请求及结果';

DROP TABLE IF EXISTS `wcp_card_cancel_trans`;
CREATE TABLE `wcp_card_cancel_trans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `src_biz_seq_no` varchar(32) DEFAULT NULL COMMENT '请求方的业务流水号',
  `req_id` varchar(32) DEFAULT NULL COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid` varchar(48) DEFAULT NULL COMMENT '微信openid',
  `card_no` varchar(36) DEFAULT NULL COMMENT '预分配的卡号',
  `mobile` varchar(16) DEFAULT NULL COMMENT '预分配卡号时使用的手机号',
  `name` varchar(100) DEFAULT NULL COMMENT '预分配卡号时使用的姓名',
  `id_no` varchar(20) DEFAULT NULL COMMENT '预分配卡号时使用的证件号码',
  `status` varchar(2) DEFAULT '00' COMMENT '请求处理状态：10-待处理，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code` varchar(20) DEFAULT NULL COMMENT '处理结果码',
  `result_msg` varchar(255) DEFAULT NULL COMMENT '与结果码对应的说明',
  `created_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp(3) NOT NULL DEFAULT '0000-00-00 00:00:00.000' COMMENT '创建日期时间',
  `last_modified_by` varchar(20) DEFAULT NULL COMMENT '最后修改人',
  `last_modified_date` timestamp(3) NULL DEFAULT '0000-00-00 00:00:00.000' COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COMMENT='销卡登记表';


DROP TABLE IF EXISTS `wcp_current_account_open_trans`;
CREATE TABLE `wcp_current_account_open_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `card_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT '卡号',
  `ecif_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT '客户号',
  `account_no`         VARCHAR(36)               DEFAULT NULL
  COMMENT '活期存款账号',
  `account_name`       VARCHAR(100)              DEFAULT NULL
  COMMENT '账户名称',
  `bind_card_no`       VARCHAR(36)               DEFAULT NULL
  COMMENT '他行卡号/账号',
  `bind_name`          VARCHAR(100)              DEFAULT NULL
  COMMENT '他行卡持有人姓名',
  `bind_bank_code`     VARCHAR(20)               DEFAULT NULL
  COMMENT '他行卡行名称',
  `bind_bank_name`     VARCHAR(20)               DEFAULT NULL
  COMMENT '他行卡行名称',
  `bind_mobile`        VARCHAR(16)               DEFAULT NULL
  COMMENT '手机号码',
  `branch_code`        VARCHAR(18)               DEFAULT NULL
  COMMENT '他行卡机构名称',
  `product_id`         VARCHAR(18)               DEFAULT NULL
  COMMENT '产品编号',
  `account_type`       VARCHAR(18)               DEFAULT NULL
  COMMENT '客户账号类型',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '存款活期账户开户流水';


DROP TABLE IF EXISTS `wcp_ecif_account_open_trans`;
CREATE TABLE `wcp_ecif_account_open_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `name`               VARCHAR(200)              DEFAULT NULL
  COMMENT '个人姓名',
  `id_no`              VARCHAR(50)               DEFAULT NULL
  COMMENT '个人证件号码',
  `id_type`            VARCHAR(2)                DEFAULT NULL
  COMMENT '个人证件类型',
  `wechat_unionid`     VARCHAR(32)               DEFAULT NULL
  COMMENT '微信unionID',
  `mobile`             VARCHAR(20)               DEFAULT NULL
  COMMENT '手机号',
  `business_type`      VARCHAR(10)               DEFAULT NULL
  COMMENT '业务类型',
  `ecif_no`            VARCHAR(16)               DEFAULT NULL
  COMMENT '客户号',
  `is_old_ecif`        TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '是否老客户',
  `dcn_no`             VARCHAR(3)                DEFAULT NULL
  COMMENT 'DCN号',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_req_id` (`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = 'ECIF客户号创建流水';


DROP TABLE IF EXISTS `wcp_id_card_image_fetch_job`;
CREATE TABLE `wcp_id_card_image_fetch_job` (
  `id`                   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`               VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`        VARCHAR(48)               DEFAULT NULL
  COMMENT '微信openid',
  `id_card_image_seq_no` VARCHAR(32)               DEFAULT NULL
  COMMENT '用户上传身份证影像时的seq no',
  `risk_var_seq_no`      VARCHAR(32)               DEFAULT NULL
  COMMENT '微信传递风控变量时的seq no',
  `quality_check_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '开户时，资格检查的编号，包括 联网核查、4要素实名认证、安全、反欺诈',
  `ecif_no`              VARCHAR(32)               DEFAULT NULL
  COMMENT 'ECIF号',
  `dcn_no`               VARCHAR(10)               DEFAULT NULL
  COMMENT 'DCN号',
  `status`               VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `timing_start`         TIMESTAMP(3)     NULL     DEFAULT NULL
  COMMENT '计时开始的时间点，job创建的时间',
  `retry_count`          TINYINT(4)                DEFAULT NULL
  COMMENT '重试次数',
  `created_by`           VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`         TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`     VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date`   TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_pending` (`status`, `retry_count`),
  KEY `idx_created_date` (`created_date`),
  UNIQUE KEY `idx_req_id`(`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '身份证照片的下载补偿任务';

DROP TABLE IF EXISTS `wcp_id_card_image_ocr_trans`;
CREATE TABLE `wcp_id_card_image_ocr_trans` (
  `id`                    INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`                VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `src_biz_seq_no`        VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`         VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `seq_no`                VARCHAR(32)      NOT NULL
  COMMENT '微信请求的消息序列号',
  `side`                  VARCHAR(1)       NOT NULL
  COMMENT '身份证正反面标识，F为正面，B为反面',
  `reco_type`             VARCHAR(10)               DEFAULT 'IdCard'
  COMMENT '要识别的文件类型，取值包括: IdCard-身份证识别，正面或反面',
  `encoding`              VARCHAR(10)               DEFAULT 'utf-8'
  COMMENT '返回结果的文字编码方式，取值包括：utf-8， 默认值；gb2312',
  `b64`                   VARCHAR(1)                DEFAULT '0'
  COMMENT '输入图片是否为base64格式，取值：0，	默认，二进制格式；1，	base64格式',
  `crop_image`            VARCHAR(1)                DEFAULT '0'
  COMMENT '是否返回切边（base64格式），取值：0，	默认，不返回切边图；1，	返回切边图',
  `head_portrait`         VARCHAR(1)                DEFAULT '0'
  COMMENT '是否返回头像（base64格式），只对身份证识别有效，取值范围：0，默认，不返回头像；1，则返回身份证的头像照片',
  `error`                 TINYINT(4)                DEFAULT '-1'
  COMMENT '错误码',
  `ret_status`            TINYINT(4)                DEFAULT '-1'
  COMMENT '状态码',
  `warning`               VARCHAR(8)                DEFAULT NULL
  COMMENT '告警码',
  `score`                 DECIMAL(3, 2)             DEFAULT NULL
  COMMENT '评分',
  `result_side`           VARCHAR(1)                DEFAULT NULL
  COMMENT 'OCR识别的身份证正反面标识，F为正面，B为反面',
  `details`               VARCHAR(255)              DEFAULT NULL
  COMMENT '错误信息，若错误码为0，返回结果无此信息',
  `name`                  VARCHAR(100)              DEFAULT NULL
  COMMENT '姓名',
  `gender`                VARCHAR(10)               DEFAULT NULL
  COMMENT '性别',
  `nation`                VARCHAR(50)               DEFAULT NULL
  COMMENT '民族',
  `birthdate`             VARCHAR(30)               DEFAULT NULL
  COMMENT '生日',
  `address`               VARCHAR(255)              DEFAULT NULL
  COMMENT '住址',
  `idno`                  VARCHAR(20)               DEFAULT NULL
  COMMENT '身份证号码',
  `issuedby`              VARCHAR(255)              DEFAULT NULL
  COMMENT '签发机关',
  `validthru`             VARCHAR(50)               DEFAULT NULL
  COMMENT '有效期限',
  `cropped_image_fps_id`  VARCHAR(100)              DEFAULT NULL
  COMMENT '切割图',
  `cropped_image_fps_md5` VARCHAR(100)              DEFAULT NULL
  COMMENT '切割图',
  `height`                SMALLINT(6)               DEFAULT NULL
  COMMENT '头像高度',
  `left_position`         SMALLINT(6)               DEFAULT NULL
  COMMENT '头像坐标left',
  `top_position`          SMALLINT(6)               DEFAULT NULL
  COMMENT '头像坐标top',
  `width`                 SMALLINT(6)               DEFAULT NULL
  COMMENT '头像宽度',
  `image_fps_id`          VARCHAR(100)              DEFAULT NULL
  COMMENT '头像',
  `image_fps_md5`         VARCHAR(100)              DEFAULT NULL
  COMMENT '头像',
  `status`                VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `created_by`            VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`          TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`      VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date`    TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`, `side`),
  KEY `idx_openid_seq` (`seq_no`, `wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '用户身份证照片OCR的请求及结果数据';


DROP TABLE IF EXISTS `wcp_id_card_image_trans`;
CREATE TABLE `wcp_id_card_image_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `seq_no`             VARCHAR(32)      NOT NULL
  COMMENT '微信请求的消息序列号',
  `download_token`     TEXT             NOT NULL
  COMMENT '图片提取信息',
  `scene`              VARCHAR(1)                DEFAULT NULL
  COMMENT '场景：O-开户，R-补传',
  `fps_id_front`       VARCHAR(100)              DEFAULT NULL
  COMMENT '身份证正面（头像面）图片文件FPS ID',
  `fps_md5_front`      VARCHAR(100)              DEFAULT NULL
  COMMENT '身份证正面（头像面）图片文件FPS MD5',
  `cre_img_front_md5`  VARCHAR(32)               DEFAULT NULL
  COMMENT '正面图片数据MD5',
  `fps_id_back`        VARCHAR(100)              DEFAULT NULL
  COMMENT '身份证背面（国徽面）图片文件FPS ID',
  `fps_md5_back`       VARCHAR(100)              DEFAULT NULL
  COMMENT '身份证背面（国徽面）图片文件FPS MD5',
  `cre_img_back_md5`   VARCHAR(32)               DEFAULT NULL
  COMMENT '反面图片数据MD5',
  `ocred`              TINYINT(1)                DEFAULT '0'
  COMMENT '是否已经进行了OCR识别',
  `ocr_cost`           INT(11)                   DEFAULT NULL
  COMMENT 'OCR耗时，单位毫秒',
  `ocred_by_retry`     TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '是否通过事后重试OCR',
  `ocr_retry_count`    TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT 'OCR重试次数',
  `fetched`            TINYINT(1)                DEFAULT '0'
  COMMENT '是否下载成功',
  `fetch_cost`         INT(11)                   DEFAULT NULL
  COMMENT '下载耗时，单位毫秒',
  `used`               TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '是否使用过 0 -未使用 1-已使用',
  `fetched_by_retry`   TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '是否通过事后重试下载',
  `fetch_retry_count`  TINYINT(1) UNSIGNED       DEFAULT '0'
  COMMENT '下载重试次数',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `cost_time`          INT(11)                   DEFAULT NULL
  COMMENT '从接到请求到返回给微信之间的耗时，单位：毫秒',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `ret_code`           VARCHAR(20)               DEFAULT NULL
  COMMENT '返回微信的返回码',
  `ret_msg`            VARCHAR(255)              DEFAULT NULL
  COMMENT '返回微信的信息',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_seq_no` (`seq_no`)
    COMMENT 'seq_no唯一索引',
  KEY `idx_openid_seq` (`wechat_openid`, `seq_no`),
  UNIQUE KEY `idx_reqid` (`req_id`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_openid_scene` (`wechat_openid`, `scene`, `status`),
  KEY `idx_openid_used` (`wechat_openid`, `scene`, `used`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '用户在微信客户端上传的身份证照片的下载信息及上传到FPS的信息';


DROP TABLE IF EXISTS `wcp_mobile_check_failed`;
CREATE TABLE `wcp_mobile_check_failed` (
  `id`                      INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`                  VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`           VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `quality_check_no`        VARCHAR(32)               DEFAULT NULL
  COMMENT '开户时，资格检查的编号，包括 联网核查、4要素实名认证、安全、反欺诈',
  `moblie_check_failure`    VARCHAR(1)                DEFAULT NULL
  COMMENT '是否手机唯一性检查失败 1:true :: 0:false',
  `telcom_bl_check_failure` VARCHAR(1)                DEFAULT NULL
  COMMENT '是否电信黑名单检查失败 1:true :: 0:false',
  `result_code`             VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`              VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`              VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`            TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`        VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date`      TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '电信诈骗黑名单及手机号检查失败登记表';


DROP TABLE IF EXISTS `wcp_mobile_check_trans`;
CREATE TABLE `wcp_mobile_check_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `quality_check_no`   VARCHAR(32)               DEFAULT NULL
  COMMENT '开户时，资格检查的编号，包括 联网核查、4要素实名认证、安全、反欺诈',
  `sec_appid`          VARCHAR(5)                DEFAULT NULL
  COMMENT '安全平台分配的appid',
  `sec_route`          VARCHAR(10)               DEFAULT NULL
  COMMENT '路由方式',
  `sec_type`           VARCHAR(1)                DEFAULT NULL
  COMMENT '调用方式, 1：同步',
  `sec_cmd`            VARCHAR(4)                DEFAULT NULL
  COMMENT '操作步骤',
  `os_type`            VARCHAR(1)                DEFAULT NULL
  COMMENT '系统类型',
  `appid`              VARCHAR(32)               DEFAULT NULL
  COMMENT '渠道appid',
  `custom`             VARCHAR(1)                DEFAULT NULL
  COMMENT '客户来源：1.手Q 2.微信 3.金立 4.酷派 5.手机号OTP登陆 0：其他',
  `version`            VARCHAR(10)               DEFAULT NULL
  COMMENT '主版本号',
  `h5_ver`             VARCHAR(10)               DEFAULT NULL
  COMMENT 'H5 版本号',
  `openid`             VARCHAR(36)               DEFAULT NULL
  COMMENT '用户ID',
  `unionid`            VARCHAR(36)               DEFAULT NULL
  COMMENT '微信用户id',
  `ecif_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT '客户号',
  `time_flag`          VARCHAR(20)               DEFAULT NULL
  COMMENT '时间标签',
  `phone_no`           VARCHAR(11)               DEFAULT NULL
  COMMENT '手机号',
  `id_type`            VARCHAR(2)                DEFAULT NULL
  COMMENT '证件类型',
  `id_no`              VARCHAR(18)               DEFAULT NULL
  COMMENT '身份证号（18位）',
  `name`               VARCHAR(100)              DEFAULT NULL
  COMMENT '姓名',
  `other_account`      VARCHAR(36)               DEFAULT NULL
  COMMENT '他行卡号(银行卡号)',
  `scence_ip`          VARCHAR(30)               DEFAULT NULL
  COMMENT '客户端IP',
  `device_id`          VARCHAR(36)               DEFAULT NULL
  COMMENT '硬设备ID',
  `imei`               VARCHAR(36)               DEFAULT NULL
  COMMENT '设备标识符',
  `other_phone_no`     VARCHAR(11)               DEFAULT NULL
  COMMENT '他行手机号',
  `other_name`         VARCHAR(100)              DEFAULT NULL
  COMMENT '他行卡持有人姓名',
  `id_no_15`           VARCHAR(15)               DEFAULT NULL
  COMMENT '身份证号（15位）',
  `ret_code`           VARCHAR(1)                DEFAULT NULL
  COMMENT '返回码, 公共返回码 0 ：通过 1 ：禁止操作 小于0：失败',
  `ret_msg`            VARCHAR(255)              DEFAULT NULL
  COMMENT '返回描述',
  `ret_level`          VARCHAR(3)                DEFAULT NULL
  COMMENT '命中风险级别最高的规则retlevel, 风险等级 0 ：无 1 ：低 2：中低 3 ：中 4 ：中高 5 ：高',
  `rule_code`          VARCHAR(20)               DEFAULT NULL
  COMMENT '规则码',
  `rule_action`        TEXT COMMENT '命中风险级别最高的规则action',
  `rules`              TEXT COMMENT '命中规则列表',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_req_id` (`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '电信诈骗黑名单及手机号是否绑定多张身份证检查流水';


DROP TABLE IF EXISTS `wcp_real_name_auth_trans`;
CREATE TABLE `wcp_real_name_auth_trans` (
  `id`                      INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `src_biz_seq_no`          VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `req_id`                  VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`           VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `quality_check_no`        VARCHAR(32)               DEFAULT NULL
  COMMENT '开户时，资格检查的编号，包括 联网核查、4要素实名认证、安全、反欺诈',
  `req_trans_id`            VARCHAR(32)               DEFAULT NULL
  COMMENT '当财付通传入15位身份证时，一次需要送出2个请求，该字段用于区分每次请求',
  `src_chl_code`            VARCHAR(2)                DEFAULT NULL
  COMMENT '源渠道编码',
  `chl_code`                VARCHAR(2)                DEFAULT NULL
  COMMENT '渠道编码',
  `pay_route_flag`          VARCHAR(1)                DEFAULT NULL
  COMMENT '路由选择标记',
  `pay_route_code`          VARCHAR(2)                DEFAULT NULL
  COMMENT '代收路由通路',
  `trans_orgid`             VARCHAR(6)                DEFAULT NULL
  COMMENT '交易机构号',
  `person_code`             VARCHAR(6)                DEFAULT NULL
  COMMENT '法人编码',
  `pay_product_code`        VARCHAR(10)               DEFAULT NULL
  COMMENT '支付产品编码',
  `acct_type`               VARCHAR(2)                DEFAULT NULL
  COMMENT '帐号类型',
  `input_user`              VARCHAR(18)               DEFAULT NULL
  COMMENT '柜员',
  `grant_user`              VARCHAR(18)               DEFAULT NULL
  COMMENT '授权柜员',
  `req_date`                VARCHAR(8)                DEFAULT NULL
  COMMENT '委托日期',
  `chcktp`                  VARCHAR(1)                DEFAULT NULL
  COMMENT '验证类型',
  `acct_id`                 VARCHAR(32)               DEFAULT NULL
  COMMENT '账号',
  `recv_bank`               VARCHAR(14)               DEFAULT NULL
  COMMENT '接收行行号',
  `ccy`                     VARCHAR(3)                DEFAULT NULL
  COMMENT '币种',
  `acct_name`               VARCHAR(140)              DEFAULT NULL
  COMMENT '户名',
  `phonenm`                 VARCHAR(14)               DEFAULT NULL
  COMMENT '手机号',
  `cert_type`               VARCHAR(2)                DEFAULT NULL
  COMMENT '证件类型',
  `cert_id`                 VARCHAR(32)               DEFAULT NULL
  COMMENT '证件号',
  `remark`                  VARCHAR(127)              DEFAULT NULL
  COMMENT '备注/附言',
  `sms_code`                VARCHAR(6)                DEFAULT NULL
  COMMENT '短信码',
  `issins_code`             VARCHAR(20)               DEFAULT NULL
  COMMENT '发卡机构代码',
  `bind_id`                 VARCHAR(128)              DEFAULT NULL
  COMMENT '绑定关系标识号',
  `success_expiry_second`   INT(11)                   DEFAULT NULL
  COMMENT '验证成功的有效期秒数',
  `fail_expiry_second`      INT(11)                   DEFAULT NULL
  COMMENT '验证失败的有效期秒数',
  `ret_code`                VARCHAR(8)                DEFAULT NULL
  COMMENT '支付平台处理状态',
  `src_global_busi_transId` VARCHAR(32)               DEFAULT NULL
  COMMENT '原元业务流水号',
  `src_syscall_transId`     VARCHAR(32)               DEFAULT NULL
  COMMENT '原系统调用流水号',
  `resp_code`               VARCHAR(16)               DEFAULT NULL
  COMMENT '实名认证结果',
  `resp_msg`                VARCHAR(255)              DEFAULT NULL
  COMMENT '实名认证结果描述',
  `resp_time`               VARCHAR(20)               DEFAULT NULL
  COMMENT '实名认证返回时间',
  `rtncd`                   VARCHAR(16)               DEFAULT NULL
  COMMENT '银行返回码',
  `rtninf`                  VARCHAR(255)              DEFAULT NULL
  COMMENT '银行返回码描述',
  `verify_type`             VARCHAR(2)                DEFAULT NULL
  COMMENT '验证类型',
  `verify_time`             VARCHAR(23)               DEFAULT NULL
  COMMENT '验证时间',
  `status`                  VARCHAR(2)       NOT NULL DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `timing_start_at`         TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '异步请求发起的时间',
  `responding_at`           TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '异步返回的时间',
  `timeout_threshold`       INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '超时阈值',
  `created_by`              VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`            TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`        VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date`      TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_trans_id` (`quality_check_no`, `status`),
  KEY `idx_req_trans_id` (`req_trans_id`, `status`),
  KEY `idx_created_date` (`created_date`),
  KEY `idx_req_id` (`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '4要素实名认证请求及结果';


DROP TABLE IF EXISTS `wcp_wechat_risk_var_trans`;
CREATE TABLE `wcp_wechat_risk_var_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `seq_no`             VARCHAR(32)      NOT NULL
  COMMENT '微信请求的消息序列号',
  `risk_var`           TEXT COMMENT '微信端风控变量',
  `scene`              VARCHAR(2)                DEFAULT NULL
  COMMENT '场景码：0-通用； 1-更换手机号； 2-大额案件理赔； 3-解除管制； 4-开户；',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  `timing_start_at`    TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '接收风控变量的时间',
  `timeout_threshold`  INT(10) UNSIGNED          DEFAULT NULL
  COMMENT '超时阈值',
  PRIMARY KEY (`id`),
  KEY `idx_seq_no` (`seq_no`),
  KEY `idx_openid_req` (`wechat_openid`, `req_id`),
  KEY `idx_openid_scene` (`wechat_openid`, `scene`),
  KEY `idx_created_date` (`created_date`),
  UNIQUE KEY `idx_req_id` (`req_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '微信端的风控变量';


DROP TABLE IF EXISTS `wcp_account_close_failed`;
CREATE TABLE `wcp_account_close_failed` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`      VARCHAR(48)               DEFAULT NULL
  COMMENT '微信openid',
  `wechat_pay_openid`  VARCHAR(64)               DEFAULT NULL
  COMMENT '微信支付openid',
  `card_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT '预分配的卡号',
  `mobile`             VARCHAR(16)               DEFAULT NULL
  COMMENT '预分配卡号时使用的手机号',
  `name`               VARCHAR(100)              DEFAULT NULL
  COMMENT '预分配卡号时使用的姓名',
  `id_no`              VARCHAR(20)               DEFAULT NULL
  COMMENT '预分配卡号时使用的证件号码',
  `id_type`            VARCHAR(2)                DEFAULT NULL
  COMMENT '预分配卡号时使用的证件的类型',
  `ecif_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT 'ECIF客户号',
  `account_no`         VARCHAR(36)               DEFAULT NULL
  COMMENT '账户号',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-待处理，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '结果对应的描述',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_auth` (`id_no`, `mobile`, `name`),
  KEY `idx_card_no` (`card_no`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '销户失败登记表';


DROP TABLE IF EXISTS `wcp_account_attr_set_trans`;
CREATE TABLE `wcp_account_attr_set_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `card_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT '卡号',
  `level`              VARCHAR(8)                DEFAULT NULL
  COMMENT '属性层级',
  `sub_level`          VARCHAR(8)                DEFAULT NULL
  COMMENT '属性子层级',
  `code`               VARCHAR(3)                DEFAULT NULL
  COMMENT '属性代码',
  `position_value`     VARCHAR(1)                DEFAULT NULL
  COMMENT '属性枚举值',
  `action`             VARCHAR(1)                DEFAULT NULL
  COMMENT '对属性的操作',
  `expiry_date`        VARCHAR(8)                DEFAULT NULL
  COMMENT '到期日期',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '存款核心活期户打标流水';


DROP TABLE IF EXISTS `wcp_risk_code_set_job`;
CREATE TABLE `wcp_risk_code_set_job` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`      VARCHAR(48)               DEFAULT NULL
  COMMENT '微信openid',
  `ecif_no`            VARCHAR(48)               DEFAULT NULL
  COMMENT 'ECIF号',
  `risk_code`          VARCHAR(255)              DEFAULT NULL
  COMMENT '风险识别码',
  `process_type`       VARCHAR(1)                DEFAULT NULL
  COMMENT '处理类型，0-增加，1-移除',
  `retry_count`        TINYINT(3) UNSIGNED       DEFAULT NULL
  COMMENT '重试次数',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_status` (`status`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '开户成功风险标识码登记表';

DROP TABLE IF EXISTS `wcp_risk_code_set_trans`;
CREATE TABLE `wcp_risk_code_set_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`      VARCHAR(48)               DEFAULT NULL
  COMMENT '微信openid',
  `ecif_no`            VARCHAR(48)               DEFAULT NULL
  COMMENT 'ECIF号',
  `risk_code`          VARCHAR(10)               DEFAULT NULL
  COMMENT '风险识别码',
  `process_type`       VARCHAR(1)                DEFAULT NULL
  COMMENT '处理类型，0-增加，1-移除',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_risk_code` (`wechat_openid`, `risk_code`, `process_type`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '风险标识码操作流水';

DROP TABLE IF EXISTS `wcp_deposit_account_maintain_trans`;
CREATE TABLE `wcp_deposit_account_maintain_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `card_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT '卡号',
  `bind_card_no_old`   VARCHAR(36)               DEFAULT NULL
  COMMENT '旧绑定他行卡号',
  `bind_card_no_new`   VARCHAR(36)               DEFAULT NULL
  COMMENT '新绑定他行卡号',
  `bind_name`          VARCHAR(100)              DEFAULT NULL
  COMMENT '他行卡持有人姓名',
  `bind_bank_code`     VARCHAR(20)               DEFAULT NULL
  COMMENT '他行卡行号',
  `bind_bank_name`     VARCHAR(20)               DEFAULT NULL
  COMMENT '他行卡行名称',
  `bind_mobile_old`    VARCHAR(16)               DEFAULT NULL
  COMMENT '旧绑定手机号码',
  `bind_mobile_new`    VARCHAR(16)               DEFAULT NULL
  COMMENT '新绑定手机号码',
  `operate_type`       TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '操作类型:1-更新 2-重置',
  `process_type`       TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '处理代码:0-增加 1-删除 2-修改 3-换卡',
  `binding_type`       TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '绑卡验证类型:1-四要素验证 3-三要素验证绑卡',
  `open_card_type`     TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '开卡类型:1-新开卡 2-换绑卡(前端透传) 3-换手机号',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '存款核心账户绑定信息维护流水';

DROP TABLE IF EXISTS `wcp_ecif_account_maintain_trans`;
CREATE TABLE `wcp_ecif_account_maintain_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`      VARCHAR(48)      NOT NULL
  COMMENT '微信openid',
  `name`               VARCHAR(200)              DEFAULT NULL
  COMMENT '个人姓名',
  `id_no`              VARCHAR(50)               DEFAULT NULL
  COMMENT '个人证件号码',
  `ecif_no`            VARCHAR(16)               DEFAULT NULL
  COMMENT '客户号',
  `mobile_old`         VARCHAR(20)               DEFAULT NULL
  COMMENT '旧绑定手机号',
  `mobile_new`         VARCHAR(20)               DEFAULT NULL
  COMMENT '新绑定手机号',
  `open_card_type`     TINYINT(1) UNSIGNED       DEFAULT NULL
  COMMENT '开卡类型:1-新开卡 2-换绑卡(前端透传) 3-换手机号',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = 'ECIF客户手机号信息维护流水';

DROP TABLE IF EXISTS `wcp_account_close_trans`;
CREATE TABLE `wcp_account_close_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `wechat_openid`      VARCHAR(48)               DEFAULT NULL
  COMMENT '微信openid',
  `card_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT '预分配的卡号',
  `mobile`             VARCHAR(16)               DEFAULT NULL
  COMMENT '预分配卡号时使用的手机号',
  `name`               VARCHAR(100)              DEFAULT NULL
  COMMENT '预分配卡号时使用的姓名',
  `id_no`              VARCHAR(20)               DEFAULT NULL
  COMMENT '预分配卡号时使用的证件号码',
  `id_type`            VARCHAR(2)                DEFAULT NULL
  COMMENT '预分配卡号时使用的证件的类型',
  `ecif_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT 'ECIF客户号',
  `account_no`         VARCHAR(36)               DEFAULT NULL
  COMMENT '账户号',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-异步初始化，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `interest_amt`       DECIMAL(19, 2)            DEFAULT NULL
  COMMENT '销户时的账户利息',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '财付通解约时发起的销户请求流水';

DROP TABLE IF EXISTS `wcp_card_cancel_trans`;
CREATE TABLE `wcp_card_cancel_trans` (
  `id`                 INT(10) UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT '自增主键',
  `src_biz_seq_no`     VARCHAR(32)               DEFAULT NULL
  COMMENT '请求方的业务流水号',
  `req_id`             VARCHAR(32)               DEFAULT NULL
  COMMENT '在分步骤的请求中，用于定位多个步骤属于同一次业务请求',
  `wechat_openid`      VARCHAR(48)               DEFAULT NULL
  COMMENT '微信openid',
  `card_no`            VARCHAR(36)               DEFAULT NULL
  COMMENT '预分配的卡号',
  `mobile`             VARCHAR(16)               DEFAULT NULL
  COMMENT '预分配卡号时使用的手机号',
  `name`               VARCHAR(100)              DEFAULT NULL
  COMMENT '预分配卡号时使用的姓名',
  `id_no`              VARCHAR(20)               DEFAULT NULL
  COMMENT '预分配卡号时使用的证件号码',
  `status`             VARCHAR(2)                DEFAULT '00'
  COMMENT '请求处理状态：10-待处理，00-交易初始化，01-交易成功，02-交易失败，11-异步请求成功，12-异步请求失败，13-异步返回已接收，14-异步返回成功，15-异步返回失败，16-异步对端失败',
  `result_code`        VARCHAR(20)               DEFAULT NULL
  COMMENT '处理结果码',
  `result_msg`         VARCHAR(255)              DEFAULT NULL
  COMMENT '与结果码对应的说明',
  `created_by`         VARCHAR(20)               DEFAULT NULL
  COMMENT '创建人',
  `created_date`       TIMESTAMP(3)     NOT NULL DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '创建日期时间',
  `last_modified_by`   VARCHAR(20)               DEFAULT NULL
  COMMENT '最后修改人',
  `last_modified_date` TIMESTAMP(3)     NULL     DEFAULT '0000-00-00 00:00:00.000'
  COMMENT '最后更新日期时间',
  PRIMARY KEY (`id`),
  KEY `idx_wechat_openid` (`wechat_openid`),
  KEY `idx_created_date` (`created_date`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '销卡登记表';
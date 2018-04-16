create table `inv_purchase_info` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT ' 表id' ,
`trans_date` date NOT NULL COMMENT '进货日期',
`product_no` varchar(32) DEFAULT NULL COMMENT '商品编号',
`batch_no` varchar(32) NOT NULL COMMENT '进货批次号',
`product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
`product_type` varchar(4) DEFAULT NULL COMMENT '商品类型',
`pur_price` decimal DEFAULT NULL COMMENT '进货价格',
`pur_number` int(4) UNSIGNED DEFAULT NULL COMMENT '进货数量',
`created_by` varchar(20) DEFAULT NULL COMMENT '创建人',
`created_date` timestamp(3) NOT NULL DEFAULT '0000-00-00 00:00:00.000' COMMENT '创建日期时间',
`last_modified_by` varchar(20) DEFAULT NULL COMMENT '最后修改人',
`last_modified_date` timestamp(3) NULL DEFAULT '0000-00-00 00:00:00.000' COMMENT '最后更新日期时间',
PRIMARY KEY (`id`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货信息表';
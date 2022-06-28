DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` datetime(3) NULL DEFAULT NULL,

    `name`        varchar(255)        NOT NULL DEFAULT '' COMMENT '产品名称',
    `desc`        varchar(255)        NOT NULL DEFAULT '' COMMENT '产品描述',
    `stock`       int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '产品库存',
    `price`       int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '产品金额',
    
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
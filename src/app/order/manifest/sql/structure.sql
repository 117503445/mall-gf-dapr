DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` datetime(3) NULL DEFAULT NULL,

    `consumer_id` varchar(36)         NOT NULL DEFAULT '' COMMENT '消费者的 UUID | "44ec60c4-1434-47a6-a9c2-443eb1ac27c8"',
    `product_id`  bigint unsigned NOT NULL COMMENT '商品 id',
    `amount` int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '商品数量',
    
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
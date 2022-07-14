DROP TABLE IF EXISTS `pay`;

CREATE TABLE `pay` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` datetime(3) NULL DEFAULT NULL,

    `name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户姓名',
    `gender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别',
    `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '用户电话',
    `password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码',
    
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_name_unique` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
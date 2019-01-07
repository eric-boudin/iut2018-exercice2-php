CREATE TABLE `product_category` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `IDX_PRODUCT_CATEGORY_PRODUCT_ID` (`product_id`),
  KEY `IDX_PRODUCT_CATEGORY_CATEGORY_ID` (`category_id`),
  CONSTRAINT `FK_PRODUCT_CATEGORY_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_CATEGORY_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

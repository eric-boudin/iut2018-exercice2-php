CREATE TABLE `product_image` (
  `product_image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `image_url_key` varchar(255) NOT NULL,
  `is_active` tinyint(1) unsigned DEFAULT '0',
  `position` int(10) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_image_id`),
  KEY `IDX_PRODUCT_IMAGE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_PRODUCT_IMAGE_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

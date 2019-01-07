CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `url_key` varchar(255) NOT NULL,
  `description` text,
  `position` int(10) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UQ_CATEGORY_URL_KEY` (`url_key`),
  KEY `IDX_CATEGORY_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_CATEGORY_CATEGORY` FOREIGN KEY (`parent_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

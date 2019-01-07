CREATE TABLE IF NOT EXISTS `cms_page` (
  `cms_page_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `url_key` VARCHAR(255) NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NOT NULL,
  `meta_title` VARCHAR(255) NULL,
  `meta_description` VARCHAR(255) NULL,
  `meta_keywords` VARCHAR(255) NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`cms_page_id`),
  UNIQUE INDEX `url_key_UNIQUE` (`url_key` ASC))
ENGINE = InnoDB DEFAULT CHARSET=utf8;
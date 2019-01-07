-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(60) NOT NULL,
  `ean` VARCHAR(13) NULL,
  `name` VARCHAR(255) NOT NULL,
  `price` DECIMAL(12,4) NOT NULL,
  `stock_qty` INT(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` TEXT NULL,
  `tva` DECIMAL(12,4) NOT NULL DEFAULT 0,
  `special_price` INT(10) UNSIGNED NULL,
  `special_price_from_date` TIMESTAMP NULL,
  `special_price_to_date` TIMESTAMP NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` INT(10) UNSIGNED NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `path` VARCHAR(255) NOT NULL,
  `level` INT(10) UNSIGNED NOT NULL,
  `position` INT(10) UNSIGNED NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`category_id`),
  INDEX `IDX_CATEGORY_PARENT_ID` (`parent_id` ASC),
  CONSTRAINT `FK_CATEGORY_CATEGORY`
    FOREIGN KEY (`parent_id`)
    REFERENCES `category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_category` (
  `product_id` INT(10) UNSIGNED NOT NULL,
  `category_id` INT(10) UNSIGNED NOT NULL,
  `position` INT(10) UNSIGNED NULL DEFAULT 0,
  INDEX `IDX_PRODUCT_CATEGORY_PRODUCT_ID` (`product_id` ASC),
  INDEX `IDX_PRODUCT_CATEGORY_CATEGORY_ID` (`category_id` ASC),
  CONSTRAINT `FK_PRODUCT_CATEGORY_PRODUCT`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_PRODUCT_CATEGORY_CATEGORY`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB CHARSET=utf8;


-- -----------------------------------------------------
-- Table `product_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(10) UNSIGNED NOT NULL,
  `image_path` VARCHAR(255) NOT NULL,
  `image_url_path` VARCHAR(255) NOT NULL,
  `is_active` TINYINT(1) UNSIGNED NULL DEFAULT 0,
  `position` INT(10) UNSIGNED NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `IDX_PRODUCT_IMAGE_PRODUCT_ID` (`product_id` ASC),
  PRIMARY KEY (`product_image_id`),
  CONSTRAINT `FK_PRODUCT_IMAGE_PRODUCT`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB CHARSET=utf8;

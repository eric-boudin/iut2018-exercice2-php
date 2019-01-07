-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(60) NOT NULL,
  `ean` VARCHAR(13) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `price` DECIMAL(12,4) NOT NULL,
  `stock_qty` INT(10) UNSIGNED NOT NULL,
  `description` TEXT NULL,
  `tva` DECIMAL(12,4) NOT NULL,
  `special_price` INT(10) UNSIGNED NULL,
  `special_price_from_date` TIMESTAMP NULL,
  `special_price_to_date` TIMESTAMP NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  `level` INT(10) UNSIGNED NOT NULL,
  `position` INT(10) UNSIGNED NULL DEFAULT 0,
  `created-at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated-at` TIMESTAMP NULL,
  PRIMARY KEY (`category_id`),
  INDEX `fk_category_category1_idx` (`parent_id` ASC),
  CONSTRAINT `fk_category_category1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `mydb`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_category` (
  `product_id` INT(10) NOT NULL,
  `category_id` INT(10) NOT NULL,
  `position` INT(10) UNSIGNED NULL DEFAULT 0,
  INDEX `fk_PRODUCT_CATEGORY_PRODUCT_idx` (`product_id` ASC),
  INDEX `fk_PRODUCT_CATEGORY_CATEGORY1_idx` (`category_id` ASC),
  CONSTRAINT `fk_PRODUCT_CATEGORY_PRODUCT`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCT_CATEGORY_CATEGORY1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` INT(10) NOT NULL,
  `image_path` VARCHAR(255) NOT NULL,
  `image_url_path` VARCHAR(255) NOT NULL,
  `is_active` TINYINT(1) UNSIGNED NULL DEFAULT 0,
  `position` INT(10) UNSIGNED NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `fk_PRODUCT_IMAGE_PRODUCT1_idx` (`product_id` ASC),
  PRIMARY KEY (`product_image_id`),
  CONSTRAINT `fk_PRODUCT_IMAGE_PRODUCT1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
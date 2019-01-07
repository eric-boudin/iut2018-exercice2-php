CREATE TABLE IF NOT EXISTS `homestead`.`quote` (
  `quote_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT(10) UNSIGNED NOT NULL,
  `grand_total` DECIMAL(12,4) NOT NULL,
  `subtotal_ind_tax` DECIMAL(12,4) NOT NULL,
  `subtotal` DECIMAL(12,4) NOT NULL,
  `discount_amount` DECIMAL(12,4) NOT NULL,
  `is_active` TINYINT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT current_timestamp,
  `updated_at` TIMESTAMP NULL,
  `coupon_code` VARCHAR(20) NULL,
  PRIMARY KEY (`quote_id`),
  UNIQUE INDEX `coupon_code_UNIQUE` (`coupon_code` ASC))
ENGINE = InnoDB
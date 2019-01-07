CREATE TABLE IF NOT EXISTS `quote` (
  `quote_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT(10) UNSIGNED NULL,
  `grand_total` DECIMAL(12,4) NOT NULL DEFAULT 0,
  `subtotal_ind_tax` DECIMAL(12,4) NOT NULL DEFAULT 0,
  `subtotal` DECIMAL(12,4) NOT NULL DEFAULT 0,
  `discount_amount` DECIMAL(12,4) NOT NULL DEFAULT 0,
  `is_active` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT current_timestamp,
  `updated_at` TIMESTAMP NULL,
  `coupon_code` VARCHAR(20) NULL,
  PRIMARY KEY (`quote_id`),
  CONSTRAINT `FK_QUOTE_CUSTOMER`
    FOREIGN KEY (`customer_id`) REFERENCES customer(`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  UNIQUE INDEX `UQ_QUOTE_COUPON_CODE` (`coupon_code` ASC))
ENGINE = InnoDB DEFAULT CHARSET=utf8;

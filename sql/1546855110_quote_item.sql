CREATE TABLE IF NOT EXISTS `quote_item` (
    `quote_item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `quote_id` INT UNSIGNED NOT NULL,
    `product_id` INT UNSIGNED NOT NULL,
    `price` DECIMAL(12, 4) UNSIGNED NOT NULL,
    `row_total` DECIMAL(12, 4) UNSIGNED NOT NULL,
    `qty` INT UNSIGNED NOT NULL,
    `sku` VARCHAR(60) NOT NULL,
    `ean` VARCHAR(13) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `tax_amount` DECIMAL(12, 4) UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    `discount_amount` DECIMAL(12, 4) UNSIGNED NOT NULL,
    `shipping_amount` DECIMAL(12, 4) UNSIGNED NOT NULL;
    `shipping_amount_include_tax` DECIMAL(12, 4) UNSIGNED NOT NULL;
    FOREIGN KEY (`quote_id`) REFERENCES quote(`quote_id`),
    FOREIGN KEY (`product_id`) REFERENCES product(`product_id`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;
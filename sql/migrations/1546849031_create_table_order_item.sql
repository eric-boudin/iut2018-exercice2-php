CREATE TABLE `order_item` (
  `order_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `quote_item_id` int(10) unsigned DEFAULT NULL,
  `sku` varchar(60) NOT NULL,
  `ean` varchar(13) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int(10) unsigned NOT NULL,
  `qty_refunded` int(10) unsigned DEFAULT '0',
  `discount_amout` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_total_incl_tax` decimal(12,4) DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `IDX_ORDER_ITEM_QUOTE_ITEM` (`quote_item_id`),
  KEY `IDX_ORDER_ITEM_ORDER` (`order_id`),
  CONSTRAINT `FK_ORDER_ITEM_ORDER` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ORDER_ITEM_QUOTE_ITEM` FOREIGN KEY (`quote_item_id`) REFERENCES `quote_item` (`quote_item_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

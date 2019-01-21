CREATE TABLE `invoice_item` (
  `invoice_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty_invoiced` int(10) unsigned NOT NULL,
  `discount_amout` decimal(12,4) DEFAULT '0.0000',
  `row_total` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `row_total_incl_tax` decimal(12,4) DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_item_id`),
  KEY `IDX_INVOICE_ITEM_INVOICE` (`invoice_id`),
  KEY `IDX_INVOICE_ITEM_ORDER_ITEM` (`order_item_id`),
  CONSTRAINT `FK_INVOICE_ITEM_INVOICE` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INVOICE_ITEM_ORDER_ITEM` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`order_item_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

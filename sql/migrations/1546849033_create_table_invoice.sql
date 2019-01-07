CREATE TABLE `invoice` (
  `invoice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `subtotal` decimal(12,4) unsigned DEFAULT '0.0000',
  `subtotal_incl_tax` decimal(12,4) unsigned DEFAULT '0.0000',
  `discount_amount` decimal(12,4) unsigned DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) unsigned DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) unsigned DEFAULT '0.0000',
  `tax_amount` decimal(12,4) unsigned DEFAULT '0.0000',
  `grand_total` decimal(12,4) unsigned DEFAULT '0.0000',
  `total_item_invoiced` int(10) unsigned DEFAULT '0',
  `total_qty_invoiced` int(10) unsigned DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `IDX_INVOICE_ORDER` (`order_id`),
  CONSTRAINT `FK_INVOICE_ORDER` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

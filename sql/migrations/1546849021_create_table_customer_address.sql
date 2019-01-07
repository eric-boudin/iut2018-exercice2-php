CREATE TABLE `customer_address` (
  `customer_address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `street_1` varchar(255) NOT NULL,
  `street_2` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country_id` char(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_address_id`),
  KEY `IDX_CUSTOMER_ADDRESS_CUSTOMER` (`customer_id`),
  CONSTRAINT `FK_CUSTOMER_ADDRESS_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

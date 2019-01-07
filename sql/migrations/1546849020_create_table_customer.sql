CREATE TABLE `customer` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `dob` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `UQ_CUSTOMER_EMAIL` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

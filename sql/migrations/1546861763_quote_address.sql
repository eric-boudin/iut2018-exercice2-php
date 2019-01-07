CREATE TABLE `quote_address`
(
    quote_adress_id INT(10) UNSIGNED NOT NULL,
    quote_id INT(10) UNSIGNED NOT NULL,
    customer_adress_id INT(10) UNSIGNED NULL,
    address_type TINYINT(1) NOT NULL,
    street_1 VARCHAR(100) NOT NULL,
    street_2 VARCHAR(100),
    postcode VARCHAR(60) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country_id CHAR(2) NOT NULL,
    PRIMARY KEY (quote_adress_id),
    CONSTRAINT fk_quote_adress_to_quote FOREIGN KEY (quote_id) REFERENCES quote(quote_id), 
    CONSTRAINT fk_quote_adress_to_custumer_adress FOREIGN KEY (customer_adress_id) REFERENCES customer_adress(customer_adress_id)
);

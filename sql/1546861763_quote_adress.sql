CREATE TABLE quote_adress
(
    quote_adress_id INT(10) NOT NULL,
    quote_id INT(10) NOT NULL,
    customer_adress_id INT(10),
    type TINYINT(1) NOT NULL,
    nb INT(5) NOT NULL,
    street_1 VARCHAR(100) NOT NULL,
    street_2 VARCHAR(100),
    postcode INT(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL,
    PRIMARY KEY (quote_adress_id),
    CONSTRAINT fk_quote_adress_to_quote FOREIGN KEY (quote_id) REFERENCES quote(quote_id), 
    CONSTRAINT fk_quote_adress_to_custumer_adress FOREIGN KEY (customer_adress_id) REFERENCES customer_adress(customer_adress_id)
);
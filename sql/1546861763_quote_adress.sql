CREATE TABLE quote_adress
(
    quote_adress_id int NOT NULL,
    quote_id int NOT NULL,
    type tinyint NOT NULL,
    
    PRIMARY KEY (quote_adress_id),
    FOREIGN KEY (quote_id) REFERENCES quote(quote_id) 
);
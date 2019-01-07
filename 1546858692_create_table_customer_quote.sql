CREATE TABLE customer
(
  customer_id INT(10) unsigned auto_increment primary key,
  firstname   VARCHAR(255) not null,
  lastname    VARCHAR(255) not null,
  email       VARCHAR(255) not null,
  gender      tinyint(1)   null,
  created_at  timestamp    DEFAULT CURRENT_TIMESTAMP
);

create table customer_address
(
  customer_address_id int unsigned auto_increment primary key,
  street_1            VARCHAR(255) not null,
  street_2            VARCHAR(255) null,
  postcode            VARCHAR(255) not null,
  city                VARCHAR(255) not null,
  country             VARCHAR(255) not null,
  firstname           VARCHAR(255) null,
  lastname            VARCHAR(255) null,
  customer_id         INT(10) unsigned null,
  constraint customer_address_customer_customer_id_fk
    foreign key (customer_id) references customer (customer_id)
);

create table order_item
(
  order_item_id  INT(10) UNSIGNED auto_increment primary key,
  qty_ordered    int(10) UNSIGNED                        not null,
  qty_refunded   int(10) UNSIGNED                        not null,
  quote_item_id  int(10) UNSIGNED                        not null,
  price          decimal(12, 4)                      not null,
  raw_total      int(10)                             not null,
  sku            VARCHAR(60)                         not null,
  ean            VARCHAR(13)                         null,
  name           VARCHAR(255)                        not null,
  tax_amount     decimal(12, 4)                      not null,
  created_at     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
  updated_at     timestamp                           null,
  discount_amout decimal(12, 4)                      null,
  constraint order_item_quote_item_fk
    foreign key (quote_item_id) references quote_item (quote_item_id)
);

create table `order`
(
  customer_id       int unsigned                        null,
  order_id          int unsigned auto_increment
    primary key,
  quote_id          int unsigned                        null,
  shipping          decimal(12, 4)                      null,
  shipping_tax      decimal(12, 4)                      null,
  order_item_id     int unsigned                        not null,
  grand_total       decimal(12, 4)                      not null,
  subtotal_incl_tax decimal(12, 4)                      not null,
  subtotal          decimal(12, 4)                      not null,
  discount_amount   decimal(12, 4)                      not null,
  is_active         tinyint(1)                          not null,
  created_at        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
  constraint order_customer_fk
    foreign key (customer_id) references customer (customer_id),
  constraint order_order_item_fk
    foreign key (order_item_id) references order_item (order_item_id),
  constraint order_quote_fk
    foreign key (quote_id) references quote (quote_id)
);

create table credit_memo
(
  credit_memo_id    int unsigned auto_increment
    primary key,
  order_id          int unsigned                        not null,
  customer_id       int unsigned                        null,
  quote_id          int unsigned                        null,
  shipping          decimal(12, 4)                      null,
  shipping_tax      decimal(12, 4)                      null,
  order_item_id     int unsigned                        not null,
  grand_total       decimal(12, 4)                      not null,
  subtotal_incl_tax decimal(12, 4)                      not null,
  subtotal          decimal(12, 4)                      not null,
  discount_amount   decimal(12, 4)                      not null,
  is_active         tinyint(1)                          not null,
  created_at        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
  constraint credit_memo_customer_fk
    foreign key (customer_id) references customer (customer_id),
  constraint credit_memo_order_fk
    foreign key (order_id) references `order` (order_id),
  constraint credit_memo_order_item_fk
    foreign key (order_item_id) references order_item (order_item_id),
  constraint credit_memo_quote_fk
    foreign key (quote_id) references quote (quote_id)
);

create table credit_memo_item
(
  credit_memo_item_id int unsigned auto_increment
    primary key,
  order_item_id       int unsigned                        not null,
  credit_memo_id      int unsigned                        not null,
  qty_ordered         int unsigned                        not null,
  qty_refunded        int unsigned                        not null,
  quote_item_id       int unsigned                        not null,
  price               decimal(12, 4)                      not null,
  raw_total           int(10)                             not null,
  sku                 varchar(60)                         not null,
  ean                 varchar(13)                         null,
  name                varchar(255)                        not null,
  tax_amount          decimal(12, 4)                      not null,
  created_at          timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
  updated_at          timestamp                           null,
  discount_amout      decimal(12, 4)                      null,
  constraint credit_memo_item_credit_memo_fk
    foreign key (credit_memo_id) references credit_memo (credit_memo_id),
  constraint credit_memo_item_order_item_fk
    foreign key (order_item_id) references order_item (order_item_id),
  constraint credit_memo_item_quote_item_fk
    foreign key (quote_item_id) references quote_item (quote_item_id)
);

create table invoice
(
  invoice_id        int unsigned auto_increment
    primary key,
  order_id          int unsigned                        not null,
  customer_id       int unsigned                        null,
  quote_id          int unsigned                        null,
  shipping          decimal(12, 4)                      null,
  shipping_tax      decimal(12, 4)                      null,
  order_item_id     int unsigned                        not null,
  grand_total       decimal(12, 4)                      not null,
  subtotal_incl_tax decimal(12, 4)                      not null,
  subtotal          decimal(12, 4)                      not null,
  discount_amount   decimal(12, 4)                      not null,
  is_active         tinyint(1)                          not null,
  created_at        timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
  constraint invoice_customer_fk
    foreign key (customer_id) references customer (customer_id),
  constraint invoice_order_fk
    foreign key (order_id) references `order` (order_id),
  constraint invoice_order_item_fk
    foreign key (order_item_id) references order_item (order_item_id),
  constraint invoice_quote_fk
    foreign key (quote_id) references quote (quote_id)
);

create table invoice_item
(
  invoice_item_id int unsigned auto_increment
    primary key,
  order_item_id   int unsigned not null,
  invoice_id      int unsigned not null,
  constraint invoice_item_invoice_fk
    foreign key (invoice_id) references invoice (invoice_id),
  constraint invoice_item_order_item_fk
    foreign key (order_item_id) references order_item (order_item_id)
);

create table order_address
(
  order_id         int unsigned not null,
  quote_address_id int unsigned not null,
  street_1         varchar(255) not null,
  street_2         varchar(255) null,
  postcode         varchar(255) not null,
  city             varchar(255) not null,
  country          varchar(255) not null,
  firstname        varchar(255) null,
  lastname         varchar(255) null,
  customer_id      int unsigned null,
  primary key (order_id, quote_address_id),
  constraint order_address_customer_customer_id_fk
    foreign key (customer_id) references customer (customer_id),
  constraint order_address_order_fk
    foreign key (order_id) references `order` (order_id),
  constraint order_address_quote_address_fk
    foreign key (quote_address_id) references quote_address (quote_address_id)
);
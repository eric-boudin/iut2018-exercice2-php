<?php
namespace Entity;

class Product
{
    use DbEntity;

    public static $table = 'product';

    public $product_id;
    public $sku;
    public $ean;
    public $name;
    public $price;
    public $stock_qty;
    public $description;
    public $tva;
    public $special_price;
    public $special_price_from_date;
    public $special_price_to_date;
}

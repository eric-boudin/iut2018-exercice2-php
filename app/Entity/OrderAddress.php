<?php
namespace Entity;

class OrderAddress extends Entity
{
    public static $table = 'order_address';
    public static $primaryKey = 'order_address_id';

    public $order_address_id;
    public $order_id;
    public $quote_address_id;
    public $customer_address_id;
    public $firstname;
    public $lastname;
    public $street_1;
    public $street_2;
    public $postcode;
    public $city;
    public $region;
    public $country;
    public $created_at;
    public $updated_at;

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    public function quoteAddress()
    {
        return $this->belongsTo(QuoteAddress::class, 'quote_address_id');
    }

    public function customerAddress()
    {
        return $this->belongsTo(CustomerAddress::class, 'customer_address_id');
    }

}
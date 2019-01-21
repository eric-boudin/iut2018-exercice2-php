<?php
namespace Entity;

class QuoteAddress extends Entity
{
    public static $table = 'quoteaddress';
    public static $primaryKey = 'quote_address_id';

    public $quote_address_id;
    public $quote_id;
    public $customer_address_id;
    public $address_type;
    public $firstname;
    public $lastname;
    public $street_1;
    public $street_2;
    public $postcode;
    public $city;
    public $region;
    public $country_id;
    public $created_id;
    public $updated_at;

    public function quote()
    {
        return $this->belongsTo(Quote::class, 'quote_id');
    }

    public function customerAddress()
    {
        return $this->belongsTo(CustomerAddress::class, 'customer_address_id');
    }
}

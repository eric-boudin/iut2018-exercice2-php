<?php
namespace App\Entity;

class CustomerAddress extends Entity
{
    public static $table = 'customer_address';
    public static $primaryKey = 'customer_address_id';

    public $customer_address_id;
    public $customer_id;
    public $firstname;
    public $lastname;
    public $street_1;
    public $street_2;
    public $postcode;
    public $city;
    public $region;
    public $country_id;
    public $created_at;
    public $updated_at;

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }
}

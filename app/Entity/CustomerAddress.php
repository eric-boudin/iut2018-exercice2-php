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

    public function toArray(): array
    {
        return [
            'customer_address_id' => $this->customer_address_id,
            'customer_id' => $this->customer_id,
            'firstname' => $this->firstname,
            'lastname' => $this->lastname,
            'street_1' => $this->street_1,
            'street_2' => $this->street_2,
            'postcode' => $this->postcode,
            'city' => $this->city,
            'region' => $this->region,
            'country_id' => $this->country_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}

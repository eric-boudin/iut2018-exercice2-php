<?php
namespace App\Entity;

class Customer extends Entity
{
    public static $table = 'customer';
    public static $primaryKey = 'customer_id';

    public $customer_id;
    public $email;
    public $firstname;
    public $lastname;
    public $gender;
    public $dob;
    public $password;
    public $created_at;
    public $updated_at;
}

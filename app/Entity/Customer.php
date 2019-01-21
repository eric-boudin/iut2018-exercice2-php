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

    public function toArray() : array
    {
        return [
            'customer_id' => $this->customer_id,
            'email' => $this->email,
            'firstname' => $this->firstname,
            'lastname' => $this->lastname,
            'gender' => $this->gender,
            'dob' => $this->dob,
            'password' => $this->password,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}

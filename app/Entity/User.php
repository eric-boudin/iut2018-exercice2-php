<?php
namespace Entity;

class User
{
    use DbEntity;

    public $user_id;
    public $email;
    public $password;
    public $created_at;
}

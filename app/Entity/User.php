<?php
namespace Entity;

class User
{
    use DbEntity;

    public static $table = 'user';

    public $user_id;
    public $email;
    public $password;
    public $created_at;
}

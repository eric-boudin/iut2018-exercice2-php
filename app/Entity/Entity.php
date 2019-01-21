<?php

namespace App\Entity;

abstract class Entity
{
    use DbEntity;

    public static $table;
    public static $primaryKey = 'id';
}

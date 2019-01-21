<?php
namespace App\Entity;

class Cms extends Entity
{
    public static $table = 'cms';
    public static $primaryKey = 'cms_id';

    public $cms_id;
    public $url_key;
    public $title;
    public $content;
    public $meta_title;
    public $meta_description;
    public $meta_keywords;
    public $created_at;
    public $updated_at;
}

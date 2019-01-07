<?php
namespace Entity;

class Cms
{
    use DbEntity;

    public static $table = 'cms';

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

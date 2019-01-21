<?php
namespace Entity;

class Category
{
    use DbEntity;

    public static $table = 'category';

    public $category_id;
    public $parent_id;
    public $name;
    public $description;
    public $path;
    public $level;
    public $position;
    public $created_at;
    public $updated_at;

    public function category()
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }
}

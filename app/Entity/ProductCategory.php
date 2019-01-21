<?php
namespace Entity;

class ProductCategory
{
    use DbEntity;

    public static $table = 'product_category';

    public $product_id;
    public $category_id;
    public $position;
    
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}

<?php
namespace Entity;

class ProductImage
{
    use DbEntity;

    public static $table = 'product_image';

    public $product_image_id;
    public $product_id;
    public $image_path;
    public $image_url_path;
    public $is_active;
    public $position;
    public $created_at;
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}

<?php
namespace Entity;

class QuoteItem
{
    use DbEntity;

    public static $table = 'quote_item';
    public static $primaryKey = 'quote_item_id';

    public $quote_item_id;
    public $quote_id;
    public $product_id;
    public $sku;
    public $ean;
    public $name;
    public $price;
    public $qty;
    public $discount_amount;
    public $row_total;
    public $tax_amount;
    public $row_total_incl_tax;
    public $created_at;
    public $updated_at;

    public function quote()
    {
        return $this->belongsTo(Quote::class, 'quote_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}

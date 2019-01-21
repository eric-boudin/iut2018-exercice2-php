<?php
namespace Entity;

class OrderItem extends Entity
{
    public static $table = 'oder_item';
    public static $primaryKey = 'oder_item_id';

    public $order_item_id;
    public $order_id;
    public $quote_item_id;
    public $sku;
    public $ean;
    public $name;
    public $price;
    public $qty_ordered;
    public $qty_refunded;
    public $discount_amout;
    public $row_total;
    public $tax_amount;
    public $row_total_incl_tax;
    public $created_at;
    public $updated_at;

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    public function quoteItem()
    {
        return $this->belongsTo(quoteItem::class, 'quote_item_id');
    }
}

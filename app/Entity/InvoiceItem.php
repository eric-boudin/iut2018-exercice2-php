<?php
namespace Entity;

class InvoiceItem extends Entity
{
    public static $table = 'invoice_item';
    public static $primaryKey = 'invoice_item_id';

    public $invoice_item_id;
    public $order_item_id;
    public $qty_invoiced;
    public $discount_amout;
    public $row_total;
    public $created_at;
    public $updated_at;

    public function orderItem()
    {
        return $this->belongsTo(Order::class, 'order_item_id');
    }
}

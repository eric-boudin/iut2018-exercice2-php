<?php
namespace Entity;

class Invoice extends Entity
{
    public static $table = 'invoice';
    public static $primaryKey = 'invoice_id';

    public $invoice_id;
    public $order_id;
    public $subtotal;
    public $subtotal_incl_tax;
    public $discount_amount;
    public $shipping_amount;
    public $shipping_amount_incl_tax;
    public $tax_amount;
    public $grand_total;
    public $total_item_invoiced;
    public $total_qty_invoiced;
    public $created_at;
    public $updated_at;

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }
}

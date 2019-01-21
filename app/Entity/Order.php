<?php
namespace Entity;

class Order extends Entity
{
    public static $table = 'oder';
    public static $primaryKey = 'oder_id';

    public $order_id;
    public $quote_id;
    public $customer_id;
    public $subtotal;
    public $subtotal_incl_tax;
    public $discount_amount;
    public $shipping_amount;
    public $shipping_amount_incl_tax;
    public $tax_amount;
    public $grand_total;
    public $total_item_ordered;
    public $total_qty_ordered;
    public $coupon_code;
    public $shipping_method;
    public $payment_method;
    public $created_at;
    public $updated_at;

    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    public function quote()
    {
        return $this->belongsTo(Quote::class, 'quote_id');
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'item_count',
        'order_status',
        'order_total',
        'order_discount',
        'order_courier',
        'order_payment_method',
        'order_delivery_address',
    ];
}

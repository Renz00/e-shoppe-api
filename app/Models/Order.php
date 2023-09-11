<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

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

    public function user(){
        return $this->belongsTo(User::class);
    }

}

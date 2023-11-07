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
        'order_sub_total',
        'order_grand_total',
        'order_voucher',
        'order_discount',
        'order_courier',
        'order_shipping_price',
        'order_payment_method',
        'order_delivery_address',
        'order_eta'
    ];

    public function user(){
        return $this->belongsTo(User::class, 'id');
    }
    
    // public function status(){
    //     return $this->hasOne(Status::class, 'id');
    // }

    // public function courier(){
    //     return $this->hasOne(Courier::class, 'id');
    // }

    // public function payment(){
    //     return $this->hasOne(Payment::class, 'id');
    // }
}

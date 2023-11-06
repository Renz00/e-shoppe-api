<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->cascadeOnDelete();
            $table->integer('item_count');
            $table->foreignId('order_status');
            $table->float('order_grand_total', 8, 2);
            $table->float('order_sub_total', 8, 2);
            $table->float('order_discount', 8, 2);
            $table->float('order_shipping_price', 8, 2);
            $table->foreignId('order_courier');
            $table->foreignId('order_payment_method');
            $table->text('order_delivery_address');
            $table->date('order_eta');
            $table->boolean('order_is_cancelled')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
};

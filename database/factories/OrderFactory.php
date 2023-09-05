<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            // 'user_id' => fake()->name(),
            // 'item_count' => fake()->paragraph(),
            // 'order_status' => fake()->randomDigit(),
            // 'order_total' => fake()->randomDigit(),
            // 'order_discount' => '3',
            // 'order_courier' => '3',
            // 'order_payment_method' => '3',
            // 'order_delivery_address' => fake()->paragraph(),
        ];
    }
}

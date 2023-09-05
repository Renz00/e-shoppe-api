<?php

namespace Database\Factories;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'product_name' => fake()->sentence(),
            'product_description' => fake()->paragraph(),
            'product_price' => fake()->randomDigit(),
            'product_discount' => fake()->randomDigit(),
            'product_rating' => '1',
            //'product_category' => '1' // Gadgets
            //'product_category' => '2' // Cosmetics
            'product_category' => '3' // Apparel
        ];
    }
}

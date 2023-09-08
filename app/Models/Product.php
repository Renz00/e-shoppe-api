<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Product extends Model
{
    use HasFactory, Searchable;

    public function toSearchableArray()
    {
        return [
            "product_name" => $this->product_name,
            "product_description" => $this->product_description,
        ];
    }
}

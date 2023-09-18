<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;
use Laravel\Scout\Attributes\SearchUsingPrefix;

class Product extends Model
{
    use HasFactory, Searchable;

    #[SearchUsingPrefix(['product_name'])]

    public function toSearchableArray()
    {
        return [
            "product_name" => $this->product_name
        ];
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;

class ProductSeeder extends Seeder
{
    public function run()
    {
        Product::create(['name' => 'Product 1', 'image' => 'produk1.jpg', 'price' => 10.00]);
        Product::create(['name' => 'Product 2', 'image' => 'produk2.jpg', 'price' => 20.00]);
        Product::create(['name' => 'Product 3', 'image' => 'produk3.jpg', 'price' => 30.00]);
        Product::create(['name' => 'Product 4', 'image' => 'produk4.jpg', 'price' => 40.00]);
    }
}


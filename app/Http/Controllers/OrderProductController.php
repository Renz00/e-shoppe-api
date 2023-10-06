<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Order_Product;
use Illuminate\Support\Facades\DB;

class OrderProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     * 
     * @param  Object $storedOrder
     * @param  Array $order_products
     * @return Boolean
     */
    public function store($storedOrder, $order_products)
    {
        $resultCount = 0;

        foreach ($order_products as $product) {
            // try {
                $result = Order_Product::create([
                    'order_id' => $storedOrder->id,
                    'product_id' => $product['id'],
                    'product_price' => $product['price'],
                    'product_discount' => $product['discount'],
                    'total_price' => $product['total_price'],
                    'count' => $product['count']
                ]);

                switch ($result){
                    case true:
                        $resultCount++;
                        break;
                    default:
                        break;
                }

            // } catch (\Exception $e) {
            //     return response()->json(['message' => 'An error occurred. #1-2'], 500);
            // }
        }
        
        if ($resultCount == count($order_products)){
            return true;
        }
        else {
            return false;
        }
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $orderId
     * @return \Illuminate\Http\Response
     */
    public function show($orderId)
    {
        $order_products = DB::table('order__products')
        ->where('order__products.order_id', '=', $orderId)
        ->leftJoin('products', 'order__products.product_id', '=', 'products.id')
        ->leftJoin('categories', 'products.product_category', '=', 'categories.id')
        ->select('order__products.id', 'order__products.order_id', 'order__products.product_id', 'order__products.count', 
        'order__products.product_discount', 'order__products.product_price', 'order__products.total_price', 
        'products.product_name', 'products.product_category', 'categories.category_name')
        ->get();

        return $order_products;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Object $orderId
     * @param  Array $order_products
     * @return Boolean
     */
    public function update($order, $order_products)
    {
        //Delete all existing order products
        Order_Product::where('order_id', $order->id)->delete();
        //Store new order products
        $result = $this->store($order, $order_products);
        
        return $result;
    }
}

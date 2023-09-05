<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::all();
        return response()->json($orders);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $storedOrder = Order::create([
            'user_id' => $request->input('id'),
            'item_count' => $request->input('count'),
            'order_status' => $request->input('status'),
            'order_total' => $request->input('total'),
            'order_discount' => $request->input('discount'),
            'order_courier' => $request->input('courier'),
            'order_payment_method' => $request->input('payment_method'),
            'order_delivery_address' => $request->input('delivery_address'),
        ]);

        return response()->json($storedOrder);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        return response()->json($order);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        $result = Order::where('id', $order->id)
            ->update([
                'user_id' => $request->input('id'),
                'item_count' => $request->input('count'),
                'order_status' => $request->input('status'),
                'order_total' => $request->input('total'),
                'order_discount' => $request->input('discount'),
                'order_courier' => $request->input('courier'),
                'order_payment_method' => $request->input('payment_method'),
                'order_delivery_address' => $request->input('delivery_address'),
            ]);

        return response()->json($result);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        $result = Order::destroy($order->id);
        return response()->json($result);
    }
}

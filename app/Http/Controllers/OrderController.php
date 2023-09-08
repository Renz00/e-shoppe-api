<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\OrderProductController;

class OrderController extends Controller
{

    protected $OrderProductController;

    public function __construct(OrderProductController $OrderProductController)
    {
        $this->OrderProductController = $OrderProductController;
    }

    /**
     * Display a listing of the resource.
     * @param Int $status
     * @return \Illuminate\Http\Response
     */
    public function fetchOrders($status)
    {
        $orders = Order::where('order_status', $status)->paginate(12);
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
        // try {
            //Will return the data of the stored order
            $storedOrder = Order::create([
                'user_id' => $request->input('order')['id'],
                'item_count' => $request->input('order')['count'],
                'order_status' => $request->input('order')['status'],
                'order_total' => $request->input('order')['total'],
                'order_discount' => $request->input('order')['discount'],
                'order_courier' => $request->input('order')['courier'],
                'order_payment_method' => $request->input('order')['payment_method'],
                'order_delivery_address' => $request->input('order')['delivery_address'],
            ]);

            $result = $this->OrderProductController->store($storedOrder, $request->input('order_products'));

            if ($result == true){
                return response()->json(["order" => $storedOrder, "order_products" => $request->input('order_products')]);
            }
            else {
                return response()->json(['message' => 'An error occurred while saving. #1-2'], 500);
            }

        // } catch (\Exception $e) {
        //     return response()->json(['message' => 'An error occurred while saving. #1-1'], 500);
        // }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        $order_products = $this->OrderProductController->show($order->id);
        return response()->json(["order" => $order, "order_products" => $order_products]);
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
        // try{
            //Will return a boolean of the result
            $updateResult = $order->update([
                'user_id' => $request->input('order')['id'],
                'item_count' => $request->input('order')['count'],
                'order_status' => $request->input('order')['status'],
                'order_total' => $request->input('order')['total'],
                'order_discount' => $request->input('order')['discount'],
                'order_courier' => $request->input('order')['courier'],
                'order_payment_method' => $request->input('order')['payment_method'],
                'order_delivery_address' => $request->input('order')['delivery_address'],
            ]);

            $result = $this->OrderProductController->update($order, $request->input('order_products'));

            if ($result == true && $updateResult == true){
                return response()->json(["order" => $request->input('order'), "order_products" => $request->input('order_products')]);
            }
            else {
                return response()->json(['message' => 'An error occurred while updating. #1-2'], 500);
            }

        // }
        // catch (\Exception $e){
        //     return response()->json(['message' => 'An error occurred while updating. #1-1'], 500);
        // }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        $deletedResult = Order::destroy($order->id);

        if ($deletedResult == true){
            return response()->json(["result" => $deletedResult]);
        }
        else {
            return response()->json(['message' => 'An error occurred while deleting. #1-1'], 500);
        }

    }
}

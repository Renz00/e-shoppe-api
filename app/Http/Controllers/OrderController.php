<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\OrderProductController;

class OrderController extends Controller
{
    private $pages;
    protected $OrderProductController;

    public function __construct(OrderProductController $OrderProductController)
    {
        $this->OrderProductController = $OrderProductController;
        $this->pages = 12;
        // //Will check the OrderPolicy.php for authorization
        // //for all methods using the Order model
        // $this->authorizeResource(Order::class);

    }

    public function index(){
        $orders = Order::all();
        return response()->json(['orders' => $orders]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->order, [
            'user_id' => ['required', 'numeric'],
            'item_count' => ['required', 'numeric'],
            'status' => ['required', 'numeric'],
            'grand_total' => ['required', 'numeric'],
            'sub_total' => ['required', 'numeric'],
            'discount' => ['required', 'numeric']
        ]);

         //Validate form data
         if($validator->fails()){
            return response()->json(['errors'=>$validator->messages()]);
         }

        // try {
            //Will return the data of the stored order
            $storedOrder = Order::create([
                'user_id' => $request->order['user_id'],
                'item_count' => $request->order['item_count'],
                'order_status' => $request->order['status'],
                'order_sub_total' => $request->order['sub_total'],
                'order_grand_total' => $request->order['grand_total'],
                'order_voucher' => $request->order['voucher'],
                'order_discount' => $request->order['discount'],
                'order_courier' => $request->order['courier'],
                'order_shipping_price' => $request->order['shipping_price'],
                'order_payment_method' => $request->order['payment_method'],
                'order_delivery_address' => $request->order['delivery_address'],
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
     * @param Int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {   
        $order = Order::where('id', $id)->get();
        $order_products = $this->OrderProductController->show($id);
        return response()->json(["order" => $order, "order_products" => $order_products]);
    }

    /**
     * Display orders of current user.
     * @param String $user_status
     * @return \Illuminate\Http\Response
     */
    public function userOrders($order_status)
    {   
        $user_id = session()->get('user_id');
        $status = Str::replace('-', ' ', $order_status);
        switch ($status){
            case 'packing':
                $status = 1;
                break;
            case 'in transit':
                $status = 2;
                break;
            case 'arrived':
                $status = 3;
                break;
            case 'cancelled':
                $status = 4;
                break;
            default:
                $status = 1;
                break;  
        }

        $order = DB::table('orders')
        ->where('orders.user_id', '=', $user_id)
        ->where('orders.order_status', $status)
        ->leftJoin('statuses', 'orders.order_status', '=', 'statuses.id')
        ->orderBy('orders.id', 'asc')
        ->paginate($this->pages);

        return response()->json(["order" => $order]);
    }

    /**
     * Update order
     * @param Int $id
     * @return \Illuminate\Http\Response
     */
    public function cancelOrder($id)
    {   
        $order = Order::find($id);
 
        $order->order_is_cancelled = true;
        $order->order_status = 4; // 4 means cancelled
        $order->save();

        if ($order->first()){
            return response()->json(["result" => true]);
        }
        else {
            return response()->json(["result" => false]);
        }

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
                'user_id' => $request->order['id'],
                'item_count' => $request->order['count'],
                'order_status' => $request->order['status'],
                'order_total' => $request->order['total'],
                'order_discount' => $request->order['discount'],
                'order_courier' => $request->order['courier'],
                'order_payment_method' => $request->order['payment_method'],
                'order_delivery_address' => $request->order['delivery_address'],
            ]);

            $result = $this->OrderProductController->update($order, $request->order_products);

            if ($result == true && $updateResult == true){
                return response()->json(["order" => $request->order, "order_products" => $request->order_products]);
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
            return response()->json(["deleted" => true]);
        }
        else {
            return response()->json(['message' => 'An error occurred while deleting. #1-1'], 500);
        }

    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Favourite;
use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    // protected $limit;

    // public function __construct()
    // {
    //     $this->limit = 12;
    // }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::orderBy('product_rating', 'DESC')->limit(12)->get();

        return response()->json(["products" => $products]);
    }

    public function loadMore($limit){
        $products = Product::orderBy('product_rating', 'DESC')->limit($limit)->get();
        return response()->json(["products" => $products]);
    }

    public function paginatedProducts(){
        $products = Product::orderBy('product_rating', 'DESC')->paginate(12);
        return response()->json(["products" => $products]);
    }

    /**
     * Fetch filtered products.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function filterProducts(Request $request)
    {
        Validator::make($request->all(), [
            'category' => 'required',
            'rating' => 'required',
            'min_price' => 'required|numeric|min:1',
            'max_price' => 'required|numeric|min:1'
        ])->validate();

        $products = Product::whereIn('product_category', $request->category)
        ->whereIn('product_rating', $request->rating)
        ->whereBetween('product_price', [$request->min_price, $request->max_price])
        ->paginate(12);

        return response()->json(["products" => $products]);
    }

    /**
     * Search a product using product_name and product_description.
     *
     * @param  String $search_slug
     * @return \Illuminate\Http\Response
     */
    public function searchProducts($search_slug)
    {
        $searchText = Str::replace('-', ' ', $search_slug);
        $searchResult = Product::search($searchText)->paginate(12);

        if ($searchResult){
            return response()->json(["products" => $searchResult]);
        }
        else {
            return response()->json(['message' => 'No results found.']);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {   
        //If product is favourite of user, add isFavourite to product array
        if (session()->has('user_id')){
            $favourite = Favourite::where('user_id', session('user_id'))->where('product_id', $product->id)->get();
            if (count($favourite)>0){
                //pushing a key value pair in product array
                $product['isFavourite'] = true;
            }
            else {
                $product['isFavourite'] = false;
            }
        }
        return response()->json(["products" => $product]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }
}

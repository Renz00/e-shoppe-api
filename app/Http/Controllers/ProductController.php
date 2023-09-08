<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::latest()->paginate(12);

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
        // try {
            $validateFilter = $request->validate([
                'category' => 'required',
                'rating' => 'required',
                'min_price' => 'required|numeric|max:500000|min:0',
                'max_price' => 'required|numeric|max:500000|min:0'
            ]);
        // }
        // catch (\Exception $e){
        //     return response()->json($e);
        // }
        
        $products = Product::whereIn('product_category', $request->input('category'))
        ->whereIn('product_rating', $request->input('rating'))
        ->whereBetween('product_price', [$request->input('min_price'), $request->input('max_price')])
        ->get();

        return response()->json(["products" => $products]);
    }

    /**
     * Search a product using product_name and product_description.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function searchProduct($search_text)
    {
        $searchResult = Product::search($search_text)->get();

        if (count($searchResult)>0){
            return response()->json(["search_result" => $searchResult])->paginate(12);
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

<?php

namespace App\Http\Controllers;

use App\Models\Favourite;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FavouriteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $favourites = Favourite::where('user_id', auth()->user())
        ->orderBy('id', 'DESC')
        ->paginate(12);

        return response()->json(["favourites" => $favourites]);
    }

    /**
     * Fetch filtered products.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function sortFavourites(Request $request)
    {
            $validator = Validator::make($request->all(), [
                'sort' => 'required|string|max:50'
            ]);

            if($validator->fails()){
                return response()->json(['errors'=>$validator->messages()]);
             }
        
        switch ($request->input('sort')){
            case 'asc':
                $favourites = Favourite::where('user_id', auth()->user())
                ->orderBy('id', 'ASC')
                ->paginate(12);
                break;
            case 'desc':
                $favourites = Favourite::where('user_id', auth()->user())
                ->orderBy('id', 'DESC')
                ->paginate(12);
                break;
            default:
                break;
        }

        return response()->json(["favourites" => $favourites]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $fav = Favourite::where('user_id', $request->user_id)
        ->where('product_id', $request->product_id)->get();
        if (count($fav)<=0 ){
            $storedFavourite = Favourite::create([
                "user_id" => $request->user_id,
                "product_id" => $request->product_id,
            ]);
    
            if ($storedFavourite){
                return response()->json(['favourite' => $storedFavourite]);
            }
            else {
                return response()->json(['message' => 'Error occured while storing favourite. #1-2'], 500);
            }
        }
        else {
            $deletedResult = Favourite::where('user_id', $request->user_id)
            ->where('product_id', $request->product_id)->delete();
            if ($deletedResult == 1){
                return response()->json(['deleted' => true]);
            }
            else {
                return response()->json(['message' => 'Error occured while storing favourite. #1-1'], 500);
            } 
        }  
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Favourite  $favourite
     * @return \Illuminate\Http\Response
     */
    public function show(Favourite $favourite)
    {
        return response()->json(['favourite' => $favourite]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Favourite  $favourite
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Favourite $favourite)
    {
        $updatedFavourite = $favourite->update([
            "user_id" => $request->user_id,
            "product_id" => $request->product_id,
        ]);

        if ($updatedFavourite == true){
            return response()->json(['favourite' => $request]);
        }
        else {
            return response()->json(['message' => 'Error occured while updating favourite. #1-1'], 500);
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Favourite  $favourite
     * @return \Illuminate\Http\Response
     */
    public function destroy(Favourite $favourite)
    {
        $result = $favourite->delete();

        if ($result == true){
            return response()->json(['result' => $result]);
        }
        else {
            return response()->json(['message' => 'Error occured while deleting favourite. #1-1'], 500);
        }

    }
}

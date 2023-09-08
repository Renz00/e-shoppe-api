<?php

namespace App\Http\Controllers;

use App\Models\Favourite;
use Illuminate\Http\Request;

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
        try {
            $validateFilter = $request->validate([
                'sort' => 'required|string|max:50'
            ]);
        }
        catch (\Exception $e){
            return response()->json($e);
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
        $storedFavourite = Favourite::create([
            "user_id" => $request->input('user_id'),
            "product_id" => $request->input('product_id'),
        ]);

        if (count($storedFavourite)>0){
            return response()->json(['favourite' => $storedFavourite]);
        }
        else {
            return response()->json(['message' => 'Error occured while storing favourite. #1-1'], 500);
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
            "user_id" => $request->input('user_id'),
            "product_id" => $request->input('product_id'),
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

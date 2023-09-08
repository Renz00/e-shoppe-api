<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\FavouriteController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::prefix('/v1')->group(function () {

    Route::resource('products', ProductController::class);
    Route::get('/products/{search_text}', [ProductController::class, 'searchProducts']);
    Route::post('/products/filter', [ProductController::class, 'filterProducts']);

    Route::resource('orders', OrderController::class);
    Route::get('orders/status/{status}', [OrderController::class, 'fetchOrders']);

    Route::resource('users', UserController::class);

    Route::resource('/favourites', FavouriteController::class);
    Route::post('/favourites/sort', [FavouriteController::class, 'sortFavourites']);
 
});

Route::prefix('/auth')->group(function () {
    Route::post('login', LoginController::class);
    Route::post('register', RegisterController::class);
    Route::post('logout', LogoutController::class)->middleware('auth:sanctum');
});


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

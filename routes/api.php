<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\FavouriteController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Auth\TokenController;
use App\Http\Controllers\Auth\RegisterController;

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

//Product Routes
Route::resource('products', ProductController::class);
Route::get('/products/load-more/{limit}', [ProductController::class, 'loadMore'])->name('loadmore.products');
Route::get('/products/fetch/paginated', [ProductController::class, 'paginatedProducts'])->name('paginated.products');
Route::get('/products/search-products/{search_slug}', [ProductController::class, 'searchProducts'])->name('search.products');
Route::post('/products/filter', [ProductController::class, 'filterProducts'])->name('filter.products');

//Order Routes
Route::post('orders/store', [OrderController::class, 'store'])->name('store.orders')->middleware('auth:sanctum');
Route::get('orders/{id}', [OrderController::class, 'show'])->name('show.orders')->middleware('auth:sanctum');
Route::get('orders/cancel/{id}', [OrderController::class, 'cancelOrder'])->name('cancel.orders')->middleware('auth:sanctum');
Route::get('orders/status/{order_status}', [OrderController::class, 'userOrders'])->name('user.orders')->middleware('auth:sanctum');
Route::post('orders/sort', [OrderController::class, 'sortOrders'])->name('sort.orders')->middleware('auth:sanctum');


//User Routes
Route::resource('users', UserController::class)->middleware('auth:sanctum');

//Favourite Routes
Route::get('/favourites', [FavouriteController::class, 'index'])->name('index.favourites')->middleware('auth:sanctum');
Route::post('/favourites/sort', [FavouriteController::class, 'sortFavourites'])->name('sort.favourites')->middleware('auth:sanctum');
Route::post('/favourites/store', [FavouriteController::class, 'store'])->name('store.favourites')->middleware('auth:sanctum');


Route::prefix('/auth')->group(function () {
    Route::post('login', LoginController::class);
    Route::post('register', RegisterController::class);
    Route::post('logout', LogoutController::class)->middleware('auth:sanctum');
    Route::post('verify', TokenController::class)->middleware('auth:sanctum');
});

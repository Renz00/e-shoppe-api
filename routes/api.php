<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\FavouriteController;
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
    Route::get('/products/load-more/{limit}', [ProductController::class, 'loadMore'])->name('loadmore.products');
    Route::get('/products/fetch/paginated', [ProductController::class, 'paginatedProducts'])->name('paginated.products');
    Route::get('/search-products/{search_slug}', [ProductController::class, 'searchProducts'])->name('search.products');
    Route::post('/products/filter', [ProductController::class, 'filterProducts'])->name('filter.products');

    Route::resource('orders', OrderController::class)->middleware('auth:sanctum');
    Route::get('orders/status/{status}', [OrderController::class, 'fetchOrders'])->name('fetch.orders')->middleware('auth:sanctum');

    Route::resource('users', UserController::class)->middleware('auth:sanctum');

    Route::resource('/favourites', FavouriteController::class)->middleware('auth:sanctum');
    Route::post('/favourites/sort', [FavouriteController::class, 'sortFavourites'])->name('sort.favourites')->middleware('auth:sanctum');

});

Route::prefix('/auth')->group(function () {
    Route::post('login', LoginController::class);
    Route::post('register', RegisterController::class);
    Route::post('logout', LogoutController::class)->middleware('auth:sanctum');
});

<?php

use App\Http\Controllers\Admin\AuthenticatedSessionController;
use App\Http\Controllers\Admin\DashboardController as AdminDashboardController;
use App\Http\Controllers\Admin\OrderController as AdminOrderController;
use App\Http\Controllers\Admin\RegisteredAdminController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PaymentController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('cart', [CartController::class, 'cartList'])->name('cart.list');
Route::post('cart', [CartController::class, 'addToCart'])->name('cart.store');
Route::post('update-cart', [CartController::class, 'updateCart'])->name('cart.update');
Route::post('remove', [CartController::class, 'removeCart'])->name('cart.remove');
Route::post('clear', [CartController::class, 'clearAllCart'])->name('cart.clear');

/****Order Route */
Route::post('order', [OrderController::class, 'order'])->name('order');
Route::post('order/list', [DashboardController::class, 'getOrders'])->name('order.list');
/****Payment Route */
Route::get('payment/{id?}', [PaymentController::class, 'payment'])->name('payment');
Route::post('payment', [PaymentController::class, 'paymentSubmit'])->name('payment.submit');

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
});

/**** Admin Login Route */
Route::get('/admin/login', [AuthenticatedSessionController::class, 'create'])->name('admin.login');
Route::post('/admin/login', [AuthenticatedSessionController::class, 'store'])->name('admin.login.submit');
Route::get('/admin/register', [RegisteredAdminController::class, 'create'])->name('admin.register');
Route::post('/admin/register', [RegisteredAdminController::class, 'store'])->name('admin.register.submit');

/****Admin Route */

Route::middleware(['auth:admin'])->prefix('admin')->group(function () {
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('admin.dashboard');

    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('admin.logout');
    Route::get('/order', [AdminOrderController::class, 'index'])->name('admin.order');
    Route::get('/order/{id}', [AdminOrderController::class, 'show'])->name('admin.order.show');
    Route::get('/order/edit/{id}', [AdminOrderController::class, 'edit'])->name('admin.order.edit');
    Route::post('/order/edit/{id}', [AdminOrderController::class, 'update'])->name('admin.order.update');
});

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        $orders = Order::with('user', 'product')
            ->where('payment_status', 1)
            ->where('status', '!=', 'cancel')
            ->where('status', '!=', 'accept')
            ->orderBy('id', 'DESC')
            ->get();
        return view('admin.dashboard', compact('orders'));
    }
}

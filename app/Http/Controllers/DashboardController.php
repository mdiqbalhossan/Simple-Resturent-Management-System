<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\DataTables;

class DashboardController extends Controller
{
    public function index()
    {
        $orders = Order::where('user_id', Auth::user()->id)->with('product')->latest()->get();
        return view('dashboard', compact('orders'));
    }
}

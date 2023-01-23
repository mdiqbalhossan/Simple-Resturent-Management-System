<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::with('user', 'product')->latest()->get();
        return view('admin.order', compact('orders'));
    }

    public function show($id)
    {
        $order = Order::with('user', 'product')->findOrFail($id);
        return view('admin.show', compact('order'));
    }

    public function edit($id)
    {
        $order = Order::findOrFail($id);
        return view('admin.edit', compact('order'));
    }

    public function update(Request $request, $id)
    {
        $order = Order::findOrFail($id);
        $order->status = $request->status;
        $order->save();
        return redirect()->route('admin.order')->with('success', 'Order status updated successfully');
    }
}

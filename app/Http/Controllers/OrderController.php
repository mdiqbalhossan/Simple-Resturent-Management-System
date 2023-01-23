<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class OrderController extends Controller
{
    public function order(Request $request)
    {
        $request->validate([
            'phone' => 'required',
            'address' => 'required',
            'city' => 'required',
            'zipcode' => 'required',
            'country' => 'required',
        ]);
        $total = \Cart::getTotal();
        $cartItems = \Cart::getContent();
        $order_id = [];
        foreach ($cartItems as $cartItem) {
            $order = new Order();
            $order->phone = $request->phone;
            $order->address = $request->address;
            $order->city = $request->city;
            $order->state = $request->state;
            $order->zipcode = $request->zipcode;
            $order->country = $request->country;
            $order->user_id = auth()->user()->id;
            $order->product_id = $cartItem->id;
            $order->payment_method = 'card';
            $order->payment_status = 0;
            $order->payment_amount = $cartItem->price;
            $order->payment_currency = 'USD';
            $order->quantity = $cartItem->quantity;
            $order->status = 'pending';
            $order->save();
            $order_id[] = $order->id;
        }
        \Cart::clear();
        $order_details = [
            'order_id' => $order_id,
            'total' => $total,
        ];
        Session::put('order_details', $order_details);
        return redirect()->route('payment')->with('total', $total);
    }
}

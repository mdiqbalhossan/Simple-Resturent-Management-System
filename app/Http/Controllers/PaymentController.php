<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Stripe\Charge;
use Stripe\Stripe;

class PaymentController extends Controller
{
    public function payment()
    {
        return view('payment');
    }

    public function paymentSubmit(Request $request)
    {
        $order_details = Session::get('order_details');
        Stripe::setApiKey(env('STRIPE_SECRET'));
        Charge::create([
            "amount" => $order_details['total'] * 100,
            "currency" => "USD",
            "source" => $request->stripeToken,
            "description" => "Making test payment."
        ]);

        if (isset($order_details['order_id']) && count($order_details['order_id']) > 0) {
            foreach ($order_details['order_id'] as $order_id) {
                $order = Order::find($order_id);
                $order->payment_status = 1;
                $order->status = 'processing';
                $order->payment_date = date('Y-m-d H:i:s');
                $order->save();
            }
        }

        Session::flash('success', 'Payment has been successfully processed.');

        return redirect()->route('dashboard');
    }
}

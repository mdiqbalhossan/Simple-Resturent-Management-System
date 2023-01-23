<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Stripe\Charge;
use Stripe\Stripe;

class PaymentController extends Controller
{
    public function payment($id = null)
    {
        if ($id) {
            $order = Order::find($id);
            $order_details = [
                'order_id' => $id,
                'total' => $order->payment_amount * $order->quantity,
            ];
            Session::put('order_details', $order_details);
            Session::put('total', $order_details['total']);
        }
        return view('payment');
        // dd(Session::get('total'));
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

        if (isset($order_details['order_id']) && is_array($order_details['order_id'])) {
            foreach ($order_details['order_id'] as $order_id) {
                $order = Order::find($order_id);
                $order->payment_status = 1;
                $order->status = 'processing';
                $order->payment_date = date('Y-m-d H:i:s');
                $order->save();
            }
        } else {
            $order_id = $order_details['order_id'];
            $order = Order::find($order_id);
            $order->payment_status = 1;
            $order->status = 'processing';
            $order->payment_date = date('Y-m-d H:i:s');
            $order->save();
        }

        Session::flash('success', 'Payment has been successfully processed.');
        Session::forget('order_details');
        Session::forget('total');
        return redirect()->route('dashboard');
    }
}

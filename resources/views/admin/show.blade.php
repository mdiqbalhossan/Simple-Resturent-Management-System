@extends('layouts.backend')
@section('title','Order List')

@section('content')
<div class="container-fluid px-4">
    <div class="card my-4">
        <div class="card-header">
            Order Details
        </div>
        <div class="card-body">
            <table class="table">
                <tbody>
                    <tr>
                        <td>User Name: </td>
                        <td>{{ $order->user->name }}</td>
                        <td>Product Name</td>
                        <td>{{ $order->product->name }}</td>
                    </tr>
                    <tr>
                        <td>Quentity</td>
                        <td>{{ $order->quantity }}</td>
                        <td>Price</td>
                        <td>{{ $order->payment_amount }}</td>
                        <td>Total Price</td>
                        <td>{{ $order->quantity * $order->payment_amount }}</td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>{{ $order->status }}</td>
                        <td>Payment Method</td>
                        <td>{{ $order->payment_method }}</td>
                    </tr>
                    <tr>
                        <td>Payment Status</td>
                        <td>{{ $order->payment_status == 0? 'Due' : 'Paid' }}</td>
                        <td>Payment Amount</td>
                        <td>{{ $order->quantity * $order->payment_amount }}</td>
                    </tr>
                    <tr>
                        <td>Payment Date</td>
                        <td>{{ $order->payment_date }}</td>
                        <td>Payment Currency</td>
                        <td>{{ $order->payment_currency }}</td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td>{{ $order->address }}</td>
                        <td>City</td>
                        <td>{{ $order->city }}</td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td>{{ $order->state }}</td>
                        <td>Country</td>
                        <td>{{ $order->country }}</td>
                    </tr>
                    <tr>
                        <td>Zip Code</td>
                        <td>{{ $order->zipcode }}</td>
                        <td>Phone</td>
                        <td>{{ $order->phone }}</td>
                    </tr>
                    <tr>
                        <td colspan="3"><a href="{{ route('admin.order') }}" class="btn btn-danger">Back</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
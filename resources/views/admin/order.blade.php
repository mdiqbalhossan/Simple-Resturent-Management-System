@extends('layouts.backend')
@section('title','Order List')
@section('content')
<div class="container-fluid px-4">
    <h1 class="mt-4">Order List</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
        <li class="breadcrumb-item active">Order List</li>
    </ol>
    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Order List
        </div>
        @if ($message = Session::get('success'))
        <div class="alert alert-success" role="alert">
            {{ $message }}
        </div>
        @endif
        <div class="card-body">
            <table id="datatablesSimple">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Order Date</th>
                        <th>Status</th>
                        <th title="Payment Status">P.Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Order Date</th>
                        <th>Status</th>
                        <th title="Payment Status">P.Status</th>
                        <th>Action</th>
                    </tr>
                </tfoot>
                <tbody>
                    @foreach ($orders as $order)
                    <tr>
                        <td>{{ $order->user->name }}</td>
                        <td>{{ $order->product->name }}</td>
                        <td>{{ $order->quantity }}</td>
                        <td>{{ $order->payment_amount*$order->quantity }}</td>
                        <td>{{ $order->created_at->diffForHumans() }}</td>
                        <td>{{ Str::title($order->status) }}</td>
                        <td>{{ $order->payment_status == 0 ? 'Due' : 'Paid' }}</td>
                        <td>
                            <a href="{{ route('admin.order.show', $order->id) }}" class="btn btn-primary btn-sm"
                                title="View Details"><i class="fa fa-eye" aria-hidden="true"></i></a>
                            <a href="{{ route('admin.order.edit', $order->id) }}" class="btn btn-success btn-sm"
                                title="Update Status"><i class="fa fa-edit" aria-hidden="true"></i></a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
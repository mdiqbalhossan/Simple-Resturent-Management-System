@extends('layouts.frontend')
@push('css')
<link rel="stylesheet" href="//cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css">
@endpush
@section('content')
<div class="container mt-5">
    <h2>Order List</h2>
    <table id="myTable" class="cell-border">
        <thead>
            <tr>
                <th>ID</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Payment Status</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($orders as $key =>$order)
            <tr>
                <td>{{ $key+1 }}</td>
                <td>{{ $order->product->name }}</td>
                <td>{{ $order->quantity }}</td>
                <td>{{ Str::title($order->status) }}</td>
                <td>{{ ($order->payment_status == 0 ? 'Due' : 'Paid') }}</td>
                <td>{{ $order->payment_amount }}</td>
                <td>
                    @if ($order->payment_status == 0)
                    <a href="{{ route('payment', $order->id) }}" class="btn btn-success btn-sm">Pay Now</a>
                    @endif
                </td>
            </tr>
            @endforeach


        </tbody>
    </table>
</div>
@endsection

@push('js')
<script src="//cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready( function () {
    $('#myTable').DataTable();
    } );
</script>
@endpush
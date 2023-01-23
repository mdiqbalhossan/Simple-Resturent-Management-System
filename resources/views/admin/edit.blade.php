@extends('layouts.backend')
@section('title','Order Edit')

@section('content')
<div class="container-fluid px-4" style="width: 400px">
    <div class="card my-4">
        <div class="card-header">
            Order Status Edit
        </div>
        <div class="card-body">
            <form action="" method="POST" action="{{ route('admin.order.update', $order->id) }}">
                @csrf
                <label for="">Select Order Status</label>
                <select class="form-select" aria-label="Default select example" name="status">
                    <option selected>Select Order Status</option>
                    <option value="accept" {{ $order->status == 'accept' ? 'selected' : '' }}>Accept</option>
                    <option value="pending" {{ $order->status == 'pending' ? 'selected' : '' }}>Pending</option>
                    <option value="processing" {{ $order->status == 'processing' ? 'selected' : '' }}>Processing
                    </option>
                    <option value="cancel" {{ $order->status == 'cancel' ? 'selected' : '' }}>Cancel</option>
                </select>
                <button type="submit" class="btn btn-primary mt-3">Update</button>
            </form>

        </div>
    </div>
</div>
@endsection
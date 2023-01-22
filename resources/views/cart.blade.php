@extends('layouts.frontend')

@section('content')
<div class="card">
    <div class="card-body">
        @if ($message = Session::get('success'))
        <div class="alert alert-success" role="alert">
            {{ $message }}
        </div>
        @endif

        <h5 class="card-title">Cart List</h5>
        <p class="card-text">
        <table class="table table-borderless">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Image</th>
                    <th scope="col">Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Remove</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($cartItems as $key => $item)
                <tr>
                    <th scope="row">{{ $key++ }}</th>
                    <td><img src="{{ $item->attributes->image }}" alt="" width="48px"></td>
                    <td>{{ $item->name }}</td>
                    <td>
                        <div width="10px" height="28px">
                            <div class="relative flex flex-row w-full h-8">

                                <form action="{{ route('cart.update') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $item->id}}">
                                    <input type="number" name="quantity" value="{{ $item->quantity }}"
                                        class="text-center" style="width: 50px" />
                                    <button type="submit" class="btn btn-primary btn-sm">update</button>
                                </form>
                            </div>
                        </div>
                    </td>
                    <td>${{ $item->price }}</td>
                    <td>
                        <form action="{{ route('cart.remove') }}" method="POST">
                            @csrf
                            <input type="hidden" value="{{ $item->id }}" name="id">
                            <button class="btn btn-danger btn-sm">x</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        </p>
        <p class="card-text font-weight-bold">Total: ${{ Cart::getTotal() }}</p>
        <div class="d-flex justify-content-between">
            <form action="{{ route('cart.clear') }}" method="POST" class="form-inline">
                @csrf
                <button class="btn btn-danger">Remove All Cart</button>
            </form>
            <a href="#" class="btn btn-success float-end">Buy Now</a>
        </div>
    </div>
</div>
@endsection
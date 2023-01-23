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
        </div>
    </div>
</div>
{{-- Info Card --}}
<div class="card mt-2">
    @if (Auth::check())
    <div class="card-body">
        <h5 class="card-title">Personal and Shipping Info</h5>
        <form action="{{ route('order') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" aria-describedby="addressHelp">
                <div id="addressHelp" class="form-text">Please Given your correct address for delivery product.</div>
            </div>
            <div class="row g-3 align-items-center mb-3">
                <div class="col-md-3">
                    <label for="city" class="form-label">City</label>
                    <input type="text" id="city" class="form-control" name="city">
                </div>
                <div class="col-md-3">
                    <label for="state" class="form-label">State</label>
                    <input type="text" id="state" class="form-control" name="state">
                </div>
                <div class="col-md-3">
                    <label for="country" class="form-label">Country</label>
                    <input type="text" id="country" class="form-control" name="country">
                </div>
                <div class="col-md-3">
                    <label for="zipcode" class="form-label">ZipCode</label>
                    <input type="text" id="zipcode" class="form-control" name="zipcode">
                </div>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phone" aria-describedby="phoneHelp" name="phone">
                <div id="phoneHelp" class="form-text">Please Given your correct phone number for contact our delivery
                    man.</div>
            </div>
            <div class="d-flex justify-content-between">
                <a href="{{ route('home') }}" class="btn btn-danger">Cancel</a>
                <button type="submit" class="btn btn-primary float-end">Buy Now</button>
            </div>
        </form>
    </div>
    @else
    <div class="card-body">
        <h5 class="card-title
        ">Please Login or Register to Buy Product</h5>
        <a href="{{ route('login') }}" class="btn btn-primary">Login</a>
    </div>
    @endif

</div>
@endsection
@extends('layouts.frontend')
@section('content')
<div class="row row-cols-1 row-cols-md-3 g-4">
    @foreach ($products as $product)
    <div class="col my-2">
        <div class="card">
            <img src="{{ $product->image }}" class="card-img-top" alt="{{ $product->name }}" height="200px">
            <div class="card-body">
                <h5 class="card-title">{{ $product->name }}</h5>
                <p class="card-text">{{ Str::words($product->description, 20) }}</p>
                <p class="card-text"><small class="text-muted">Price: ${{ $product->price }}</small></p>
            </div>
            <div class="card-footer">
                <form action="{{ route('cart.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" value="{{ $product->id }}" name="id">
                    <input type="hidden" value="{{ $product->name }}" name="name">
                    <input type="hidden" value="{{ $product->price }}" name="price">
                    <input type="hidden" value="{{ $product->image }}" name="image">
                    <input type="hidden" value="1" name="quantity">
                    <button class="btn btn-primary"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add To
                        Cart</button>
                </form>
            </div>
        </div>
    </div>
    @endforeach

</div>
@endsection
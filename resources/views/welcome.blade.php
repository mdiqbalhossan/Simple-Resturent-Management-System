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
                <a href="#" class="btn btn-primary"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a>
            </div>
        </div>
    </div>
    @endforeach

</div>
@endsection
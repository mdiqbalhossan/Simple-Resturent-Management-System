<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Resturent Management System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    @stack('css')
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="{{ route('home') }}">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedCo
  n     tent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="{{ route('home') }}">Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link mr-sm-2" href="{{ route('cart.list') }}"><i class="fa fa-shopping-cart"
                            aria-hidden="true"></i> ({{
                        Cart::getTotalQuantity()}})</a>
                </li>
                @if(Auth::check())
                <li class="nav-item">

                    <a class="nav-link mr-sm-2" href="{{ route('dashboard') }}"><i class="fa fa-user-circle"
                            aria-hidden="true"></i>
                        Dashboard</a>


                </li>
                <li class="nav-item">

                    <form id="frm-logout" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                    <a href="{{ route('logout') }}" class="nav-link mr-sm-2"
                        onclick="event.preventDefault(); document.getElementById('frm-logout').submit();">
                        <i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp; Logout</a>

                </li>
                @else

                <li class="nav-item">

                    <a class="nav-link mr-sm-2" href="{{ route('login') }}"><i class="fa fa-lock"
                            aria-hidden="true"></i> Login</a>

                </li>
                <li class="nav-item">

                    <a class="nav-link mr-sm-2" href="{{ route('register') }}"><i class="fa fa-lock"
                            aria-hidden="true"></i>
                        Register</a>

                </li>
                @endif
            </ul>
        </div>
    </nav>
    <div class="container my-5">
        @yield('content')
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js">
    </script>
    @stack('js')
</body>

</html>
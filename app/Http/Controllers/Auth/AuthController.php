<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Event;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    // use AuthenticatesUsers;

    // protected $redirectTo = '/';

    // public function __construct()
    // {
    //     $this->middleware('guest')->except('logout');
    // }

    public function login()
    {
        $data = request()->validate([
            'email' => 'required|email',
            'password' => 'required|min:5'
        ]);
        $latestEvent = Event::latest()->first();
        $approvedEvents = Event::where('approved', 1)->get();
        if (auth()->attempt(['email' => $data['email'], 'password' => $data['password']])) {
            // Authentication passed, redirect the user
            $authenticatedUser = auth()->user();

            $userDataJson = json_encode($authenticatedUser);

            if ($authenticatedUser->role == "user") {
                return view('home.home', compact('latestEvent', 'approvedEvents'))->with('userDataJson', $userDataJson);
            } else {
                return view('admin.admin-home')->with('userDataJson', $userDataJson);
                // return view('/admin/dashboard')->with('userDataJson', $userDataJson);
            }
        } else {
            // Authentication failed, return an error
            return redirect('/')->with('err-msg', 'Invalid login credentials');
        }
    }
}

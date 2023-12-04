<?php

namespace App\Http\Controllers;

use App\Mail\ContactFormMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    //
    public function create()
    {
        return view('contact.create');
    }

    public function store()
    {
        $data = request()->validate([
            'name' => 'required|min:3',
            'email' => 'required|email',
            'message' => 'required',
            'mobile' => 'required',
        ]);

        // send an email with $data variable
        Mail::to('test@gmail.com')->send(new ContactFormMail($data));

        return redirect('contact')->with('msg', "Thank you for your mail.");
    }
}

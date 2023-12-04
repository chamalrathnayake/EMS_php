<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('users.create');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    // private function to validate
    private function validateRequest()
    {
        return   request()->validate([
            'name' => 'required|min:3',
            'email' => 'required|email',
            'password' => 'required|min:5',
            'confirm_password' => 'required|min:5',
            'mobile' => 'required',
            'district' => 'required'
        ]);
    }

    public function create()
    {
        $districts = [
            'Colombo',
            'Kandy',
            'Galle'
        ];

        return view('users.create', compact('districts'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request['district']);
        $validatedData = $this->validateRequest();

        // Hash the password before creating the user
        $validatedData['password'] = bcrypt($validatedData['password']);
        $validatedData['role'] = "user";

        User::create($validatedData);

        return redirect('/login');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        $districts = [
            'Colombo',
            'Kandy',
            'Galle'
        ];
        return view('users.update-user', compact('user', 'districts'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $districts = [
            'Colombo',
            'Kandy',
            'Galle'
        ];

        $validatedData = $request->validate([
            'name' => 'required|min:3',
            'mobile' => 'required',
            'district' => 'required'
        ]);

        // Update the user data in the database
        $user->update($validatedData);
        $userDataJson = json_encode($user);

        // Return the updated user data and store it in local storage
        return view('users.update-user', compact('user', 'districts'))->with('userDataJson', $userDataJson);
    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }

    public function register()
    {
        $districts = [
            'Colombo',
            'Kandy',
            'Galle'
        ];
        return view('users.create', compact('districts'));
    }
}

<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        try{
            $validationResult = $request->validate([
                'name' => 'required|string|max:150',
                'email' => 'required|email|unique:users',
                'password' => 'required|confirmed|min:8'
            ]);
        }
        catch (\Exception $e){
            return response()->json($e);
        }

        $hashedPassword = Hash::make($request->input('password'));

        $user = User::create([
            "name" => $request->input('name'),
            "email" => $request->input('email'),
            "role" => "customer",
            "password" => $hashedPassword
        ]);

        if (count($user)>0){
            return response()->json(['result' => 1]);
        }
        else {
            return response()->json(['message' => "An error occured while registering. #1-1"]);
        }

        
    }
}

<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        //if $user is empty or password is incorrect
        if (!$user || !Hash::check($request->password, $user->password)){
           return response()->json(['result' => false]);
        }
        else {
            if (count($user)>0){
                return response()->json([
                    'user' => $user,
                    'token' => $user->createToken('api_token')->plainTextToken
                ]);
            }
            else {
                return response()->json(['message' => "An error occured while loggin in. #1-1"]);
            }
        } 
    }
}

<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

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
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:150'],
            'email' => ['required', 'email', 'unique:users'],
            'phone' => ['required', 'numeric'],
            'password' => ['required', 'confirmed', 'min:8']
        ]);

        //Validate form data
        if($validator->fails()){
            return response()->json(['errors'=>$validator->messages()]);
         }

        $hashedPassword = Hash::make($request->password);
    
        $user = User::create([
            "name" => $request->name,
            "email" => $request->email,
            "phone" => $request->phone,
            "role" => "customer",
            "password" => $hashedPassword
        ])->first();

        if ($user){
            //Adding user data to session
            session([
                'user_id' => $user->id,
            ]);
            return response()->json(['result' => 1, 'user_id' => $user->id]);
        }
        else {
            return response()->json(['message' => "An error occured while registering. #1-1"]);
        }
    }
}

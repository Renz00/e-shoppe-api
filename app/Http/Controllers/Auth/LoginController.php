<?php

namespace App\Http\Controllers\Auth;

use Closure;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    private $userPassword;

    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'exists:App\Models\User,email'],
            'password' => ['required','min:8','max:50', ]
        ], $messages = [
            'exists' => 'Your E-mail does not exist.',
        ]); // adding custom error messages

        //Validate form data
        if ($validator->fails()){
            return response()->json(['errors'=>$validator->messages()]);
        }

        $user = User::where('email', $request->email)->first();

        //Validate password
        if ($user && !Hash::check($request->password, $user->password)){
            $errorMessages = $validator->messages()->add('password', 'Password is incorrect');
            return response()->json(['errors'=>$errorMessages]);
        }
       
        //Adding user data to session
        session([
            'user_id' => $user->id,
        ]);

        return response()->json([
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'role' => $user->role,
            ],
            'token' => $user->createToken('api_token')->plainTextToken
        ]);
    }
}

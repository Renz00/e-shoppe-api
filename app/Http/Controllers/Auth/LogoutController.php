<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LogoutController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {   
        // $result = $request->user()->currentAccessToken()->delete();

        $result = $request->user()->tokens()->delete();
        
        if ($result == 1){
            session()->forget('user_id');
            return response()->json(['result' => $result]);
        }
        else {
            return response()->json(['message' => "An error occured while logging out. #1-1"]);
        }
        
    }
}

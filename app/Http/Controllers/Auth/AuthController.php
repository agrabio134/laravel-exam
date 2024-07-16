<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed|regex:/[a-z]/|regex:/[A-Z]/|regex:/[0-9]/|regex:/[@$!%*#?&]/',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json(['access_token' => $token, 'token_type' => 'Bearer'], 201);
    }

    public function login(Request $request)
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json(['message' => 'Invalid login details'], 401);
        }

        $user = User::where('email', $request['email'])->firstOrFail();
        $token = $user->createToken('auth_token')->plainTextToken;
        $message = 'Login successful';

        

        if ($request->header('X-API-REQUEST')) {
            return response()->json(['access_token' => $token, 'token_type' => 'Bearer', 'user' => $user->name, 'message' => $message]);
        }
        return redirect('/blogs');

        
    }

    public function logout(Request $request)
    {
        $user = $request->user();
    
        if ($user) {
            $user->tokens()->delete(); // Revoke all tokens for the user
        }
        
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/blogs');

        return response()->json(['message' => 'Logged out'], 200);
    }

}

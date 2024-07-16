<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BlogPost;
use App\Models\User;
use App\Notifications\NewBlogNotification;



class BlogPostController extends Controller
{
    //
    public function get_blogs()
{
    $blogPosts = BlogPost::all();
    return response()->json($blogPosts);
    
}
public function store(Request $request)
{
    $request->validate([
        'title' => 'required|string|max:255',
        'content' => 'required|string',
    ]);

    $user = auth()->user(); // Get the authenticated user

    if (!$user) {
        return response()->json(['message' => 'Unauthenticated'], 401);
    }

    $blogPost = BlogPost::create([
        // 'user_id' => 1, just for testing
        'user_id' => $user->id,
        'title' => $request->title,
        'content' => $request->content,
    ]);

    // Notify users
    $usersToNotify = User::all(); 

    foreach ($usersToNotify as $user) {
        $user->notify(new NewBlogNotification($blogPost));
    }

    return response()->json($blogPost, 201);


}

public function show($id)
{
    $blogPost = BlogPost::find($id);
    return response()->json($blogPost);

}

public function update(Request $request, $id)
{
    $request->validate([
        'title' => 'required|string|max:255',
        'content' => 'required|string',
    ]);

    $blogPost = BlogPost::find($id);
    $blogPost->title = $request->title;
    $blogPost->content = $request->content;
    $blogPost->save();

    return response()->json($blogPost);
}

// delete
public function delete($id)
{
    $blogPost = BlogPost::find($id);
    if (!$blogPost) {
        return response()->json(['message' => 'Blog Post not found'], 404);
    }
    $blogPost->delete();


    return response()->json(['message' => 'Blog Post deleted successfully'], 200);
}
}
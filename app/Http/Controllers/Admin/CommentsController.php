<?php

namespace App\Http\Controllers\Admin;


use App\Models\Comment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class CommentsController extends Controller
{
    public function index()
    {
    	$comments = Comment::all();

    	return view('admin.comments.index', ['comments'	=>	$comments]);
    }

    public function store(Request $request)
    {
        $this->validate($request,[
           'message' => 'required'
        ]);
        $comment = new Comment;
        $comment->text = $request->get('message');
        $comment->post_id = $request->get('post_id');
        $comment->user_id = Auth::user()->id;
        $comment->save();

        return redirect()->back()->with('status','Ваш комментарий будет скоро одобрен');
    }


    public function toggle($id)
    {
    	$comment = Comment::find($id);
    	$comment->toggleStatus();

    	return redirect()->back();
    }

    public function destroy($id)
    {
    	Comment::find($id)->remove();
    	return redirect()->back();
    }
}

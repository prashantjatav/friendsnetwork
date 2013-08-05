class PostsController < ApplicationController

  def new
  end
  
  def index
   @post = Post.new
   @post.photos.build
   @posts = Post.order('created_at DESC')
  end
  
  def create
   @post = current_user.posts.build(params[:post])
    if(@post.save)
     redirect_to posts_path
    end
  end
  
  def show
  @post = Post.find
  end
  
  def add_comment
     @post=Post.find(params[:p_id])
     @comment = Comment.new(:post_id=>params[:p_id], :user_id=>current_user.id, :comment=>params[:text])
    #@comment = Comment.new(:post_id=>params[:id], :user_id=>current_user.id, :comment=>params[:comment])
    if(@comment.save)
      render :partial => 'comment'
    end
  end
  
  def add_like
  @post=Post.find(params[:p_id])
    @like = Like.new(:post_id=>params[:p_id], :user_id=>current_user.id)
    if(@like.save)
     render :partial => 'like'
    end 
  end

end




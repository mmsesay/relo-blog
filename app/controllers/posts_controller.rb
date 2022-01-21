class PostsController < ApplicationController
  # GET /user/:user_id/posts
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.new
  end

  # GET /users/:user_id/posts/:id
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id]).where(author_id: params[:user_id])
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter  =  0;
    @post.likes_counter  =  0;

    if @post.save
      p @post
      flash[:notice] = "New post created"
      redirect_to user_path(@post.author_id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def reference_params
    @post.author_id = params[:user_id]
  end
end

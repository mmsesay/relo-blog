class PostsController < ApplicationController
  # GET /user/:user_id/posts
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).all
  end

  # GET /users/:user_id/posts/:id
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post created"
      redirect_to user_path(@post.author_id)
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

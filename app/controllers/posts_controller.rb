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
end

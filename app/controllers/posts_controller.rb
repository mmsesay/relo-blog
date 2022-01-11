class PostsController < ApplicationController
  # GET /user/:user_id/posts
  def index
    @title = 'Relo-blog'
    @user_id = params[:user_id]
  end

  # GET /users/:user_id/posts/:id
  def show
    @user_id = params[:user_id]
    @post_id = params[:id]
  end
end

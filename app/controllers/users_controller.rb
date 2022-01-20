class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
    @current_user = current_user
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end
end

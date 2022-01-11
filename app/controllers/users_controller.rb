class UsersController < ApplicationController
  # GET /users
  def index
    @title = 'Relo-blog'
  end

  # GET /users/:id
  def show
    @id = params[:id]
  end
end

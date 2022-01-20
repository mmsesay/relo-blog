class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(author_id: params[:user_id], post_id: params[:post_id])

    if @like.save
      redirect_to user_post_path(@like.author_id, @like.post_id)
    end
  end
end

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    reference_params
  end

  def create
    @comment = current_user.comments.new(comment_params)
    reference_params

    if @comment.save
      flash[:notice] = "Comment created"
      redirect_to user_post_path(@comment.author_id, @comment.post_id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def reference_params
    @comment.post_id = params[:post_id]
    @comment.author_id = params[:user_id]
  end
end

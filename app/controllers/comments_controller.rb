class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @current_user = current_user
    @comment = @current_user.comments.new(comment_params)

    if @comment.save
      flash[:notice] = "Comment created"
      redirect_to user_post_path(@comment.author_id, @comment.post_id)
    else
      render "new"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

class CommentsController < ApplicationController

  def create
    @comment = Comment.create!(comment_params)
    @producer_email = @comment.producer.email
    @date = @comment.created_at
    render json: { comment: @comment, producer_email: @producer_email, date: @date }
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :sound_id, :producer_id)
  end
end

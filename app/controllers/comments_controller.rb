class CommentsController < ApplicationController

  def create
    @comment = Comment.create!(comment_params)
    @producer_email = @comment.producer.email
    render json: { comment: @comment, producer_email: @producer_email }
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :sound_id, :producer_id)
  end
end

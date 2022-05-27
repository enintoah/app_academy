class CommentsController < ApplicationController
  def create 
    comment = Comment.new(comment_params)
    if comment.save!
      render json: comment
    else 
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comments = Comment.find_by(id: params[:id])
    @comments.destroy
    redirect comments_url
  end

  def index
    if params.has_key?(:user_id)
      @comments = Comment.where(user_id: params[:user_id])
    elsif params.has_key?(:artwork_id)
      @comments = Comment.where(artwork_id: params[:artwork_id])
    else
      @comments = Comment.all
    end
    render json: @comments
  end

  private
  def comment_params
    params.require(:comment).permit(:artwork_id, :user_id)
  end
end

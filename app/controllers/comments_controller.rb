class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to user_posts_url
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to user_posts_url
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_posts_url
  end
end

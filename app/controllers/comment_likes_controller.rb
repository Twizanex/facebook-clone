class CommentLikesController < ApplicationController
  def create
    @comment_like = CommentLike.new(params[:comment_like])
    if @comment_like.save
      redirect_to :back
    else
      flash.now[:errors] = @comment_like.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @comment_like = CommentLike.find(params[:id])
    @comment_like.destroy
    redirect_to :back
  end
end

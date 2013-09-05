class CommentLikesController < ApplicationController
  def create
    @comment_like = CommentLike.new(:user_id => current_user.id, :comment_id => params[:comment_id])
    if @comment_like.save
      render :json => @comment_like
    else
      render :json => "Something bad happened!", :status => 422
    end
  end

  def destroy
    CommentLike.destroy(params[:id])
    render :json => true
  end
end

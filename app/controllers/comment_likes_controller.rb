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

  # def create
  #   @comment_like = CommentLike.new(:user_id => current_user.id, :post_id => params[:post_id], :comment_id => params[:comment_id])
  #   if @comment_like.save
  #     render :json => @comment_like
  #   else
  #     render :json => "Something bad happened!", :status => 422
  #   end
  # end

  # def destroy
  #   @comment_like = CommentLike.find(params[:id])
  #   CommentLike.destroy(params[:id])
  #   render :json => @comment_like
  # end
end

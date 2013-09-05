class LikesController < ApplicationController
  def create
    @like = Like.new(:user_id => current_user.id, :post_id => params[:post_id])
    if @like.save 
      render :json => @like
    else
      render :json => "Something bad happened!", :status => 422
    end
  end

  def destroy
    @like = Like.find(params[:id])
    Like.destroy(params[:id])
    render :json => @like
    # render :json => "success"
    # head :ok
  end
end

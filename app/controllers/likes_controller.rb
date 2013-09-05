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
    Like.destroy(params[:id])
    render :json => true
  end
end

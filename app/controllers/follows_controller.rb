class FollowsController < ApplicationController
  def index
    @followings = current_user.outbound_followers
    @followings = @followings.sort_by { |following| following.username }
    render :index
  end

  def create
    @following = Follow.new(params[:follow])
    if @following.save
      redirect_to :back
    else
      flash.now[:errors] = @following.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @following = Follow.find(params[:id])
    @following.destroy
    redirect_to :back
  end
end

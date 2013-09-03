class LikesController < ApplicationController
  def create
    @like = Like.new(params[:like])
    if @like.save 
      redirect_to :back
    else
      flash.now[:errors] = @like.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to :back
  end
end

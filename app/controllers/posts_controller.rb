class PostsController < ApplicationController
  before_filter :require_current_user!

  def index
    @posts = []
    current_user.outbound_followers.each do |outbound_follower|
      @posts += outbound_follower.posts
    end
    @posts += current_user.posts
    @posts = @posts.sort_by { |post| post.created_at }

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @posts }
    end
  end

  def create
    params[:post][:author_id] = current_user.id
    @post = Post.new(params[:post])
    if @post.save
      redirect_to :back
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end
end

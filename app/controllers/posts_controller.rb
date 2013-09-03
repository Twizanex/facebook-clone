class PostsController < ApplicationController
  before_filter :require_current_user!

  respond_to :json
  respond_to :html, :only => [:index]

  def index
    @posts = []
    current_user.outbound_followers.each do |outbound_follower|
      @posts += outbound_follower.posts
    end

    @posts += current_user.posts

    respond_to do |format|
      format.html { render :index }
      format.json { render :index, :handlers => :rabl }
    end
  end

  def create
    params[:post][:author_id] = current_user.id
    @post = Post.new(params[:post])
    if @post.save
      render :json => @post
    else
      render :json => @post.errors.full_messages, :status => 422
    end
  end
 
end

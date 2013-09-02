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
 
end

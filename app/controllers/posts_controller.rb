class PostsController < ApplicationController
  before_filter :require_current_user!

  def index
    Post.order('created_at DESC').all
    @posts = []
    current_user.outbound_followers.each do |outbound_follower|
      @posts += outbound_follower.posts
    end
    @posts += current_user.posts
    @posts = @posts.sort_by { |post| post.created_at }
    render :index
  end

  def create
    params[:post][:author_id] = current_user.id
    @post = Post.new(params[:post])
    if @post.save
      redirect_to user_posts_url
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to :back
    end
  end
 
end

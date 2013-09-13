class PostsController < ApplicationController
  before_filter :require_current_user!

  def index
    @posts = []
    current_user.outbound_followers.each do |outbound_follower|
      @posts += outbound_follower.posts.includes({:comments => :comment_likes}, :likes)
    end
    @posts += current_user.posts.includes({:comments => :comment_likes}, :likes)
    @posts = @posts.sort_by { |post| post.created_at }

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @posts }
    end
  end

  def create
    params[:post][:author_id] = current_user.id
    begin 
      @post = Post.create(params[:post])
      ActiveRecord::Base.transaction do 
        if params[:tags]
          params[:tags].each do |user_id|
            Tag.create!(:post_id => @post.id, :user_id => user_id.to_i)
          end
        end
      end
    rescue => e
      flash.now[:errors] ||= []
      flash.now[:errors] << @post
    else
      redirect_to :back
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end
end

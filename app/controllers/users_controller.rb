class UsersController < ApplicationController
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #authored posts but not authored wall-to-walls
    @posts = @user.posts.where(recipient_id: nil).
            includes({:comments => :comment_likes}, :likes)
    #wallposts
    @posts += Post.where(recipient_id: params[:id])
    render :show
  end
end

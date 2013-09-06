class PhotosController < ApplicationController
  def index
    @posts_with_photo = []
    User.find(params[:user_id]).posts.each do |post|
      if post.photo_file_size
        @posts_with_photo << post
      end     
    end
  end
end




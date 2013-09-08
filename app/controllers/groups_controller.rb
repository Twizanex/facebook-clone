class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    render :index
  end

  def show
    @group = Group.find(params[:id])
    render :show
  end

  def create
    begin
      ActiveRecord::Base.transaction do 
        params[:group][:creator_id] = current_user.id
        @group = Group.create(params[:group])
        GroupUserJoin.create!(group_id: @group.id, user_id: current_user.id)
      end
    rescue => e
      flash.now[:errors] ||= []
      flash.now[:errors] += e.record.errors.full_messages
    else
      redirect_to :back
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_groups_url(current_user.id)
  end
end

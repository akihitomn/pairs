class GroupsController < ApplicationController

  def index
    @users = current_user.followings
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to user_group_messages_path(group_id: @group.id)
    end
  end

  private
  def group_params
    params.permit(user_ids:[])
  end

end

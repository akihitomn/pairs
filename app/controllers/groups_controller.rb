class GroupsController < ApplicationController

  def index
    @users = current_user.followings
  end

  def new
  end

end

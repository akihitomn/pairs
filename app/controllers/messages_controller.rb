class MessagesController < ApplicationController

  def index
    @users = current_user.followings
  end

end

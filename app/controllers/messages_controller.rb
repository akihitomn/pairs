class MessagesController < ApplicationController

  def index
    @users = current_user.followings
    @message = Message.new
  end

end

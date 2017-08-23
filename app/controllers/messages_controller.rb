class MessagesController < ApplicationController

  def index
    @users = current_user.followings
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html
        format.json
      end
    else
      flash.now[:alert] = 'メッセージか画像を入力して下さい'
      render :index
    end
  end

  private
  def message_params
      params.require(:message)).permit(:message, :image).merge(user_id: current_user.id)
  end
end

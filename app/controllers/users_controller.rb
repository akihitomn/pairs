class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order(created_at: :DESC).page(params[:page]).per(16)
    @user = User
  end

  def edit
    @users = current_user.followings
  end

  def update
  end

  def show
  end

end

class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:following_id])
    current_user.follow(user)
    redirect_to root_path
  end

  def destroy
    @user = Relationship.find(params[:id]).following_id
    current_user.unfollow!(@user)
    redirect_to @user
  end
end

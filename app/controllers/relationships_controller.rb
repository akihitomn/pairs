class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:following_id])
    binding.pry
    @group = Group.new
      user.followings.each do |following|
        if following.id == current_user.id
          @group.save(user_ids: [current_user.id, user.id])
        end
      end
    current_user.follow(user)
    redirect_to root_path
  end

  def destroy
    @user = Relationship.find(params[:id]).following_id
    current_user.unfollow!(@user)
    redirect_to @user
  end
end

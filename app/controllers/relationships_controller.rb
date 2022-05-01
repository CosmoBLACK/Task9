class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back fallback_location: root_path
  end

  def following
    user = User.find(params[:user_id])
    @users = user.following
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
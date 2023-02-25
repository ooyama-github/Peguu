class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  
  # 非同期通信化
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
  end 
  
  
  # 非同期通信化
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
  end 
  
  
  #フォロー
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings.where(is_deleted: false)
  end 
  
  
  #フォロワー
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers.where(is_deleted: false)
  end 
end

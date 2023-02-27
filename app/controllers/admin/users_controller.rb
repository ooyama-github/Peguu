class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page]).per(25)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:alert] = "ユーザー情報を編集しました"
      redirect_to admin_users_path
    else
      render :edit
    end 
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :is_deleted)
  end 
end

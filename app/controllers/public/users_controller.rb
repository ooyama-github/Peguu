class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, alert: "～退会が完了しました、ご利用ありがとうございました～"
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end

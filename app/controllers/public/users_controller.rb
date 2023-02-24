class Public::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]


  def show
    @user = User.find(params[:id])
    @post_items = @user.post_items.page(params[:page]).per(8).reverse_order
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "登録内容を変更しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  def unsubscribe
  end


  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, alert: "～退会が完了しました、ご利用ありがとうございました～"
  end


  def bookmarks
    @user = User.find(params[:id])
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:campsite_id)
    @bookmark_campsites = Campsite.find(bookmarks)
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_item_id)
    @favorite_items = PostItem.find(favorites)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲストユーザー"
      redirect_to user_path(@user)
      flash[:notice] = "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end

end

class Admin::PostItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @post_items = PostItem.page(params[:page]).per(18).reverse_order
  end

  def show
    @post_item = PostItem.find(params[:id])
  end
  
  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    flash[:alert] = "削除しました！"
    redirect_to admin_post_items_path
  end
end
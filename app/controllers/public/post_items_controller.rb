class Public::PostItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new

  end


  def create

  end


  def index

  end


  def show

  end


  def edit

  end


  def update

  end


  def destroy

  end


  private

  def post_item_params
    params.require(:post_item).permit(:body, :post_dog_image)
  end


  def ensure_correct_user
    @post_item = PostItem.find(params[:id])
    unless @post_item.user == current_user
      redirect_to post_items_path
    end
  end

end

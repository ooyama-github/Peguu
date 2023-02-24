class Public::PostItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @post_item = PostItem.new
  end


  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.user_id = current_user.id
    if @post_item.save
      flash[:notice] = "投稿されました！"
      redirect_to post_item_path(@post_item.id)
    else
      render :new
    end
  end
  

  def index
    @post_items = PostItem.page(params[:page]).per(18).reverse_order
  end


  def show
    @post_item = PostItem.find(params[:id])
    @post_comment = PostComment.new
  end


  def edit
    @post_item = PostItem.find(params[:id])
  end


  def update
    @post_item = PostItem.find(params[:id])
    if @post_item.update(post_item_params)
      flash[:notice] = "編集されました！"
      redirect_to post_item_path(@post_item.id)
    else
      render :edit
    end
  end


  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    flash[:alert] = "削除しました！"
    redirect_to post_items_path
  end


  private

  def post_item_params
    params.require(:post_item).permit(:body, :post_item_image)
  end


  def ensure_correct_user
    @post_item = PostItem.find(params[:id])
    unless @post_item.user == current_user
      redirect_to post_items_path
    end
  end

end

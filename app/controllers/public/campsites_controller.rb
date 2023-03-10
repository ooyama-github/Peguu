class Public::CampsitesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @campsite = Campsite.new
  end


  def create
    @campsite = Campsite.new(campsite_params)
    @campsite.user_id = current_user.id
    if @campsite.save
      flash[:notice] = "投稿されました！"
      redirect_to campsite_path(@campsite.id)
    else
      render :new
    end
  end


  def index
    @campsites = Campsite.page(params[:page]).per(18).order(created_at: :desc)   #reverse_order
    if params[:prefecture_code].present?
      @campsites = @campsites.where(prefecture_code: params[:prefecture_code])
    end
  end


  def show
    @campsite = Campsite.find(params[:id])
    @campsite_comment = CampsiteComment.new
  end


  def edit
    @campsite = Campsite.find(params[:id])
  end


  def update
    @campsite = Campsite.find(params[:id])
    if @campsite.update(campsite_params)
      flash[:notice] = "内容を編集しました！"
      redirect_to campsite_path(@campsite.id)
    else
      render :edit
    end
  end


  def destroy
    @campsite = Campsite.find(params[:id])
    @campsite.destroy
    flash[:notice] = "削除しました！"
    redirect_to campsites_path
  end


  private

  def campsite_params
    params.require(:campsite).permit(:title, :opinion, :campsite_name, :facility, :campsite_image, :prefecture_code)
  end

  def ensure_correct_user
    @campsite = Campsite.find(params[:id])
    unless @campsite.user == current_user
      redirect_to campsites_path
    end
  end

end

class Admin::CampsitesController < ApplicationController
  
  before_action :authenticate_admin!
  
  
  def index
    @campsites = Campsite.page(params[:page]).per(18).order(created_at: :desc)   #reverse_order
    if params[:prefecture_code].present?
      @campsites = @campsites.where(prefecture_code: params[:prefecture_code])
    end
  end


  def show
    @campsite = Campsite.find(params[:id])
  end


  def destroy
    @campsite = Campsite.find(params[:id])
    @campsite.destroy
    flash[:notice] = "削除しました！"
    redirect_to admin_walks_path
  end
end
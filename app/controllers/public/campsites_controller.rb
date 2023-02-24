class Public::CampsitesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
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

  def campsite_params
    params.require(:campsite).permit(:title, :opinion, :campsite_name, :facility, :campsite_image, :tag_id)
  end

  def ensure_correct_user
    @campsite = Campsite.find(params[:id])
    unless @campsite.user == current_user
      redirect_to campsites_path
    end
  end

end

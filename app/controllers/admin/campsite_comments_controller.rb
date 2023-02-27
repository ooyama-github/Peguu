class Admin::CampsiteCommentsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def destroy
    @campsite = Campsite.find(params[:campsite_id])
    @campsite_comment = CampsiteComment.find(params[:id])
    @campsite_comment.destroy
  end
end
class Public::CampsiteCommentsController < ApplicationController

  def create
    @campsite = Campsite.find(params[:campsite_id])
    @campsite_comment = CampsiteComment.new(campsite_comment_params)
    @campsite_comment.campsite_id = @campsite.id
    @campsite_comment.user_id = current_user.id
    @campsite_comment.save
    @campsite_comment = CampsiteComment.new
  end


  def destroy
    @campsite = Campsite.find(params[:campsite_id])
    @campsite_comment = CampsiteComment.find(params[:id])
    @campsite_comment.destroy
    @campsite_comment = CampsiteComment.new
  end


  private

  def campsite_comment_params
    params.require(:campsite_comment).permit(:campsite_comment)
  end
end
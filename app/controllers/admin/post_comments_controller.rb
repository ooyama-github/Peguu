class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @post_item = PostItem.find(params[:post_item_id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
  end
  
end
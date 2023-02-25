class Public::PostCommentsController < ApplicationController

  def create
    @post_item = PostItem.find(params[:post_item_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post_item_id = @post_item.id
    @post_comment.user_id = current_user.id
    @post_comment.save
    @post_comment = PostComment.new
  end


  def destroy
    @post_item = PostItem.find(params[:post_item_id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    @post_comment = PostComment.new
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:item_comment)
  end
end
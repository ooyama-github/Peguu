class Public::BookmarksController < ApplicationController
  
  def create
    @campsite = Campsite.find(params[:campsite_id])
    bookmark = current_user.bookmarks.new(campsite_id: @campsite.id)
    bookmark.save
  end 
  
  
  def destroy
    @campsite = Campsite.find(params[:campsite_id])
    bookmark = current_user.bookmarks.find_by(campsite_id: @campsite.id)
    bookmark.destroy
  end
end

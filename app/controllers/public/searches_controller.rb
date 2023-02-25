class Public::SearchesController < ApplicationController
  
  def search
    @word = params[:word]
    @campsites = Campsite.where([ "title LIKE? OR opinion LIKE? OR campsite_name LIKE?", "%#{@word}%", "%#{@word}%", "%#{@word}%" ])
  end
  
end
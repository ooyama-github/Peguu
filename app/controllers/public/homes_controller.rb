class Public::HomesController < ApplicationController
  def top
    # 新しく投稿した3件を表示する
    @new_3_campsites = Campsite.order('id desc').limit(3)
  end

  def about
  end
end

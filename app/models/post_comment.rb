class PostComment < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :post_item
  
  
  # バリデーション
  validates :item_comment, length: { minimum: 1, maximum: 300 }
  
end

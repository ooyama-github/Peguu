class CampsiteComment < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :campsite
  
  
  # バリデーション
  validates :campsite_comment, length: { minimum: 1, maximum: 300 }
  
end

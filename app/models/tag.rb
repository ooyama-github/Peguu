class Tag < ApplicationRecord
  
  # アソシエーション
  has_many :campsites, dependent: :destroy
  
  # バリデーション
  validates :prefecture, presence: true
  
end

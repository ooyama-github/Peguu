class PostItem < ApplicationRecord
  
  # アクティブストレージ
  has_one_attached :post_item_image
  
  
  # アソシエーション
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  # アイテムの画像がない場合の画像設定
  def get_post_item_image
    (post_item_image.attached?) ? post_item_image: 'no_image.png'
  end
  
  
  #favorites存在有無のメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  
  # バリデーション
  validates :body, length: { minimum: 1, maximum: 300 }
  validates :post_item_image, presence: true
  
end

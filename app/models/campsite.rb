class Campsite < ApplicationRecord

  # アクティブストレージ
  has_one_attached :campsite_image

  # キャンプサイトの画像がない場合の画像
  def get_campsite_image
    (campsite_image.attached?) ? campsite_image: 'no_image.png'
  end


  #book_mark存在有無のメソッド
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end


  # enum追加
  enum facility: { auto_camp: 0, free_site: 1, both: 2 }


  # アソシエーション
  belongs_to :user
  has_many :campsite_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy


  # バリデーション
  validates :title, length: { minimum: 1, maximum: 20 }
  validates :opinion, length: { minimum: 1, maximum: 300 }
  validates :facility, presence: true

end

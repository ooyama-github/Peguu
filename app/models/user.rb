class User < ApplicationRecord
  
  # ActiveStorageを追加（画像）
  has_one_attached :profile_image
  
  # 初期画像
  def get_profile_image
    (profile_image.attached?) ? profile_image: 'icon.png'
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

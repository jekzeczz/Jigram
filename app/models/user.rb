class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :avatar, AvatarUploader
  
  validates :username, presence: true, length: { minimum: 4, maximum: 16 }
  
  has_many :posts, dependent: :destroy
  
  def self.search(search) #ここでのself.はUser.を意味する
    if search
      User.where(['username LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      User.all #全て表示。User.は省略
    end
  end
  
end

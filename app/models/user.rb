class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :username, presence: true
  
  has_one_attached :avatar
  
  # # 論理削除追加
  # acts_as_paranoid
  
  has_many :posts, :dependent => :destroy #ユーザー削除時投稿も削除
  # def posts
  #   return Post.where(user_id: self.id)
  # end
end
